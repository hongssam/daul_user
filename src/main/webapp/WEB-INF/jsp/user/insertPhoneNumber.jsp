<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Our LogIn Register -->
	<section class="login-section">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-lg-6 offset-lg-3">
					<div class="login_form inner_page">
						<h4>"e다울마당" 서비스 연동</h4>
						<p>서비스에 연동하기 위해 전화번호를 입력해 주세요.<br>최초 한번만 입력하시면 됩니다.</p>
					<form id="connect-form" method="post" >
						<div class="form-group">
							<input type="hidden" value="${userKakao_key}" name="userKakao_key">
							<input type="hidden" value="${forward}" id="forward">
							<input type="text" class="form-control" name="phone" placeholder="전화번호">
						</div>
						<div class="form-group">
							<button type="button" class="btn btn-block btn-primary" id="connect-service">서비스 연동</button>
						</div>
						<div class="form-group text-right p10">
							<p>
								아직 회원이 아니신가요?
								<a class="btn-outline-primary" href="register-term.html">회원가입하기</a>
							</p>
						</div>
					</form>
				</div>
				</div>
			</div>
		</div>
	</section>
	
	
	
	<script type="text/javascript">
	$("#connect-service").click(function() {
		connect();
	});
	
	
	function connect(){
		
		var forward = $("#forward").val();
		
		var request = $.ajax({
			url: "/user/connectKakao.do",
			method: "post",
			//contentType: "application/json",
			//dataType: "json",
			data: $("#connect-form").serialize()
		});
		request.done(function(data) {
			if(data == "noData"){
				
				if (!confirm("입력하신 휴대폰 번호로 등록된 정보가 없습니다.\n 회원등록 페이지로 이동하시겠습니까?")) return false;
				
				location.href = CTX + "/user/userRegistTermPage.do";
				
			}else{
				console.log(data.userKakao_key);
				alert("서비스에 연동되었습니다.")
				location.href = CTX + "/login/kakaoLogin.do?user_key="+data.userKakao_key+"&forward=" + forward;
			}
		});
		request.fail(function(error) {
			console.log(error);
			console.log("request fail");
		});
	}
	
	</script>
	
	