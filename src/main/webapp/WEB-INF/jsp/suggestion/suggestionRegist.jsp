<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Subpage Nav Tabs -->
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first active">
				<a href="/suggestion/suggestionRegistPage.do">제안하기</a>
			</div>
			<div class="wizard-item">
				<a href="/suggestion/suggestionListPage.do?order=1&type=normal">열린 제안</a>
			</div>
			<div class="wizard-item">
				<a href="/suggestion/suggestionListPage.do?order=1&type=like">공감 제안</a>
			</div>
			<div class="wizard-item last">
				<a href="/suggestion/suggestionListPage.do?order=1&type=end">종료된 제안</a>
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
					<form:form method="post" modelAttribute="suggestionVo" enctype="multipart/form-data" id="regist-form" action="/suggestion/suggestionRegist.do">
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
													<form:input type="text" class="form-control" placeholder="" path="title"/>
													<form:errors style="color:red" path="title"/>
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
													<form:textarea class="form-control" rows="10" style="resize: none;" path="content"/>
													<form:errors style="color:red" path="content"/>
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
													<input type="file" class="form-control mb-md-2" multiple="multiple" id="sgstFile" name="sgstFile"/>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="board-btns text-center">
							<button type="button" class="btn btn-primary" id="sgstRegistBtn" data-title="열린제안" >등록</button>
							<button type="button" class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/suggestion/suggestionListPage.do'">취소</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
	var input_file = document.getElementById("sgstFile");
	
	input_file.addEventListener("change", function() {
		sgstFileChange();
	});
	
	var sgstFileList = new Array();
	
	function sgstFileChange() {
		var fileValue = input_file.files;
		
		if (fileValue.length > 0) {
	  		for (var i = 0; i < fileValue.length; i++) {
				var exist = false;
				
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
					
					var str =
						'<input type="hidden" name="save_file_name" value="' + fileValue[i].name + '">' +
						'<a href="#">' +
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
		
		for (var i = 0; i < sgstFileList.length; i++) {
			if (fileName === sgstFileList[i].name) {
				sgstFileList.splice(i, 1);
				
				_this.parentElement.remove();
			}
		}
	}
	
	var sgstRegistBtn = document.getElementById("sgstRegistBtn");
	
	sgstRegistBtn.addEventListener("click", function() {
		if (!submitConfirm($(sgstRegistBtn))) return false;
		
		document.getElementById("regist-form").submit();
	});
</script>