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
			<c:forEach var="list" items="${surveyList}" varStatus="idx">
				<div class="grid-item col-12">
					<div class="feat_property list" onclick="location.href='${pageContext.request.contextPath}/survey/surveyDetailPage.do?survey_idx=${list.survey_idx }'">
						<div class="thumb">
							<img class="img-whp" src="${pageContext.request.contextPath}/survey/getImg.do?survey_idx=${list.survey_idx}" style="height: 266px;">
						</div>
						<div class="details">
							<div class="tc_content">
								<div class="dtls_headr">
									<c:if test="${list.ing eq '투표중' }">
										<span class="status_tag outline-primary">${list.ing }</span>
									</c:if>
									<c:if test="${list.ing eq '투표전' }">
										<span class="status_tag default">${list.ing }</span>
									</c:if>
									<c:if test="${list.ing eq '투표완료' }">
										<span class="status_tag default">${list.ing }</span>
									</c:if>
								</div>
								<h4>${list.title}</h4>
								<p class="content">${list.content}</p>
								<p class="date">
									<b>투표기간</b> | ${list.s_date} ~${list.e_date}
								</p>
	
								<div class="bottom">
									<span class="item"><span class="icon flaticon-user"></span>참여 ${list.participation_count}</span> 
									<span class="item"><span class="icon flaticon-chat"></span>의견 ${list.opinion_count}</span>
								</div>
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
	$(function() {
		var today = formatDate(new Date());
		var preday = formatPreDate(new Date());
		$("input[name='search_s_date']").val(preday);
		$("input[name='search_e_date']").val(today);
	})
	
	var btn_search = document.getElementById("search_btn");
	
	btn_search.addEventListener("click", function() {
		searchSurveyList();
	});
	
	var input_search = document.getElementById("search");
	
	input_search.addEventListener("keydown", function(e) {
		if (e.keyCode === 13) {
			event.preventDefault();
	
			searchSurveyList();
		}
	});
	
	function searchSurveyList() {
		var search_value = $("#search_form").serialize();
		location.href = "${pageContext.request.contextPath}/user/mypageSurveyListPage.do?" + search_value;
	}
	
	function fn_paging(pageNum) {
		location.href = '${pageContext.request.contextPath}/user/mypageSurveyListPage.do?curPage=' + pageNum;
	}
	
	
	
</script>