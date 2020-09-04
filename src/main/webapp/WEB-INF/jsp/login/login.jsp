<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- Page -->
<div class="page vertical-align text-center" data-animsition-in="fade-in" data-animsition-out="fade-out">
	<div class="page-content vertical-align-middle">
		<div class="panel">
			<div class="panel-body">
				<div class="brand">
					<img class="brand-img" src="${pageContext.request.contextPath}/images/logo-colored.png" alt="...">
					<h2 class="brand-text font-size-18">관리자 로그인</h2>
				</div>
				<form id="login-form">
					<div class="form-group form-material floating" data-plugin="formMaterial">
						<input type="text" class="form-control" id="user_id" name="user_id" />
						<label class="floating-label">ID</label>
					</div>
					<div class="form-group form-material floating" data-plugin="formMaterial">
						<input type="password" class="form-control" id="pw" name="pw" />
						<label class="floating-label">PASSWORD</label>
					</div>
					<span class="text-left" id="chk-error"></span>
					<button type="button" class="btn btn-primary btn-block btn-lg mt-40" id="login-btn">로그인</button>

					<button type="button" class="btn btn-primary btn-block btn-lg mt-40" id="logoutbtn">로그아웃</button>
					<a id="kakao-login-btn"></a>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- End Page -->
<script type="text/javascript">
	Kakao.init('999d41a6f19235ee8e6d382a1535fde5');
	console.log(Kakao.isInitialized());

	Kakao.Auth.createLoginButton({ container : '#kakao-login-btn', success : function(authObj) {
		Kakao.API.request({ url : '/v2/user/me', success : function(res) {
			console.log(JSON.stringify(res));
			console.log(JSON.stringify(res.kakao_account.email));
			console.log(JSON.stringify(res.id));

			//로그인시 회원db에 고유id가 없으면 회원가입페이지로가서 정보 입력하도록,
			//있을시 자동로그인
		}, fail : function(error) {
			console.log('login success, but failed to request user information: ' + JSON.stringify(error));
		}, });
	}, fail : function(err) {
		alert(JSON.stringify(err));
	} });

	function logoutbtn() {
		if (!Kakao.Auth.getAccessToken()) {
			console.log('Not logged in.');
			return;
		}
		Kakao.Auth.logout(function() {
			console.log(Kakao.Auth.getAccessToken());

			//토큰을못쓰게 하는거고 서비스 로그아웃기능 추가해야함
		});
	}

	$("#logoutbtn").click(function() {
		unlinkApp();
	});

	function unlinkApp() {
		Kakao.API.request({ url : '/v1/user/unlink', success : function(res) {
			console.log('success: ' + JSON.stringify(res))
		}, fail : function(err) {
			console.log('fail: ' + JSON.stringify(err))
		}, })
	}

	/* Kakao.Auth.createLoginButton({
		container:'#kakao-login-btn',
		success: function(authObj){
			Kakao.API.request({
				url:'/v1/user/me',
				success:function(res){
					console.log(res);
					
					var userID = res.id;
					var userEmail = res.account_email;
					
					console.log(userID);
					console.log(userEmail);
				},
				fail:function(errer){
					alert(JSON.stringify(error));
				}
			});
		},
		fail:function(err){
			alert(JSON.stringify(err));
		}
	});
	 */

	$("#user_id").keydown(function(key) {
		if (key.keyCode === 13)
			login();
	});

	$("#pw").keydown(function(key) {
		if (key.keyCode === 13)
			login();
	});

	$("#login-btn").click(function() {
		login();
	});

	function login() {
		var request = $.ajax({ url : "/login/login.do", method : "post", data : $("#login-form").serialize() });
		request.done(function(data) {
			console.log(data);
			console.log("request done");

			if (data === "success") {
				location.href = "${pageContext.request.contextPath}/main/main.do";
			} else {
				$("#chk-error").text(data);
			}
		});
		request.fail(function(error) {
			console.log(error);
			console.log("request fail");
		});
	}

	$("#user_id").val("admin");
	$("#pw").val("1234qwer");

	$("#login-btn").trigger("click");
</script>