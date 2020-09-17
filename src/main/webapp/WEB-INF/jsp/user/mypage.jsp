<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first active">
				<a href="#">계정 정보</a>
			</div>
			<div class="wizard-item">
				<a href="#">나의 제안 목록</a>
			</div>
			<div class="wizard-item">
				<a href="#">나의 투표 목록</a>
			</div>
			<div class="wizard-item last">
				<a href="#">나의 공모 목록</a>
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
					<form method="post" modelAttribute="userVo">
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
								<input type="password" class="form-control" placeholder="비밀번호(영문자, 숫자 혼합 8~15자리)">
							</div>
						</div>
						<div class="form-group row ">
							<div class="col-lg-3 p0">
								<label>비밀번호 확인<span>*</span></label>
							</div>
							<div class="col-lg-9">
								<input type="password" class="form-control" placeholder="비밀번호 확인">
							</div>
						</div>
						<div class="form-group row ">
							<div class="col-lg-3 p0">
								<label>이름(닉네임)<span>*</span></label>
							</div>
							<div class="col-lg-9">
								<form:input type="text" class="form-control" path="name" placeholder="이름(닉네임)"/>
							</div>
						</div>
						<div class="form-group row ">
							<div class="col-lg-3 p0">
								<label>이메일<span>*</span></label>
							</div>
							<div class="col-lg-9">
								<form:input type="email" class="form-control" path="email" placeholder="이메일"/>
							</div>
						</div>
						<div class="form-group row ">
							<div class="col-lg-3 p0">
								<label>전화번호<span>*</span></label>
							</div>
							<div class="col-lg-9">
								<form:input type="number" class="form-control" path="phone" placeholder="전화번호" readonly="true"/>
							</div>
						</div>

						<div class="form-group row ">
							<div class="col-lg-3 p0">
								<label>알림설정<span></span></label>
							</div>
							<div class="col-lg-9">
								<div class="ui_kit_whitchbox">
									<div class="custom-control custom-switch">
										<input type="checkbox" class="custom-control-input" id="customSwitch1"> <label class="custom-control-label" for="customSwitch1">이메일</label>
									</div>
									<div class="custom-control custom-switch">
										<input type="checkbox" class="custom-control-input" id="customSwitch2"> <label class="custom-control-label" for="customSwitch2">카카오 알림톡</label>
									</div>
									<div class="custom-control custom-switch">
										<input type="checkbox" class="custom-control-input" id="customSwitch3"> <label class="custom-control-label" for="customSwitch3">문자 메세지</label>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group submit custom-control">
							<button type="submit" class="btn btn-primary">등록</button>
							<button type="submit" class="btn btn-default ">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

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
	
	/* $("#pw-chk").keyup(function(){
		passwordCheck();
	}); */
	
	$("#user-reg-btn").click(function() {
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
	
	$("#user-reg-cancel").click(function() {
		location.href = "${pageContext.request.contextPath}/user/userListPage.do?auth_type=public";
	});
	
	var userIdFlag = false;
	var idRule = /^[a-zA-Z0-9_]{5,15}$/;
	
	$("#userIdCheck").click(function() {
		var userId = $("#user_id").val();
		
		if (!idRule.test(userId)) {
			alert("아이디는 영문자, 숫자, 특수문자 _만 사용가능 하며 5~15자리로 입력해 주세요.");
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
					alert("이미 존재하는 아이디 입니다.");
				} else {
					userIdFlag = true;
					alert("사용가능한 아이디 입니다.");
					$("#userIdCheck").remove();
					//$("#userIdCheckDiv").append("<span style='color:blue;'>사용가능한 아이디입니다.</span>");
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
</script>