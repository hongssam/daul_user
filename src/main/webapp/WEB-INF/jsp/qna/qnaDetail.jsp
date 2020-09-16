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


<!-- QA Detail Section -->
<section class="qa-detail-section bgc-fa">
	<div class="container">
		<div class="row">
			<div class="col-lg-10 offset-lg-1">
				<div class="board-detail-table">
					<div class="table-responsive mt0">
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col" class="text-left">${qnaVo.question }</th>
									<th scope="col" class="text-right board-info">${qnaVo.name } | ${qnaVo.create_date } | 조회 ${qnaVo.view_count }</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="text-left board-content" colspan="2">
										<div style="min-height: 224px;">
											${qnaVo.content }
										</div>
									</td>
								</tr>
								<tr>
									<td class="text-left board-nav" colspan="2">
										<a href="#">
											<span class="fa-caret-up mr10">&nbsp;&nbsp;&nbsp;윗글</span>
											답변 드립니다.
										</a>
										<hr>
										<a href="#">
											<span class="fa-caret-down mr10">&nbsp;&nbsp;&nbsp;아래글</span>
											답변 드립니다.
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="board-btns text-center">
					<c:choose>
						<c:when test="${qnaVo.create_user eq login.user_id }">
							<button type="submit" class="btn btn-default" onclick="location.href='qa.html'">목록</button>
							<button type="submit" class="btn btn-default" onclick="location.href='qa-edit.html'">글쓰기</button>
							<button type="submit" class="btn btn-default" onclick="location.href='qa-edit.html'">수정</button>
							<button type="submit" class="btn btn-default">삭제</button>
						</c:when>
						<c:otherwise>
							<button type="submit" class="btn btn-default" onclick="location.href='qa.html'">목록</button>
							<button type="submit" class="btn btn-default" onclick="location.href='qa-edit.html'">글쓰기</button>
						</c:otherwise>
					</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
