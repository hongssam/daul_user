<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Subpage Nav Tabs -->
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first active">
				<a href="/contest/contestListPage.do?order=1">공모제안</a>
			</div>
			<div class="wizard-item last">
				<a href="/contest/contestNoticeListPage.do">공지사항</a>
			</div>
		</div>
	</div>
</div>

<!-- Suggest Detail Section -->
<section class="suggest-detail-section bgc-fa">
	<div class="container">
		<input type="hidden" id="admin_contest_idx" value="${contestVo.admin_contest_idx }" />
		<div class="row">
			<div class="col-lg-10 offset-lg-1">
				<div class="ed-content">
					<div class="title">
						<div class="tag">
							<c:if test="${contestVo.ing eq '공모진행중' }">
								<span class="status_tag outline-primary">${contestVo.ing }</span>
							</c:if>
							<c:if test="${contestVo.ing eq '공모전' }">
								<span class="status_tag default">${contestVo.ing }</span>
							</c:if>
							<c:if test="${contestVo.ing eq '공모종료' }">
								<span class="status_tag default">${contestVo.ing }</span>
							</c:if>
						</div>
						<h4>${contestVo.title}</h4>
						<p class="date">
							<b>공모기간</b> | ${contestVo.contest_s_date} ~${contestVo.contest_e_date}
						</p>
						<p class="date">
							<b>접수기간</b> | ${contestVo.submit_s_date} ~${contestVo.submit_e_date}
						</p>
					</div>
					<hr />
					<div class="content">
						<p>${contestVo.content}</p>
					</div>
					<div class="files" id="file-list"></div>
					<div class="bottom">
						<c:choose>
							<c:when test="${empty login.user_id && contestVo.ing eq '공모진행중'}">
								<button class="btn btn-primary btn-survey" onclick="gotoLoginPage()">
									<i class="fa-comments-o"></i>
									공모 참여하기
								</button>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${checkSubmit eq 0}">
										<c:if test="${contestVo.ing eq '공모진행중'}">
											<button class="btn btn-primary btn-survey" data-toggle="modal" data-target=".contest-edit-modal" id="contest-edit-modal-btn">
												<i class="fa-comments-o"></i>
												공모 참여하기
											</button>
										</c:if>
									</c:when>
									<c:otherwise>
										<button class="btn btn-dark btn-survey" data-toggle="modal" data-target="#contest-update-modal" id="contest-update-modal-btn">
											<i class="fa-edit"></i>
											내 제안 보기
										</button>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="col-lg-10 offset-lg-1">
				<div class="board-table mt20">
					<p>총 ${fn:length(userContestList)}건의 공모가 있습니다.</p>
					<div class="table-responsive mt0">
						<table class="table">
							<thead class="thead-light hidden-sm-down">
								<tr>
									<th scope="col">번호</th>
									<th scope="col">작성자</th>
									<th scope="col">제안명</th>
									<th scope="col">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${userContestList}" varStatus="idx">
									<tr>
										<td class="text-center hidden-sm-down">${list.num }</td>
										<td class="text-center hidden-sm-down">${list.user_name }</td>
										<td class="hidden-sm-down">${list.title }</td>
										<td class="text-center hidden-sm-down">${list.create_date }</td>
										<td class="hidden-sm-up">
											${list.title}
											<p class="small mt0 mb0">${list.user_name} | ${list.create_date}</p>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<%@ include file="../common/pagination.jsp"%>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Contest Modal -->
