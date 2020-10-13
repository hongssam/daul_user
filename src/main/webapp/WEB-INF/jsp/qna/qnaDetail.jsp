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

<c:choose>
	<c:when test="${qnaVo.lock_chk eq 'N' }">
		<section class="qa-detail-section bgc-fa">
			<div class="container">
				<div class="row">
					<div class="col-lg-10 offset-lg-1">
						<div class="board-detail-table">
							<div class="table-responsive mt0">
								<input type="hidden" id="qna_idx" value=${qnaVo.qna_idx }>
								<table class="table">
									<thead class="thead-light">
										<tr class="hidden-sm-down">
											<th scope="col" class="text-left">${qnaVo.question }</th>
											<th scope="col" class="text-right board-info">${qnaVo.name }|${qnaVo.create_date }| 조회 ${qnaVo.view_count }</th>
										</tr>
										
										<tr class="hidden-sm-up">
											<th scope="col" class="text-left">
												${qnaVo.question }
												<p class="small">${qnaVo.name }|${qnaVo.create_date }| 조회 ${qnaVo.view_count }</p>
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="text-left board-content" colspan="2">
												<div style="min-height: 224px;">${qnaVo.content }</div>
											</td>
										</tr>
										<tr>
											<td class="text-left board-nav" id="before-after-qna" colspan="2"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="board-btns text-center">
								<button type="button" class="btn btn-default" onclick="location.href='/qna/qnaListPage.do'">목록</button>
								<button type="button" class="btn btn-default" id="qna_regist_btn">글쓰기</button>
								<c:if test="${qnaVo.create_user eq login.user_id }">
									<button type="button" class="btn btn-default" id="qna_modify_btn">수정</button>
									<button type="button" class="btn btn-default" id="qna_delete_btn">삭제</button>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</c:when>
	<c:otherwise>
		<c:choose>
			<c:when test="${login.user_id eq qnaVo.create_user }">
				<section class="qa-detail-section bgc-fa">
					<div class="container">
						<div class="row">
							<div class="col-lg-10 offset-lg-1">
								<div class="board-detail-table">
									<div class="table-responsive mt0">
										<input type="hidden" id="qna_idx" value=${qnaVo.qna_idx }>
										<table class="table">
											<thead class="thead-light">
												<tr>
													<th scope="col" class="text-left">${qnaVo.question }</th>
													<th scope="col" class="text-right board-info">${qnaVo.name }|${qnaVo.create_date }| 조회 ${qnaVo.view_count }</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="text-left board-content" colspan="2">
														<div style="min-height: 224px;">${qnaVo.content }</div>
													</td>
												</tr>
												<tr>
													<td class="text-left board-nav" id="before-after-qna" colspan="2"></td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="board-btns text-center">
										<button type="button" class="btn btn-default" onclick="location.href='/qna/qnaListPage.do'">목록</button>
										<button type="button" class="btn btn-default" id="qna_regist_btn">글쓰기</button>
										<c:if test="${qnaVo.create_user eq login.user_id }">
											<button type="button" class="btn btn-default" id="qna_modify_btn">수정</button>
											<button type="button" class="btn btn-default" id="'qna_delete_btn">삭제</button>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</c:when>
			<c:otherwise>
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="login_form p30">
							<form action="#">
								<div class="heading">
									<h4>비밀글 기능으로 보호된 글입니다.</h4>
									<p>작성자와 관리자만 열람하실 수 있습니다.</p>
								</div>
								<div class="text-center">
									<button type="button" class="btn btn-primary btn-block" onclick="listPage();">목록</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>


	</c:otherwise>
</c:choose>


<script type="text/javascript">
	$(function() {
		getBeforeQna();
	});

	var idx = $("#qna_idx").val();

	function getBeforeQna() {
		var request = $.ajax({ url : "/qna/getBeforeQna.do?qna_idx=" + idx, method : "get", });

		request.done(function(data) {
			getAfterQna();
			drawBeforeQna(data);
		});

		request.fail(function(error) {
			console.log(error);
		});
	}

	function getAfterQna() {
		var request = $.ajax({ url : "/qna/getAfterQna.do?qna_idx=" + idx, method : "get", });

		request.done(function(data) {
			drawAfterQna(data);
		});

		request.fail(function(error) {
			console.log(error);
		});
	}

	function drawBeforeQna(data) {
		var before_qna_idx = data.qna_idx;
		var before_qna_question = data.question;
		var str;

		if (typeof before_qna_question == "undefined" || before_qna_question == null || before_qna_question == '') {
			str = '<a href="#">' + '<span class="fa-caret-up mr10">&nbsp;&nbsp;&nbsp;윗글</span>' + '이전 게시물이 없습니다.' + '</a>' + '<hr>';
		} else {
			str = '<a href="/qna/qnaDetail.do?qna_idx=' + before_qna_idx + '">' + '<span class="fa-caret-up mr10">&nbsp;&nbsp;&nbsp;윗글</span>'
					+ before_qna_question + '</a>' + '<hr>';
		}
		$("#before-after-qna").append(str);
	}

	function drawAfterQna(data) {
		var after_qna_idx = data.qna_idx;
		var after_qna_question = data.question;
		var str;

		if (typeof after_qna_question == "undefined" || after_qna_question == null || after_qna_question == '') {
			str = '<a href="#">' + '<span class="fa-caret-down mr10">&nbsp;&nbsp;&nbsp;아랫글</span>' + '다음 게시물이 없습니다.' + '</a>' + '<hr>';
		} else {
			str = '<a href="/qna/qnaDetail.do?qna_idx=' + after_qna_idx + '">' + '<span class="fa-caret-down mr10">&nbsp;&nbsp;&nbsp;아랫글</span>'
					+ after_qna_question + '</a>' + '<hr>';
		}
		$("#before-after-qna").append(str);
	}

	function listPage() {
		location.href = "${pageContext.request.contextPath}/qna/qnaListPage.do";
	}
	
	var qna_regist_btn = document.getElementById("qna_regist_btn");
	
	qna_regist_btn.addEventListener("click", function() {
		if (login_user_id !== "") {
			location.href = CTX + '/qna/qnaRegistPage.do';
		} else {
			gotoLoginPage();
		}
	});
	
	var create_user = "${qnaVo.create_user}";
	
	if (create_user === login_user_id) {
		var qna_modify_btn = document.getElementById("qna_modify_btn");
		
		qna_modify_btn.addEventListener("click", function() {
			location.href = "/qna/qnaModifyPage.do?qna_idx=${qnaVo.qna_idx}";
		});
		
		var qna_delete_btn = document.getElementById("qna_delete_btn");
		
		qna_delete_btn.addEventListener("click", function() {
			if (!confirm("삭제하시겠습니까?")) return false;
			location.href = "/qna/qnaDelete.do?qna_idx=${qnaVo.qna_idx}";
		});
	}
</script>
