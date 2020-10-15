<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="./mypageNavTab.jsp" %>

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
								<label>비밀번호<span></span></label>
							</div>
							<div class="col-lg-9">
								<c:choose>
									<c:when test ="${ login.user_key eq '' || empty login.user_key }">
										<button type="button" class="btn btn-primary" data-toggle="modal" onclick="pw_alert();" style="font-size:14px; margin-bottom:0px;">비밀번호변경</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#openPwChangeModal" id="openPwChangeModalBtn" style="font-size:14px; margin-bottom:0px;">비밀번호변경</button>	
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<%-- 
						<div class="form-group row ">
							<div class="col-lg-3 p0">
								<label>비밀번호 확인<span>*</span></label>
							</div>
							<div class="col-lg-9">
								<input type="password" class="form-control" id="pw-chk" placeholder="비밀번호 확인">
								<span class="text-left" id="pwChk-error" style="color:red"></span>
							</div>
						</div> --%>
						<div class="form-group row ">
							<div class="col-lg-3 p0">
								<label>이름(닉네임)<span>*</span></label>
							</div>
							<div class="col-lg-9">
								<form:input type="text" class="form-control" path="name" placeholder="이름(닉네임)"/>
								<form:errors style="color: red" path="name"/>
							</div>
						</div>
						<%-- <div class="form-group row ">
							<div class="col-lg-3 p0">
								<label>이메일<span>*</span></label>
							</div>
							<div class="col-lg-9">
								<form:input type="email" class="form-control" path="email" placeholder="이메일"/>
								<form:errors style="color: red" path="email"/>
							</div>
						</div> --%>
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
								<!-- 	<div class="custom-control custom-switch">
										<input type="checkbox" class="custom-control-input" id="email_chk" name="email_chk" value="Y"> 
										<label class="custom-control-label" for="email_chk">이메일</label>
									</div> -->
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
							<!-- <button type="button" class="btn btn-danger" id="" data-title="회원탈퇴">탈퇴</button> -->
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</section>


<div class="survey-result-modal modal fade" id="openPwChangeModal" aria-hidden="true" aria-labelledby="faqPositionCenter" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-simple modal-center">
		<div class="modal-content">
			<div class="modal-header">
				<p>비밀번호 찾기</p>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="pwChange-modal-form">
					<div class="example-wrap">
						<input type="hidden" id="modal_user_id" name="user_id" value="">
						<h4 class="example-title">새 비밀번호</h4>
						<input type="password" class="form-control" name="pw" id="pw" value="" />
						<span>비밀번호는 8자 이상 입력해야 합니다.</span>
						<br>
						<span>최소 하나의 영문,숫자,특수문자를 입력해야 합니다.</span>
						<br>
						<br>
						<h4 class="example-title">비밀번호 재입력</h4>
						<input type="password" class="form-control" name="new_pw" id="pw-chk" value="" />
						<span>위에 입력한 비밀번호를 한번 더 입력해 주십시오.</span>
						<br>
						<span class="text-left" id="pwChk-error" style="color: red"></span>
						<br>
					</div>
					<!-- <div style="text-align: center">
						<button type="button" class="btn btn-primary waves-effect waves-classics" id="pwChange-modal-btn" data-title="비밀번호">변경</button>
						<button type="button" class="btn btn-default waves-effect waves-classics" data-dismiss="modal" aria-label="Close" id="faq-modal-cancle-btn">취소</button>
					</div> -->
				</form>
			</div>
			<div class="modal-footer">
				<!-- <button type="button" class="btn btn-default btn-pure" data-dismiss="modal">Close</button>
       			<button type="button" class="btn btn-primary">Save changes</button> -->
       			<button type="button" class="btn btn-primary waves-effect waves-classics" id="pwChange-modal-btn" data-title="비밀번호">변경</button>
				<button type="button" class="btn btn-default waves-effect waves-classics" data-dismiss="modal" aria-label="Close" id="faq-modal-cancle-btn">취소</button>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	document.getElementById("pw").value = "";
	
	var chk_obj = {
			//email_chk : "${userVo.email_chk}",
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
	var pwRule = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	
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
				$("#pwChk-error").text("영문자, 숫자, 특수문자가 포함된 8~15자리로 입력해 주세요.");
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
	/* 	passwordCheck();
		
		if (!pwFlag) {
			alert("비밀번호를 확인해주세요.");
			return false;
		}  */
		
		if (!submitConfirm($(user_modify_btn))) return false;
		
		var form = document.getElementById("userVo");
		form.action = "/user/publicUserModify.do";
		
		form.submit();
	});
	 
	var openPwChangeModalBtn = document.getElementById("openPwChangeModalBtn");
	openPwChangeModalBtn.addEventListener("click", function() {
		var user_id = $("#user_id").val();
		$("#modal_user_id").val(user_id);
	});
		
	$("#pwChange-modal-btn").click(function() {

		passwordCheck();

		if (!pwFlag) {
			alert("비밀번호를 확인해주세요.");
			return false;
		}

		if (!submitConfirm($(this)))
			return false;

		changePw();
	});
	
	var pwRule = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;

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
				$("#pwChk-error").text("영문자, 숫자, 특수문자가 포함된 8자리 이상으로 입력해 주세요.");
				pwFlag = false;
			} else {
				$("#pwChk-error").text("");
				pwFlag = true;
			}
		} else {
			pwFlag = false;
		}
	}
	
	
	function changePw() {

		var request = $.ajax({ url : "/user/changeNewPw2.do", method : "post", data : $("#pwChange-modal-form").serialize() });

		request.done(function(data) {
			alert("패스워드가 정상적으로 변경되었습니다.");
			location.href = "${pageContext.request.contextPath}/login/loginPage.do";

		});

		request.fail(function(error) {
			console.log("request fail");
		});

		var pwFlag = false;
	}
	
	
	function pw_alert(){
		alert("카카오계정만 등록되어있는 경우 비밀번호를 변경할 수 없습니다.");
	}
	
</script>