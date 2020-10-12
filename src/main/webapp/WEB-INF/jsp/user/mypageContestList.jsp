<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- Subpage Nav Tabs -->
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first">
				<a href="#">계정 정보</a>
			</div>
			<div class="wizard-item">
				<a href="/user/mypageSuggestionListPage.do">나의 제안 목록</a>
			</div>
			<div class="wizard-item">
				<a href="/user/mypageSurveyListPage.do">나의 투표 목록</a>
			</div>
			<div class="wizard-item last active">
				<a href="/user/mypageContestListPage.do">나의 공모 목록</a>
			</div>
		</div>
	</div>
</div>

<!-- Listing Grid Section -->
<section class="suggest-list-section bgc-fa">
	<div class="container mt0">
		<div class="grid-list-header row">
			<div class="col-lg-6 offset-lg-6">
				<div class="candidate_revew_select">
					<form id="search_form">
						<div class="select-search-type">
							<select class="selectpicker show-tick" name="search_type" data-width="100%">
								<option value="title">제목</option>
								<option value="create_user">작성자</option>
							</select>
						</div>
						<div class="input-search">
							<i class="icon input-search-close flaticon-magnifying-glass" id="search_btn" aria-hidden="true"></i>
							<input type="text" class="form-control" name="search" id="search" placeholder="검색...">
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="grid-list row">
			<c:forEach var="list" items="${contestList}" varStatus="idx">
				<c:choose>
					<c:when test="${empty login.user_id }">
						<div class="grid-item col-12">
							<div class="feat_property list style2">
								<div class="thumb">
									<img class="img-whp" src="${pageContext.request.contextPath}/contest/getImg.do?admin_contest_idx=${list.admin_contest_idx}" style="height: 270px;">
								</div>
								<div class="details">
									<div class="tc_content">
										<div class="dtls_headr">
											<c:if test="${list.ing eq '공모진행중' }">
												<span class="status_tag outline-primary">${list.ing }</span>
											</c:if>
											<c:if test="${list.ing eq '공모전' }">
												<span class="status_tag default">${list.ing }</span>
											</c:if>
											<c:if test="${list.ing eq '공모종료' }">
												<span class="status_tag default">${list.ing }</span>
											</c:if>
										</div>
										<h4>${list.title}</h4>
										<p class="content">${list.content}</p>
										<p class="date">
											<b>공모기간</b> | ${list.contest_s_date} ~${list.contest_e_date}
										</p>
										<p class="date">
											<b>접수기간</b> | ${list.submit_s_date} ~${list.submit_e_date}
										</p>
										<div class="bottom">
											<span class="item">
												<span class="icon flaticon-user"></span>
												참여 ${list.user_contest_cnt }
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="grid-item col-12">
							<div class="feat_property list style2" onclick="location.href='${pageContext.request.contextPath}/contest/contestDetailPage.do?admin_contest_idx=${list.admin_contest_idx}'">
								<div class="thumb">
									<img class="img-whp" src="${pageContext.request.contextPath}/contest/getImg.do?admin_contest_idx=${list.admin_contest_idx}" style="height: 270px;">
								</div>
								<div class="details">
									<div class="tc_content">
										<div class="dtls_headr">
											<c:if test="${list.ing eq '공모진행중' }">
												<span class="status_tag outline-primary">${list.ing }</span>
											</c:if>
											<c:if test="${list.ing eq '공모전' }">
												<span class="status_tag default">${list.ing }</span>
											</c:if>
											<c:if test="${list.ing eq '공모종료' }">
												<span class="status_tag default">${list.ing }</span>
											</c:if>
										</div>
										<h4>${list.title}</h4>
										<p class="content">${list.content}</p>
										<p class="date">
											<b>공모기간</b> | ${list.contest_s_date} ~${list.contest_e_date}
										</p>
										<p class="date">
											<b>접수기간</b> | ${list.submit_s_date} ~${list.submit_e_date}
										</p>
										<div class="bottom">
											<span class="item">
												<span class="icon flaticon-user"></span>
												참여 ${list.user_contest_cnt }
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>

			</c:forEach>

			<%@ include file="../common/pagination.jsp"%>
		</div>
	</div>
</section>

<script type="text/javascript">
	function fn_paging(pageNum) {
		location.href = '${pageContext.request.contextPath}/user/mypageContestListPage.do?curPage=' + pageNum;
	}

	var btn_search = document.getElementById("search_btn");

	btn_search.addEventListener("click", function() {
		searchContestList();
	});

	var input_search = document.getElementById("search");

	input_search.addEventListener("keydown", function(e) {
		if (e.keyCode === 13) {
			event.preventDefault();

			searchContestList();
		}
	});

	function searchContestList() {
		var search_value = $("#search_form").serialize();
		location.href = "${pageContext.request.contextPath}/contest/contestListPage.do?" + search_value;
	}
</script>