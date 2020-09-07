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
					<div class="step-box active">회원정보 입력</div>
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

<!-- Register -->
<section class="reg-form-section bgc-fa">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-lg-8 offset-lg-2">
				<div class="reg-form-box">
					<form action="#">
						<div class="form-group row">
							<div class="col-lg-3 p0">
								<label>아이디<span>*</span></label>
							</div>
							<div class="col-lg-9 id-dupl ">
								<input type="text" class="form-control pull-left" placeholder="아이디">
								<button type="submit" class="btn btn-dupl btn-dark pull-right">중복확인</button>
							</div>
						</div>
						<div class="form-group row ">
							<div class="col-lg-3 p0">
								<label>비밀번호<span>*</span></label>
							</div>
							<div class="col-lg-9">
								<input type="password" class="form-control" placeholder="비밀번호(영문자, 숫자 혼합 8~15자리)">
							</div>
						</div>
						<div class="form-group row ">
							<div class="col-lg-3 p0">
								<label>비밀번호 확인<span>*</span></label>
							</div>
							<div class="col-lg-9">
								<input type="password" class="form-control" placeholder="비밀번호 확인">
							</div>
						</div>
						<div class="form-group row ">
							<div class="col-lg-3 p0">
								<label>이름(닉네임)<span>*</span></label>
							</div>
							<div class="col-lg-9">
								<input type="text" class="form-control" placeholder="이름(닉네임)">
							</div>
						</div>
						<div class="form-group row ">
							<div class="col-lg-3 p0">
								<label>이메일<span>*</span></label>
							</div>
							<div class="col-lg-9">
								<input type="email" class="form-control" placeholder="이메일">
							</div>
						</div>
						<div class="form-group row ">
							<div class="col-lg-3 p0">
								<label>전화번호<span>*</span></label>
							</div>
							<div class="col-lg-9">
								<input type="number" class="form-control phone" placeholder="전화번호" disabled>
							</div>
						</div>
						<div class="form-group submit custom-control">
							<button type="submit" class="btn btn-primary">등록</button>
							<button type="submit" class="btn btn-default ">취소</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</section>