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

<!-- Notice Table Section -->
<section class="notice-section bgc-fa">
	<div class="container">
		<div class="row">
       <div class="col-lg-12">
				<div class="board-table">
					<p>총 19건의 게시물이 있습니다.</p>
					<div class="table-responsive mt0">
						<table class="table">
							<thead class="thead-light">
									<tr>
										<th scope="col">번호</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col">작성일</th>
										<th scope="col">조회</th>
									</tr>
							</thead>
							<tbody>
									<tr>
										<td class="text-center">1</td>
										<td><a href="/board/noticeDetailPage.do"><span class="status_tag outline-dark">공지</span>미리보는 대한민국의 미래는? </a></td>
										<td class="text-center">관리자</td>
										<td class="text-center">2020.08.21</td>
										<td class="text-center">25</td>
									</tr>
									<tr>
										<td class="text-center">1</td>
										<td><a href="/board/noticeDetailPage.do"><span class="status_tag outline-dark">공지</span>미리보는 대한민국의 미래는? </a></td>
										<td class="text-center">관리자</td>
										<td class="text-center">2020.08.21</td>
										<td class="text-center">25</td>
									</tr>
									<tr>
										<td class="text-center">1</td>
										<td><a href="/board/noticeDetailPage.do"><span class="status_tag outline-dark">공지</span>미리보는 대한민국의 미래는? </a></td>
										<td class="text-center">관리자</td>
										<td class="text-center">2020.08.21</td>
										<td class="text-center">25</td>
									</tr>
							</tbody>
						</table>
					</div>
					<div class="table-nav">
						<ul class="page-navigation">
								<li class="page-item disabled">
									<a class="page-link" href="#"><span class="fa-angle-double-left"></span></a>
								</li>
								<li class="page-item disabled">
									<a class="page-link" href="#"><span class="fa-angle-left"></span></a>
								</li>
								<li class="page-item text"><a class="page-link" href="#">1</a></li>
								<li class="page-item text active" aria-current="page">
									<a class="page-link" href="#">2</a>
								</li>
								<li class="page-item text"><a class="page-link" href="#">3</a></li>
								<li class="page-item">
									<a class="page-link" href="#"><span class="fa-angle-right"></span></a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#"><span class="fa-angle-double-right"></span></a>
								</li>
						</ul>
						<div class="candidate_revew_select style2 text-center mb30-991 mt20">
							<ul class="mb0">
								<li class="list-inline-item">
									<select class="selectpicker show-tick">
										<option>제목</option>
										<option>작성자</option>
									</select>
								</li>
								<li class="list-inline-item">
									<div class="candidate_revew_search_box course fn-520">
										<form class="form-inline my-2">
											<input class="form-control mr-sm-2" type="search" placeholder="" aria-label="Search">
											<button class="btn my-2 my-sm-0" type="submit"><span class="flaticon-magnifying-glass"></span></button>
										</form>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
       		</div>
		</div>
	</div>
</section>