<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Whether -->
<section id="whether" class="home-whether">
	<div class="container" id="weather-container"></div>

</section>

<!-- Home Contents -->
<section class="home-contents bgc-f7">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-lg-4">
				<div class="main-title text-center">
					<h3>열린제안</h3>
				</div>
				<c:choose>
					<c:when test="${sgstList.size() eq 0}">
						<div class="style2">
							<div class="item">
								<div class="home-content-box survey">
									<img class="img-whp" src="${pageContext.request.contextPath}/survey/getImg.do?survey_idx=" style="height: 230px;">
									<div class="details">
										<div class="tc_content">
											<div class="fp_content">
												<h4 class="title">현재 진행중인 열린제안이 없습니다.</h4>
												<div></div>
											</div>
										</div>
									</div>
									<div class="bottom">
										<div class="content">
											<span class="item"> </span>

											<span class="item"> </span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:when>
					<c:when test="${sgstList.size() eq 1}">
						<div class="style2">
							<c:forEach var="sgst" items="${sgstList}">
								<div class="item">
									<div class="home-content-box suggest" id="/suggestion/suggestionDetailPage.do?suggestion_idx=${sgst.suggestion_idx }">
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
													<p style="white-space: pre-wrap">${sgst.content}</p>
												</div>
											</div>
										</div>
										<div class="bottom">
											<div class="content">
												<span class="like-cnt">
													<span class="icon flaticon-heart"></span>
													공감 ${sgst.like_count}
												</span>
												<span class="reply-cnt">
													<span class="icon flaticon-chat"></span>
													의견 ${sgst.opinion_cnt}
												</span>
											</div>
											<div class="bar-graph-bg">
												<div class="bar-graph-fr" style="width:${sgst.like_per}%"></div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:when>
					<c:otherwise>
						<div class="testimonial_grid_slider style2">
							<c:forEach var="sgst" items="${sgstList}">
								<div class="item">
									<div class="home-content-box suggest" id="/suggestion/suggestionDetailPage.do?suggestion_idx=${sgst.suggestion_idx }">
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
													<p style="white-space: pre-wrap">${sgst.content}</p>
												</div>
											</div>
										</div>
										<div class="bottom">
											<div class="content">
												<span class="like-cnt">
													<span class="icon flaticon-heart"></span>
													공감 ${sgst.like_count}
												</span>
												<span class="reply-cnt">
													<span class="icon flaticon-chat"></span>
													의견 ${sgst.opinion_cnt}
												</span>
											</div>
											<div class="bar-graph-bg">
												<div class="bar-graph-fr" style="width:${sgst.like_per}%"></div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>

			</div>
			<div class="col-md-6 col-lg-4">
				<div class="main-title text-center">
					<h3>설문조사</h3>
				</div>
				<c:choose>
					<c:when test="${surveyList.size() eq 0}">
						<div class="style2">
							<div class="item">
								<div class="home-content-box survey">
									<img class="img-whp" src="${pageContext.request.contextPath}/survey/getImg.do?survey_idx=" style="height: 230px;">
									<div class="details">
										<div class="tc_content">
											<div class="fp_content">
												<h4 class="title">현재 진행중인 설문조사가 없습니다.</h4>
												<div></div>
											</div>
										</div>
									</div>
									<div class="bottom">
										<div class="content">
											<span class="item"> </span>

											<span class="item"> </span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:when>
					<c:when test="${surveyList.size() eq 1}">
						<div class="style2">
							<c:forEach var="survey" items="${surveyList}">
								<div class="item">
									<div class="home-content-box survey" id="/survey/surveyDetailPage.do?survey_idx=${survey.survey_idx }">
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
												<span class="item">
													<span class="icon flaticon-user"></span>
													참여 ${survey.participation_count}
												</span>
												|
												<span class="item">
													<span class="icon flaticon-chat"></span>
													의견 ${survey.opinion_count}
												</span>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:when>
					<c:otherwise>
						<div class="testimonial_grid_slider style2">
							<c:forEach var="survey" items="${surveyList}">
								<div class="item">
									<div class="home-content-box survey" id="/survey/surveyDetailPage.do?survey_idx=${survey.survey_idx }">
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
												<span class="item">
													<span class="icon flaticon-user"></span>
													참여 ${survey.participation_count}
												</span>
												|
												<span class="item">
													<span class="icon flaticon-chat"></span>
													의견 ${survey.opinion_count}
												</span>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-md-6 col-lg-4">
				<div class="main-title text-center">
					<h3>나눔공모</h3>
				</div>
				<c:choose>
					<c:when test="${contestList.size() eq 0}">
						<div class="style2">
							<div class="item">
								<div class="home-content-box survey">
									<img class="img-whp" src="${pageContext.request.contextPath}/survey/getImg.do?survey_idx=" style="height: 230px;">
									<div class="details">
										<div class="tc_content">
											<div class="fp_content">
												<h4 class="title">현재 진행중인 나눔공모가 없습니다.</h4>
												<div></div>
											</div>
										</div>
									</div>
									<div class="bottom">
										<div class="content">
											<span class="item"> </span>

											<span class="item"> </span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:when>
					<c:when test="${contestList.size() eq 1}">
						<div class="style2">
							<c:forEach var="contest" items="${contestList}">
								<div class="item">
									<div class="home-content-box contest" id="/contest/contestDetailPage.do?admin_contest_idx=${contest.admin_contest_idx }">
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
												<span class="item">
													<span class="icon flaticon-user"></span>
													참여 ${contest.user_contest_cnt}
												</span>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:when>
					<c:otherwise>
						<div class="testimonial_grid_slider style2">
							<c:forEach var="contest" items="${contestList}">
								<div class="item">
									<div class="home-content-box contest" id="/contest/contestDetailPage.do?admin_contest_idx=${contest.admin_contest_idx }">
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
												<span class="item">
													<span class="icon flaticon-user"></span>
													참여 ${contest.user_contest_cnt}
												</span>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</section>

