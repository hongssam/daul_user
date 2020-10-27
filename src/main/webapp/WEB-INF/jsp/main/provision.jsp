<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Subpage Nav Tabs -->
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first">
				<a href="/main/privacyPage.do">개인정보처리방침</a>
			</div>
			<div class="wizard-item last active">
				<a href="/main/provisionPage.do">이용약관</a>
			</div>
		</div>
	</div>
</div>

<!-- Register Terms & Conditions -->
<section class="reg-terms-section bgc-fa">
	<div class="container">
		<div class="term-box">
			<div class="terms_condition_grid p20" style="overflow: scroll; height: 450px">
				<%@ include file="../user/provisionContent.jsp" %>
			</div>
		</div>
	</div>
</section> 