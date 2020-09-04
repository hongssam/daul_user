<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
	    <!-- Page -->
	    <h1 class="page-title">사용자 비밀번호 확인</h1>
	    <ol class="breadcrumb">
	      <li class="breadcrumb-item"><a href="/main/main.do">Home</a></li>
	      <li class="breadcrumb-item active">사용자 비밀번호 확인</li>
	    </ol>
	
	    <div class="page-content">
	        <form:form method="get" action="/user/pwChk.do" modelAttribute="userVo">
	          <div class="form-group form-material row" style="display:none;">
	      	    <label class="col-md-3 col-form-label">Nickname</label>
	    	    <div class="col-md-4">
	    		  <form:input type="input" class="form-control" value="${userVo.nickname}" path="nickname"/>
	    		</div>
	    	  </div>
	    	  
	    	  <div class="form-group form-material row">
	      	    <label class="col-md-3 col-form-label">Password</label>
	    	    <div class="col-md-4">
	    		  <form:input type="password" class="form-control" path="pw"/>
	    		</div>
	    	  </div>
	    	      
	    	  <div class="example-buttons">
                <button class="btn btn-primary waves-effect waves-classic" id="chkBtn" type="submit">확인</button>
              </div>
	    	</form:form>
	    </div>
    </div>
</div>

<script type="text/javascript">
   	
   	/* $("#chkBtn").click(function() {
   		if (!confirm("수정하시겠습니까?")) return;
   		
   	}); */
</script>


