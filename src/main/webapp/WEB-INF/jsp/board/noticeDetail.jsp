<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Subpage Nav Tabs -->
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
         <div class="wizard-item first">
           <a href="/board/introPage.do">e-다울마당이란</a>
         </div>
         <div class="wizard-item">
           <a href="/board/faqListPage.do">자주하는질문</a>
         </div>
         <div class="wizard-item active">
           <a href="/board/noticeListPage.do">공지사항</a>
         </div>
         <div class="wizard-item last">
           <a href="/board/qnaListPage.do">묻고답하기</a>
         </div>
       </div>
	</div>
</div>

<!-- Notice Detail Section -->
<section class="notice-detail-section bgc-fa">
	<div class="container">
		<div class="row">
	        <div class="col-lg-10 offset-lg-1">
				<div class="board-detail-table">
					<div class="table-responsive mt0">
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col" class="text-left">미리 보는 2030년 전북의 모습은?</th>
									<th scope="col" class="text-right board-info">관리자 | 2020.08.21 | 조회 21</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="text-left board-content" colspan="2">
										<div style="min-height: 224px;">
											<img src="images/board-sample.png" class="w-75" /><br>
											<br>2030년 까지 실제 예산이 반영된 사업계획이 실현된다면 우리 전라북도가 어떻게 변화될까요? <br>10년후 전라북도의 변화된 미래상을 이미지로 보여주는 '미리보는 전라북도 2030' 책자가 발간되어 안내해드립니다. <br>감사합니다.
										</div>
									</td>
								</tr>
								<tr>
									<td class="text-left board-file" colspan="2">
										<a href="#">
											<span class="fa-file-o mr10"></span>
											미리보는 전라북도 2030.pdf
										</a>
										<br>
										<a href="#">
											<span class="fa-file-o mr10"></span>
											미리보는 전라북도 2030.pdf
										</a>
									</td>
								</tr>
								<tr>
									<td class="text-left board-nav" colspan="2">
										<a href="#">
											<span class="fa-caret-up mr10">&nbsp;&nbsp;&nbsp;윗글</span>
											미리보는 전라북도 2030.pdf
										</a>
										<hr>
										<a href="#">
											<span class="fa-caret-down mr10">&nbsp;&nbsp;&nbsp;아래글</span>
											'20년 폭염대책 효과적인 지원방안 설문참여 당첨자 안내
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="board-btns text-center">
						<button type="submit" class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/board/noticeListPage.do'">목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>