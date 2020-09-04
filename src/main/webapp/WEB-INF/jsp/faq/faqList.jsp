<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
		<!-- Page -->
		<ol class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="/main/main.do">Home</a>
			</li>
			<li class="breadcrumb-item">게시판</li>
			<li class="breadcrumb-item active">자주하는질문</li>
		</ol>
		<div class="panel">
			<div class="panel-body" style="padding-top: 20px; padding-bottom: 1px;">
				<form id="search-form">
					<div class="form-group row">
						<!-- 등록일 -->
						<label class="col-md-1 col-form-label"><strong>등록일 </strong></label>
						<div class="col-md-5">
							<div class="input-daterange" data-plugin="datepicker">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">
											<i class="icon md-calendar" aria-hidden="true"></i>
										</span>
									</div>
									<input type="text" class="form-control" name="search_s_date" />
								</div>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">-</span>
									</div>
									<input type="text" class="form-control" name="search_e_date" />
								</div>
							</div>
						</div>
						<!-- 검색어 -->
						<label class="col-md-1 col-form-label"><strong>검색어 </strong></label>
						<div class="col-md-5">
							<div class="input-group">
								<div class="input-group-prepend w-p25">
									<select data-plugin="selectpicker" name="search_type">
										<option value="" selected>선택</option>
										<option value="title">제목</option>
										<option value="content">내용</option>
										<option value="create_user">작성자</option>
									</select>
								</div>
								<!-- <input type="text" class="form-control"> -->
								<input type="text" class="form-control" name="search" placeholder="검색어를 입력하세요." onkeyup="enterKey()">
							</div>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-lg-12">
							<button type="button" class="btn btn-primary btn-outline float-right waves-effect waves-classic" id="searchBtn">검색</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<div class="panel">
			<header class="panel-heading">
				<div class="panel-actions"></div>
			</header>
			<br />
			<div class="panel-body" style="padding-top: 20px; padding-bottom: 1px;">
				<div id="faqListTable" class="text-break"></div>
			</div>
			<div class="col-md-12">
				<div class="example example-buttons">
					<div>
						<button type="button" class="btn btn-primary btn-outline float-right waves-effect waves-classic" data-toggle="modal" data-target="#faqPositionCenter" id="faqPositionCenterBtn" href="#">글쓰기</button>
						<button type="button" style="display: none;" class="btn btn-squared btn-info" id="faqUpdate" data-toggle="modal" data-target="#faqUpdatePositionCenter" href="#">수정</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Page -->
</div>
<!-- FAQ 등록 모달 -->
<div class="modal fade" id="faqPositionCenter" aria-hidden="true" aria-labelledby="faqPositionCenter" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-simple modal-center">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">x</span>
				</button>
				<h4 class="modal-title">FAQ</h4>
			</div>
			<div class="modal-body">
				<form id="faq-modal-form">
					<div class="example-wrap">
						<h4 class="example-title">작성자</h4>
						<input type="text" readonly="true" class="form-control" id="inputPlaceholder" value="${login.user_id}" />
						<h4 class="example-title">질의</h4>
						<textarea class="form-control" id="question-reg" name="question" rows="5"></textarea>
						<span class="text-left" style="color: red;" id="chk-error-question"></span>
						<h4 class="example-title">응답</h4>
						<textarea class="form-control" id="answer-reg" name="answer" rows="5"></textarea>
						<span class="text-left" style="color: red;" id="chk-error-answer"></span>
					</div>

					<span class="text-left" id="chk-error"></span>
					<div style="text-align: center">
						<button type="button" class="btn btn-primary waves-effect waves-classics" id="faq-modal-btn" data-title="FAQ">등록</button>
						<button type="button" class="btn btn-default waves-effect waves-classics" data-dismiss="modal" aria-label="Close" id="faq-modal-cancle-btn">취소</button>
					</div>
				</form>

			</div>
			<div class="modal-footer">
				<!-- <button type="button" class="btn btn-default btn-pure" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button> -->
			</div>
		</div>
	</div>
</div>
<!--FAQ등록 모달 끝 -->

<!-- FAQ수정 모달 -->
<div class="modal fade" id="faqUpdatePositionCenter" aria-hidden="true" aria-labelledby="faqUpdatePositionCenter" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-simple modal-center">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">x</span>
				</button>
				<h4 class="modal-title">FAQ 상세보기</h4>
			</div>
			<div class="modal-body">
				<form id="faq-modal-update-form">
					<div class="example-wrap">
						<h4 class="example-title">작성자</h4>
						<input type="text" class="form-control" id="inputPlaceholder" name="create_user" value="${login.user_id}" />
						<h4 class="example-title">질의</h4>
						<textarea class="form-control" id="question_update" name="question" rows="5"></textarea>
						<h4 class="example-title">응답</h4>
						<textarea class="form-control" id="answer_update" name="answer" rows="5"></textarea>

						<input type="hidden" id="faq_idx_update" name="faq_idx" />

					</div>

					<span class="text-left" id="chk-error"></span>
					<div style="text-align: center">
						<button type="button" class="btn btn-primary waves-effect waves-classics" id="faq-modal-update-btn" data-title="FAQ">수정</button>
						<button type="button" class="btn btn-default waves-effect waves-classics" id="faq-modal-delete-btn" data-title="FAQ">삭제</button>
						<button type="button" class="btn btn-default waves-effect waves-classics" data-dismiss="modal" aria-label="Close" id="faq-modal-cancle-btn2">취 &nbsp;&nbsp; 소</button>
					</div>
				</form>

			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<!--FAQ수정 모달 끝 -->


