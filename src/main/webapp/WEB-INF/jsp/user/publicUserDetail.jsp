<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
	    <!-- Page -->
	    <!-- <h1 class="page-title">사용자 목록</h1> -->
	    <ol class="breadcrumb">
	      <li class="breadcrumb-item"><a href="/main/main.do">Home</a></li>
	      <li class="breadcrumb-item">사용자</li>
	      <li class="breadcrumb-item">일반회원</li>
	      <li class="breadcrumb-item active">회원상세</li>
	    </ol>
	
	    	<div class="row">
	    		<div class="col-lg-4">
	    			<div class="mb-30">
    					<div class="panel">
    						<div class="panel-body text-center">
    							<img class="rounded-circle mb-10" width="150" height="150" src="${pageContext.request.contextPath}/images/placeholder.png" alt="...">
    							<p class="form-control-plaintext"><b>회원가입일 : </b>${userVo.reg_date}</p>
    							<p class="form-control-plaintext"><b>최종로그인 : </b>${userVo.last_login_date}</p>
    						</div>
    					</div>
    					<div class="panel panel-bordered">
    						<div class="panel-heading">
    							<h3 class="panel-title">활동현황</h3>
    						</div>
    						<div class="panel-body">
    							<div class="input-group pb-5">
    								<div class="input-group-append">
    									<span class="input-group-text">열린제안</span>
    								</div>
    								<input type="text" class="form-control text-center" value="${userCntVo.suggestion_cnt}"/>
    							</div>
    							<div class="input-group pb-5">
    								<div class="input-group-append">
    									<span class="input-group-text">설문참여</span>
    								</div>
    								<input type="text" class="form-control text-center" value="${userCntVo.participation_cnt}"/>
    							</div>
    							<div class="input-group pb-5">
    								<div class="input-group-append">
    									<span class="input-group-text" >공모참여</span>
    								</div>
    								<input type="text" class="form-control text-center" value="${userCntVo.contest_cnt}"/>
    							</div>
    							<div class="input-group">
    								<div class="input-group-append">
    									<span class="input-group-text">답변활동</span>
    								</div>
    								<input type="text" class="form-control text-center" value="${userCntVo.opinion_cnt}"/>
    							</div>
    						</div>
    					</div>
    					<div class="panel panel-bordered">
    						<div class="panel-heading">
    							<h3 class="panel-title">수신여부</h3>
    						</div>
    						<div class="panel-body">
    							<div class="input-group pb-5">
    								<div class="input-group-append">
    									<span class="input-group-text">이메일</span>
    								</div>
    								<div class="form-control">
	    								<div class="float-left mr-20" id="email_chk-div">
	    									<input type="checkbox" data-plugin="switchery"/>
	    								</div>
    									<label class="pt-3" for="emailSwitch">On</label>
    								</div>
    							</div>
    							<div class="input-group pb-5">
    								<div class="input-group-append">
    									<span class="input-group-text">알림톡</span>
    								</div>
    								<div class="form-control">
    									<div class="float-left mr-20" id="talk_chk-div">
	    									<input type="checkbox" data-plugin="switchery"/>
	    								</div>
    									<label class="pt-3" for="talkSwitch">On</label>
    								</div>
    							</div>
    							<div class="input-group">
    								<div class="input-group-append">
    									<span class="input-group-text">&nbsp;SMS&nbsp;</span>
    								</div>
    								<div class="form-control">
    									<div class="float-left mr-20" id="sms_chk-div">
	    									<input type="checkbox" data-plugin="switchery"/>
	    								</div>
    									<label class="pt-3" for="smsSwitch">On</label>
    								</div>
    							</div>
    						</div>
    					</div>
	    			</div>
	    		</div>
	    		<div class="col-lg-8">
	    			<div class="mb-30">
	    				<div class="panel">
	    					<div class="panel-body">
	    						<form:form method="post" modelAttribute="userVo">
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">아이디 </label>
		    							<div class="col-md-6">
		    								<form:input type="text" class="form-control" path="user_id" readonly="true"/>
		    								<form:errors path="user_id"/>
		    							</div>
	    							</div>
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">계정 </label>
		    							<div class="col-md-6">
			    							<form:select data-plugin="selectpicker" class="w-p100" path="channel" disabled="true">
			    								<option value="일반">일반</option>
			    								<option value="카카오">카카오</option>
			    							</form:select>
		    							</div>
	    							</div>
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">유형 <span class="required">*</span></label>
		    							<div class="col-md-6">
		    								<form:select data-plugin="selectpicker" class="w-p100" path="auth_type">
			    								<option value="public">일반</option>
			    								<option value="pro">전문가</option>
			    								<option value="admin">관리자</option>
			    							</form:select>
			    							<form:errors path="auth_type"/>
		    							</div>
	    							</div>
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">이름 <span class="required">*</span></label>
		    							<div class="col-md-6">
		    								<form:input type="text" class="form-control" path="name"/>
		    								<form:errors path="name"/>
		    							</div>
	    							</div>
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">비밀번호 </label>
		    							<div class="col-md-6">
		    								<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#pwChangeModal" id="pwChangeModalBtn">변경</button>
		    							</div>
	    							</div>
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">전화번호 <span class="required">*</span></label>
		    							<div class="col-md-6">
		    								<form:input type="text" class="form-control" path="phone" placeholder="ex) xxx-xxxx-xxxx"/>
		    								<form:errors path="phone"/>
		    							</div>
	    							</div>
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">이메일 <span class="required">*</span></label>
		    							<div class="col-md-6">
		    								<form:input type="text" class="form-control" path="email" placeholder="ex) example@email.com"/>
		    								<form:errors path="email"/>
		    							</div>
	    							</div>
	    							<form:input type="hidden" path="email_chk"/>
	    							<form:input type="hidden" path="talk_chk"/>
	    							<form:input type="hidden" path="sms_chk"/>
	    							<form:input type="hidden" path="reg_date"/>
	    							<form:input type="hidden" path="last_login_date"/>
	    							
								    <br/>   
								    <br/>
								       
	    							<div class="col-md-12 text-right">
		    								<button type="submit" class="btn btn-primary waves-effect waves-classic" id="userSave" data-title="회원" formaction="/user/update.do">저장 </button>
		    								<button type="submit" class="btn btn-dark waves-effect waves-classic" id="userDelete" data-title="회원" formaction="/user/delete.do">삭제 </button>
		    								<button type="button" class="btn btn-default btn-outline waves-effect waves-classic" id="userList">목록 </button>
	    								
	    							</div>
	    							
	    						</form:form>
	    					</div>
	    				</div>
	    			</div>
	    		</div>
	    	</div>
	
	</div>
