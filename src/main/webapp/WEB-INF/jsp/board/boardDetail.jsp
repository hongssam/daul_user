<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
	    <!-- Page -->
	    <h1 class="page-title">공지사항 상세</h1>
	    <ol class="breadcrumb">
	      <li class="breadcrumb-item"><a href="/main/main.do">Home</a></li>
	      <li class="breadcrumb-item">공지사항</li>
	      <li class="breadcrumb-item active">공지사항 상세</li>
	    </ol>
	
		<div class="col-lg-12">
			<div class="mb-30">
				<div class="panel">
					<div class="panel-body">
						<form:form method="post" modelAttribute="boardVo" id="noticeForm">
			         		<form:input type="hidden" class="form-control" path="notice_idx"/>
			         		<div class="form-group row">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">등록자 </label>
								<div class="col-md-8">
									<form:input type="text" readonly="true" class="form-control" path="create_user"/>
									<form:errors path="create_user"/>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">제목 </label>
								<div class="col-md-8">
									<form:input type="text"  class="form-control" path="title"/>
									<form:errors path="title"/>
									<span class="text-left" style="color:red;" id="chk-error-title"></span>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">내용 </label>
								<div class="col-md-8">
									<form:textarea type="text" class="form-control" path="content" rows="5"/>
									<form:errors path="content"/>
									<span class="text-left" style="color:red;" id="chk-error-content"></span>
								</div>
							</div>
					    	<div class="form-group row">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label">첨부파일 </label>
								<div class="col-md-8">
									<div class="input-group input-group-file" data-plugin="inputGroupFile">
										<input type="text" class="form-control" id="noticeFileTitle" value="파일 0개" readonly />
										<span class="input-group-append"> 
											<span class="btn btn-primary btn-file"> 
												<i class="icon md-upload" aria-hidden="true"></i> 
												<input multiple="multiple" type="file" id="noticeFile" name="noticeFile" />
											</span>
										</span> 
									</div>
								</div>
							</div>  
							<div class="form-gorup row">
								<div class="col-md-1"></div>
								<label class="col-md-2 col-form-label"></label>
								<div class="col-md-8">
									<div id="noticeFile-list"></div>
								</div>
							</div>
					    
					        <br/>
					        <br/>
					        
							<div class="col-md-11 text-right">
								<div class="example example-buttons"> 
									<button type="button" class="btn btn-primary waves-effect waves-classic" data-title="공지사항" id="noticeModifyBtn" >수정 </button>
									<button type="submit" class="btn btn-primary waves-effect waves-classic" data-title="공지사항" id="notcieDeleteBtn" name="notcieDeleteBtn" formaction="/board/noticeDelete.do">삭제 </button>
									<button type="button" class="btn btn-default btn-outline waves-effect waves-classic" id="noticeListBtn">목록 </button>
								</div>
							</div>
						</form:form>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
</div>


