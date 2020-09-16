<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Register Wizard -->
<section class="reg-wizard-section bgc-fa">
	<div class="container">
		<div class="wizard row">
			<div class="wizard-item">
				<div class="step-box">
					<a href="#">
						약관동의
					</a>
				</div>
				<div class="step-arrow">
					<img src="${pageContext.request.contextPath}/images/icon-arrow-forward.png">
				</div>
			</div>
			<div class="wizard-item">
				<div class="step-box active">
					<a href="#">
						본인확인
					</a>
				</div>
				<div class="step-arrow">
					<img src="${pageContext.request.contextPath}/images/icon-arrow-forward.png">
				</div>
			</div>
			<div class="wizard-item">
				<div class="step-box ">
					<a href="#">
						회원정보 입력
					</a>
				</div>
				<div class="step-arrow">
					<img src="${pageContext.request.contextPath}/images/icon-arrow-forward.png">
				</div>
			</div>
			<div class="wizard-item">
				<div class="step-box">
					<a href="#">
						가입완료
					</a>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Register Auth -->
<section class="reg-auth-section bgc-fa">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="auth-box">
					<h4>휴대폰 인증</h4>
					<div class="auth-btn-box">
						<p class="desc">
							본인 명의의 휴대폰으로만 인증이 가능합니다.<br>가입을 원하시면 <b>[인증하기]</b>를 클릭해주세요.
						</p>
						<div class="auth-btn">
							<img class="icon" src="${pageContext.request.contextPath}/images/icon-auth.png">
							<p>인증하기</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="auth-box">
					<h4>SNS 회원가입</h4>
					<div class="auth-btn-box">
						<p class="desc">기존에 사용하시는 계정으로 간단하게 회원가입하세요.</p>
						<div class="auth-btn kakao">
							<img class="icon" src="${pageContext.request.contextPath}/images/icon-auth-kakao.png">
							<p>카카오로 가입</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="auth-box">
					<h4>테스트 인증</h4>
					<div class="auth-btn-box">
						<div class="auth-btn">
							<form id="test_form" method="post" action="/user/userRegistPage.do">
								<input type="text" name="phone" id="phone" placeholder="핸드폰 번호 입력"/>
								<button type="submit" id="test_go_reg_page">테스트등록화면이동</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script src="${pageContext.request.contextPath}/js/kakao-login.js"></script>
<script type="text/javascript">
	var kakao_reg = document.querySelector("div.auth-btn.kakao");

	kakao_reg.addEventListener("click", function() {
		kakaoLogin();
	});
</script>