<!-- End Page -->
</div>

<!-- 비밀번호 변경 모달 -->
<div class="modal fade" id="pwChangeModal" aria-hidden="true" aria-labelledby="pwChangeModal" role="dialog" tabindex="-1">
  <div class="modal-dialog modal-simple modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" id="modalCloseBtn" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">x</span>
        </button>
        <h4 class="modal-title">비밀번호 변경</h4>
      </div>
      <div class="modal-body">
    	<div class="col-md-1"></div>
      	<form id="pwChangeForm">
          <div class="form-group form-material row">
			<div class="col-md-1"></div>
			<label class="col-md-3 col-form-label">비밀번호 </label>
			<div class="col-md-6">
				<input type="password" class="form-control" id="pw" name="pw" placeholder="영문자, 숫자 혼합 8~15자리"/>
			</div>
		  </div>
		  <div class="form-group form-material row">
			<div class="col-md-1"></div>
			<label class="col-md-3 col-form-label">비밀번호 확인 </label>
			<div class="col-md-6">
				<input type="password" class="form-control" id="pw-chk" placeholder="영문자, 숫자 혼합 8~15자리"/>
				<span class="text-left" id="pw-chk-error"></span>
			</div>
		  </div>
		  <input type="hidden" name="user_id" value="${userVo.user_id}"/>
          <span class="text-left" id="chk-error"></span>
          <button type="button" class="btn btn-primary btn-block mt-40 w-p50 float-right" id="pwChangeBtn">변경</button>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- 비밀번호 변경 모달 끝 -->
