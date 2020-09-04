<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="page">
	<div class="page-content container-fluid">
		회원가입 <br/>
		
		
		<form:form action = "/sub/signUp.do" method = "post" modelAttribute="subVo">
			<label>아이디(email) : </label>
				<form:input type = "text" path="email" size="20"/>
				<form:errors path="email"/>
			<br/>
			<label>비밀번호 : </label>
				<form:input type = "password" path="pw" size="20"/>	
				<form:errors path="pw"/>
			<br/>
			<label>비밀번호 확인 : </label>
				<form:input type = "password" path="pwCheck" size="20"/>
				<form:errors path="pwCheck"/>
			<br/>
			<label>닉네임 : </label>
				<form:input type = "text" path="nickname" size="20"/>
				<form:errors path="nickname"/>
			<br/>
			<label>핸드폰번호 : </label>
				<form:input type = "text" path="phone_num" size="20"/>
				<form:errors path="phone_num"/>
			<br/>
		<input type = "submit" value = "전송">
	</form:form>
	</div>
	</div>
</body>
</html>