<script type="text/javascript">
	
	$(document).ready(function(){
		$("a[name='file']").on("click",function(e){
			e.preventDefault();
			fn_downloadFile($(this));
		});
	});
   
	function fn_downloadFile(obj){
		var save_file_name = obj.siblings("input[name='save_file_name']").val();
		location.href = "${pageContext.request.contextPath}/board/downloadFile.do?save_file_name=" + save_file_name;
	}
	
	$("#noticeListBtn").click(function() {
		location.href = "${pageContext.request.contextPath}/board/boardListPage.do";
	});
  
	$("#noticeModifyBtn").click(function() {
		if (!submitConfirm($(this))) return false;
		
		$("#noticeFile").attr("type", "text");
		$("#noticeFile").attr("type", "file");
		
		var formData = new FormData($("#noticeForm")[0]);
		
		for (var i = 0; i < noticeFileList.length; i++) {
			formData.append("noticeFile", noticeFileList[i]);
		}
		
		var request = $.ajax({
			method: 'POST',
			url : "/board/noticeModify.do",
			enctype: "multipart/form-data",
			processData: false,
			contentType: false,
			data: formData
		});
		
		request.done(function(data){
			
		   	if(typeof(data) == "object"){
        		valid(data);
        		return false;
        	}
        	
		   	if(typeof(data) == "string"){
			location.href = "${pageContext.request.contextPath}/board/boardDetail.do?notice_idx=" + data;
		   	}
		});
	});
	
	var fileList = new Array();
	
	<c:forEach var="file" items="${boardFile}">
		var file = {};
		file.notice_idx 	= "${file.notice_idx}";
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
			if (file.attach_type.indexOf("notice") > -1) {
				var str = '<li>'+
            	'<input type="hidden" name="save_file_name" value="' + file.save_file_name + '">'+
    			'<span class="file-img"></span>'+
    			'<a href="#this" name="file">' +file.org_file_name+'</a>'+
    			'<span>&nbsp;&nbsp;&nbsp;&nbsp;'+file.file_size+'kb</span>'+
    			'&nbsp;&nbsp;<button type="button" class="input-search-close icon md-close" name="FileDelBtn" ></button>'+
    			'</li>';
				$("#noticeFile-list").append(str);
			} 
		}
	}
	
	$("#noticeFile").change(function() {
		noticeFileChange();
	});
	
	var noticeFileList = new Array();
	
	function noticeFileChange() {
  		var fileValue = $("#noticeFile")[0].files;

	  	// 새로 추가한 파일fileValue이 존재하면
	  	// 기존에 등록했던 파일들fileList과 비교를 하고
	  	// 새로 추가했던 파일들noticeFileList과 비교를 해서 noticeFileList에 push
	  	if (fileValue.length > 0) {
	  		for (var i = 0; i < fileValue.length; i++) {
  				var exist = false;
  				
  				for (var j = 0; j < fileList.length; j++) {
  					if (fileList[j].attach_type === "noticeFile") {
  						if (fileValue[i].name === fileList[j].org_file_name) {
  							console.log("this file is already registed", fileValue[i].name);
  							exist = true;
  							break;
  						}
  					}
  				}
  				
  				for (var k = 0; k < noticeFileList.length; k++) {
  					if (fileValue[i].name === noticeFileList[k].name) {
  						console.log("this file is already exist", fileValue[i].name);
  						exist = true;
  						break;
  					}
  				}
  				
  				if (!exist) {
  					noticeFileList.push(fileValue[i]);
	
  					$("#noticeFileTitle").val( '파일 '+ noticeFileList.length + '개');
  					
  					var str = '<li>'+
			  			'<input type="hidden" name="save_file_name" value="' + fileValue[i].name + '">' +
			  			'<span class="file-img"></span>' +
			  			'<a href="#this" name="file"> (new) ' + fileValue[i].name + '</a>' +
			  			'<span>&nbsp;&nbsp;&nbsp;&nbsp;' + (fileValue[i].size/1024).toFixed(2) + ' kb</span>' +
			  			'&nbsp;&nbsp;<button type="button" class="input-search-close icon md-close" name="newFileDelBtn" onclick="newFileDel(this)"></button>' +
			  			'</li>';
		  			
  					$("#noticeFile-list").append(str);
  				}
  			}
	  	}
  	}
	
	function newFileDel(_this) {
  		var fileName = $(_this).siblings().first().val();
  		
  		for (var i = 0; i < noticeFileList.length; i++) {
  			if (fileName === noticeFileList[i].name) {
  				noticeFileList.splice(i, 1);
  				
  				$(_this).parent().remove();
  				
  				$("#noticeFileTitle").val( '파일 '+ noticeFileList.length + '개');
  			}
  		}
  	}
	
	$("button[name='FileDelBtn']").click(function() {
		var save_file_name = $(this).parent().find("input[name='save_file_name']").val();
		
		if (!confirm("해당 파일이 삭제됩니다. 삭제하시겠습니까?")) return;
		
		var idx = $("#notice_idx").val();

		var request = $.ajax({
			url: "/board/noticeAttachFileDelete.do",
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
						$target.eq(i).parent().remove();
					}
				}
				
				for (var j = 0; j < fileList.length; j++) {
					if (fileList[j].save_file_name === save_file_name) {
						fileList.splice(j, 1);
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
	
	function submitConfirm($type) {
		var type = $type.text();
		var title = $type.data("title");
		var msg = "";
		
		if (title !== undefined) msg += title + "을(를) ";
		msg += type + "하시겠습니까?";
		
		if (!confirm(msg)) return false;
		else return true;
	}
	
	$("button[name='notcieDeleteBtn']").click(function() {
		if (!submitConfirm($(this))) return false;
	});
	
	
</script>