<script type="text/javascript">
	var pwFlag = false;
	var pwRule = /^(?=.*[a-z])(?=.*[0-9]).{8,15}$/;
	
	
	
	function passwordCheck() {
		var pw = $("#pw").val();
		var pwChk = $("#pw-chk").val();

		if (pw !== pwChk) {
			$("#pw-chk-error").text("비밀번호가 일치하지 않습니다.");
			pwFlag = true;
			return;
		} else {
			$("#pw-chk-error").text("");
			pwFlag = false;
		}
		
		// 비밀번호가 빈값이 아닐때만 비밀번호 규칙 확인
		if (pw !== "") {
			if (!pwRule.test(pw)) {
				$("#pw-chk-error").text("영문자, 숫자가 포함된 8~15자리로 입력해 주세요.");
				pwFlag = true;
			} else {
				$("#pw-chk-error").text("");
				pwFlag = false;
			}
		}
	}
	
	$("#pw").blur(function() {
		passwordCheck();
	});
	
	$("#pw-chk").blur(function() {
		passwordCheck();
	});
	
	// 수신여부 init
	var chkArr = ["${userVo.email_chk}", "${userVo.talk_chk}", "${userVo.sms_chk}"];
	
	$("input[type='checkbox']").each(function(idx) {
		if (chkArr[idx] === "Y") {
			if (!$(this).is(":checked")) {
				$(this).click();
			}
			
			$(this).parent().next().text("On");
		} else {
			if ($(this).is(":checked")) {
				$(this).click();
			}
			
			$(this).parent().next().text("Off");
		}
	});
	
	// 수신여부 click
	$("div[id*='_chk-div']").click(function(event) {
		// 수신여부 click하고난 후 :checked 상태에 따라 hidden으로 숨겨놓은 input태그의 value 설정
		// :checked = false -> value = 'N' , :checked = true -> value = 'Y'
		var currentTarget = event.currentTarget;
		var valueTarget = currentTarget.id.split("-")[0];
		var labelTarget = $(currentTarget).next();
		var checkboxTarget = $(currentTarget).children("input");
		
		if (checkboxTarget.is(":checked")) {
			$("#" + valueTarget).val("Y");
			
			$(labelTarget).text("On");
		} else {
			$("#" + valueTarget).val("N");
			
			$(labelTarget).text("Off");
		}
	});
	
	$("#userSave").click(function() {
		if (!submitConfirm($(this))) return false;
	});
	
	$("#userDelete").click(function() {
		if (!submitConfirm($(this))) return false;
	});
	
	$("#userList").click(function() {
		location.href = "${pageContext.request.contextPath}/user/userListPage.do?auth_type=public";
	});
	
	$("#pwChangeModalBtn").click(function() {
		$("#pw").val("");
		$("#pw-chk").val("");
		$("#pw-chk-error").text("");
	});
	
	$("#pwChangeBtn").click(function() {
		passwordCheck();
		
		if (pwFlag) {
			alert("비밀번호를 확인해주세요.");
			return;
		}
		
		if (!confirm("비밀번호를 변경하시겠습니까?")) return false;
		
		var request = $.ajax({
			url: "/user/updateUserPw.do",
			method: "post",
			data: $("#pwChangeForm").serialize()
		});
		
		request.done(function(data) {
			console.log("DONE : ", data);
			$("#modalCloseBtn").click();
		});
		
		request.fail(function(error) {
			console.log("FAIL : ", error);
			alert("비밀번호 변경에 실패하였습니다.");
		});
	});
</script>
