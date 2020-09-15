<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Subpage Nav Tabs -->
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first">
				<a href="/survey/surveyListPage.do?order=1">설문하기</a>
			</div>
			<div class="wizard-item last active">
				<a href="/survey/surveyNoticeListPage.do">공지사항</a>
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
						<input type="hidden" id="notice_idx" value=${surveyNoticeVo.notice_idx }>
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col" class="text-left">${surveyNoticeVo.title}</th>
									<th scope="col" class="text-right board-info">${surveyNoticeVo.name}| ${surveyNoticeVo.create_date} | 조회 ${surveyNoticeVo.view_count}</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="text-left board-content" colspan="2">
										<div style="min-height: 224px;">
											<img src="images/board-sample.png" class="w-75" />
											<br>
											${surveyNoticeVo.content}
										</div>
									</td>
								</tr>
								<tr>
									<td class="text-left board-file" id="file-list" colspan="2">
									</td>
								</tr>
								<tr>
									<td class="text-left board-nav" id="before-after-notice" colspan="2">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="board-btns text-center">
						<button type="submit" class="btn btn-default" onclick="location.href='/survey/surveyNoticeListPage.do'">목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
	$(function() {
		getBeforeNotice();
	});

	var idx = $("#notice_idx").val();
	
	function getBeforeNotice() {
		
		var request = $.ajax({
			url: "/survey/getBeforeNotice.do?notice_idx="+idx,
			method: "get",
		});
		
		request.done(function(data) {
			getAfterNotice();
			drawBeforeNotice(data);
		});
		
		request.fail(function(error) {
			console.log(error);
		});
	}
	
	function getAfterNotice() {
		var request = $.ajax({
			url: "/survey/getAfterNotice.do?notice_idx="+idx,
			method: "get",
		});
		
		request.done(function(data) {
			drawAfterNotice(data);
		});
		
		request.fail(function(error) {
			console.log(error);
		});
	} 
	
	function drawBeforeNotice(data){
		var before_notice_idx = data.notice_idx;
		var before_notice_title = data.title;
		var str;
		
		if(typeof before_notice_title == "undefined" || before_notice_title == null || before_notice_title == ''){
			str = 	'<a href="#">'
			+	'<span class="fa-caret-up mr10">&nbsp;&nbsp;&nbsp;윗글</span>'
			+	'이전 게시물이 없습니다.'
			+'</a>'
			+'<hr>';
		}else{
			str = 	'<a href="/survey/surveyNoticeDetail.do?notice_idx='+before_notice_idx+'">'
			+	'<span class="fa-caret-up mr10">&nbsp;&nbsp;&nbsp;윗글</span>'
			+	before_notice_title
			+'</a>'
			+'<hr>';
		}
		$("#before-after-notice").append(str);
	}
	
	function drawAfterNotice(data){
		var after_notice_idx = data.notice_idx;
		var after_notice_title = data.title;
		var str;
		
		if(typeof after_notice_title == "undefined" || after_notice_title == null || after_notice_title == ''){
			str = 	'<a href="#">' 
			+	'<span class="fa-caret-down mr10">&nbsp;&nbsp;&nbsp;아랫글</span>'
			+	'다음 게시물이 없습니다.'
			+'</a>'
			+'<hr>';
		}else{
			str = 	'<a href="/survey/surveyNoticeDetail.do?notice_idx='+after_notice_idx+'">' 
			+	'<span class="fa-caret-down mr10">&nbsp;&nbsp;&nbsp;아랫글</span>'
			+	after_notice_title
			+'</a>'
			+'<hr>';
		}
		$("#before-after-notice").append(str);
	}
	
	
	var fileList = new Array();

	<c:forEach var="file" items="${fileList}">
		var file = {};
		file.contest_idx 	= "${file.admin_contest_idx}";
		file.org_file_name 	= "${file.org_file_name}";
		file.save_file_name = "${file.save_file_name}";
		file.file_size 		= "${file.file_size}";
		file.create_user 	= "${file.create_user}";
		file.del_chk 		= "${file.del_chk}";
		file.attach_type 	= "${file.attach_type}";
		fileList.push(file);
	</c:forEach>	
	
	if (fileList.length > 0) {
		for (var file of fileList) {
			var str = 		'<a href="#this" name="file">'
						+   '<input type="hidden" name="save_file_name" value="' + file.save_file_name + '">'
						+	'	<span class="fa-file-o mr10"></span>'
						+	file.org_file_name
						+	'</a>'
						+	'<br>';
			
			$("#file-list").append(str);
		}
	}
	
	$(document).ready(function(){
		$("a[name='file']").on("click",function(e){
			e.preventDefault();
			fn_downloadFile($(this));
		});
   	});
	
  	function fn_downloadFile(obj){
		var save_file_name = obj.parent().find("input[name='save_file_name']").val();
		location.href = "${pageContext.request.contextPath}/survey/downloadSurveyNoticeFile.do?save_file_name=" + save_file_name;
  	}
	
	
</script>