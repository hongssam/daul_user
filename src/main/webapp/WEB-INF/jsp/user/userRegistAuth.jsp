<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- <%
    NiceID.Check.CPClient niceCheck = new  NiceID.Check.CPClient();
    
    String sSiteCode = "BS821";			// NICE로부터 부여받은 사이트 코드
    String sSitePassword = "FQjooBjIbgKQ";		// NICE로부터 부여받은 사이트 패스워드
    
    String sRequestNumber = "REQ0000000001";        	// 요청 번호, 이는 성공/실패후에 같은 값으로 되돌려주게 되므로 
                                                    	// 업체에서 적절하게 변경하여 쓰거나, 아래와 같이 생성한다.
    sRequestNumber = niceCheck.getRequestNO(sSiteCode);
  	session.setAttribute("REQ_SEQ" , sRequestNumber);	// 해킹등의 방지를 위하여 세션을 쓴다면, 세션에 요청번호를 넣는다.
  	
   	String sAuthType = "M";      	// 없으면 기본 선택화면, M: 핸드폰, C: 신용카드, X: 공인인증서
   	
   	String popgubun 	= "N";		//Y : 취소버튼 있음 / N : 취소버튼 없음
	String customize 	= "";		//없으면 기본 웹페이지 / Mobile : 모바일페이지
	
	String sGender = ""; 			//없으면 기본 선택 값, 0 : 여자, 1 : 남자 
	
    // CheckPlus(본인인증) 처리 후, 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.
	//리턴url은 인증 전 인증페이지를 호출하기 전 url과 동일해야 합니다. ex) 인증 전 url : http://www.~ 리턴 url : http://www.~
    String sReturnUrl = "http://localhost:9090/user/userRegistPage.do";      // 성공시 이동될 URL
    String sErrorUrl = "http://localhost:9090/user/userRegistAuthPage.do";          // 실패시 이동될 URL

    // 입력될 plain 데이타를 만든다.
    String sPlainData = "7:REQ_SEQ" + sRequestNumber.getBytes().length + ":" + sRequestNumber +
                        "8:SITECODE" + sSiteCode.getBytes().length + ":" + sSiteCode +
                        "9:AUTH_TYPE" + sAuthType.getBytes().length + ":" + sAuthType +
                        "7:RTN_URL" + sReturnUrl.getBytes().length + ":" + sReturnUrl +
                        "7:ERR_URL" + sErrorUrl.getBytes().length + ":" + sErrorUrl +
                        "11:POPUP_GUBUN" + popgubun.getBytes().length + ":" + popgubun +
                        "9:CUSTOMIZE" + customize.getBytes().length + ":" + customize + 
						"6:GENDER" + sGender.getBytes().length + ":" + sGender;
    
    String sMessage = "";
    String sEncData = "";
    
    int iReturn = niceCheck.fnEncode(sSiteCode, sSitePassword, sPlainData);
    if( iReturn == 0 )
    {
        sEncData = niceCheck.getCipherData();
    }
    else if( iReturn == -1)
    {
        sMessage = "암호화 시스템 에러입니다.";
    }    
    else if( iReturn == -2)
    {
        sMessage = "암호화 처리오류입니다.";
    }    
    else if( iReturn == -3)
    {
        sMessage = "암호화 데이터 오류입니다.";
    }    
    else if( iReturn == -9)
    {
        sMessage = "입력 데이터 오류입니다.";
    }    
    else
    {
        sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
    }
%> --%>

<!-- Register Wizard -->
<section class="reg-wizard-section bgc-fa">
	<div class="container">
		<div class="wizard row">
			<div class="wizard-item">
				<div class="step-box">
					<a href="#">
						약관동의
					</a>
				</div>
				<div class="step-arrow">
					<img src="${pageContext.request.contextPath}/images/icon-arrow-forward.png">
				</div>
			</div>
			<div class="wizard-item">
				<div class="step-box active">
					<a href="#">
						본인확인
					</a>
				</div>
				<div class="step-arrow">
					<img src="${pageContext.request.contextPath}/images/icon-arrow-forward.png">
				</div>
			</div>
			<div class="wizard-item">
				<div class="step-box ">
					<a href="#">
						회원정보 입력
					</a>
				</div>
				<div class="step-arrow">
					<img src="${pageContext.request.contextPath}/images/icon-arrow-forward.png">
				</div>
			</div>
			<div class="wizard-item">
				<div class="step-box">
					<a href="#">
						가입완료
					</a>
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
						<div class="auth-btn" id="sms_auth_chk">
							<img class="icon" src="${pageContext.request.contextPath}/images/icon-auth.png">
							<p>인증하기</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="auth-box">
					<h4>SNS 회원가입</h4>
					<div class="auth-btn-box">
						<p class="desc">기존에 사용하시는 계정으로 간단하게 회원가입하세요.</p>
						<div class="auth-btn kakao">
							<img class="icon" src="${pageContext.request.contextPath}/images/icon-auth-kakao.png">
							<p>카카오로 가입</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script src="${pageContext.request.contextPath}/js/kakao-login.js"></script>
<script type="text/javascript">
	var kakao_reg = document.querySelector("div.auth-btn.kakao");

	kakao_reg.addEventListener("click", function() {
		kakaoLogin();
	});
	
	function smsAuthChk() {
		var request = $.ajax({
			url: "/user/smsAuthChk.do",
			method: "get"
		});
		
		request.done(function(data) {
			console.log(data);
			
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
				
				window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
				
				form.submit();
			}
		});
		
		request.fail(function(error) {
			console.log("smsAuthTest.do fail", error);
		});
	}
	
	var sms_auth_chk_div = document.getElementById("sms_auth_chk");
	
	sms_auth_chk_div.addEventListener("click", function() {
		smsAuthChk();
	});
	
	function goUserRegistPage(obj) {
		console.log(obj);
		
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
</script>