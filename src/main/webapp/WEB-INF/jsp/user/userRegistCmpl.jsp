<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Register Wizard -->
<section class="reg-wizard-section bgc-fa">
	<div class="container">
		<div class="wizard row">
			<div class="wizard-item regist">
				<div class="step-box">
					약관동의
				</div>
				<div class="step-arrow">
					<img src="${pageContext.request.contextPath}/images/icon-arrow-forward.png">
				</div>
			</div>
			<div class="wizard-item regist">
				<div class="step-box">
					본인확인
				</div>
				<div class="step-arrow">
					<img src="${pageContext.request.contextPath}/images/icon-arrow-forward.png">
				</div>
			</div>
			<div class="wizard-item regist">
				<div class="step-box ">
					회원정보 입력
				</div>
				<div class="step-arrow">
					<img src="${pageContext.request.contextPath}/images/icon-arrow-forward.png">
				</div>
			</div>
			<div class="wizard-item regist">
				<div class="step-box active">
					가입완료
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Register Complete -->
<section class="reg-complete-section bgc-fa">
	<div class="container">
		<div class="reg-complete-box">
			<img class="icon" src="${pageContext.request.contextPath}/images/register-complete.png">
			<h4>회원가입이 완료되었습니다.</h4>
			<p>
				<b>${user_id}</b>의 회원가입을 축하합니다.
			</p>
			<p>알차고 실속있는 서비스로 찾아뵙겠습니다.</p>
			<div class="form-group custom-control">
				<button type="button" class="btn btn-primary" id="home_btn">홈으로 가기</button>
				<button type="button" class="btn btn-dark" id="login_btn">로그인</button>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
	var home_btn = document.getElementById("home_btn");
	var login_btn = document.getElementById("login_btn");
	
	home_btn.addEventListener("click", function() {
		location.href = CTX + "/main/main.do";
	});
	
	login_btn.addEventListener("click", function() {
		location.href = CTX + "/login/loginPage.do";
	});
</script>