<div class="contest-edit-modal modal fade " tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<p>공모제안</p>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<h4 class="title">${contestVo.title}</h4>
				<hr>
				<div class="board-detail-table edit-style">
					<div class="caption">
						<ul>
							<li>
								<i>&#149;</i>
								공모신청서 양식을 다운로드하지 않으신 분은 다운받아 작성하시기 바랍니다.
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
					<form:form method="post" modelAttribute="contestVo" enctype="multipart/form-data" id="regist-form" action="/contest/contestUserRegist.do">
						<div class="table-responsive mt0">
							<form:input type="hidden" path="admin_contest_idx" value="${contestVo.admin_contest_idx}" />
							<table class="table">
								<tbody>
									<tr>
										<td class="text-left board-content">
											<div class="form-group row">
												<div class="col-lg-2">
													<label>제목<span class="color-red ml5">*</span></label>
												</div>
												<div class="col-lg-10">
													<form:input type="text" class="form-control" path="user_title" placeholder="" id="regist-title"/>
													<form:errors style="color:red" path="user_title" />
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td class="text-left board-file">
											<div class="form-group row">
												<div class="col-lg-2">
													<label>제안서<span class="color-red ml5">*</span></label>
												</div>
												<div class="col-lg-10">
													<span class="color-red ml5">※ 반드시 공모신청서 양식을 다운로드 받아 작성하여 올려주세요.</span>
													<input type="file" class="form-control" multiple="multiple" id="contestFile" name="contestFile">
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="board-btns text-center">
							<button type="button" class="btn btn-primary" id="contestRegistBtn" data-title="공모제안">등록</button>
							<button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">취소</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div> 


<c:choose>
	<c:when test="${empty login.user_id }">
	</c:when>
	<c:otherwise>
		<!-- Contest Modal -->
		<div class="contest-edit-modal modal fade" id="contest-update-modal" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<p>공모제안 수정</p>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<h4 class="title">${contestVo.title }</h4>
						<hr>
						<div class="board-detail-table edit-style">
							<div class="caption">
								<ul>
									<li>
										<i>&#149;</i>
										공모신청서 양식을 다운로드하지 않으신 분은 다운받아 작성하시기 바랍니다.
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

							<form:form method="post" modelAttribute="userContestVo" enctype="multipart/form-data" id="modify-form" action="/contest/contestUserUpdate.do">
								<div class="table-responsive mt0">
									<form:input type="hidden" path="user_contest_idx" value="${userContestVo.user_contest_idx }" />
									<form:input type="hidden" path="admin_contest_idx" value="${userContestVo.admin_contest_idx }" />
									<table class="table">
										<tbody>
											<tr>
												<td class="text-left board-content">
													<div class="form-group row">
														<div class="col-lg-2">
															<label>제목<span class="color-red ml5">*</span></label>
														</div>
														<div class="col-lg-10">
															<form:input type="text" class="form-control" path="title" placeholder="" id="modify-title" />
															<form:errors style="color:red" path="title" />
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td class="text-left board-file">
													<div class="form-group row">
														<div class="col-lg-2">
															<label>제안서<span class="color-red ml5">*</span></label>
														</div>
														<div class="col-lg-10">
															<span class="color-red ml5">※ 반드시 공모신청서 양식을 다운로드 받아 작성하여 올려주세요.</span>
															<input type="file" class="form-control" multiple="multiple" id="userContestFile" name="contestFile" id="modify-file">
															<p id="userFile-list"></p>
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="board-btns text-center">
									<button type="button" class="btn btn-primary" id="contestModifyBtn" data-title="공모제안">수정</button>
									<button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">취소</button>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>



