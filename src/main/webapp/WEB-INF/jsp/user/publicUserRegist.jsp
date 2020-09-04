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
	      <li class="breadcrumb-item active">회원등록</li>
	    </ol>
	
	    <div class="page-content">
	    	<div class="row">
	    		<div class="col-lg-4">
	    			<div class="mb-30">
    					<div class="panel">
    						<div class="panel-body text-center">
    							<img class="rounded-circle mb-10" width="150" height="150" src="${pageContext.request.contextPath}/images/placeholder.png" alt="...">
    						</div>
    					</div>
    					<div class="panel panel-bordered">
    						<div class="panel-heading">
    							<h3 class="panel-title">수신여부</h3>
    						</div>
    						<div class="panel-body">
    							<div class="input-group">
    								<div class="input-group-append">
    									<span class="input-group-text">이메일</span>
    								</div>
    								<div class="form-control">
	    								<div class="float-left mr-20" id="email_chk-div">
	    									<input type="checkbox" data-plugin="switchery"/>
	    								</div>
    									<label class="pt-3" for="emailSwitch">Off</label>
    								</div>
    							</div>
    							<div class="input-group">
    								<div class="input-group-append">
    									<span class="input-group-text">알림톡</span>
    								</div>
    								<div class="form-control">
    									<div class="float-left mr-20" id="talk_chk-div">
	    									<input type="checkbox" data-plugin="switchery"/>
	    								</div>
    									<label class="pt-3" for="talkSwitch">Off</label>
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
    									<label class="pt-3" for="smsSwitch">Off</label>
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
		    							<label class="col-md-2 col-form-label">아이디 <span class="required">*</span></label>
		    							<div class="col-md-6" id="userIdCheckDiv">
		    								<form:input type="text" class="form-control" path="user_id"/>
		    								<form:errors style="color:red;" path="user_id"/>
		    							</div>
		    							<div class="col-md-1" >
		    								<button type="button" class="btn btn-primary waves-effect waves-classic" id="userIdCheck">중복확인 </button>
		    							</div>
	    							</div>
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">계정 <span class="required">*</span></label>
		    							<div class="col-md-6">
		    								<form:select data-plugin="selectpicker" class="w-p100" path="channel">
			    								<option value="일반">일반</option>
			    								<option value="카카오">카카오</option>
			    							</form:select>
			    							<form:errors style="color:red;" path="channel"/>
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
			    							<form:errors style="color:red;" path="auth_type"/>
		    							</div>
	    							</div>
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">이름 <span class="required">*</span></label>
		    							<div class="col-md-6">
		    								<form:input type="text" class="form-control" path="name"/>
		    								<form:errors style="color:red;" path="name"/>
		    							</div>
	    							</div>
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">비밀번호 <span class="required">*</span></label>
		    							<div class="col-md-6">
		    								<form:input type="password" class="form-control" placeholder="영문자, 숫자 혼합 8~15자리" path="pw"/>
		    								<form:errors style="color:red;" path="pw"/>
		    							</div>
	    							</div>
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">비밀번호 확인 </label>
		    							<div class="col-md-6">
		    								<input type="password" class="form-control" id="pw-chk" placeholder="영문자, 숫자 혼합 8~15자리"/>
		    								<span class="text-left" id="pwChk-error" style="color:red;"></span>
		    							</div>
	    							</div>
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">전화번호 <span class="required">*</span></label>
		    							<div class="col-md-6">
		    								<form:input type="text" class="form-control" path="phone" placeholder="ex) xxx-xxxx-xxxx"/>
		    								<form:errors style="color:red;" path="phone"/>
		    							</div>
	    							</div>
	    							<div class="form-group row">
	    								<div class="col-md-2"></div>
		    							<label class="col-md-2 col-form-label">이메일 <span class="required">*</span></label>
		    							<div class="col-md-6">
		    								<form:input type="text" class="form-control" path="email" placeholder="ex) example@email.com"/>
		    								<form:errors style="color:red;" path="email"/>
		    							</div>
	    							</div>
	    							<form:input type="hidden" path="email_chk" value="N"/>
	    							<form:input type="hidden" path="talk_chk" value="N"/>
	    							<form:input type="hidden" path="sms_chk" value="N"/>
	    							<form:input type="hidden" path="reg_date"/>
	    							<form:input type="hidden" path="last_login_date"/>
	    							<div class="form-group form-material row">
	    								<div class="col-md-12 text-right">
		    								<button type="submit" class="btn btn-primary waves-effect waves-classic" id="userCreate" data-title="회원" formaction="/user/create.do">등록 </button>
		    								<button type="button" class="btn btn-default btn-outline waves-effect waves-classic" id="userList">목록 </button>
	    								</div>
	    							</div>
	    						</form:form>
	    					</div>
	    				</div>
	    			</div>
	    		</div>
	    	</div>
		</div>
	</div>
