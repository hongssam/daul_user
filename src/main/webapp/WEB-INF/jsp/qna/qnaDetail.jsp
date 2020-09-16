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
						<input type="hidden" id="qna_idx" value=${qnaVo.qna_idx }>
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
									<td class="text-left board-nav" id="before-after-qna" colspan="2">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="board-btns text-center">
					<c:choose>
						<c:when test="${qnaVo.create_user eq login.user_id }">
							<button type="submit" class="btn btn-default" onclick="location.href='/qna/qnaListPage.do'">목록</button>
							<button type="submit" class="btn btn-default" onclick="location.href='/qna/qnaRegistPage.do'">글쓰기</button>
							<button type="submit" class="btn btn-default" onclick="location.href='/qna/qnaUpdate.do'">수정</button>
							<button type="submit" class="btn btn-default" onclick="location.href='/qna/qnaDelete.do'">삭제</button>
						</c:when>
						<c:otherwise>
							<button type="submit" class="btn btn-default" onclick="location.href='/qna/qnaListPage.do'">목록</button>
							<button type="submit" class="btn btn-default" onclick="location.href='/qna/qnaRegistPage.do'">글쓰기</button>
						</c:otherwise>
					</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<script type="text/javascript">
	
	$(function() {
		getBeforeQna();
	});
	
	var idx = $("#qna_idx").val();
	
	function getBeforeQna() {
		
		var request = $.ajax({
			url: "/qna/getBeforeQna.do?qna_idx="+idx,
			method: "get",
		});
		
		request.done(function(data) {
			getAfterQna();
			drawBeforeQna(data);
			console.log(data);
		});
		
		request.fail(function(error) {
			console.log(error);
		});
	}
	
	function getAfterQna() {
		var request = $.ajax({
			url: "/qna/getAfterQna.do?qna_idx="+idx,
			method: "get",
		});
		
		request.done(function(data) {
			drawAfterQna(data);
			console.log(data);
		});
		
		request.fail(function(error) {
			console.log(error);
		});
	} 
	
	function drawBeforeQna(data){
		var before_qna_idx = data.qna_idx;
		var before_qna_question = data.question;
		var str;
		
		if(typeof before_qna_question == "undefined" || before_qna_question == null || before_qna_question == ''){
			str = 	'<a href="#">'
			+	'<span class="fa-caret-up mr10">&nbsp;&nbsp;&nbsp;윗글</span>'
			+	'이전 게시물이 없습니다.'
			+'</a>'
			+'<hr>';
		}else{
			str = 	'<a href="/qna/qnaDetail.do?qna_idx='+before_qna_idx+'">'
			+	'<span class="fa-caret-up mr10">&nbsp;&nbsp;&nbsp;윗글</span>'
			+	before_qna_question
			+'</a>'
			+'<hr>';
		}
		$("#before-after-qna").append(str);
	}
	
	function drawAfterQna(data){
		var after_qna_idx = data.qna_idx;
		var after_qna_question = data.question;
		var str;
		
		if(typeof after_qna_question == "undefined" || after_qna_question == null || after_qna_question == ''){
			str = 	'<a href="#">' 
			+	'<span class="fa-caret-down mr10">&nbsp;&nbsp;&nbsp;아랫글</span>'
			+	'다음 게시물이 없습니다.'
			+'</a>'
			+'<hr>';
		}else{
			str = 	'<a href="/qna/qnaDetail.do?qna_idx='+after_qna_idx+'">' 
			+	'<span class="fa-caret-down mr10">&nbsp;&nbsp;&nbsp;아랫글</span>'
			+	after_qna_question
			+'</a>'
			+'<hr>';
		}
		$("#before-after-qna").append(str);
	}
	
</script>
