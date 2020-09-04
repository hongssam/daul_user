<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
	    <!-- Page -->
	    <h1 class="page-title">사용자 상세</h1>
	    <ol class="breadcrumb">
	      <li class="breadcrumb-item"><a href="/main/main.do">Home</a></li>
	      <li class="breadcrumb-item active">사용자 상세</li>
	    </ol>
	
	    <div class="page-content">
	        <form>
	          <div class="form-group form-material row">
		    	<label class="col-md-3 col-form-label">번호</label>
		    	<div class="col-md-4">
		    	  <input type="text" class="form-control" value="${userVo.user_seq}" disabled/>
		    	</div>
		      </div>
	    		
	    	  <div class="form-group form-material row">
	      	    <label class="col-md-3 col-form-label">Email</label>
	    	    <div class="col-md-4">
	    		  <input type="text" class="form-control" value="${userVo.email}" disabled/>
	    		</div>
	    	  </div>
	    	
	    	  <div class="form-group form-material row">
	    	    <label class="col-md-3 col-form-label">Nickname</label>
	    		<div class="col-md-4">
	    		  <input type="text" class="form-control" value="${userVo.nickname}" disabled/>
	    		</div>
	    	  </div>
	    	  
	    	  <div class="form-group form-material row">
	    	    <label class="col-md-3 col-form-label">Phone</label>
	    		<div class="col-md-4">
	    		  <input type="text" class="form-control" value="${userVo.phone_num}" disabled/>
	    		</div>
	    	  </div>
	    	      
	    	  <div class="example-buttons">
                <button class="btn btn-primary waves-effect waves-classic" id="modifyBtn" type="button">수정</button>
                <button class="btn btn-info waves-effect waves-classic" id="listBtn" type="button">목록</button>
              </div>
	    	</form>
	    </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
    	var nickname = getParameterByName("Nickname");
    	
    	$("#modifyBtn").click(function() {
    		location.href = "${pageContext.request.contextPath}/user/userPwChkPage.do?Nickname=" + nickname;
    	});
    	
    	$("#deleteBtn").click(function() {
    		// delete request
    	});
    	
    	$("#listBtn").click(function() {
    		location.href = "${pageContext.request.contextPath}/user/userListPage.do";
    	});
    })
</script>


