<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- Subpage Nav Tabs -->
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first active">
				<a href="/survey/surveyListPage.do?order=1">설문조사</a>
			</div>
			<div class="wizard-item last">
				<a href="/survey/surveyNoticeListPage.do">공지사항</a>
			</div>
		</div>
	</div>
</div>

<!-- Suggest Detail Section -->
<section class="suggest-detail-section bgc-fa">
	<div class="container">
		<div class="row">
			<div class="col-lg-10 offset-lg-1">
				<div class="ed-content">
					<div class="title">
						<div class="tag">
							<c:if test="${surveyVo.ing eq '투표중' }">
								<span class="status_tag outline-primary">${surveyVo.ing }</span>
							</c:if>
							<c:if test="${surveyVo.ing eq '투표전' }">
								<span class="status_tag default">${surveyVo.ing }</span>
							</c:if>
							<c:if test="${surveyVo.ing eq '투표완료' }">
								<span class="status_tag default">${surveyVo.ing }</span>
							</c:if>
						</div>
						<input type="hidden" id="survey_idx" value="${surveyVo.survey_idx }" />
						<h4>${surveyVo.title}</h4>
						<p class="date hidden-sm-down">
							<b>투표기간</b> | ${surveyVo.s_date} ~${surveyVo.e_date} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<b>참여자</b> | ${surveyVo.participation_count} 명
						</p>
						<p class="date hidden-sm-up">
							<b>투표기간</b> | ${surveyVo.s_date} ~${surveyVo.e_date}
							<br>
							<b>참여자</b> | ${surveyVo.participation_count} 명
						</p>

					</div>
					<hr />
					<div class="content">
						<p>${surveyVo.content}</p>
					</div>
					<div class="bottom">
						<c:choose>
							<c:when test="${login.user_id eq '' || empty login.user_id}">
								<c:if test="${surveyVo.ing eq '투표중'}">
									<button class="btn btn-primary btn-survey" onclick="gotoLoginPage()">
										<i class="fa-check-square-o"></i>
										참여하기
									</button>
								</c:if>
							</c:when>
							<c:otherwise>
								<c:if test="${login.user_id ne '' && not empty login.user_id}">
									<c:if test="${isPart eq false && surveyVo.ing eq '투표중'}">
										<button class="btn btn-primary btn-survey" data-toggle="modal" data-target=".survey-modal">
											<i class="fa-check-square-o"></i>
											참여하기
										</button>
									</c:if>
								</c:if>
							</c:otherwise>
						</c:choose>
						<button class="btn btn-dark btn-survey" data-toggle="modal" data-target=".survey-result-modal">
							<i class="fa-pie-chart"></i>
							결과보기
						</button>
					</div>
				</div>
			</div>
			<div class="col-lg-10 offset-lg-1">
				<div class="ed-content-reivew-write mt20 bgc-f1">
					<form class="comments_form" id="opn_form">
						<div class="form-group ">
							<textarea class="form-control" rows="3" name="opinion_content" id="opinion_content" placeholder="의견을 작성해주세요."></textarea>
							<input type="hidden" name="survey_idx" value="${surveyVo.survey_idx}" />
							<input type="hidden" name="opinion_idx" value="" />
						</div>
						<div class="form-group text-right ">
							<button type="button" class="btn btn-primary" id="opn_reg_btn">등록</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-10 offset-lg-1">
				<div class="ed-content-reivew">
					<div class="top opn-cnt">
						<p>총 ${surveyVo.opinion_count}개의 의견이 있습니다.</p>
						<hr>
					</div>
					<div class="reviews"></div>
					<ul class="page-navigation mt20">
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Suvery Modal -->
<div class="survey-modal modal fade " tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<p>설문조사</p>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<h4 class="title">${surveyVo.title }</h4>
				<form:form method="post" modelAttribute="surveyVo" action="/survey/vote.do" id="vote-form">
					<input type="hidden" name="survey_idx" value="${surveyVo.survey_idx }">
					<div class="survey-box shortcode_widget_radiobox" id="survey-box"></div>
					<hr>
					<div class="survey-box bottom">
						<button type="button" class="btn btn-primary" id="surveyVoteBtn">등록</button>
						<button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">취소</span>
						</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>

<!-- Suvery Result Modal -->
<div class="survey-result-modal modal fade " tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">

		<div class="modal-content">
			<div class="modal-header">
				<p>설문조사 결과</p>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<h4 class="title">${surveyVo.title }</h4>
				<div class="survey-result-box" id="result-box"></div>
				<hr>
			</div>
		</div>
	</div>
</div>

