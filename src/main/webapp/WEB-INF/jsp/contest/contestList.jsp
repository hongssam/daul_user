<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!-- Subpage Nav Tabs -->
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first active">
				<a href="/contest/conestListPage.do">공모제안</a>
			</div>
			<div class="wizard-item last">
				<a href="">공지사항</a>
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
					<li class="active">최신 순</li>
					<li>참여자 많은 순</li>
					<li>의견 많은 순</li>
				</ul>
			</div>
			<div class="col-lg-6">
				<div class="candidate_revew_select text-right">
					<div class="select-search-type">
						<select class="selectpicker show-tick" data-width="100%">
							<option>제목</option>
							<option>작성자</option>
						</select>
					</div>
					<div class="input-search">
						<i class="icon input-search-close flaticon-magnifying-glass" aria-hidden="true"></i>
						<input type="text" class="form-control" name="" placeholder="검색...">
					</div>
				</div>
			</div>
		</div>
		<div class="grid-list row">
			<c:forEach var="list" items="${contestList}" varStatus="idx">
				<div class="grid-item col-12">
					<div class="feat_property list style2" onclick="location.href='${pageContext.request.contextPath}/contest/contestDetailPage.do?admin_contest_idx=${list.admin_contest_idx}'">
						<div class="thumb">
							<img class="img-whp" src="${pageContext.request.contextPath}/images/property/fp1.jpg" alt="fp1.jpg">
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