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
         <div class="wizard-item">
           <a href="/board/noticeListPage.do">공지사항</a>
         </div>
         <div class="wizard-item last active">
           <a href="/board/qnaListPage.do">묻고답하기</a>
         </div>
       </div>
	</div>
</div>

<!-- QA Edit Section -->
<!-- Edit Section -->
<section class="qa-edit-section bgc-fa">
	<div class="container">
		<div class="row">
			<div class="col-lg-10 offset-lg-1">
				<div class="board-detail-table edit-style">
					<div class="caption">
						<ul>
							<li>
								<i>&#149;</i>
								민원, 불편, 개선, 부조리신고, 홍보 등은 처리되지 않습니다.
							</li>
							<li>
								<i>&#149;</i>
								제안 제시기준에 맞지 않는 부적절한 게시물은 이동 또는 삭제 조치됩니다.
							</li>
							<li>
								<i>&#149;</i>
								<span class="color-red ml5">*</span>
								표시는 필수 입력입니다.
							</li>
						</ul>
					</div>
					<div class="table-responsive mt0">
						<table class="table">
							<tbody>
								<tr>
									<td class="text-left board-content">
										<div class="form-group row">
											<div class="col-lg-2">
												<label>제목<span class="color-red ml5">*</span></label>
											</div>
											<div class="col-lg-10">
												<input type="text" class="form-control" placeholder="">
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td class="text-left board-content">
										<div class="form-group row">
											<div class="col-lg-2">
												<label>내용<span class="color-red ml5">*</span></label>
											</div>
											<div class="col-lg-10">
												<textarea class="form-control" rows="10" style="resize: none;"></textarea>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="board-btns text-center">
						<button type="submit" class="btn btn-primary">등록</button>
						<button type="button" class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/board/qnaListPage.do'">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>