<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page">
	<div class="page-content container-fluid">
		SUB TEST PAGE <br/>
			
		<c:if test = "${not empty login}">
			<h1>로그인중입니다</h1>
		</c:if>
		<c:if test = "${empty login }">
		<form:form action = "/sub/login.do" method = "post" modelAttribute="subVo">
			<label>아이디 : </label>
			<form:input type = "text" path="email" size="20"/>
			<form:errors path="email"/>
			<br/>
			<label>비밀번호 : </label>
			<form:input type = "password" path="pw" size="20"/>
			<form:errors path="pw"/>
			<br/>
			<input type = "submit" value = "전송">
		</form:form>
		<div class="col-xl-3 col-md-6">
	        <div class="card bg-primary text-white mb-4">
	         		<div class="card-footer d-flex align-items-center justify-content-between">
	            	   <a class="small text-white stretched-link" href="/sub/signUpPage.do">회원가입</a>
	         	</div>
	       	</div>
	        </div>
		</c:if>
	</div>
</div>