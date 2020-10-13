<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first" data-type="account">
				<a href="#" id="mypage_account_info_btn">계정 정보</a>
			</div>
			<div class="wizard-item" data-type="suggestion">
				<a href="/user/mypageSuggestionListPage.do">나의 제안 목록</a>
			</div>
			<div class="wizard-item" data-type="survey">
				<a href="/user/mypageSurveyListPage.do">나의 투표 목록</a>
			</div>
			<div class="wizard-item last" data-type="contest">
				<a href="/user/mypageContestListPage.do">나의 공모 목록</a>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var pathname = window.location.pathname;
	var wizard = document.querySelector("div.wizard");
	
	if (pathname.indexOf("Account") > -1) {
		var wizard_child = wizard.querySelector("div[data-type='account']");
		
		if (!wizard_child.classList.contains("active")) wizard_child.classList.add("active");
	} else if (pathname.indexOf("Suggestion") > -1) {
		var wizard_child = wizard.querySelector("div[data-type='suggestion']");
		
		if (!wizard_child.classList.contains("active")) wizard_child.classList.add("active");
	} else if (pathname.indexOf("Survey") > -1) {
		var wizard_child = wizard.querySelector("div[data-type='survey']");
		
		if (!wizard_child.classList.contains("active")) wizard_child.classList.add("active");
	} else if (pathname.indexOf("Contest") > -1) {
		var wizard_child = wizard.querySelector("div[data-type='contest']");
		
		if (!wizard_child.classList.contains("active")) wizard_child.classList.add("active");
	}
	

	var mypage_account_info_btn = document.getElementById("mypage_account_info_btn");
	
	mypage_account_info_btn.addEventListener("click", function() {
		var form = document.createElement("form");

		form.method = "post";
		form.action = "/user/mypageAccountInfo.do";

		var input = document.createElement("input");

		input.setAttribute("type", "hidden");
		input.setAttribute("name", "user_id");
		input.setAttribute("value", "${login.user_id}");

		form.appendChild(input);
		document.body.appendChild(form);

		form.submit();
	});
</script>