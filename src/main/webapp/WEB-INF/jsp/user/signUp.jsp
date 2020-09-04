<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page vertical-align text-center" data-animsition-in="fade-in" data-animsition-out="fade-out">>
	<div class="page-content vertical-align-middle">
		<div class="panel">
			<div class="panel-body">
				<div class="brand">
					<img class="brand-img" src="${pageContext.request.contextPath}/images/logo-colored.png" alt="...">
					<h2 class="brand-text font-size-18">Remark</h2>
				</div>
				<form:form method="post" action="/user/signUp.do" modelAttribute="userVo" id="signUpForm">
					<div class="form-group form-material floating" data-plugin="formMaterial">
						<form:input type="text" class="form-control" id="id" path="id"/>
						<label class="floating-label">Id</label>
						<form:errors class="text-left" path="id"/>
					</div>
					<div class="form-group form-material floating" data-plugin="formMaterial">
						<form:input type="password" class="form-control" id="pw" path="pw"/>
						<label class="floating-label">Password</label>
						<form:errors path="pw"/>
					</div>
					<div class="form-group form-material floating" data-plugin="formMaterial">
						<form:input type="password" class="form-control" id="pwChk" path=""/>
						<label class="floating-label">Password check</label>
						<form:errors path="pwCheck"/>
						<span class="text-left" id="pwChk-error"></span>
					</div>
					<div class="form-group form-material floating" data-plugin="formMaterial">
						<form:input type="text" class="form-control" path="nickname"/>
						<label class="floating-label">Nickname</label>
						<form:errors path="nickname"/>
					</div>
					<div class="form-group form-material floating" data-plugin="formMaterial">
						<form:input type="text" class="form-control" id="email" path="email"/>
						<label class="floating-label">Email</label>
						<form:errors class="text-left" path="email"/>
					</div>
					<div class="form-group form-material floating" data-plugin="formMaterial">
						<form:input type="text" class="form-control" path="phone_num"/>
						<label class="floating-label">Phone number</label>
						<form:errors path="phone_num"/>
					</div>
					<!-- <button type="submit" class="btn btn-primary btn-block btn-lg mt-40">Sign up</button> -->
					<button type="button" class="btn btn-primary btn-block btn-lg mt-40" id="signUpBtn">Sign up</button>
				</form:form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var pwFlag = false;
	
	function passwordCheck() {
		var pw = $("#pw").val();
		var pwChk = $("#pwChk").val();
		
		if (pw !== pwChk) {
			$("#pwChk-error").text("비밀번호가 일치하지 않습니다.");
			pwFlag = true;
		} else {
			$("#pwChk-error").text("");
			pwFlag = false;
		}
	}
	
	$("#pwChk").blur(function() {
		passwordCheck();
	});
	
	$("#signUpBtn").click(function() {
		passwordCheck();
		
		if (pwFlag) {
			alert("비밀번호를 확인해주세요.");
			return;
		}
		
		$("#signUpForm").submit();
	});
</script>