<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="./mypageNavTab.jsp" %>

<!-- Listing Grid Section -->
<section class="suggest-list-section bgc-fa">
	<div class="container mt0">
		<div class="grid-list-header row">
			<div class="col-lg-6 offset-lg-6">
				<div class="candidate_revew_select">
					<form id="search_form">
						<div class="select-search-type">
							<select class="selectpicker show-tick" name="search_type" data-width="100%">
								<option value="title" <c:if test="${pagination.search_type eq 'title'}">selected</c:if>>제목</option>
							</select>
						</div>
						<div class="input-search">
							<i class="icon input-search-close flaticon-magnifying-glass" id="search_sgst_btn" aria-hidden="true"></i>
							<input type="text" class="form-control" name="search" id="search" value="${pagination.search}" placeholder="검색...">
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="grid-list row">
			<c:if test="${sgstListSize eq 0}">
				<div class="grid-item col-md-6 col-lg-12 text-center">
					게시물이 존재하지 않습니다.
				</div>
			</c:if>
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
			
			<%@ include file="../common/pagination.jsp" %>
		</div>
	</div>
</section>

<script type="text/javascript">
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
	
	function searchSgstList() {
		var search_value = $("#search_form").serialize();
		
		location.href = "${pageContext.request.contextPath}/user/mypageSuggestionListPage.do?" + search_value;
	}
	
	function fn_paging(pageNum) {
		location.href = "${pageContext.request.contextPath}/user/mypageSuggestionListPage.do?curPage=" + pageNum;
	}
</script>