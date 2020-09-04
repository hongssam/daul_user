<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Page -->

<form:form action='/board/boardInsert.do' method="post" modelAttribute="faqVo" enctype="multipart/form-data">
	<div class="page">
		<div class="page-content container-fluid">
			<h1></h1>

			<div class="example-wrap">
				<h4 class="example-title">질문</h4>
				<form:input type="text" path="question" class="form-control" id="inputPlaceholder" placeholder="" />
				<h4 class="example-title">답변</h4>
				<form:textarea class="form-control" path="answer" id="textareaDefault" rows="10" />
				<h4 class="example-title">File Upload</h4>
				<a href="#this" onclick="addFile()">파일추가</a>
				<div class="form-group" id="file-list">
					<div class="input-group input-group-file" data-plugin="inputGroupFile">
						<input type="file" name="file" path="boardfile" class="form-control" readonly="" />
						<span class="input-group-append"> </span>
						<a href='#this' name='file-delete'>삭제</a>
					</div>
				</div>
			</div>
		</div>
		<button type="submit" class="btn btn-default">작성하기</button>
	</div>

</form:form>

<script type="text/javascript">
	$(document).ready(function() {
		$("a[name='file-delete']").on("click", function(e) {
			e.preventDefault();
			deleteFile($(this));
		});
	})

	function addFile() {
		var str = " <div class='form-group' id='file-list'>"
				+ "<div class='input-group input-group-file' data-plugin='inputGroupFile'>"
				+ "<input type='file' name='file' path='boardfile' class='form-control' readonly=''>"
				+ "<span class='input-group-append'>"
				+ "</span><a href='#this' name='file-delete'>삭제</a> "
				+ "</div>" + "</div>";

		$("#file-list").append(str);
		$("a[name='file-delete']").on("click", function(e) {
			e.preventDefault();
			deleteFile($(this));
		});
	}

	function deleteFile(obj) {
		obj.parent().remove();
	}
</script>





