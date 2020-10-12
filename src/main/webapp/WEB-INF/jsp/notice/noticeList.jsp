<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<!-- Subpage Nav Tabs -->
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first">
				<a href="/board/introPage.do">e-다울마당이란</a>
			</div>
			<div class="wizard-item">
				<a href="/faq/faqListPage.do">자주하는질문</a>
			</div>
			<div class="wizard-item active">
				<a href="/notice/noticeListPage.do">공지사항</a>
			</div>
			<div class="wizard-item last">
				<a href=/qna/qnaListPage.do>묻고답하기</a>
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
					<p>총 ${pagination.listCnt}건의 게시물이 있습니다.</p>
					<div class="table-responsive mt0">
						<table class="table">
							<thead class="thead-light hidden-sm-down">
								<tr>
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">작성일</th>
									<th scope="col">조회</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${noticeList}" varStatus="idx">
									<tr>
										<td class="text-center hidden-sm-down">${list.num}</td>
										<td class="hidden-sm-down">
											<a href="/notice/noticeDetail.do?notice_idx=${list.notice_idx }">
												<span class="status_tag outline-dark">공지</span>${list.title}
											</a>
										</td>
										<td class="text-center hidden-sm-down">${list.name }</td>
										<td class="text-center hidden-sm-down">${list.create_date }</td>
										<td class="text-center hidden-sm-down">${list.view_count }</td>
										
										<td class="hidden-sm-up">
											<a href="/notice/noticeDetail.do?notice_idx=${list.notice_idx }">
												<span class="status_tag outline-dark">공지</span>
												${list.title}
											</a>
											<p class="small mt10 mb0">${list.name } | ${list.create_date } | ${list.view_count }</p>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="table-nav">
						<%@ include file="../common/pagination.jsp"%>
						
						<div class="candidate_revew_select style2 text-center mb30-991 mt20 hidden-sm-down">
							<form id="search_form">
								<ul class="mb0">
									<li class="list-inline-item">
										<select class="selectpicker show-tick" name="search_type">
											<option value="title" <c:if test="${pagination.search_type eq 'title'}">selected</c:if>>제목</option>
											<option value="create_user" <c:if test="${pagination.search_type eq 'create_user'}">selected</c:if>>작성자</option>
										</select>
									</li>
									<li class="list-inline-item">
										<div class="candidate_revew_search_box course fn-520">
											<div class="form-inline my-2">
												<input class="form-control mr-sm-2" type="text" name="search" id="search" value="${pagination.search}" placeholder="검색..." aria-label="Search">
												<button class="btn my-2 my-sm-0" type="button" id="search_btn">
													<span class="flaticon-magnifying-glass"></span>
												</button>
											</div>
										</div>
									</li>
								</ul>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
	function fn_paging(pageNum) {
		location.href = '${pageContext.request.contextPath}/notice/noticeListPage.do?curPage=' + pageNum;
	}
	
	var btn_search = document.getElementById("search_btn");
	
	btn_search.addEventListener("click", function() {
		searchNoticeList();
	});
	
	var input_search = document.getElementById("search");
	
	input_search.addEventListener("keydown", function(e) {
		if (e.keyCode === 13) {
			event.preventDefault();
	
			searchNoticeList();
		}
	});
	
	function searchNoticeList() {
		var search_value = $("#search_form").serialize();
		location.href = "${pageContext.request.contextPath}/notice/noticeListPage.do?" + search_value;
	}
</script>