<!-- End Page -->
</div>
<script type="text/javascript">
	var pwFlag = false;
	var pwRule = /^(?=.*[a-z])(?=.*[0-9]).{8,15}$/;
	
	function passwordCheck() {
		var pw = $("#pw").val();
		var pwChk = $("#pw-chk").val();

		if (pw !== pwChk) {
			$("#pwChk-error").text("비밀번호가 일치하지 않습니다.");
			pwFlag = false;
			return;
		} else {
			$("#pwChk-error").text("");
			pwFlag = true;
		}
		
		// 비밀번호가 빈값이 아닐때만 비밀번호 규칙 확인
		if (pw !== "") {
			if (!pwRule.test(pw)) {
				$("#pwChk-error").text("영문자, 숫자가 포함된 8~15자리로 입력해 주세요.");
				pwFlag = false;
			} else {
				$("#pwChk-error").text("");
				pwFlag = true;
			}
		} else {
			pwFlag = false;
		}
	}
	
	$("#pw").change(function() {
		passwordCheck();
	});
	
	$("#pw-chk").change(function() {
		passwordCheck();
	});


	$("#pw-chk").keyup(function(){
		passwordCheck();
	});
	// 수신여부 init
	var chkArr = ["${userVo.email_chk}", "${userVo.talk_chk}", "${userVo.sms_chk}"];
	
	$("input[type='checkbox']").each(function(idx) {
		var valueTarget = $(this).parent().attr("id").split("-")[0];
		
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
		
		$("#" + valueTarget).val(chkArr[idx]);
	});
	
	// 수신여부 click
	$("div[id*='_chk-div']").click(function(event) {
		console.log(event);
		// 수신여부 click하고난 후 :checked 상태에 따라 hidden으로 숨겨놓은 input태그의 value 설정
		// :checked = false -> value = 'N' , :checked = true -> value = 'Y'
		var currentTarget = event.currentTarget;
		var valueTarget = currentTarget.id.split("-")[0];
		var labelTarget = $(currentTarget).next();
		console.log(labelTarget);
		var checkboxTarget = $(currentTarget).children("input");
		
		if (checkboxTarget.is(":checked")) {
			$("#" + valueTarget).val("Y");
			
			$(labelTarget).text("On");
		} else {
			$("#" + valueTarget).val("N");
			
			$(labelTarget).text("Off");
		}
	});
	
	$("#userCreate").click(function() {
		if (!userIdFlag) {
			alert("아이디를 확인해주세요.");
			return false;
		} 
			
		passwordCheck();
		
		if (!pwFlag) {
			alert("비밀번호를 확인해주세요.");
			return false;
		}
		
		if (!submitConfirm($(this))) return false;
	});
	
	$("#userList").click(function() {
		location.href = "${pageContext.request.contextPath}/user/userListPage.do?auth_type=public";
	});
	
	var userIdFlag = false;
	
	$("#userIdCheck").click(function() {
		var userId = $("#user_id").val();
		
		if (userId.length < 4 || userId.length > 10) {
			alert("ID는 4~10자리로 입력해주세요.");
			return false;
		}
		
		if (userId) {
			var request = $.ajax({
				url: "/user/userIdCheck.do",
				method: "get",
				data: {
					user_id: userId
				}
			});
			
			request.done(function(data) {
				if (data.exist) {
					userIdFlag = false;
					alert("이미 존재하는 ID입니다.");
				} else {
					userIdFlag = true;
					alert("사용가능한 ID입니다.");
					$("#userIdCheck").remove();
					$("#userIdCheckDiv").append("<span style='color:blue;'>사용가능한 아이디입니다.</span>");
					
				}
			});
		} else {
			userIdFlag = false;
			alert("아이디를 입력해주세요.");
		}
	});
	
	$("#user_id").change(function() {
		userIdFlag = false;
	});
	
	$(function() {
		$("#pw").val('');
		$("#pw-chk").val('');
	});
	
	
</script>
