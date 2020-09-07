<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Register Wizard -->
<section class="reg-wizard-section bgc-fa">
	<div class="container">
		<div class="wizard row">
			<div class="wizard-item">
				<a href="/user/userRegistTermPage.do">
					<div class="step-box">약관동의</div>
				</a>
				<div class="step-arrow">
					<img src="${pageContext.request.contextPath}/images/icon-arrow-forward.png">
				</div>
			</div>
			<div class="wizard-item">
				<a href="/user/userRegistAuthPage.do">
					<div class="step-box">본인확인</div>
				</a>
				<div class="step-arrow">
					<img src="${pageContext.request.contextPath}/images/icon-arrow-forward.png">
				</div>
			</div>
			<div class="wizard-item">
				<a href="/user/userRegistPage.do">
					<div class="step-box ">회원정보 입력</div>
				</a>
				<div class="step-arrow">
					<img src="${pageContext.request.contextPath}/images/icon-arrow-forward.png">
				</div>
			</div>
			<div class="wizard-item">
				<a href="/user/userRegistCmplPage.do">
					<div class="step-box active">가입완료</div>
				</a>
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
				<b>김선호님</b>의 회원가입을 축하합니다.
			</p>
			<p>알차고 실속있는 서비스로 찾아뵙겠습니다.</p>
			<div class="form-group custom-control">
				<button type="submit" class="btn btn-primary">홈으로 가기</button>
				<button type="button" class="btn btn-dark">로그인</button>
			</div>
		</div>
	</div>
</section>