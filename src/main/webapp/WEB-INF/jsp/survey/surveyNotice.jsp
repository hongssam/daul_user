<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Subpage Nav Tabs -->
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first">
				<a href="/survey/surveyListPage.do?order=1">설문하기</a>
			</div>
			<div class="wizard-item last active">
				<a href="/survey/surveyNoticeListPage.do">공지사항</a>
			</div>
		</div>
	</div>
</div>

<!-- Notice Table Section -->
<section class="notice-section bgc-fa">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="board-table">
					<p>총 19건의 게시물이 있습니다.</p>
					<div class="table-responsive mt0">
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">작성일</th>
									<th scope="col">조회</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${surveyNoticeList}" varStatus="idx">
									<tr>
										<td class="text-center">${idx.index + 1}</td>
										<td>
											<a href="/survey/surveyNoticeDetail.do?notice_idx=${list.notice_idx }">
												<span class="status_tag outline-dark">공지</span>${ list.title}
											</a>
										</td>
										<td class="text-center">${list.name }</td>
										<td class="text-center">${list.create_date }</td>
										<td class="text-center">${list.view_count }</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
						<%@ include file="../common/pagination.jsp"%>
					<div class="table-nav">
						<div class="grid-list-header row" style="border-top: 0px;">
							<div class="col-lg-6">
								<div class="candidate_revew_select text-right">
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
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">

function fn_paging(pageNum) {
	location.href = '${pageContext.request.contextPath}/survey/surveyNoticeListPage.do?curPage=' + pageNum;
}

var btn_search = document.getElementById("search_btn");

btn_search.addEventListener("click", function() {
	searchSurveyNoticeList();
});

var input_search = document.getElementById("search");

input_search.addEventListener("keydown", function(e) {
	if (e.keyCode === 13) {
		event.preventDefault();

		searchSurveyNoticeList();
	}
});

function searchSurveyNoticeList() {
	var search_value = $("#search_form").serialize();
	location.href = "${pageContext.request.contextPath}/survey/surveyNoticeListPage.do?" + search_value;
}

</script>