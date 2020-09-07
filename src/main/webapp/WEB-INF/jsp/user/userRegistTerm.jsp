<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Register Wizard -->
<section class="reg-wizard-section bgc-fa">
	<div class="container">
		<div class="wizard row">
			<div class="wizard-item">
				<a href="/user/userRegistTermPage.do">
					<div class="step-box active">약관동의</div>
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
					<div class="step-box">가입완료</div>
				</a>
			</div>
		</div>
	</div>
</section>

<!-- Register Terms & Conditions -->
<section class="reg-terms-section bgc-fa">
	<div class="container">
		<div class="term-box">
			<h4>이용 약관</h4>
			<div class="terms_condition_grid p20">
				<textarea disabled>
Curabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta in ligula. Aliquam laoreet nisl massa, at interdum mauris sollicitudin et. Mauris risus lectus, tristique at nisl at, pharetra tristique enim
          </textarea>
			</div>
			<div class="form-group custom-control custom-checkbox text-center m10">
				<input type="checkbox" class="custom-control-input" /> <label class="custom-control-label">이용약관에 동의합니다.</label>
			</div>
		</div>
		<div class="term-box mb60">
			<h4>개인정보 수집・이용</h4>
			<div class="terms_condition_grid p20">
				<textarea disabled>
Curabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta iabitur massa magna, tempor in blandit id, porta in ligula. Aliquam laoreet nisl massa, at interdum mauris sollicitudin et. Mauris risus lectus, tristique at nisl at, pharetra tristique enim
            </textarea>
			</div>
			<div class="form-group custom-control custom-checkbox text-center m10">
				<input type="checkbox" class="custom-control-input" /> <label class="custom-control-label">이용약관에 동의합니다.</label>
			</div>
		</div>
		<div class="term-box">
			<div class="form-group text-center">
				<button type="submit" class="btn btn-primary btn-register">회원 가입하기</button>
			</div>
		</div>
	</div>
</section>