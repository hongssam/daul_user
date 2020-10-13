<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Subpage Nav Tabs -->
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first">
				<c:choose>
					<c:when test="${empty login.user_id}">
						<a onclick="gotoLoginPage()">제안하기</a>
					</c:when>
					<c:otherwise>
						<a href="/suggestion/suggestionRegistPage.do">제안하기</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="wizard-item" data-type="normal">
				<a href="/suggestion/suggestionListPage.do?order=1&board_type=normal">열린 제안</a>
			</div>
			<div class="wizard-item" data-type="like">
				<a href="/suggestion/suggestionListPage.do?order=1&board_type=like">공감 제안</a>
			</div>
			<div class="wizard-item last" data-type="end">
				<a href="/suggestion/suggestionListPage.do?order=1&board_type=end">종료된 제안</a>
			</div>
		</div>
	</div>
</div>

<!-- Listing Grid Section -->
<section class="suggest-list-section bgc-fa">
	<div class="container mt0">
		<div class="grid-list-header row">
			<div class="item col-lg-6">
				<ul class="sort-type text-left">
					<!-- <li data-order="1">최신 순</li> -->
					<li data-order="1">
						<a href="/suggestion/suggestionListPage.do?order=1&board_type=${board_type}">최신 순</a>
					</li>
					<li data-order="2">
						<a href="/suggestion/suggestionListPage.do?order=2&board_type=${board_type}">공감 높은 순</a>
					</li>
					<li data-order="3">
						<a href="/suggestion/suggestionListPage.do?order=3&board_type=${board_type}">의견 많은 순</a>
					</li>
				</ul>
			</div>
			<div class="item col-lg-6">
				<div class="candidate_revew_select">
					<form id="search_form">
						<div class="select-search-type">
							<select class="selectpicker show-tick" name="search_type" id="search_type" data-width="100%">
								<option value="title" <c:if test="${pagination.search_type eq 'title'}">selected</c:if>>제목</option>
								<option value="create_user" <c:if test="${pagination.search_type eq 'create_user'}">selected</c:if>>작성자</option>
							</select>
						</div>
						<div class="input-search">
							<i class="icon input-search-close flaticon-magnifying-glass btn" id="search_sgst_btn" aria-hidden="true"></i>
							<input type="text" class="form-control" name="search" id="search" value="${pagination.search}" placeholder="검색...">
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="grid-list row">
			<c:forEach var="sgst" items="${sgstList}">
				<div class="grid-item col-md-6 col-lg-3">
					<div class="content-box suggest" onclick="location.href='${pageContext.request.contextPath}/suggestion/suggestionDetailPage.do?suggestion_idx=${sgst.suggestion_idx}'">
						<div class="details">
							<div class="tc_content">
								<ul class="fp_meta">
									<li class="list-inline-item float-left">
										<img src="${pageContext.request.contextPath}/images/user.png" alt="user.png">
									</li>
									<li class="list-inline-item">
										<p>${sgst.name}</p>
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
								<div class="bar-graph-fr" style="width: ${sgst.like_per}%"></div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

			<%@ include file="../common/pagination.jsp"%>
		</div>
	</div>
</section>

<script type="text/javascript">
	var location_search_arr = window.location.search.split("&");

	var ul = document.querySelector("ul.sort-type.text-left");
	var div_wizard = document.querySelector("div.wizard");
	var order, board_type;

	for (var i = 0; i < location_search_arr.length; i++) {
		var search = location_search_arr[i];

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
		} else if (search.indexOf("board_type") > -1) {
			var board_type_arr = search.split("=");
			board_type = board_type_arr[board_type_arr.length - 1];

			var div_wizard_child = div_wizard.children;

			for (var j = 0; j < div_wizard_child.length; j++) {
				var div = div_wizard_child[j];

				if (board_type === div.dataset.type) {
					if (!div.classList.contains("active")) div.classList.add("active");
				} else {
					div.classList.remove("active");
				}
			}
		} /* else if (search.indexOf("search") > -1) {
					var value = search.split("=");
					
					if (search.indexOf("search_type") > -1)	document.getElementById("search_type").value = decodeURI(value[1]);
					else									document.getElementById("search").value = decodeURI(value[1]);
				} */
	}

	var btn_search_sgst = document.getElementById("search_sgst_btn");

	btn_search_sgst.addEventListener("click", function() {
		searchSgstList();
	});

	var input_search = document.getElementById("search");

	input_search.addEventListener("keydown", function(e) {
		if (e.keyCode === 13) {
			event.preventDefault();

			searchSgstList();
		}
	});

	var url_param = "order=" + order + "&board_type=" + board_type;

	function searchSgstList() {
		var search_value = $("#search_form").serialize();

		location.href = "${pageContext.request.contextPath}/suggestion/suggestionListPage.do?" + url_param + "&" + search_value;
	}

	function fn_paging(pageNum) {
		location.href = "${pageContext.request.contextPath}/suggestion/suggestionListPage.do?curPage=" + pageNum + "&" + url_param;
	}

	function loginPage() {
		alert("로그인이 필요합니다.");
		location.href = "${pageContext.request.contextPath}/login/loginPage.do";
	}
</script>