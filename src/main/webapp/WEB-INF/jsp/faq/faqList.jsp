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
					<div class="faq_according">
						<div class="accordion" id="accordionExample">
							<c:forEach var="list" items="${faqList}" varStatus="idx">
								<div class="card">
									<div class="card-header" id="heading${idx.index}">
										<h2 class="mb-0">
											<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse${idx.index}" aria-expanded="false" aria-controls="collapse${idx.index}">${list.question }</button>
										</h2>
									</div>
									<div id="collapse${idx.index}" class="collapse" aria-labelledby="heading${idx.index}" data-parent="#accordionExample">
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
	
</script>