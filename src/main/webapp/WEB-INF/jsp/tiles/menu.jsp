<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Main Header Nav -->
<header class="header-nav menu_style_home_one home7 navbar-scrolltofixed stricky-fixed main-menu">
	<div class="container p0">
		<!-- Ace Responsive Menu -->
		<nav>
			<!-- Menu Toggle btn-->
			<div class="menu-toggle">
				<img class="nav_logo_img img-fluid" src="${pageContext.request.contextPath}/images/logo.png" alt="header-logo.png">
				<button type="button" id="menu-btn">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<a href="/main/main.do" class="navbar_brand float-left dn-smd">
				<img class="logo1 img-fluid" src="${pageContext.request.contextPath}/images/logo.png" alt="header-logo.png" style="width: 180px; margin-top: 10px;"> <img class="logo2 img-fluid" src="${pageContext.request.contextPath}/images/logo.png" alt="header-logo.png" style="width: 180px; margin-top: 10px;">
			</a>
			<!-- Responsive Menu Structure-->
			<!--Note: declare the Menu style in the data-menu-style="horizontal" (options: horizontal, vertical, accordion) -->
			<ul id="respMenu" class="ace-responsive-menu text-center" data-menu-style="horizontal">
				<li>
					<a href="/board/introPage.do">
						<span class="title">e-다울마당</span>
					</a>
					<!-- Level Two-->
					<ul>
						<li>
							<a href="/board/introPage.do">e-다울마당이란?</a>
						</li>
						<li>
							<a href="/faq/faqListPage.do">자주하는 질문</a>
						</li>
						<li>
							<a href="/notice/noticeListPage.do">공지사항</a>
						</li>
						<li>
							<a href="/qna/qnaListPage.do">묻고답하기</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="/suggestion/suggestionListPage.do?order=1&board_type=normal">
						<span class="title">열린제안</span>
					</a>
					<!-- Level Two-->
					<ul>
						<c:choose>
							<c:when test="${empty login.user_id }">
								<li>
									<a onclick="gotoLoginPage()">제안하기</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="/suggestion/suggestionRegistPage.do">제안하기</a>
								</li>
							</c:otherwise>
						</c:choose>

						<li>
							<a href="/suggestion/suggestionListPage.do?order=1&board_type=normal">열린제안</a>
						</li>
						<li>
							<a href="/suggestion/suggestionListPage.do?order=1&board_type=like">공감제안</a>
						</li>
						<li>
							<a href="/suggestion/suggestionListPage.do?order=1&board_type=end">종료된제안</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="/survey/surveyListPage.do?order=1">
						<span class="title">설문조사</span>
					</a>
					<!-- Level Two-->
					<ul>
						<li>
							<a href="/survey/surveyListPage.do?order=1">설문조사</a>
						</li>
						<li>
							<a href="/survey/surveyNoticeListPage.do">공지사항</a>
						</li>
					</ul>
				</li>
				<li class="last">
					<a href="/contest/contestListPage.do?order=1">
						<span class="title">공모제안</span>
					</a>
					<!-- Level Two-->
					<ul>
						<li>
							<a href="/contest/contestListPage.do?order=1">공모제안</a>
						</li>
						<li>
							<a href="/contest/contestNoticeListPage.do">공지사항</a>
						</li>
					</ul>
				</li>
				<c:choose>
					<c:when test="${login.name ne '' && not empty login.name }">
						<li class="list-inline-item list_s pull-right nav-item-account">
							<a href="#" class="btn" style="margin-top: 1px" onclick="kakaoUserLogout()">
								<span class="dn-lg">| 로그아웃</span>
							</a>
						</li>
						<li class="list-inline-item list_s pull-right nav-item-account">
							<a href="#" class="flaticon-user" style="cursor: pointer" id="mypage_btn">
								<span class="dn-lg">${login.name}</span>
							</a>
							<form id="mypage_form">
								<input type="hidden" name="user_id" value="${login.user_id}" />
							</form>
						</li>
					</c:when>
					<c:otherwise>
						<li class="list-inline-item list_s pull-right nav-item-account">
							<a href="/user/userRegistTermPage.do" style="margin-top: 1px">
								<span class="dn-lg">| 회원가입</span>
							</a>
						</li>
						<li class="list-inline-item list_s pull-right nav-item-account">
							<a href="/login/loginPage.do" class="flaticon-user">
								<span class="dn-lg">로그인</span>
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</div>
</header>

