<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- Subpage Nav Tabs -->
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first active">
				<a href="/contest/contestListPage.do?order=1">공모제안</a>
			</div>
			<div class="wizard-item last">
				<a href="/contest/contestNoticeListPage.do">공지사항</a>
			</div>
		</div>
	</div>
</div>

<!-- Listing Grid Section -->
<section class="suggest-list-section bgc-fa mt0 pt0">
	<div class="container mt0">
		<div class="grid-list-header row">
			<div class="col-lg-6">
				<ul class="sort-type text-left">
					<li data-order="1">
						<a href="/contest/contestListPage.do?order=1">최신 순</a>
					</li>
					<li data-order="2">
						<a href="/contest/contestListPage.do?order=2">참여 많은 순</a>
					</li>
				</ul>
			</div>
			<div class="col-lg-6">
				<div class="candidate_revew_select text-right">
					<form id="search_form">
						<div class="select-search-type">
							<select class="selectpicker show-tick" name="search_type" id="search_type" data-width="100%">
								<option value="title" <c:if test="${pagination.search_type eq 'title'}">selected</c:if>>제목</option>
								<option value="create_user" <c:if test="${pagination.search_type eq 'create_user'}">selected</c:if>>작성자</option>
							</select>
						</div>
						<div class="input-search">
							<i class="icon input-search-close flaticon-magnifying-glass" id="search_btn" aria-hidden="true"></i>
							<input type="text" class="form-control" name="search" id="search" value="${pagination.search}" placeholder="검색...">
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
							<div class="feat_property list style2" onclick="loginPage()">
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
		location.href = '${pageContext.request.contextPath}/contest/contestListPage.do?curPage=' + pageNum;
	}

	var ul = document.querySelector("ul.sort-type.text-left");
	var div_wizard = document.querySelector("div.wizard");
	var search_arr = window.location.search.split("&");
	var order, type;

	for (var i = 0; i < search_arr.length; i++) {
		var search = search_arr[i];

		if (search.indexOf("order") > -1) {
			var order_arr = search.split("=");
			order = order_arr[order_arr.length - 1];

			var ul_child = ul.children;

			for (var j = 0; j < ul_child.length; j++) {
				var li = ul_child[j];

				if (order === li.dataset.order) {
					if (!li.classList.contains("active"))
						li.classList.add("active");
				} else {
					li.classList.remove("active");
				}
			}
		} else if (search.indexOf("type") > -1) {
			var type_arr = search.split("=");
			type = type_arr[type_arr.length - 1];

			var div_wizard_child = div_wizard.children;

			for (var j = 0; j < div_wizard_child.length; j++) {
				var div = div_wizard_child[j];

				if (type === div.dataset.type) {
					if (!div.classList.contains("active"))
						div.classList.add("active");
				} else {
					div.classList.remove("active");
				}
			}
		}
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
		location.href = "${pageContext.request.contextPath}/contest/contestListPage.do?order=" + order + "&" + search_value;
	}
	
	function loginPage(){
		alert("로그인이 필요합니다.");
		location.href = "${pageContext.request.contextPath}/login/loginPage.do";
	}
</script>