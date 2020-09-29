<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript">
var obj = {};


obj.requestNumber 	= "${res.sRequestNumber}";
obj.responseNumber 	= "${res.sResponseNumber}";
obj.authType 		= "${res.sAuthType}";
obj.name 			= "${res.sName}";
obj.birthDate 		= "${res.sBirthDate}";
obj.gender 			= "${res.sGender}";
obj.nationalInfo 	= "${res.sNationalInfo}";
obj.dupInfo 		= "${res.sDupInfo}";
obj.connInfo 		= "${res.sConnInfo}";
obj.mobileNo 		= "${res.sMobileNo}";
obj.mobileCo 		= "${res.sMobileCo}";
obj.msg				= "${res.resMsg}";

function goParent() {
	opener.goUserRegistPage(obj);
	
	window.close();
}

goParent();
</script>