<!-- Main Header Nav For Mobile -->
<div id="page" class="stylehome1 h0">
	<div class="mobile-menu">
		<div class="header stylehome1">
			<div class="main_logo_home2 text-center">
				<img class="nav_logo_img img-fluid mt20" style="width: 150px; margin-top: 30px;" src="${pageContext.request.contextPath}/images/logo.png" alt="header-logo.png" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
			</div>
			<ul class="menu_bar_home2">
				<c:choose>
					<c:when test="${login.name ne '' && not empty login.name }">
						<li class="list-inline-item list_s">
							<a href="#" id="mypage_btn3">
								<span class="flaticon-user"></span>
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="list-inline-item list_s">
							<a href="/login/loginPage.do">
								<span class="flaticon-user"></span>
							</a>
						</li>
					</c:otherwise>
				</c:choose>

				<li class="list-inline-item">
					<a href="#menu">
						<span></span>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- /.mobile-menu -->
	<nav id="menu" class="stylehome1">
		<ul>
			<li>
				<span>e-다울마당</span>
				<!-- Level Two-->
				<ul>
					<li>
						<a href="/board/introPage.do">e-다울마당이란?</a>
					</li>
					<li>
						<a href="/faq/faqListPage.do">자주하는 질문</a>
					</li>
					<li>
						<a href="/notice/noticeListPage.do">공지사항</a>
					</li>
					<li>
						<a href="/qna/qnaListPage.do">묻고답하기</a>
					</li>
				</ul>
			</li>
			<li>
				<span>열린제안</span>
				<!-- Level Two-->
				<ul>
					<li>
						<c:choose>
							<c:when test="${empty login.user_id }">
								<li>
									<a onclick="gotoLoginPage()">제안하기</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="/suggestion/suggestionRegistPage.do">제안하기</a>
								</li>
							</c:otherwise>
						</c:choose>
					</li>
					<li>
						<a href="/suggestion/suggestionListPage.do?order=1&board_type=normal">열린제안</a>
					</li>
					<li>
						<a href="/suggestion/suggestionListPage.do?order=1&board_type=like">공감제안</a>
					</li>
					<li>
						<a href="/suggestion/suggestionListPage.do?order=1&board_type=end">종료된제안</a>
					</li>
				</ul>
			</li>
			<li>
				<span>설문조사</span>
				<!-- Level Two-->
				<ul>
					<li>
						<a href="/survey/surveyListPage.do?order=1">설문조사</a>
					</li>
					<li>
						<a href="/survey/surveyNoticeListPage.do">공지사항</a>
					</li>
				</ul>
			</li>
			<li>
				<span>공모제안</span>
				<!-- Level Two-->
				<ul>
					<li>
						<a href="/contest/contestListPage.do?order=1">공모제안</a>
					</li>
					<li>
						<a href="/contest/contestNoticeListPage.do">공지사항</a>
					</li>
				</ul>
			</li>

			<c:choose>
				<c:when test="${login.name ne '' && not empty login.name }">
					<li>
						<a href="#" id="mypage_btn_left">
							<span class="flaticon-user"></span>
							${login.name}
						</a>
					</li>
					<li>
						<a href="#" onclick="kakaoUserLogout()">
							<span class="flaticon-logout"></span>
							로그아웃
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="/login/loginPage.do">
							<span class="flaticon-user"></span>
							로그인
						</a>
					</li>
					<li>
						<a href="/user/userRegistTermPage.do">
							<span class="flaticon-edit"></span>
							회원가입
						</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
</div>

<script type="text/javascript">
	function kakaoUserLogout() {
		var channel = "${login.channel}";

		if (channel === "kakao" && Kakao.isInitialized()) {
			Kakao.API.request({ url : "/v1/user/unlink", success : function(res) {
				console.log("카카오 로그아웃 성공", res);
			}, fail : function(err) {
				console.log("카카오 로그아웃 실패", err);
			}, always : function() {
				location.href = CTX + "/login/logout.do";
			} });
		} else {
			location.href = CTX + "/login/logout.do";
		}
	}

	var mypage_btn = document.getElementById("mypage_btn");

	if (mypage_btn != null) {
		mypage_btn.addEventListener("click", function() {
			var form = document.createElement("form");

			form.method = "post";
			form.action = "/user/mypageDetailPage.do";

			var input = document.createElement("input");

			input.setAttribute("type", "hidden");
			input.setAttribute("name", "user_id");
			input.setAttribute("value", "${login.user_id}");

			form.appendChild(input);
			document.body.appendChild(form);

			form.submit();
		});
	}

	var mypage_btn_left = document.getElementById("mypage_btn_left");

	if (mypage_btn_left != null) {
		mypage_btn_left.addEventListener("click", function() {
			var form = document.createElement("form");

			form.method = "post";
			form.action = "/user/mypageDetailPage.do";

			var input = document.createElement("input");

			input.setAttribute("type", "hidden");
			input.setAttribute("name", "user_id");
			input.setAttribute("value", "${login.user_id}");

			form.appendChild(input);
			document.body.appendChild(form);

			form.submit();
		});
	}

	var mypage_btn3 = document.getElementById("mypage_btn3");

	if (mypage_btn3 != null) {
		mypage_btn3.addEventListener("click", function() {
			var form = document.createElement("form");

			form.method = "post";
			form.action = "/user/mypageDetailPage.do";

			var input = document.createElement("input");

			input.setAttribute("type", "hidden");
			input.setAttribute("name", "user_id");
			input.setAttribute("value", "${login.user_id}");

			form.appendChild(input);
			document.body.appendChild(form);

			form.submit();
		});
	}

	
	function loginPage() {
		alert("로그인이 필요합니다.");
		location.href = "${pageContext.request.contextPath}/login/loginPage.do";
	}
</script>