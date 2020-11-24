<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Subpage Nav Tabs -->
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first active">
				<c:choose>
					<c:when test="${empty login.user_id}">
						<a onclick="gotoLoginPage()">제안하기</a>
					</c:when>
					<c:otherwise>
						<a href="/suggestion/suggestionRegistPage.do">제안하기</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="wizard-item">
				<a href="/suggestion/suggestionListPage.do?order=1&board_type=normal">열린 제안</a>
			</div>
			<div class="wizard-item">
				<a href="/suggestion/suggestionListPage.do?order=1&board_type=like">공감 제안</a>
			</div>
			<div class="wizard-item last">
				<a href="/suggestion/suggestionListPage.do?order=1&board_type=end">종료된 제안</a>
			</div>
		</div>
	</div>
</div>
<!-- Edit Section -->
<section class="suggest-edit-section bgc-fa">
	<div class="container">
		<div class="row">
			<div class="col-lg-10 offset-lg-1">
				<div class="board-detail-table edit-style">
					<form:form method="post" modelAttribute="suggestionVo" enctype="multipart/form-data" id="modify_form" action="/suggestion/suggestionModify.do">
						<form:input type="hidden" class="form-control" path="suggestion_idx"/>
						<div class="caption">
							<ul>
								<li>
									<i>&#149;</i>
									민원, 불편, 개선, 부조리신고, 홍보 등은 처리되지 않습니다.
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
						<div class="table-responsive mt0">
							<table class="table">
								<tbody>
									<tr>
										<td class="text-left board-content">
											<div class="form-group row">
												<div class="col-lg-2">
													<label>제목<span class="color-red ml5">*</span></label>
												</div>
												<div class="col-lg-10">
													<form:input type="text" class="form-control" placeholder="" path="title" />
													<form:errors style="color:red" path="title" />
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td class="text-left board-content">
											<div class="form-group row">
												<div class="col-lg-2">
													<label>제안내용<span class="color-red ml5">*</span></label>
												</div>
												<div class="col-lg-10">
													<form:textarea class="form-control" rows="10" style="resize: none;" path="content" />
													<form:errors style="color:red" path="content" />
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td class="text-left board-file">
											<div class="form-group row">
												<div class="col-lg-2">
													<label>파일</label>
												</div>
												<div class="col-lg-10">
													<input type="file" class="form-control mb-md-2" multiple="multiple" id="sgstFile" name="sgstFile" />
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="board-btns text-center">
							<button type="button" class="btn btn-primary" id="sgst_modify_btn" data-title="열린제안">수정</button>
							<button type="button" class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/suggestion/suggestionListPage.do'">취소</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</section>


