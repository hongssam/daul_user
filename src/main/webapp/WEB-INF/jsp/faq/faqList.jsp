<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Subpage Nav Tabs -->
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first">
				<a href="/board/introPage.do">e-다울마당이란</a>
			</div>
			<div class="wizard-item active">
				<a href="/faq/faqListPage.do">자주하는질문</a>
			</div>
			<div class="wizard-item ">
				<a href="/notice/noticeListPage.do">공지사항</a>
			</div>
			<div class="wizard-item last">
				<a href="/qna/qnaListPage.do">묻고답하기</a>
			</div>
		</div>
	</div>
</div>

<section class="faq-section bgc-fa">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="faq_content">
					<div class="faq_according">
						<div class="accordion" id="accordionExample">
							<h3 id="main-div">공통</h3>
							<hr />
							<c:forEach var="list" items="${faqListMain}" varStatus="idx">
								<div class="card">
								    <div class="card-header" id="headingMain${idx.index}">
								    	<h2 class="mb-0 ">
								        	<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseMain${idx.index}" aria-expanded="true" aria-controls="collapseMain${idx.index}">
								        	${list.question }</button>
								   		</h2>
								    </div>
								    <div id="collapseMain${idx.index}"  class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
									    <div class="card-body">
											<p>${list.answer }</p>
										</div>
								    </div>
							    </div>
							</c:forEach>
							
							<h3 id="suggestion-div" class="mt40">열린제안</h3>
							<hr/>
							<c:forEach var="list" items="${faqListSuggestion}" varStatus="idx">
								<div class="card">
									<div class="card-header" id="headingSuggestion${idx.index}">
										<h2 class="mb-0">
											<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseSuggestion${idx.index}" aria-expanded="true" aria-controls="collapseSuggestion${idx.index}">${list.question }</button>
										</h2>
									</div>
									<div id="collapseSuggestion${idx.index}" class="collapse" aria-labelledby="headingSuggestion${idx.index}" data-parent="#accordionExample">
										<div class="card-body">
											<p>${list.answer }</p>
										</div>
									</div>
								</div>
							</c:forEach>
							
							<h3 id="survey-div" class="mt40">설문조사</h3>
							<hr/>
							<c:forEach var="list" items="${faqListSurvey}" varStatus="idx">
								<div class="card">
									<div class="card-header" id="headingSurvey${idx.index}">
										<h2 class="mb-0">
											<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseSurvey${idx.index}" aria-expanded="true" aria-controls="collapseSurvey${idx.index}">${list.question }</button>
										</h2>
									</div>
									<div id="collapseSurvey${idx.index}" class="collapse" aria-labelledby="headingSurvey${idx.index}" data-parent="#accordionExample">
										<div class="card-body">
											<p>${list.answer }</p>
										</div>
									</div>
								</div>
							</c:forEach>
							
							<h3 id="contest-div" class="mt40">공모제안</h3>
							<hr/>
							<c:forEach var="list" items="${faqListContest}" varStatus="idx">
								<div class="card">
									<div class="card-header" id="headingContest${idx.index}">
										<h2 class="mb-0">
											<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseContest${idx.index}" aria-expanded="true" aria-controls="collapseContest${idx.index}">${list.question }</button>
										</h2>
									</div>
									<div id="collapseContest${idx.index}" class="collapse" aria-labelledby="headingContest${idx.index}" data-parent="#accordionExample">
										<div class="card-body">
											<p>${list.answer }</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
	var idx;
	var search_arr = window.location.search.split("&");
	for (var i = 0; i < search_arr.length; i++) {
		var search = search_arr[i];
		if (search.indexOf("idx") > -1) {
			var idx_arr = search.split("=");
			idx = idx_arr[idx_arr.length - 1];
		}
	}

	if (idx === '1') {
		$("#suggestionFaq").click();
	} else if (idx === '2') {
		$("#surveyFaq").click();
	} else if (idx === '3') {
		$("#contestFaq").click();
	} else {
		$("#mainFaq").click();
	}
	
	$(document).ready(function(){
		
		if (idx === '1') {
			var offset = $('#suggestion-div').offset(); //선택한 태그의 위치를 반환
	        $('html').animate({scrollTop : offset.top-200}, 0);
		} else if (idx === '2') {
			var offset = $('#survey-div').offset(); //선택한 태그의 위치를 반환
	        $('html').animate({scrollTop : offset.top-200}, 0);
		} else if (idx === '3') {
			var offset = $('#contest-div').offset(); //선택한 태그의 위치를 반환
	        $('html').animate({scrollTop : offset.top-200}, 0);
		} else {
			var offset = $('#main-div').offset(); //선택한 태그의 위치를 반환
	        $('html').animate({scrollTop : offset.top-200}, 0);
		}
		
		
	});

		
</script>
