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

<!-- FAQ Section-->
<section class="faq-section bgc-fa">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="faq_content">
					<div class="faq_according" id="according">
						<div class="accordion" id="accordionExampleParent">
							<div class="card">
								<div class="" id="heading">
									<h2 class="mb-0">
										<button class="btn collapsed" type="button" data-toggle="collapse" data-target="#collapse" aria-expanded="false" aria-controls="collapse" id="mainFaq">공통</button>
									</h2>
									<hr/>
								</div>
								<div id="collapse" class="collapse" aria-labelledby="heading" data-parent="#accordionExampleParent">
									<div class="card-body">
										<div class="accordion" id="accordionExample">
											<c:forEach var="list" items="${faqList}" varStatus="idx">

												<div class="card">
													<div class="card-header" id="headingChild${idx.index}">
														<h2 class="mb-0">
															<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseChild${idx.index}" aria-expanded="false" aria-controls="collapseChild${idx.index}">${list.question }</button>
														</h2>
													</div>
													<div id="collapseChild${idx.index}" class="collapse" aria-labelledby="headingChild${idx.index}" data-parent="#accordionExample">
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
							<div class="card">
								<div class="" id="heading2">
									<h2 class="mb-0">
										<button class="btn collapsed" type="button" data-toggle="collapse" data-target="#collapse2" aria-expanded="false" aria-controls="collapse2" id="suggestionFaq">열린제안</button>
									</h2>
									<hr/>
								</div>
								<div id="collapse2" class="collapse" aria-labelledby="heading2" data-parent="#accordionExampleParent">
									<div class="card-body">
										<div class="accordion" id="accordionExample2">
											<c:forEach var="list" items="${faqList}" varStatus="idx">

												<div class="card">
													<div class="card-header" id="headingChild2${idx.index}">
														<h2 class="mb-0">
															<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseChild2${idx.index}" aria-expanded="false" aria-controls="collapseChild2${idx.index}">${list.question }</button>
														</h2>
													</div>
													<div id="collapseChild2${idx.index}" class="collapse" aria-labelledby="headingChild2${idx.index}" data-parent="#accordionExample2">
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
							<div class="card">
								<div class="" id="heading3">
									<h2 class="mb-0">
										<button class="btn collapsed" type="button" data-toggle="collapse" data-target="#collapse3" aria-expanded="false" aria-controls="collapse3" id="surveyFaq">설문조사</button>
									</h2>
									<hr/>
								</div>
								<div id="collapse3" class="collapse" aria-labelledby="heading3" data-parent="#accordionExampleParent">
									<div class="card-body">
										<div class="accordion" id="accordionExample3">
											<c:forEach var="list" items="${faqList}" varStatus="idx">

												<div class="card">
													<div class="card-header" id="headingChild3${idx.index}">
														<h2 class="mb-0">
															<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseChild3${idx.index}" aria-expanded="false" aria-controls="collapseChild3${idx.index}">${list.question }</button>
														</h2>
													</div>
													<div id="collapseChild3${idx.index}" class="collapse" aria-labelledby="headingChild3${idx.index}" data-parent="#accordionExample3">
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
							<div class="card">
								<div class="" id="heading4">
									<h2 class="mb-0">
										<button class="btn collapsed" type="button" data-toggle="collapse" data-target="#collapse4" aria-expanded="false" aria-controls="collapse4" id="contestFaq">나눔공모</button>
									</h2>
								</div>
								<div id="collapse4" class="collapse" aria-labelledby="heading4" data-parent="#accordionExampleParent">
									<div class="card-body">
										<div class="accordion" id="accordionExample4">
											<c:forEach var="list" items="${faqList}" varStatus="idx">

												<div class="card">
													<div class="card-header" id="headingChild4${idx.index}">
														<h2 class="mb-0">
															<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseChild4${idx.index}" aria-expanded="false" aria-controls="collapseChild4${idx.index}">${list.question }</button>
														</h2>
													</div>
													<div id="collapseChild4${idx.index}" class="collapse" aria-labelledby="headingChild4${idx.index}" data-parent="#accordionExample4">
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
			idx = idx_arr[idx_arr.length -1];
		}
	}

	if(idx === '1'){
		$("#suggestionFaq").click();
	}else if(idx === '2'){
		$("#surveyFaq").click();
	}else if(idx === '3'){
		$("#contestFaq").click();
	}else{
		$("#mainFaq").click();
	}
	
</script>