<script type="text/javascript">
	var fileList = new Array();
	var userFileList = new Array();
	
  	$(document).ready(function(){
		$("a[name='file']").on("click",function(e){
			e.preventDefault();
			fn_downloadFile($(this));
		});
		
		$("a[name='file2']").on("click",function(e){
			e.preventDefault();
			fn_downloadFile2($(this));
		});
		
   	});
   
  	function fn_downloadFile(obj){
		var save_file_name = obj.parent().find("input[name='save_file_name']").val();
		console.log(save_file_name);
		location.href = "${pageContext.request.contextPath}/contest/downloadFile.do?save_file_name=" + save_file_name;
  	}
  	
  	function fn_downloadFile2(obj){
		var save_file_name = obj.parent().find("input[name='save_file_name']").val();
		console.log(save_file_name);
		location.href = "${pageContext.request.contextPath}/contest/downloadFile2.do?save_file_name=" + save_file_name;
  	}
  	
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
			if (file.attach_type.indexOf("contest") > -1) {
				var str = 	'<a href="#this" name="file">'
						+   '<input type="hidden" name="save_file_name" value="' + file.save_file_name + '">'
						+	'	<span class="fa-file-o mr10" ></span>'
						+	file.org_file_name
						+	'</a>'
						+   '<br>';
				$("#file-list").append(str);
			} else if (file.attach_type.indexOf("prop") > -1) {
				var str =	'<a href="#this" name="file">'
						+   '<input type="hidden" name="save_file_name" value="' + file.save_file_name + '">'
						+	'	<span class="fa-file-o mr10"></span>'
						+	file.org_file_name
						+	'</a>'
						+   '<br>';
				$("#file-list").append(str);
			} else if (file.attach_type.indexOf("rep") > -1){
			}
		}
	}
	
	var input_file = document.getElementById("contestFile");
	
	input_file.addEventListener("change", function() {
		contestFileChange();
	});
	
	var contestFileList = new Array();
	
	function contestFileChange() {
		var fileValue = input_file.files;
		
		if(fileValue.length > 0){
			for(var i = 0; i < fileValue.length; i++ ){
				var exist = false;
				
				for(var k = 0; k < contestFileList.length; k++){
					if(fileValue[i].name === contestFileList[k].name){
						console.log("this file is already exist", fileValue[i].name);
						exist = true;
						break;
					}
				}
				
				if(!exist){
					contestFileList.push(fileValue[i]);
					var p = document.createElement("p");
					p.setAttribute("name", "regist-contest-file");

					var str =
						'<input type="hidden" name="save_file_name" value="' + fileValue[i].name + '" >' +
						'<a href="#"  name="regist-file">' +
							'<span class="fa-file-o mr10"></span> (new) ' + fileValue[i].name +
						'</a>' +
						'<button class="btn btn-pure" type="button" name="newFileDelBtn" onclick="newFileDel(this)">' +
							'<span class="fa-trash-o"></span>' +
						'</button>';
						
					p.innerHTML = str;
					
					input_file.after(p);
				}
			}
		}
	}
	
	function newFileDel(_this) {
		var fileName = _this.parentElement.firstElementChild.value;
		
		for (var i = 0; i < contestFileList.length; i++) {
			if (fileName === contestFileList[i].name) {
				contestFileList.splice(i, 1);
				
				_this.parentElement.remove();
			}
		}
	} 
	
	var contestRegistBtn = document.getElementById("contestRegistBtn");
	
	contestRegistBtn.addEventListener("click", function() {
		if($("#regist-title").val() === '' || $("#regist-title").val() === null){
			alert("제목은 필수 입력항목 입니다.");
			return false;
		}
		
		if(typeof $("a[name='regist-file']")[0] === "undefined"){
			alert("첨부파일은 필수 입력항목 입니다.");
			return false;
		}
		
		if (!submitConfirm($(contestRegistBtn))) return false;
		
		document.getElementById("regist-form").submit();
	})
	
	if (login_user_id !== '') {
		var contestModifyBtn = document.getElementById("contestModifyBtn");
		
		contestModifyBtn.addEventListener("click", function() {
			if($("#modify-title").val() === '' || $("#modify-title").val() === null){
				alert("제목은 필수 입력항목 입니다.");
				return false;
			}
			
			if (!submitConfirm($(contestModifyBtn))) return false;
			
			document.getElementById("modify-form").submit();
		}); 
		
		var user_input_file = document.getElementById("userContestFile");
		
		user_input_file.addEventListener("change", function() {
			userContestFileChange();
		});
	}
	
	 <c:forEach var="userFile" items="${userFileList}">
		var userFile = {};
		userFile.contest_idx 	= "${userFile.user_contest_idx}";
		userFile.org_file_name 	= "${userFile.org_file_name}";
		userFile.save_file_name = "${userFile.save_file_name}";
		userFile.file_size 		= "${userFile.file_size}";
		userFile.create_user 	= "${userFile.create_user}";
		userFile.del_chk 		= "${userFile.del_chk}";
		userFile.attach_type 	= "${userFile.attach_type}";
		userFileList.push(userFile);
	</c:forEach>	
	
	if (userFileList.length > 0) {
		for (var file of userFileList) {
				var str = 	'<div><a href="#this" name="file2">'
						+   '<input type="hidden" name="save_file_name" value="' + file.save_file_name + '">'
						+	'	<span class="fa-file-o mr10" ></span>'
						+	file.org_file_name
						+	'</a>'
						+   '<button class="btn btn-pure" type="button" name="FileDelBtn">'
						+   '<span class="fa-trash-o"></span>' 
					    +   '</button>' 
					    +   '<br></div>';
				$("#userFile-list").append(str);
		}
	}
	
	var userContestFileList = new Array();
	
	function userContestFileChange() {
		var fileValue = user_input_file.files;
		
		if (fileValue.length > 0) {
	  		for (var i = 0; i < fileValue.length; i++) {
				var exist = false;
				
				for (var k = 0; k < userContestFileList.length; k++) {
					if (fileValue[i].name === userContestFileList[k].name) {
						console.log("this file is already exist", fileValue[i].name);
						exist = true;
						break;
					}
				}
				
				if (!exist) {
					userContestFileList.push(fileValue[i]);

					var str ='<div name="modify-contest-file">'+
						'<input type="hidden" name="save_file_name" value="' + fileValue[i].name + '">' +
						'<a href="#"  name="modify-file">' +
							'<span class="fa-file-o mr10"></span> (new) ' + fileValue[i].name +
						'</a>' +
						'<button class="btn btn-pure" type="button" name="newFileDelBtn" onclick="newFileDel2(this)">' +
							'<span class="fa-trash-o"></span>' +
						'</button>'
						+'<br/>'
						+'</div>';
						
					$("#userFile-list").append(str);
				}
			}
	  	}
	} 
	
	function newFileDel2(_this) {
		var fileName = $(_this).siblings().first().val();
		console.log(fileName);
		for (var i = 0; i < userContestFileList.length; i++) {
			if (fileName === userContestFileList[i].name) {
				userContestFileList.splice(i, 1);
				
				_this.parentElement.remove();
			}
		}
	}
	
	var userContestUpdateBtn = document.getElementById("userContestUpdateBtn");
	

	$("button[name='FileDelBtn']").click(function() {
		var save_file_name = $(this).parent().find("input[name='save_file_name']").val();
		console.log(save_file_name);
		if (!confirm("해당 파일이 삭제됩니다. 삭제하시겠습니까?")) return;
	
		var request = $.ajax({
			url: "/contest/userContestFileDelete.do",
			method: "post",
			//contentType: "application/json",
			//dataType: "json",
			data: { file_name : save_file_name}
		});
		request.done(function(data) {
			if (data === "success") {
				var $target = $("input[type='hidden'][name='save_file_name']");
		
				for (var i = 0; i < $target.length; i++) {
					if (save_file_name === $target.eq(i).val()) {
						$target.eq(i).parent().parent().remove();
					}
				}
				
				for (var j = 0; j < userFileList.length; j++) {
					if (userFileList[j].save_file_name === save_file_name) {
						userFileList.splice(j, 1);
					}
				}
			} else {
				console.log("request doen data is error");
			}
		});
		
		request.fail(function(error) {
			console.log(error);
			console.log("request fail");
		});
	}); 
	
	function fn_paging(pageNum) {
		var idx = $("#admin_contest_idx").val();
		location.href = '${pageContext.request.contextPath}/contest/contestDetailPage.do?admin_contest_idx='+idx+'&curPage=' + pageNum;
	}
	
	
	$("#contest-edit-modal-btn").click(function(e){
		$("#regist-title").val('');
		contestFileList.pop();
		$("p[name='regist-contest-file']").remove();
	});
	
	$("#contest-update-modal-btn").click(function(){
		$("#modify-title").val('${userContestVo.title}');
		userContestFileList.pop();
		$("div[name='modify-contest-file']").remove();
	}); 
</script>















