<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
			<a href="index.html" class="navbar_brand float-left dn-smd">
				<img class="logo1 img-fluid" src="${pageContext.request.contextPath}/images/logo.png" alt="header-logo.png" style="width: 180px; margin-top: 10px;">
				<img class="logo2 img-fluid" src="${pageContext.request.contextPath}/images/logo.png" alt="header-logo.png" style="width: 180px; margin-top: 10px;">
			</a>
			<!-- Responsive Menu Structure-->
			<!--Note: declare the Menu style in the data-menu-style="horizontal" (options: horizontal, vertical, accordion) -->
			<ul id="respMenu" class="ace-responsive-menu text-center" data-menu-style="horizontal">
				<li>
					<a href="intro.html"><span class="title">e-다울마당</span></a>
					<!-- Level Two-->
					<ul>
						<li><a href="intro.html">e-다울마당이란?</a></li>
						<li><a href="faq.html">자주하는 질문</a></li>
						<li><a href="notice.html">공지사항</a></li>
						<li><a href="qa.html">묻고답하기</a></li>
					</ul>
				</li>
				<li>
					<a href="suggest.html"><span class="title">열린제안</span></a>
					<!-- Level Two-->
					<ul>
						<li><a href="suggest-edit.html">제안하기</a></li>
						<li><a href="suggest.html">열린제안</a></li>
						<li><a href="suggest.html">공감제안</a></li>
						<li><a href="suggest.html">종료된제안</a></li>
					</ul>
				</li>
				<li>
					<a href="/survey/surveyListPage.do"><span class="title">설문조사</span></a>
					<!-- Level Two-->
					<ul>
						<li><a href="/survey/surveyListPage.do">설문조사</a></li>
						<li><a href="survey-notice.html">공지사항</a></li>
					</ul>
				</li>
				<li class="last">
					<a href="contest.html"><span class="title">공모제안</span></a>
					<!-- Level Two-->
					<ul>
						<li><a href="contest.html">공모제안</a></li>
						<li><a href="contest-notice.html">공지사항</a></li>
					</ul>
				</li>
				<li class="list-inline-item list_s pull-right nav-item-account">
					<a href="register-term.html" class="btn" style="margin-top: 1px">
						<span class="dn-lg">| 회원가입</span></a>
				</li>
				<li class="list-inline-item list_s pull-right nav-item-account">
					<a href="login.html" class="btn flaticon-user">
						<span class="dn-lg">로그인</span></a>
				</li>
			</ul>
		</nav>
	</div>
</header>

<!-- Main Header Nav For Mobile -->
<div id="page" class="stylehome1 h0">
	<div class="mobile-menu">
		<div class="header stylehome1">
			<div class="main_logo_home2 text-center">
				<img class="nav_logo_img img-fluid mt20" style="width: 150px; margin-top: 30px;" src="${pageContext.request.contextPath}/images/logo.png" alt="header-logo.png">
			</div>
			<ul class="menu_bar_home2">
				<li class="list-inline-item list_s"><a href="page-login.html"><span class="flaticon-user"></span></a></li>
				<li class="list-inline-item"><a href="#menu"><span></span></a></li>
			</ul>
		</div>
	</div><!-- /.mobile-menu -->
	<nav id="menu" class="stylehome1">
		<ul>
			<li><span>e-다울마당</span>
				<!-- Level Two-->
				<ul>
					<li><a href="intro.html">e-다울마당이란?</a></li>
					<li><a href="faq.html">자주하는 질문</a></li>
					<li><a href="notice.html">공지사항</a></li>
					<li><a href="qa.html">묻고답하기</a></li>
				</ul>
			</li>
			<li><span>열린제안</span>
				<!-- Level Two-->
				<ul>
					<li><a href="suggest-edit.html">제안하기</a></li>
					<li><a href="suggest.html">열린제안</a></li>
					<li><a href="suggest.html">공감제안</a></li>
					<li><a href="suggest.html">종료된제안</a></li>
				</ul>
			</li>
			<li><span>설문조사</span>
				<!-- Level Two-->
				<ul>
					<li><a href="survey.html">설문조사</a></li>
					<li><a href="survey-notice.html">공지사항</a></li>
				</ul>
			</li>
			<li><span>공모제안</span>
				<!-- Level Two-->
				<ul>
					<li><a href="contest.html">공모제안</a></li>
					<li><a href="contest-notice.html">공지사항</a></li>
				</ul>
			</li>
			<li><a href="guide.html">이용안내</a></li>
			<li><a href="page-login.html"><span class="flaticon-user"></span> Login</a></li>
			<li><a href="page-register.html"><span class="flaticon-edit"></span> Register</a></li>
		</ul>
	</nav>
</div>