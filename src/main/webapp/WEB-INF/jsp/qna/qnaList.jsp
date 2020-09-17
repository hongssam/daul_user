<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- Subpage Nav Tabs -->
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first">
				<a href="/board/introPage.do">e-다울마당이란</a>
			</div>
			<div class="wizard-item ">
				<a href="/faq/faqListPage.do">자주하는질문</a>
			</div>
			<div class="wizard-item ">
				<a href="/notice/noticeListPage.do">공지사항</a>
			</div>
			<div class="wizard-item last active">
				<a href="/qna/qnaListPage.do">묻고답하기</a>
			</div>
		</div>
	</div>
</div>

<!-- QA Table Section -->
<section class="qa-section bgc-fa">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="board-table">
					<p>총 ${pagination.listCnt}건의 게시물이 있습니다.</p>
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
								<c:forEach var="list" items="${qnaList}" varStatus="idx">
									<c:choose>
										<c:when test="${empty list.parent_qna_idx }">
											<tr>
												<td class="text-center">${list.num}</td>
												<c:choose>
													<c:when test="${list.lock_chk eq 'Y' }">
														<c:choose>
															<c:when test="${list.create_user eq login.user_id}">
																<td>
																	<a href="/qna/qnaDetail.do?qna_idx=${list.qna_idx }">
																		${ list.question}
																		<span class="fa-lock ml10"></span>
																	</a>
																</td>
															</c:when>
															<c:otherwise>
																<td>
																	<a href="#" data-toggle="modal" data-target=".board-password-modal">
																		${ list.question}
																		<span class="fa-lock ml10"></span>
																	</a>
																</td>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<td>
															<a href="/qna/qnaDetail.do?qna_idx=${list.qna_idx }"> ${ list.question} </a>
														</td>
													</c:otherwise>
												</c:choose>
												<td class="text-center">${list.name }</td>
												<td class="text-center">${list.create_date }</td>
												<td class="text-center">${list.view_count }</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
												<td class="text-center"></td>

												<c:choose>
													<c:when test="${list.lock_chk eq 'Y' }">
														<td>
															<a href="#" data-toggle="modal" data-target=".board-password-modal">
																<span class="status_tag badge mr10">RE</span>${ list.question}
																<span class="fa-lock ml10"></span>
															</a>
														</td>
													</c:when>
													<c:otherwise>
														<td>
															<a href="/qna/qnaDetail.do?qna_idx=${list.qna_idx }">
																<span class="status_tag badge mr10">RE</span>
																${ list.question}
															</a>
														</td>
													</c:otherwise>
												</c:choose>
												<td class="text-center">${list.name }</td>
												<td class="text-center">${list.create_date }</td>
												<td class="text-center">${list.view_count }</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<button type="submit" class="bottom-right-btn btn btn-primary " onclick="location.href='/qna/qnaRegistPage.do'">글쓰기</button>
					<div class="table-nav">
						<%@ include file="../common/pagination.jsp"%>

						<div class="candidate_revew_select style2 text-center mb30-991 mt20">
							<form id="search_form">
								<ul class="mb0">
									<li class="list-inline-item">
										<select class="selectpicker show-tick" name="search_type">
											<option value="title">제목</option>
											<option value="create_user">작성자</option>
										</select>
									</li>
									<li class="list-inline-item">
										<div class="candidate_revew_search_box course fn-520">
											<div class="form-inline my-2">
												<input class="form-control mr-sm-2" type="text" name="search" id="search" placeholder="검색..." aria-label="Search">
												<button class="btn my-2 my-sm-0" type="button" id="search_btn">
													<span class="flaticon-magnifying-glass"></span>
												</button>
											</div>
										</div>
									</li>
								</ul>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<!-- Modal -->
<div class="modal fade board-password-modal " tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="login_form p30">
				<form action="#">
					<div class="heading">
						<h4>비밀글 기능으로 보호된 글입니다.</h4>
						<p>작성자와 관리자만 열람하실 수 있습니다.</p>
					</div>
					<div class="text-center">
						<button type="button" class="btn btn-primary btn-block" data-dismiss="modal" aria-label="Close">확인</button>
					</div>
				</form>
			</div>

		</div>
	</div>
</div>