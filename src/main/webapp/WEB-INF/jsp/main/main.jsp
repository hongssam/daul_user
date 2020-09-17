<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!-- Whether -->
<section id="whether" class="home-whether">
	<div class="container">
		<div class="row">
			<div class="col-4" style="padding: 30px 5px;">
				<div class="whether-box">
					<div class="icon">
						<img class="whether-img img-fluid " src="${pageContext.request.contextPath}/images/whether/sunny.png" alt="header-logo.png"
							style="position:absolute; top: 7px;">
					</div>
					<div class="detais">
						<p>현재, 맑음</p>
						<p class="empty">28°C</p>
					</div>
					<div class="detais-right">
						<p>강수확률: 20%</p>
						<p>습도: 79%</p>
						<p>풍속: m/s</p>
					</div>
				</div>
			</div>
			<div class="col-8">
				<div class="row">
					<div class="col-4" style="padding: 30px 5px;">
						<div class="dust-box style1">
							<div class="icon ct-chart dust-chart-pie1">
								<div style="height:100%; width:100%; position:absolute; left:0; top:0;">
									<span>12</span>
								</div>
							</div>
							<div class="detais">
								<p>미세먼지</p>
								<p class="empty">좋음</p>
							</div>
						</div>
					</div>
					<div class="col-4"  style="padding: 30px 5px;">
						<div class="dust-box style2">
							<div class="icon ct-chart dust-chart-pie2" >
								<div style="height:100%; width:100%; position:absolute; left:0; top:0;">
									<span>42</span>
								</div>
							</div>
							<div class="detais">
								<p>초미세먼지</p>
								<p class="empty">보통</p>
							</div>
						</div>
					</div>
					<div class="col-4"  style="padding: 30px 5px;">
						<div class="dust-box style3">
							<div class="icon ct-chart dust-chart-pie3" >
								<div style="height:100%; width:100%; position:absolute; left:0; top:0;">
									<span>36</span>
								</div>
							</div>
							<div class="detais">
								<p>자외선</p>
								<p class="empty">나쁨</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Home Contents -->
<section class="home-contents bgc-f7">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-lg-4">
				<div class="main-title text-center">
					<h3>열린제안</h3>
				</div>
				<div class="testimonial_grid_slider style2">
					<c:forEach var="sgst" items="${sgstList}">
						<div class="item">
							<div class="home-content-box suggest">
								<div class="details">
									<div class="tc_content">
										<ul class="fp_meta">
											<li class="list-inline-item float-left">
												<img src="${pageContext.request.contextPath}/images/user.png" alt="user.png">
											</li>
											<li class="list-inline-item">
												<p>${sgst.create_user_name}</p>
												<p class="date">${sgst.create_date}</p>
											</li>
										</ul>
										<div class="fp_content">
											<h4 class="title">${sgst.title}</h4>
											<p>${sgst.content}</p>
										</div>
									</div>
								</div>
								<div class="bottom">
									<div class="content">
										<span class="like-cnt"><span class="icon flaticon-heart"></span>공감 ${sgst.like_count}</span>
										<span class="reply-cnt"><span class="icon flaticon-chat"></span>의견 ${sgst.opinion_cnt}</span>
									</div>
									<div class="bar-graph-bg">
										<div class="bar-graph-fr" style="width:${sgst.like_per}%"></div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-6 col-lg-4">
				<div class="main-title text-center">
					<h3>설문조사</h3>
				</div>
				<div class="testimonial_grid_slider style2">
					<c:forEach var="survey" items="${surveyList}">
						<div class="item">
							<div class="home-content-box survey">
								<img class="img-whp" src="${pageContext.request.contextPath}/survey/getImg.do?survey_idx=${survey.survey_idx}" style="height: 230px;">
								<div class="details">
									<div class="tc_content">
										<div class="fp_content">
											<h4 class="title">${survey.title}</h4>
											<div>투표기간 | ${survey.s_date} ~ ${survey.e_date}</div>
										</div>
									</div>
								</div>
								<div class="bottom">
									<div class="content">
										<span class="item"><span class="icon flaticon-user"></span>참여 ${survey.participation_count}</span>|
										<span class="item"><span class="icon flaticon-chat"></span>의견 ${survey.opinion_count}</span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-6 col-lg-4">
				<div class="main-title text-center">
					<h3>나눔공모</h3>
				</div>
				<div class="testimonial_grid_slider style2">
					<c:forEach var="contest" items="${contestList}">
						<div class="item">
							<div class="home-content-box contest">
								<img class="img-whp" src="${pageContext.request.contextPath}/contest/getImg.do?admin_contest_idx=${contest.admin_contest_idx}" style="height: 230px;">
								<div class="details">
									<div class="tc_content">
										<div class="fp_content">
											<h4 class="title">${contest.title}</h4>
											<div>공모기간 | ${contest.contest_s_date} ~ ${contest.contest_e_date}</div>
											<div>접수기간 | ${contest.submit_s_date} ~ ${contest.submit_e_date}</div>
										</div>
									</div>
								</div>
								<div class="bottom">
									<div class="content">
										<span class="item"><span class="icon flaticon-user"></span>참여 ${contest.user_contest_cnt}</span>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Home Boards -->
<section class="home-boards p-0">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 box-left" >
				<div class="home-notice-widget">
					<h4 class="title">공지사항
						<span class="more"><a href="${pageContext.request.contextPath}/notice/noticeListPage.do">더보기</a></span>
					</h4>
					<div class="widget_list">
						<ul class="list_details">
							<c:forEach var="notice" items="${noticeList}">
								<li>
									<a href="${pageContext.request.contextPath}/notice/noticeDetail.do?notice_idx=${notice.notice_idx}">
										<span class="text">${notice.title}</span>
										<span class="date">${notice.create_date}</span>
									</a>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-6 box-right" >
				<div class="home-guide-widget">
					<h4 class="title">이용안내</h4>
					<div class="row p10">
						<div class="col-4 p0">
							<div class="guide-box suggestion">
								<img class="nav_logo_img img-fluid icon" src="${pageContext.request.contextPath}/images/icon-suggest.png">
								<p>열린제안</p>
							</div>
						</div>
						<div class="col-4 p0">
							<div class="guide-box survey">
								<img class="nav_logo_img img-fluid icon" src="${pageContext.request.contextPath}/images/icon-survey.png">
								<p>설문조사</p>
							</div>
						</div>
						<div class="col-4 p0">
							<div class="guide-box contest">
								<img class="nav_logo_img img-fluid icon" src="${pageContext.request.contextPath}/images/icon-contest.png">
								<p>공모제안</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
	var div_guides = document.querySelectorAll("div.guide-box");	
	
	for (var i = 0; i < div_guides.length; i++) {
		let div_guide = div_guides[i];
		
		div_guide.addEventListener("click", function() {
			location.href = CTX + "/faq/faqListPage.do";
		});
	}
</script>