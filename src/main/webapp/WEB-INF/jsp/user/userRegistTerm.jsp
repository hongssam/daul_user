<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
	.col-org {
		color: orange;
	}
</style>
<!-- Register Wizard -->
<section class="reg-wizard-section bgc-fa">
	<div class="container">
		<div class="wizard row">
			<div class="wizard-item regist">
				<div class="step-box active">
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
				<div class="step-box">
					가입완료
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Register Terms & Conditions -->
<section class="reg-terms-section bgc-fa">
	<div class="container">
		<div class="term-box">
			<h4>이용 약관</h4>
			<div class="terms_condition_grid p20" style="overflow: scroll; height: 250px">
				<%@ include file="./provisionContent.jsp" %>
			</div>
			<div class="form-group custom-control custom-checkbox text-center m10">
				<input type="checkbox" class="custom-control-input" id="chk1" data-title="이용약관"/> <label class="custom-control-label" for="chk1">이용약관에 동의합니다.</label>
			</div>
		</div>
		<div class="term-box mb60">
			<h4>개인정보 수집・이용</h4>
			<div class="terms_condition_grid p20" style="overflow: scroll; height: 250px">
				<%@ include file="./privacyContent.jsp" %>
			</div>
			<div class="form-group custom-control custom-checkbox text-center m10">
				<input type="checkbox" class="custom-control-input" id="chk2" data-title="수집・이용"/> <label class="custom-control-label" for="chk2">개인정보 수집・이용에 동의합니다.</label>
			</div>
		</div>
		<div class="term-box">
			<div class="form-group text-center">
				<button type="button" class="btn btn-primary btn-register" id="reg_btn">회원 가입하기</button>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
	var reg_btn = document.getElementById("reg_btn");
	
	reg_btn.addEventListener("click", function() {
		var all_checkbox = document.querySelectorAll("input[type='checkbox']");
		
		for (var i = 0; i < all_checkbox.length; i++) {
			var checkbox = all_checkbox[i];
			
			if (!checkbox.checked) {
				alert("모든 약관에 동의하셔야 회원가입이 가능합니다.");
				return false;
			}
		}
		
		location.href = "${pageContext.request.contextPath}/user/userRegistAuthPage.do";
	});
</script>