<div class="col-lg-12 mt-20">

	<button style="display: none;" type="button" data-toggle="modal" data-target="#faqUpdatePositionCenter" id="faqDetailBtn">상세</button>
</div>

<script type="text/javascript">
	$(function() {

		$("#faqPositionCenterBtn").click(function() {
			$("#chk-error-question").text('');
			$("#chk-error-answer").text('');
			$("#question-reg").val('');
			$("#answer-reg").val('');
		});

		$("#faq-modal-btn").click(function() {
			if (!submitConfirm($(this)))
				return false;

			insertFaq();
		});

		$("#faq-modal-update-btn").click(function() {
			if (!submitConfirm($(this)))
				return false;

			updateFaq();
		});

		$("#faq-modal-delete-btn").click(function() {
			if (!submitConfirm($(this)))
				return false;

			deleteFaq();
		});

	});

	function insertFaq() {
		var request = $.ajax({ url : "/faq/insertFaq.do", method : "post",
		//contentType: "application/json",
		//dataType: "json",
		data : $("#faq-modal-form").serialize() });
		request.done(function(data) {
			if (typeof (data) == "object") {
				valid(data);
				return false;
			}

			if (data === "success") {

				$("#faq-modal-cancle-btn").trigger("click");
				getFaqList();
			} else {
				//alert(data);
				$("#chk-error").text(data);
			}
		});
		request.fail(function(error) {
			console.log(error);
			console.log("request fail");
		});
	}

	function updateFaq() {
		var request = $.ajax({ url : "/faq/updateFaq.do", method : "post",
		//contentType: "application/json",
		//dataType: "json",
		data : $("#faq-modal-update-form").serialize() });
		request.done(function(data) {
			if (typeof (data) == "object") {
				valid(data);
				return false;
			}

			if (data === "success") {
				getFaqList();
				$("#faq-modal-cancle-btn2").trigger("click");
			} else {
				//alert(data);
				$("#chk-error").text(data);
			}
		});
		request.fail(function(error) {
			console.log(error);
			console.log("request fail");
		});
	}

	function deleteFaq() {
		var request = $.ajax({ url : "/faq/deleteFaq.do", method : "post",
		//contentType: "application/json",
		//dataType: "json",
		data : $("#faq-modal-update-form").serialize() });
		request.done(function(data) {

			if (data === "success") {
				getFaqList();
				$("#faq-modal-cancle-btn2").trigger("click");
			} else {
				//alert(data);
				$("#chk-error").text(data);
			}
		});
		request.fail(function(error) {
			console.log(error);
			console.log("request fail");
		});
	}
	function setFaqListTable(faqList) {
		$('#faqListTable').jsGrid(
				{
					//height: "500px",
					width : "100%",

					//autoload:true,
					sorting : true,
					paging : true,
					//pageIndex: 1, default: 1
					pageSize : 10, // default: 20
					//pageButtonCount: 5, default: 15

					data : faqList,

					fields : [
							{ name : "num", title : "번호", type : "text", width : 40, align : "center" },
							{ name : "faq_idx", title : "번호", type : "text", width : 70, align : "center", css : "non-display" },
							{ name : "create_user", title : "작성자", type : "text", width : 70 },
							{ title : "질의", type : "text", width : 150, itemTemplate : function(_, item) {
								var result = "";
								console.log("length = " + item.question.length);
								if (item.question.length > 30) {
									result = item.question.substring(0, 30) + '...';
								} else {
									result = item.question;
								}
								return result;
							} }, { title : "응답", type : "text", width : 150, itemTemplate : function(_, item) {
								var result = "";
								console.log("length = " + item.answer.length);
								if (item.answer.length > 30) {
									result = item.answer.substring(0, 30) + '...';
								} else {
									result = item.answer;
								}
								return result;
							} }, { name : "create_date", title : "등록일", type : "text", width : 100, align : "center" }
					],

					rowClick : function(args) {
						var idx = args.item.faq_idx;

						$("#faqDetailBtn").trigger("click");

						$("#question_update").val(args.item.question);
						$("#answer_update").val(args.item.answer);
						$("#faq_idx_update").val(idx);

						//location.href = "${pageContext.request.contextPath}/contest/contestDetail.do?admin_contest_idx=" + idx;
					} });
	}

	function getFaqList() {
		var request = $.ajax({ url : "/faq/getFaqList.do", method : "get", data : $("#search-form").serialize() });

		request.done(function(data) {

			setFaqListTable(data);
		});

		request.fail(function(error) {
			console.log(error);
		});
	}

	$(function() {
		getFaqList();
	});

	$("#searchBtn").click(function() {
		getFaqList();
	});

	function enterKey() {
		if (window.event.keyCode === 13) {
			getFaqList();
		}
	}

	function valid(data) {
		$("#chk-error-question").text('');
		$("#chk-error-answer").text('');

		for (var i = 0; i < data.length; i++) {
			var obj = data[i];

			for ( var key in obj) {
				if (key == "question") {
					$("#chk-error-question").text(obj[key]);

				} else if (key == "answer") {
					$("#chk-error-answer").text(obj[key]);
				}

			}
		}
	}
</script>