<!-- Home Boards -->
<section class="home-boards p-0">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 box-left">
				<div class="home-notice-widget">
					<h4 class="title">
						공지사항
						<span class="more">
							<a href="${pageContext.request.contextPath}/notice/noticeListPage.do">더보기</a>
						</span>
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
			<div class="col-lg-6 box-right">
				<div class="home-guide-widget">
					<h4 class="title">이용안내</h4>
					<div class="row p10">
						<div class="col-4 p0">
							<div class="guide-box" id="suggestion">
								<img class="nav_logo_img img-fluid icon" src="${pageContext.request.contextPath}/images/icon-suggest.png">
								<p>열린제안</p>
							</div>
						</div>
						<div class="col-4 p0">
							<div class="guide-box" id="survey">
								<img class="nav_logo_img img-fluid icon" src="${pageContext.request.contextPath}/images/icon-survey.png">
								<p>설문조사</p>
							</div>
						</div>
						<div class="col-4 p0">
							<div class="guide-box" id="contest">
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
	var div_home_content_boxes = document.querySelectorAll("div.home-content-box");

	for (var i = 0; i < div_guides.length; i++) {
		let div_guide = div_guides[i];

		div_guide.addEventListener("click", function() {
			var id = div_guide.id;

			if (id === "suggestion") {
				location.href = CTX + "/faq/faqListPage.do?idx=1";
			} else if (id === "survey") {
				location.href = CTX + "/faq/faqListPage.do?idx=2";
			} else if (id === "contest") {
				location.href = CTX + "/faq/faqListPage.do?idx=3";
			}
		});
	}

	for (var j = 0; j < div_home_content_boxes.length; j++) {
		let home_content_box = div_home_content_boxes[j];

		home_content_box.addEventListener("click", function() {
			location.href = CTX + home_content_box.id;
		});
	}

	$(document).ready(function() {
		$.ajax({ type : "GET", url : "http://183.111.102.211:9000/weather", success : function(data) {
			setWeather(data);
		} });
	});

	function setWeather(data) {

		var weather = JSON.parse(data);

		var str = '<div class="row">'
				+ '<div class="col-sm-12 col-md-7 col-lg-5 col-xl-4" style="padding: 30px 5px;">'
				+ '<div class="whether-box">'
				+ '<div class="icon">'
				+ '<img class="whether-img img-fluid " src="' + weather.weather.icon + '" alt="header-logo.png" style="position:absolute; top: 7px; width: 94px">'
				+ '</div>' + '<div class="detais">' + '<p>'
				+ weather.weather.description_ko
				+ '</p>'
				+ '<p class="empty">'
				+ weather.weather.temperature
				+ '°C</p>'
				+ '</div>'
				+ '<div class="detais-right">'
				+ '<p>강수확률: '
				+ weather.weather.clouds
				+ '%</p>'
				+ '<p>습도: '
				+ weather.weather.humidity
				+ '%</p>'
				+ '<p>풍속: '
				+ weather.weather.wind_speed
				+ 'm/s</p>'
				+ '</div>'
				+ '</div>'
				+ '</div>'
				+ '<div class="col-sm-12 col-md-5 col-lg-7 col-xl-8 hidden-sm-down">'
				+ '<div class="row">'
				+ '<div class="col-md-12 col-lg-6 col-xl-4" style="padding: 30px 5px;">'
				+ '<div class="dust-box style' + weather.air_pollution.pm10.degree + '">'
				+ '<div class="icon ct-chart dust-chart-pie1">'
				+ '<div style="height:100%; width:100%; position:absolute; left:0; top:0;">'
				+ '<span>'
				+ weather.air_pollution.pm10.value
				+ '</span>'
				+ '</div>'
				+ '</div>'
				+ '<div class="detais">'
				+ '<p>미세먼지</p>'
				+ '<p class="empty">'
				+ weather.air_pollution.pm10.description
				+ '</p>'
				+ '</div>'
				+ '</div>'
				+ '</div>'
				+ '<div class="hidden-md-down col-lg-6 col-xl-4"  style="padding: 30px 5px;">'
				+ '<div class="dust-box style' + weather.air_pollution.pm25.degree + '">'
				+ '<div class="icon ct-chart dust-chart-pie2" >'
				+ '<div style="height:100%; width:100%; position:absolute; left:0; top:0;">'
				+ '<span>'
				+ weather.air_pollution.pm25.value
				+ '</span>'
				+ '</div>'
				+ '</div>'
				+ '<div class="detais">'
				+ '<p>초미세먼지</p>'
				+ '<p class="empty">'
				+ weather.air_pollution.pm25.description
				+ '</p>'
				+ '</div>'
				+ '</div>'
				+ '</div>'
				+ '<div class="col-lg-4 hidden-lg-down"  style="padding: 30px 5px;">'
				+ '<div class="dust-box style' + weather.air_pollution.o3.degree +'">'
				+ '<div class="icon ct-chart dust-chart-pie3" >'
				+ '<div style="height:100%; width:100%; position:absolute; left:0; top:0;">'
				+ '<span>'
				+ weather.air_pollution.o3.value
				+ '</span>'
				+ '</div>'
				+ '</div>'
				+ '<div class="detais">'
				+ '<p>오존</p>'
				+ '<p class="empty">'
				+ weather.air_pollution.o3.description
				+ '</p>'
				+ '</div>' + '</div>' + '</div>' + '</div>' + '</div>' + '</div>';

		$("#weather-container").append(str);
	}
</script>


















