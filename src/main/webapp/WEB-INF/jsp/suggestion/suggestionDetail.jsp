<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<div class="wizard-item active">
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

<!-- Suggest Detail Section -->
<section class="suggest-detail-section bgc-fa">
	<div class="container">
		<div class="row">
			<div class="col-lg-10 offset-lg-1">
				<div class="ed-content">
					<div class="title">
						<h4>${sgst.title}</h4>
					</div>
					<div class="meta">
						<ul class="fp_meta">
							<li class="list-inline-item float-left">
								<img src="${pageContext.request.contextPath}/images/user.png" alt="user.png">
							</li>
							<li class="list-inline-item">
								<p>${sgst.create_user}</p>
								<p class="date">${sgst.create_date}| 공감 ${sgst.like_count} 건 | 의견 ${sgst.opinion_cnt} 건</p>
							</li>
						</ul>
					</div>
					<hr />
					<div class="content">
						<p>[제안이유]</p>
						<p>${sgst.content}</p>
					</div>
					<div class="files">
						<!-- <a href="#">
							<span class="fa-file-o mr10"></span>
							미리보는 전라북도 2030.pdf
						</a>
						<br>
						<a href="#">
							<span class="fa-file-o mr10"></span>
							미리보는 전라북도 2030.pdf
						</a> -->
					</div>
					<div class="bottom">
						<button type="button" class="btn btn-like heart">
							<c:if test="${sgst.like_flag eq true}">
								<i class="fa-heart mr10"></i>
							</c:if>
							<c:if test="${sgst.like_flag eq false}">
								<i class="fa-heart-o mr10"></i>
							</c:if>
							공감 ${sgst.like_count}
						</button>
					</div>
				</div>
			</div>
			<div class="col-lg-10 offset-lg-1">
				<div class="ed-content-reivew-write mt20 bgc-f1">
					<form class="comments-form" id="opn_form">
						<div class="form-group ">
							<textarea class="form-control" rows="3" name="opinion_content" id="opinion_content" placeholder="의견을 작성해주세요."></textarea>
							<span class="text-left" style="color: red;" id="opinion_content_error"></span>
							<input type="hidden" name="suggestion_idx" value="${sgst.suggestion_idx}" />
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
						<p>총 ${sgst.opinion_cnt}개의 의견이 있습니다.</p>
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

<script src="${pageContext.request.contextPath}/js/opinion.js"></script>
<script src="${pageContext.request.contextPath}/js/pagination-opinion.js"></script>
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

	if (fileList.length > 0) {
		var div_files = document.querySelector("div.files");

		for (var i = 0; i < fileList.length; i++) {
			var file = fileList[i];

			if (file.attach_type.indexOf("rep") > -1) {
			} else if (file.attach_type.indexOf("sgst") > -1) {
				let a = document.createElement("a");
				a.href = "#this";

				var html = '<span class="fa-file-o mr10"></span>' + file.org_file_name
						+ '<input type="hidden" name="save_file_name" value="' + file.save_file_name + '"/>';

				a.innerHTML = html;
				div_files.appendChild(a);

				var br = document.createElement("br");
				div_files.appendChild(br);

				a.addEventListener("click", function() {
					var save_file_name = a.querySelector("input[name='save_file_name']").value;

					location.href = "${pageContext.request.contextPath}/suggestion/downloadFile.do?save_file_name=" + save_file_name;
				});
			}
		}
	}

	var reviews = document.querySelector("div.reviews");

	getSuggestionOpinionList(1);

	function getSuggestionOpinionList(curPage) {
		var request = $.ajax({ url : "/suggestion/suggestionOpinionList.do", method : "get",
			data : { suggestion_idx : "${sgst.suggestion_idx}", curPage : curPage } });

		request.done(function(data) {
			setOpinionList(data.sgstOpnList);
			setPaginationInit(data.pagination);
		});
	}

	function registOpinion(target) {
		if (!confirm("댓글을(를) 등록 하시겠습니까?"))
			return false;

		var form = target.closest("form");

		var request = $.ajax({ url : "/suggestion/suggestionOpinionRegist.do", method : "post", data : $(form).serialize() });

		request.done(function(data) {
			form.querySelector("textarea[name='opinion_content']").value = "";

			document.querySelector("div.top.opn-cnt").firstElementChild.innerText = "총 " + data + "개의 의견이 있습니다.";

			getSuggestionOpinionList(1);
		});

		request.fail(function(error) {
			console.log("request fail", error);
			alert(error.responseText);
		});
	}

	function deleteOpinion(target, opn) {
		if (!submitConfirm($(target)))
			return false;

		var request = $.ajax({ url : "/suggestion/suggestionOpinionDelete.do", method : "post", data : opn });

		request.done(function(data) {
			if (data === "success") {
				getSuggestionOpinionList(1);
			} else {

			}
		});
	}

	var btn_like = document.querySelector("button.btn.btn-like.heart");

	btn_like.addEventListener("click", function(e) {
		if (login_user_id !== "") {
			changeUserLike();
		} else {
			gotoLoginPage();
		}
	});

	function changeUserLike() {
		var type = "";
		var li_heart = btn_like.firstElementChild;

		if (li_heart.classList.contains("fa-heart-o"))
			type = "reg";
		else if (li_heart.classList.contains("fa-heart"))
			type = "del";

		var request = $.ajax({ url : "/suggestion/suggestionUserLikeChange.do", method : "get",
			data : { suggestion_idx : "${sgst.suggestion_idx}", method_type : type } });

		request.done(function(data) {
			var li = "";

			if (type === "reg")
				li = '<i class="fa-heart mr10"></i>';
			else
				li = '<i class="fa-heart-o mr10"></i>';

			btn_like.innerHTML = li + " 공감 " + data;

		});

		request.fail(function(error) {
			console.log("suggestionLike.do fail", error);
		});
	}

	function fn_paging(curPage) {
		getSuggestionOpinionList(curPage);
	}
</script>