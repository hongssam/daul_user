<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first active">
				<a href="#">계정 정보</a>
			</div>
			<div class="wizard-item">
				<a href="/user/mypageSuggestionListPage.do">나의 제안 목록</a>
			</div>
			<div class="wizard-item">
				<a href="/user/mypageSurveyListPage.do">나의 투표 목록</a>
			</div>
			<div class="wizard-item last">
				<a href="/user/mypageContestListPage.do">나의 공모 목록</a>
			</div>
		</div>
	</div>
</div>


<!-- Profile Section -->
<section class="profile-section bgc-fa">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-lg-8 offset-lg-2">
				<div class="reg-form-box">
					<form:form method="post" modelAttribute="userVo">
						<div class="form-group row">
							<div class="col-lg-3 p0">
								<label>아이디<span>*</span></label>
							</div>
							<div class="col-lg-9 ">
								<form:input type="text" class="form-control " path="user_id" placeholder="아이디" readonly="true"/>
							</div>
						</div>
						<div class="form-group row ">
							<div class="col-lg-3 p0">
								<label>비밀번호<span>*</span></label>
							</div>
							<div class="col-lg-9">
								<form:input type="password" class="form-control" path="pw" placeholder="비밀번호(영문자, 숫자 혼합 8~15자리)"/>
								<form:errors style="color: red" path="pw"/>
							</div>
						</div>
						<div class="form-group row ">
							<div class="col-lg-3 p0">
								<label>비밀번호 확인<span>*</span></label>
							</div>
							<div class="col-lg-9">
								<input type="password" class="form-control" id="pw-chk" placeholder="비밀번호 확인">
								<span class="text-left" id="pwChk-error" style="color:red"></span>
							</div>
						</div>
						<div class="form-group row ">
							<div class="col-lg-3 p0">
								<label>이름(닉네임)<span>*</span></label>
							</div>
							<div class="col-lg-9">
								<form:input type="text" class="form-control" path="name" placeholder="이름(닉네임)"/>
								<form:errors style="color: red" path="name"/>
							</div>
						</div>
						<div class="form-group row ">
							<div class="col-lg-3 p0">
								<label>이메일<span>*</span></label>
							</div>
							<div class="col-lg-9">
								<form:input type="email" class="form-control" path="email" placeholder="이메일"/>
								<form:errors style="color: red" path="email"/>
							</div>
						</div>
						<div class="form-group row ">
							<div class="col-lg-3 p0">
								<label>전화번호<span>*</span></label>
							</div>
							<div class="col-lg-9">
								<form:input type="text" class="form-control" path="phone" placeholder="전화번호" readonly="true"/>
							</div>
						</div>

						<div class="form-group row ">
							<div class="col-lg-3 p0">
								<label>알림설정<span></span></label>
							</div>
							<div class="col-lg-9">
								<div class="ui_kit_whitchbox">
									<div class="custom-control custom-switch">
										<input type="checkbox" class="custom-control-input" id="email_chk" name="email_chk" value="Y"> 
										<label class="custom-control-label" for="email_chk">이메일</label>
									</div>
									<div class="custom-control custom-switch">
										<input type="checkbox" class="custom-control-input" id="talk_chk" name="talk_chk" value="Y"> 
										<label class="custom-control-label" for="talk_chk">카카오 알림톡</label>
									</div>
									<div class="custom-control custom-switch">
										<input type="checkbox" class="custom-control-input" id="sms_chk" name="sms_chk" value="Y"> 
										<label class="custom-control-label" for="sms_chk">문자 메세지</label>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group submit custom-control">
							<button type="button" class="btn btn-primary" id="user_modify_btn" data-title="회원정보">수정</button>
							<button type="button" class="btn btn-default ">취소</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
	document.getElementById("pw").value = "";
	
	var chk_obj = {
			email_chk : "${userVo.email_chk}",
			talk_chk  : "${userVo.talk_chk}",
			sms_chk   : "${userVo.sms_chk}"
	}
	
	for (var data of Object.entries(chk_obj)) {
		if (data[1] === "Y") {
			var chkbox = document.getElementById(data[0]);
			
			chkbox.checked = true;
		}
	}
	
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
	
	var user_modify_btn = document.getElementById("user_modify_btn");
	
	user_modify_btn.addEventListener("click", function(e) {
		passwordCheck();
		
		if (!pwFlag) {
			alert("비밀번호를 확인해주세요.");
			return false;
		}
		
		if (!submitConfirm($(user_modify_btn))) return false;
		
		var form = document.getElementById("userVo");
		form.action = "/user/publicUserModify.do";
		
		form.submit();
	});
</script>