<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
	NiceID.Check.CPClient niceCheck = new NiceID.Check.CPClient();

	String sSiteCode = "BS821"; // NICE로부터 부여받은 사이트 코드
	String sSitePassword = "FQjooBjIbgKQ"; // NICE로부터 부여받은 사이트 패스워드

	String sRequestNumber = "REQ0000000001"; // 요청 번호, 이는 성공/실패후에 같은 값으로 되돌려주게 되므로 
												// 업체에서 적절하게 변경하여 쓰거나, 아래와 같이 생성한다.
	sRequestNumber = niceCheck.getRequestNO(sSiteCode);
	session.setAttribute("REQ_SEQ", sRequestNumber); // 해킹등의 방지를 위하여 세션을 쓴다면, 세션에 요청번호를 넣는다.

	String sAuthType = "M"; // 없으면 기본 선택화면, M: 핸드폰, C: 신용카드, X: 공인인증서

	String popgubun = "N"; //Y : 취소버튼 있음 / N : 취소버튼 없음
	String customize = ""; //없으면 기본 웹페이지 / Mobile : 모바일페이지

	String sGender = ""; //없으면 기본 선택 값, 0 : 여자, 1 : 남자 

	// CheckPlus(본인인증) 처리 후, 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.
	//리턴url은 인증 전 인증페이지를 호출하기 전 url과 동일해야 합니다. ex) 인증 전 url : http://www.~ 리턴 url : http://www.~
	String sReturnUrl = "http://localhost:8082/idInquiry_success.jsp"; // 성공시 이동될 URL
	String sErrorUrl = "http://localhost:8082/checkplus_fail.jsp"; // 실패시 이동될 URL

	// 입력될 plain 데이타를 만든다.
	String sPlainData = "7:REQ_SEQ" + sRequestNumber.getBytes().length + ":" + sRequestNumber + "8:SITECODE"
			+ sSiteCode.getBytes().length + ":" + sSiteCode + "9:AUTH_TYPE" + sAuthType.getBytes().length + ":"
			+ sAuthType + "7:RTN_URL" + sReturnUrl.getBytes().length + ":" + sReturnUrl + "7:ERR_URL"
			+ sErrorUrl.getBytes().length + ":" + sErrorUrl + "11:POPUP_GUBUN" + popgubun.getBytes().length
			+ ":" + popgubun + "9:CUSTOMIZE" + customize.getBytes().length + ":" + customize + "6:GENDER"
			+ sGender.getBytes().length + ":" + sGender;

	String sMessage = "";
	String sEncData = "";

	int iReturn = niceCheck.fnEncode(sSiteCode, sSitePassword, sPlainData);
	if (iReturn == 0) {
		sEncData = niceCheck.getCipherData();
	} else if (iReturn == -1) {
		sMessage = "암호화 시스템 에러입니다.";
	} else if (iReturn == -2) {
		sMessage = "암호화 처리오류입니다.";
	} else if (iReturn == -3) {
		sMessage = "암호화 데이터 오류입니다.";
	} else if (iReturn == -9) {
		sMessage = "입력 데이터 오류입니다.";
	} else {
		sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
	}
%>

<!-- Our LogIn Register -->

<script language='javascript'>
	window.name = "Parent_window";

	function fnPopup() {
		window
				.open('', 'popupChk',
						'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
		document.form_chk.target = "popupChk";
		document.form_chk.submit();
	}
</script>


<!-- Register Auth -->
<section class="reg-auth-section bgc-fa">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="auth-box">
					<h4>비밀번호 찾기</h4>
					<div class="auth-btn-box">
						<p class="desc">
							본인 명의의 휴대폰으로만 인증이 가능합니다.
							<br>
							비밀번호찾기를 원하시면 <b>[인증하기]</b>를 클릭해주세요.
						</p>
						<form name="form_chk" method="post">
							<input type="hidden" name="m" value="checkplusService">
							<input type="hidden" name="EncodeData" value="<%=sEncData%>">
							<div class="auth-btn" onclick="fnPopup();">
								<img class="icon" src="${pageContext.request.contextPath}/images/icon-auth.png">
								<p>인증하기</p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<button type="button" class="" data-toggle="modal" data-target="#openModal" id="modalOpenBtn" href="#" style="display: none;"></button>
	<button type="button" class="" data-toggle="modal" data-target="#openPwChangeModal" id="openPwChangeModalBtn" href="#" style="display: none;"></button>

</section>

<div class="modal fade" id="openModal" aria-hidden="true" aria-labelledby="faqPositionCenter" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-simple modal-center">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">x</span>
				</button>
				<h4 class="modal-title">비밀번호 찾기</h4>
			</div>
			<div class="modal-body">
				<div class="example-wrap" id="modal-div"></div>
				<div style="text-align: center">
					<button type="button" class="btn btn-default waves-effect waves-classics" data-dismiss="modal" aria-label="Close" id="faq-modal-cancle-btn">확인</button>
				</div>
			</div>
			<div class="modal-footer">
				<!-- <button type="button" class="btn btn-default btn-pure" data-dismiss="modal">Close</button>
       			<button type="button" class="btn btn-primary">Save changes</button> -->
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="openPwChangeModal" aria-hidden="true" aria-labelledby="faqPositionCenter" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-simple modal-center">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">x</span>
				</button>
				<h4 class="modal-title">비밀번호 찾기</h4>
			</div>
			<div class="modal-body">
				<form id="pwChange-modal-form">
					<div class="example-wrap">
						<h4 class="example-title">새 비밀번호</h4>
						<input type="text" class="form-control" name="pw" id="inputPlaceholder" value="" />
						<span>비밀번호는 9자 이상 입력해야 합니다.</span>
						<br>
						<span>최소 하나의 영문,숫자,특수문자를 입력해야 합니다.</span>
						<br>
						<span>특수문자는 !@#$%^&*() 를 입력할 수 있습니다.</span>
						<hr />
						<h4 class="example-title">비밀번호 재입력</h4>
						<input type="text" class="form-control" name="new_pw" id="inputPlaceholder" value="" />
						<span>위에 입력한 비밀번호를 한번 더 입력해 주십시오.</span>
						<hr />
					</div>
					<div style="text-align: center">
						<button type="button" class="btn btn-primary waves-effect waves-classics" id="pwChange-modal-btn" data-title="비밀번호">변경</button>
						<button type="button" class="btn btn-default waves-effect waves-classics" data-dismiss="modal" aria-label="Close" id="faq-modal-cancle-btn">취소</button>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<!-- <button type="button" class="btn btn-default btn-pure" data-dismiss="modal">Close</button>
       			<button type="button" class="btn btn-primary">Save changes</button> -->
			</div>
		</div>
	</div>
</div>



<script type="text/javascript">
	function test(di) {

		var request = $.ajax({ url : "/user/checkDI.do?user_di=" + di, method : "get" });
		request.done(function(data) {
			console.log(data)
			if (typeof data.user_id == "undefined" || data.user_id == null) {
				openModal2(data);
			} else {
				openModal(data);
			}
		});

		request.fail(function(error) {
			console.log("request fail");
		});
	}

	function openModal(data) {
		$("#openPwChangeModalBtn").click();
	}

	function openModal2(data) {
		$("#modal-div").children().remove();
		var str = '<span>해당 휴대폰으로 가입된 정보가 없습니다.</span>';
		$("#modal-div").append(str);

		$("#modalOpenBtn").click();
	}
	
	$("#pwChange-modal-btn").click(function() {
		if (!submitConfirm($(this)))
			return false;

		changePw();
	});
	
	function changePw(){
		console.log("changePw");
	}
</script>


