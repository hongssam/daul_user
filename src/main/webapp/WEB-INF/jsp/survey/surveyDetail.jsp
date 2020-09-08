<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!-- Subpage Nav Tabs -->
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first active">
				<a href="survey.html">설문하기</a>
			</div>
			<div class="wizard-item last">
				<a href="survey-notice.html">공지사항</a>
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
							<input type="hidden" id="survey_idx" value="${surveyVo.survey_idx }"/>
							<h4>${surveyVo.title}</h4>
							<p class="date"><b>투표기간</b> | ${surveyVo.s_date} ~${surveyVo.e_date}</p>
						</div>
						<hr />
						<div class="content">
							<p>[제안이유]</p>
							<p>${surveyVo.content}</p>
						</div>
						<div class="files">
							<a href="#"><span class="fa-file-o mr10"></span>미리보는 전라북도 2030.pdf</a><br>
							<a href="#"><span class="fa-file-o mr10"></span>미리보는 전라북도 2030.pdf</a>
						</div>
						<div class="bottom">
							<button class="btn btn-primary btn-survey" data-toggle="modal" data-target=".survey-modal"><i class="fa-check-square-o"></i>참여하기</button>
							<button class="btn btn-dark btn-survey" data-toggle="modal" data-target=".survey-result-modal"><i class="fa-pie-chart"></i>결과보기</button>
	
						</div>
				</div>
			</div>
			<div class="col-lg-10 offset-lg-1">
				<div class="ed-content-reivew-write mt20 bgc-f1">
					<form class="comments_form">
						<div class="form-group ">
							<textarea class="form-control" rows="3" placeholder="의견을 작성해주세요."></textarea>
						</div>
						<div class="form-group text-right ">
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-10 offset-lg-1">
				<div class="ed-content-reivew">
					<div class="top">
						<p>총 ${fn:length(surveyOpinionList)}개의 의견이 있습니다.</p>
						<hr>
					</div>
					<c:forEach var="list" items="${surveyOpinionList}" varStatus="idx">
						<div class="reviews">
							<c:if test="${list.survey_indent eq '0' }">
								<div class="item">
									<div class="meta">
										<ul class="fp_meta">
											<li class="list-inline-item float-left">
												<img src="${pageContext.request.contextPath}/images/user.png" alt="user.png">
											</li>
											<li class="list-inline-item">
												<p>${list.name} </p>
												<p class="date">${list.create_date}</p>
											</li>
										</ul>
									</div>
									<div class="content">
										<p>${list.opinion_content}</p>
									</div>
									<div class="bottom">
										<button type="submit" class="btn btn-like">삭제</button>
										<button type="submit" class="btn btn-like">의견등록</button>
									</div>
								</div>
								</c:if>
							<!-- <div class="item reply">
								<div class="reply-write">
									<div class="form-group">
										<textarea class="form-control" rows="2" placeholder="의견을 작성해주세요."></textarea>
									</div>
									<div class="form-group text-right">
										<button type="submit" class="btn btn-primary">등록</button>
									</div>
								</div>
							</div> -->
							<c:if test="${list.survey_indent ne '0' }">
								<div class="item reply">
									<div class="meta">
										<ul class="fp_meta">
											<li class="list-inline-item float-left">
												<img src="${pageContext.request.contextPath}/images/user.png" alt="user.png">
											</li>
											<li class="list-inline-item">
												<p>${list.name}</p>
												<p class="date">${list.create_date}</p>
											</li>
											<li class="list-inline-item float-right">
												<button class="btn btn-like">삭제</button>
											</li>
										</ul>
									</div>
									<div class="content">
										<p>${list.opinion_content}</p>
									</div>
								</div>
							</c:if>
						</div>
					</c:forEach>
					<ul class="page-navigation mt20">
						<li class="page-item disabled">
							<a class="page-link" href="#"><span class="fa-angle-double-left"></span></a>
						</li>
						<li class="page-item disabled">
							<a class="page-link" href="#"><span class="fa-angle-left"></span></a>
						</li>
						<li class="page-item text">
							<a class="page-link" href="#">1</a>
						</li>
						<li class="page-item text active" aria-current="page">
							<a class="page-link" href="#">2</a>
						</li>
						<li class="page-item text">
							<a class="page-link" href="#">3</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#"><span class="fa-angle-right"></span></a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#"><span class="fa-angle-double-right"></span></a>
						</li>
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
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<h4 class="title">${surveyVo.title }</h4>
       			<form:form method="post" modelAttribute="surveyVo">
       				<input type="hidden" name="survey_idx" value="${surveyVo.survey_idx }">
	      			<div class="survey-box shortcode_widget_radiobox" id="survey-box">
	      			</div>
					<hr>
					<div class="survey-box bottom">
						<button type="submit" class="btn btn-primary" formaction="/survey/vote.do">등록</button>
						<button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">취소</span></button>
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
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			</div>
			<div class="modal-body">
				<h4 class="title">${surveyVo.title }</h4>
				<div class="survey-result-box" id="result-box">
				</div>
				<hr>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	
	function getQuestionList() {
		var survey_idx = $("#survey_idx").val();
		var request = $.ajax({
			url : "/survey/getQuestionList.do?survey_idx="+survey_idx,
			method : "get"
		});
	
		request.done(function(data) {
			makeQuestion(data);
		});
	
		request.fail(function(error) {
			console.log(error);
		});
	}
	
	function makeQuestion(data){
		
		var TList = new Array();
		var QList = new Array();
		
		for (var result of data){
			if(result.type === "T"){
				TList.push(result);
			}
		}
		
		for (var result2 of data){
			if(result2.type === "Q"){
				QList.push(result2);
			}
		}
		
		for(var i = 0; i < TList.length; i++){
				var str;
				if(TList[i].select_type === "S"){
				    str = '<hr><h5 class="mb20">'+(i+1)+'. '+TList[i].question_content+'</h5>'
						+	'<div class="ui_kit_radiobox" id="radiobox_'+TList[i].ref+'">'
						+	'</div>';
				}else{
					 str = '<hr><h5 class="mb20">'+(i+1)+'. '+TList[i].question_content+'</h5>'
						+	'<div class="ui_kit_checkbox" id="checkbox_'+TList[i].ref+'">'
				}
				$("#survey-box").append(str);
		}
		for(var j = 0; j < QList.length; j++){
			console.log(QList[j].ref);
				var str2;
				if(QList[j].select_type === "P"){
				    str2 =     '   <div class="item custom-control custom-checkbox">'
							+  '		<input type="checkbox" class="custom-control-input" value="'+QList[j].question_idx+'" name="answer" id="cb'+j+'">'
							+  '		<label class="custom-control-label" for="cb'+j+'">'+QList[j].question_content+'</label>'
							+  '	</div>';
					var id = "checkbox_" + QList[j].ref;
					console.log(id);
					$("#" + id).append(str2);		
				}else{
					 str2 =     '   <div class="radio item">'
							+  '		<input type="radio" name="answer" value="'+QList[j].question_idx+'" id="radio'+j+'">'
							+  '		<label for="radio'+j+'"><span class="radio-label"></span>'+QList[j].question_content+'</label>'
							+  '	</div>';
					$("#radiobox_"+QList[j].ref).append(str2);		
				}
		}
	}


	function getSurveyResult() {
		var survey_idx = $("#survey_idx").val();
		var request = $.ajax({
			url : "/survey/getSurveyResult.do?survey_idx="+survey_idx,
			method : "get"
		});
	
		request.done(function(data) {
			makeSurveyResult(data);
		});
	
		request.fail(function(error) {
			console.log(error);
		});
	}

	function makeSurveyResult(data){
		console.log("makeSurveyResult = " +data);
		var ResultTitleList = new Array();
		var ResultQuestionList = new Array();
		var ResultSum = 0;
		for (var result of data){
			if(result.type === "T"){
				ResultTitleList.push(result);
			}
		}
		
		for (var result2 of data){
			if(result2.type === "Q"){
				ResultQuestionList.push(result2);
			}
		}
		
		for (var result of ResultQuestionList) {
			ResultSum += parseInt(result.question_count);
		}
		
		for(var i = 0; i < ResultTitleList.length; i++){
			var str = '<hr><h5 class="mb20">'+(i+1)+'. '+ResultTitleList[i].question_content+'</h5>'
				  	+	'<div id="result_'+ResultTitleList[i].ref+'">'
					+	'</div>';
			$("#result-box").append(str);
		}
		
		for(var j = 0; j < ResultQuestionList.length; j++){
			var per = (ResultQuestionList[j].question_count/ResultSum) * 100 ;
			var str = 	  '<div class="item">'
						+ '	<label>'+ ResultQuestionList[j].question_content +'</label>'
						+ '	<span class="float-right">'+ ResultQuestionList[j].question_count +'<span class="color-red">('+ per.toFixed(1) +' %)</span></span>'
						+ '	<div class="bar-graph-bg">'
						+ '		<div class="bar-graph-fr" style="width:'+ per.toFixed(1) +'%"></div>'
						+ '	</div>'
						+ '</div>';
			var id = "result_" + ResultQuestionList[j].ref;			
			$("#"+id).append(str);
		}
	}
	
	$(function() {
		getQuestionList();
		getSurveyResult();
	});

</script>