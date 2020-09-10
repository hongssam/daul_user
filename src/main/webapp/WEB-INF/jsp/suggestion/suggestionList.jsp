<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Subpage Nav Tabs -->
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first">
				<a href="/suggestion/suggestionRegistPage.do">제안하기</a>
			</div>
			<div class="wizard-item active">
				<a href="/suggestion/suggestionListPage.do?order=1">열린 제안</a>
			</div>
			<div class="wizard-item">
				<a href="/suggestion/suggestionListPage.do?order=1">공감 제안</a>
			</div>
			<div class="wizard-item last">
				<a href="/suggestion/suggestionListPage.do?order=1">종료된 제안</a>
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
					<!-- <li data-order="1">최신 순</li> -->
					<li data-order="1"><a href="/suggestion/suggestionListPage.do?order=1">최신 순</a></li>
					<li data-order="2"><a href="/suggestion/suggestionListPage.do?order=2">공감 높은 순</a></li>
					<li data-order="3"><a href="/suggestion/suggestionListPage.do?order=3">의견 많은 순</a></li>
				</ul>
			</div>
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
							<i class="icon input-search-close flaticon-magnifying-glass btn" id="search_sgst_btn" aria-hidden="true"></i>
							<input type="text" class="form-control" name="search" id="search" placeholder="검색...">
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
										<p>${sgst.create_user}</p>
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
			<div class="col-lg-12 mt20">
				<ul class="page-navigation">
					<li class="page-item disabled">
						<a class="page-link" href="#">
							<span class="fa-angle-double-left"></span>
						</a>
					</li>
					<li class="page-item disabled">
						<a class="page-link" href="#">
							<span class="fa-angle-left"></span>
						</a>
					</li>
					<li class="page-item text">
						<a class="page-link" href="#">1</a>
					</li>
					<li class="page-item text active" aria-current="page">
						<a class="page-link" href="#">2</a>
					</li>
					<li class="page-item text">
						<a class="page-link" href="#">3</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">
							<span class="fa-angle-right"></span>
						</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">
							<span class="fa-angle-double-right"></span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
	var ul = document.querySelector("ul.sort-type.text-left");
	var search_arr = window.location.search.split("&");
	var order;
	
	for (var i = 0; i < search_arr.length; i++) {
		var search = search_arr[i];
		
		if (search.indexOf("order") > -1) {
			var order_arr = search.split("=");
			order = order_arr[order_arr.length - 1];
			
			var ul_children = ul.children;
			
			for (var j = 0; j < ul_children.length; j++) {
				var li = ul_children[j];
				
				if (order === li.dataset.order) {
					if (!li.classList.contains("active"))	li.classList.add("active");
				} else {
					li.classList.remove("active");
				}
			}
		}
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
	
	function searchSgstList() {
		var search_value = $("#search_form").serialize();
		
		location.href = "${pageContext.request.contextPath}/suggestion/suggestionListPage.do?order=" + order + "&" + search_value;
	}
</script>