<script type="text/javascript">
	var fileList = new Array();
	
	<c:forEach var="file" items="${fileList}">
	var file = {};
	file["suggestion_idx"] = "${file.suggestion_idx}";
	file.org_file_name = "${file.org_file_name}";
	file.save_file_name = "${file.save_file_name}";
	file.file_size = "${file.file_size}";
	file.create_user = "${file.create_user}";
	file.del_chk = "${file.del_chk}";
	file.attach_type = "${file.attach_type}";
	fileList.push(file);
	</c:forEach>
	
	var input_file = document.getElementById("sgstFile");
	
	if (fileList.length > 0) {
		for (var i = 0; i < fileList.length; i++) {
			var file = fileList[i];
			
			if (file.attach_type.indexOf("sgst") > -1) {
				var p = document.createElement("p");

				var str = '<input type="hidden" name="save_file_name" value="' + file.save_file_name + '">' + '<a href="#">'
						+ '<span class="fa-file-o mr10"></span> ' + file.org_file_name + '</a>'
						+ '<button class="btn btn-pure" type="button" name="file_del_btn">'
						+ '<span class="fa-trash-o"></span>' + '</button>';

				p.innerHTML = str;

				input_file.parentElement.appendChild(p);
				
				let file_del_btn = document.querySelector("button[name='file_del_btn']");
				
				file_del_btn.addEventListener("click", function(e) {
					var save_file_name = file_del_btn.parentElement.firstElementChild.value;
					
					if (!confirm("해당 파일이 삭제됩니다. 삭제하시겠습니까?")) return;
					
					var request = $.ajax({
						url: "/suggestion/suggestionAttachFileDelete.do",
						method: "post",
						contentType: "application/json",
						data: JSON.stringify({file_name: save_file_name})
					});
					
					request.done(function(data) {
						if (data === "success") {
							var input = document.querySelectorAll("input[name='save_file_name']");
							
							for (var i = 0; i < input.length; i++) {
								if (input[i].value === save_file_name) {
									input[i].parentElement.remove();
								}
							}
							
							for (var j = 0; j < fileList.length; j++) {
								if (fileList[j].attach_type === "sgstFile" && fileList[j].save_file_name === save_file_name) {
									fileList.splice(j, 1);
								}
							}
						}
					});
					
					request.fail(function(error) {
						console.log("suggestionAttachFileDelete fail", error);
					});
				});
			}
		}
	}

	input_file.addEventListener("change", function() {
		sgstFileChange();
	});

	var sgstFileList = new Array();

	function sgstFileChange() {
		var fileValue = input_file.files;

		if (fileValue.length > 0) {
			for (var i = 0; i < fileValue.length; i++) {
				var exist = false;

				for (var j = 0; j < fileList.length; j++) {
  					if (fileList[j].attach_type === "sgstFile") {
  						if (fileValue[i].name === fileList[j].org_file_name) {
  							console.log("this file is already registed", fileValue[i].name);
  							exist = true;
  							break;
  						}
  					}
  				}
				
				for (var k = 0; k < sgstFileList.length; k++) {
					if (fileValue[i].name === sgstFileList[k].name) {
						console.log("this file is already exist", fileValue[i].name);
						exist = true;
						break;
					}
				}

				if (!exist) {
					sgstFileList.push(fileValue[i]);

					var p = document.createElement("p");

					var str = '<input type="hidden" name="save_file_name" value="' + fileValue[i].name + '">' + '<a href="#">'
							+ '<span class="fa-file-o mr10"></span> (new) ' + fileValue[i].name + '</a>'
							+ '<button class="btn btn-pure" type="button" name="newFileDelBtn" onclick="newFileDel(this)">'
							+ '<span class="fa-trash-o"></span>' + '</button>';

					p.innerHTML = str;

					input_file.after(p);
				}
			}
		}
	}

	function newFileDel(_this) {
		var fileName = _this.parentElement.firstElementChild.value;

		for (var i = 0; i < sgstFileList.length; i++) {
			if (fileName === sgstFileList[i].name) {
				sgstFileList.splice(i, 1);

				_this.parentElement.remove();
			}
		}
	}

	var sgst_modify_btn = document.getElementById("sgst_modify_btn");

	sgst_modify_btn.addEventListener("click", function() {
		if (!submitConfirm($(sgst_modify_btn)))	return false;
		
		$("#sgstFile").attr("type", "text");
		$("#sgstFile").attr("type", "file");
		
		var formData = new FormData($("#modify_form")[0]);
		
		for (var i = 0; i < sgstFileList.length; i++) {
			formData.append("sgstFile", sgstFileList[i]);
		}
		
		var request = $.ajax({
			url: "/suggestion/suggestionModify.do",
			method: "post",
			enctype: "multipart/form-data",
			processData: false,
			contentType: false,
			data: formData
		});
		
		request.done(function(data) {
			if (typeof(data) === "object") {
				valid(data);
				
				return false;
			} else if (typeof(data) === "string") {
				location.href = "${pageContext.request.contextPath}/suggestion/suggestionDetailPage.do?suggestion_idx=" + data;
			}
		});
	});
	
	function valid(data){	
		$("#chk-error-title").text('');
		$("#chk-error-content").text('');
	
		for(var i = 0; i < data.length; i++){
			var obj = data[i];
			
			for (var key in obj) {
				if(key=="title"){
					$("#chk-error-title").text(obj[key]);
					
				}else if(key=="content"){
					$("#chk-error-content").text(obj[key]);
				}
			
			}
		}
	}
</script>