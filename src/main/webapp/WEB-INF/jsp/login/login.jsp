<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Our LogIn Register -->
<section class="login-section bgc-fa">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-lg-6 offset-lg-3">
				<div class="login_form inner_page">
					<form id="login-form">
						<div class="form-group">
							<input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호">
						</div>
						<div class="form-group custom-control">
							<a class=" " href="/user/idInquiryPage.do">아이디 찾기</a>|
							<a class=" " href="/user/pwInquiryPage.do">비밀번호 찾기</a>|
							<a class=" " href="/user/userRegistTermPage.do">회원가입</a>
						</div>
						<div class="form-group mb20">
							<button type="button" class="btn btn-block btn-primary" id="login-btn">로그인</button>
						</div>
						<div class="form-group">
							<button type="button" class="btn btn-block btn-kakao" id="kakao_login_btn">카카오 로그인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<script src="${pageContext.request.contextPath}/js/kakao-login.js"></script>
<script type="text/javascript">
	$("#login-btn").click(function() {
		login();
	});
	
	function login() {
		var request = $.ajax({ 
			url : "/login/login.do", 
			method : "post", 
			data : $("#login-form").serialize() 
		});
		
		request.done(function(data) {
			if (data === "success") {
				location.href = "${pageContext.request.contextPath}/main/main.do";
			} else {
				//$("#chk-error").text(data);
				alert(data);
			}
		});
		
		request.fail(function(error) {
			console.log(error);
			console.log("request fail");
		});
	}
	
	var kakao_login_btn = document.getElementById("kakao_login_btn");
	
	kakao_login_btn.addEventListener("click", function() {
		kakaoLogin();
	});
	
	document.getElementById("user_id").addEventListener("keyup", function(e) {
		if (e.keyCode === 13)	login();
	});
	
	document.getElementById("pw").addEventListener("keyup", function(e) {
		if (e.keyCode === 13)	login();
	});
</script>