<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
	    <!-- Page -->
	    <h1 class="page-title">사용자 수정</h1>
	    <ol class="breadcrumb">
	      <li class="breadcrumb-item"><a href="/main/main.do">Home</a></li>
	      <li class="breadcrumb-item active">사용자 수정</li>
	    </ol>
	
	    <div class="page-content">
	        <form:form method="post" modelAttribute="userVo">
	          <div class="form-group form-material row" style="display: none;">
		    	<label class="col-md-3 col-form-label">번호</label>
		    	<div class="col-md-4">
		    	  <form:input type="text" class="form-control" path="user_seq"/>
		    	</div>
		      </div>
	    		
	    	  <div class="form-group form-material row">
	      	    <label class="col-md-3 col-form-label">Email</label>
	    	    <div class="col-md-4">
	    		  <form:input type="text" class="form-control" path="email"/>
	    		  <form:errors path="email"/>
	    		</div>
	    	  </div>
	    	  
	    	  <div class="form-group form-material row">
	      	    <label class="col-md-3 col-form-label">Password</label>
	    	    <div class="col-md-4">
	    		  <form:input type="password" class="form-control" path="pw"/>
	    		  <form:errors path="pw"/>
	    		</div>
	    	  </div>
	    	  
	    	  <div class="form-group form-material row">
	      	    <label class="col-md-3 col-form-label">Password Check</label>
	    	    <div class="col-md-4">
	    		  <input type="password" class="form-control" id="pwChk"/>
	    		  <span class="text-left" id="pwChk-error"></span>
	    		</div>
	    	  </div>
	    	
	    	  <div class="form-group form-material row">
	    	    <label class="col-md-3 col-form-label">Nickname</label>
	    		<div class="col-md-4">
	    		  <form:input type="text" class="form-control" path="nickname"/>
	    		  <form:errors path="nickname"/>
	    		</div>
	    	  </div>
	    	  
	    	  <div class="form-group form-material row">
	    	    <label class="col-md-3 col-form-label">Phone</label>
	    		<div class="col-md-4">
	    		  <form:input type="text" class="form-control" path="phone_num"/>
	    		  <form:errors path="phone_num"/>
	    		</div>
	    	  </div>
	    	      
	    	  <div class="example-buttons">
                <button class="btn btn-primary waves-effect waves-classic" id="modifyBtn" type="button">수정</button>
                <button class="btn btn-danger waves-effect waves-classic" id="deleteBtn" type="button">삭제</button>
                <button class="btn btn-info waves-effect waves-classic" id="listBtn" type="button">목록</button>
              </div>
	    	</form:form>
	    </div>
    </div>
</div>

<script type="text/javascript">
	if ($("#pw").val() != null) {
		$("#pw").val("");
	}

   	$("#listBtn").click(function() {
   		location.href = "${pageContext.request.contextPath}/user/userListPage.do";
   	});
   	
   	$("#modifyBtn").click(function() {
   		passwordCheck();
   		
   		if (pwFlag) {
			alert("비밀번호를 확인해주세요.");
			return;
		}
   		
   		if (!confirm("수정하시겠습니까?")) return;
   		
   		$("#userVo").attr("action", "/user/update.do");
   		$("#userVo").submit();
   	});
   	
   	$("#deleteBtn").click(function() {
   		if (!confirm("삭제하시겠습니까?")) return;
   		
   		$("#userVo").attr("action", "/user/delete.do");
   		$("#userVo").submit();
   	});
   	
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
</script>