<script src="${pageContext.request.contextPath}/js/opinion.js"></script>
<script src="${pageContext.request.contextPath}/js/pagination-opinion.js"></script>
<script type="text/javascript">
	function getQuestionList() {
		var survey_idx = $("#survey_idx").val();
		var request = $.ajax({ url : "/survey/getQuestionList.do?survey_idx=" + survey_idx, method : "get" });

		request.done(function(data) {
			makeQuestion(data);
		});

		request.fail(function(error) {
			console.log(error);
		});
	}

	function makeQuestion(data) {
		var survey_box = document.getElementById("survey-box");

		for (var i = 0; i < data.length; i++) {
			var question = data[i];

			var type;

			// 설문 제목
			if (question.select_type === "S")
				type = "radiobox";
			else
				type = "checkbox";

			var title_html = '<hr>' + '<h5 class="mb20">' + (i + 1) + '. ' + question.title + '</h5>'
					+ '<div class="ui_kit_' + type + '" id="' + question.ref + '"></div>';

			survey_box.innerHTML += title_html;

			// 설문 항목
			for (var j = 0; j < question.question_content.length; j++) {
				var content = question.question_content[j];

				var content_html;

				if (content.select_type === "S") {
					content_html = '<div class="radio item">'
							+ '<input type="radio" name="answer_arr[' + i + ']" value="' + content.question_idx + '" id="radio_' + i + j + '"/>'
							+ '<label for="radio_' + i + j + '"><span class="radio-label"></span>' + content.question_content + '</label>' + '</div>';
				} else {
					content_html = '<div class="item custom-control custom-checkbox">'
							+ '<input type="checkbox" class="custom-control-input" value="' + content.question_idx + '" name="answer_arr[' + i + ']" id="cb_' + i + j + '">'
							+ '<label class="custom-control-label" for="cb_' + i + j + '">' + content.question_content + '</label>' + '</div>';
				}

				var title_div = document.getElementById(content.ref);

				title_div.innerHTML += content_html;
			}
		}
	}

	function getSurveyResult() {
		var survey_idx = $("#survey_idx").val();
		var request = $.ajax({ url : "/survey/getSurveyResult.do?survey_idx=" + survey_idx, method : "get" });

		request.done(function(data) {
			makeSurveyResult(data);
		});

		request.fail(function(error) {
			console.log(error);
		});
	}

	function makeSurveyResult(data) {
		var result_box_div = document.getElementById("result-box");

		for (var i = 0; i < data.length; i++) {
			var question_data = data[i];

			if (question_data.ref === question_data.question_idx) {
				var div = document.createElement("div");
				div.id = "result_" + question_data.ref;

				var html = '<hr>' + '<h5 class="mb20">' + question_data.question_content + ' (총 ' + question_data.total_question_count + '표)</h5>'
						+ '<div name="child_question_list"></div>';

				div.innerHTML = html;

				result_box_div.append(div);
			} else {
				var html = '<div class="item">' + '<label>' + question_data.question_content + '</label>' + '<span class="float-right">'
						+ question_data.question_count + '표 <span class="color-red">(' + question_data.question_per + ' %)</span></span>'
						+ '<div class="bar-graph-bg">' + '<div class="bar-graph-fr" style="width:' + question_data.question_per + '%"></div>'
						+ '</div>' + '</div>';

				var parent_div = document.getElementById("result_" + question_data.ref).querySelector("div[name='child_question_list']");
				parent_div.innerHTML += html;
			}
		}
	}

	$(function() {
		getQuestionList();
		getSurveyResult();
		getSurveyOpinionList(1);
	});

	var reviews = document.querySelector("div.reviews");

	function getSurveyOpinionList(curPage) {
		var request = $.ajax({ url : "/survey/surveyOpinionList.do", method : "get",
			data : { survey_idx : "${surveyVo.survey_idx}", curPage : curPage } });

		request.done(function(data) {
			setOpinionList(data.surveyOpnList);
			setPaginationInit(data.pagination);
		});
	}

	function registOpinion(target) {
		if (!confirm("댓글을(를) 등록 하시겠습니까?"))
			return false;

		var form = target.closest("form");

		var request = $.ajax({ url : "/survey/surveyOpinionRegist.do", method : "post", data : $(form).serialize() });

		request.done(function(data) {
			form.querySelector("textarea[name='opinion_content']").value = "";

			document.querySelector("div.top.opn-cnt").firstElementChild.innerText = "총 " + data + "개의 의견이 있습니다.";

			getSurveyOpinionList(1);
		});

		request.fail(function(error) {
			console.log("request fail", error)
		});
	}

	function deleteOpinion(target, opn) {
		if (!submitConfirm($(target)))
			return false;

		var request = $.ajax({ url : "/survey/surveyOpinionDelete.do", method : "post", data : opn });

		request.done(function(data) {
			if (data === "success") {
				getSurveyOpinionList(1);
			} else {

			}
		});
	}

	function fn_paging(curPage) {
		getSurveyOpinionList(curPage);
	}

	function loginPage() {
		alert("로그인이 필요합니다.");
		location.href = "${pageContext.request.contextPath}/login/loginPage.do";
	}
	
	var surveyVoteBtn = document.getElementById("surveyVoteBtn");
	
	surveyVoteBtn.addEventListener("click", function() {
		
		if (!confirm("확인 시 수정할 수 없으며, 바로 결과에 반영됩니다.")) return false;
		
		document.getElementById("vote-form").submit();
	});
	
</script>