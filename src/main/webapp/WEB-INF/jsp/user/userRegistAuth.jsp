<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Register Wizard -->
<section class="reg-wizard-section bgc-fa">
	<div class="container">
		<div class="wizard row">
			<div class="wizard-item regist">
				<div class="step-box">
					약관동의
				</div>
				<div class="step-arrow">
					<img src="${pageContext.request.contextPath}/images/icon-arrow-forward.png">
				</div>
			</div>
			<div class="wizard-item regist">
				<div class="step-box active">
					본인확인
				</div>
				<div class="step-arrow">
					<img src="${pageContext.request.contextPath}/images/icon-arrow-forward.png">
				</div>
			</div>
			<div class="wizard-item regist">
				<div class="step-box ">
					회원정보 입력
				</div>
				<div class="step-arrow">
					<img src="${pageContext.request.contextPath}/images/icon-arrow-forward.png">
				</div>
			</div>
			<div class="wizard-item regist">
				<div class="step-box">
					가입완료
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Register Auth -->
<section class="reg-auth-section bgc-fa">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="auth-box">
					<h4>휴대폰 인증</h4>
					<div class="auth-btn-box">
						<p class="desc">
							본인 명의의 휴대폰으로만 인증이 가능합니다.<br>가입을 원하시면 <b>[인증하기]</b>를 클릭해주세요.
						</p>
						<div class="auth-btn hidden-sm-down" id="sms_auth_chk">
							<img class="icon" src="${pageContext.request.contextPath}/images/icon-auth.png">
							<p>인증하기</p>
						</div>
						<div>
							<button type="button" class="btn btn-block btn-primary hidden-sm-up" id="sms_auth_chk_mb">인증하기</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="auth-box">
					<h4>SNS 회원가입</h4>
					<div class="auth-btn-box">
						<p class="desc">기존에 사용하시는 카카오 계정으로 간단하게 회원가입하세요.</p>
						<div class="auth-btn kakao hidden-sm-down" id="kakao_auth_chk">
							<img class="icon" src="${pageContext.request.contextPath}/images/icon-auth-kakao.png">
							<p>카카오로 가입</p>
						</div>
						<div>
							<button type="button" class="btn btn-block btn-kakao hidden-sm-up" id="kakao_auth_chk_mb">카카오로 가입하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script src="${pageContext.request.contextPath}/js/kakao-login.js"></script>
<script type="text/javascript">
	//var kakao_reg = document.querySelector("div.auth-btn.kakao");
	var kakao_auth_chk = document.getElementById("kakao_auth_chk");
	var kakao_auth_chk_mb = document.getElementById("kakao_auth_chk_mb");

	kakao_auth_chk.addEventListener("click", function() {
		kakaoLogin();
	});
	
	kakao_auth_chk_mb.addEventListener("click", function() {
		kakaoLogin();
	});
	
	function smsAuthChk() {
		var request = $.ajax({
			url: "/user/smsAuthChk.do",
			method: "get"
		});
		
		request.done(function(data) {
			//console.log(data);
			
			if (data.resData) {
				var form = document.createElement("form");
				form.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
				form.target = "popupChk";
				
				var input1 = document.createElement("input");
				input1.type = "hidden";
				input1.name = "m";
				input1.value = "checkplusService";
				
				form.append(input1);
				
				var input2 = document.createElement("input");
				input2.type = "hidden";
				input2.name = "EncodeData";
				input2.value = data.resData;
				
				form.append(input2);
				
				document.body.append(form);
				
				if (sms_auth_pop === null) {
					sms_auth_pop = window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
				} else {
					if (sms_auth_pop.closed) {
						sms_auth_pop = window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
					}
				}
				
				form.submit();
			}
		});
		
		request.fail(function(error) {
			console.log("smsAuthTest.do fail", error);
		});
	}
	
	var sms_auth_chk_div = document.getElementById("sms_auth_chk");
	var sms_auth_chk_mb = document.getElementById("sms_auth_chk_mb");
	
	sms_auth_chk_div.addEventListener("click", function() {
		smsAuthChk();
	});
	
	sms_auth_chk_mb.addEventListener("click", function() {
		smsAuthChk();
	});
	
	function goUserRegistPage(obj) {
		//console.log(obj);

		var request = $.ajax({ 
			url : "/user/checkExistUser.do", 
			method : "get",
			data : obj
		});
		
		request.done(function(data) {
			console.log(data);
			
			if (data.exist) {
				alert("이미 등록된 사용자 입니다.");
			} else {
				var form = document.createElement("form");
				form.action = "/user/userRegistPage.do";
				form.method = "post";
				
				for (var key in obj) {
					var input = document.createElement("input");
					input.setAttribute("type", "hidden");
					input.setAttribute("name", key);
					input.setAttribute("value", obj[key]);
					
					form.append(input);
				}
				
				document.body.append(form);
				
				form.submit();
			}
		});
		
		request.fail(function(error) {
			console.log("checkExistUser fail", error);
		});
	}
</script>