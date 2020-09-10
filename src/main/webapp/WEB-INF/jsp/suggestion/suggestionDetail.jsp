<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Subpage Nav Tabs -->
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first">
				<a href="/suggestion/suggestionRegistPage.do">제안하기</a>
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
								<p class="date">${sgst.create_date} | 공감 ${sgst.like_count} 건 | 의견 ${sgst.opinion_cnt} 건</p>
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
							<c:if test="${sgst.like_flag eq true}"><i class="fa-heart mr10"></i></c:if>
							<c:if test="${sgst.like_flag eq false}"><i class="fa-heart-o mr10"></i></c:if>
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
							<span class="text-left" style="color:red;" id="opinion_content_error"></span>
							<input type="hidden" name="suggestion_idx" value="${sgst.suggestion_idx}"/>
							<input type="hidden" name="opinion_idx" value=""/>
						</div>
						<div class="form-group text-right ">
							<button type="button" class="btn btn-primary" id="opn_reg_btn">등록</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-10 offset-lg-1">
				<div class="ed-content-reivew">
					<div class="top">
						<p>총 ${sgst.opinion_cnt}개의 의견이 있습니다.</p>
						<hr>
					</div>
					<div class="reviews">
					</div>
					<ul class="page-navigation mt20">
						<li class="page-item disabled">
							<a class="page-link" href="#">
								<span class="fa-angle-double-left"></span>
							</a>
						</li>
						<li class="page-item disabled">
							<a class="page-link" href="#">
								<span class="fa-angle-left"></span>
							</a>
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
							<a class="page-link" href="#">
								<span class="fa-angle-right"></span>
							</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">
								<span class="fa-angle-double-right"></span>
							</a>
						</li>
					</ul>
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
		file.org_file_name 	= "${file.org_file_name}";
		file.save_file_name = "${file.save_file_name}";
		file.file_size 		= "${file.file_size}";
		file.create_user 	= "${file.create_user}";
		file.del_chk 		= "${file.del_chk}";
		file.attach_type 	= "${file.attach_type}";
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
				
				var html = 
					'<span class="fa-file-o mr10"></span>' + file.org_file_name +
					'<input type="hidden" name="save_file_name" value="' + file.save_file_name + '"/>';
				
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
	
	getSuggestionOpinionList();
	
	var opn_reg_btn = document.getElementById("opn_reg_btn");
	
	opn_reg_btn.addEventListener("click", function() {
		if (login_user_id === "") {
			gotoLoginPage();
		} else {
			registSuggestionOpinion(opn_reg_btn);
		}
	});
	
	var opinion_content = document.getElementById("opinion_content");
	
	opinion_content.addEventListener("click", function() {
		if (login_user_id === "") {
			gotoLoginPage();
		}
	});
	
	function gotoLoginPage() {
		if (!confirm("로그인이 필요한 기능입니다.\n로그인 페이지로 이동하시겠습니까?")) return false;
		
		location.href="${pageContext.request.contextPath}/login/loginPage.do";
	}
	
	function getSuggestionOpinionList() {
		var request = $.ajax({
			url: "/suggestion/suggestionOpinionList.do",
			method: "get",
			data: {suggestion_idx: "${sgst.suggestion_idx}"}
		});
		
		request.done(function(data) {
			var parent_opn = [];
			var child_opn = [];
			
			for (var i = 0; i < data.length; i++) {
				if (data[i].suggestion_ref === data[i].opinion_idx) {
					parent_opn.push(data[i]);
				} else {
					child_opn.push(data[i]);
				}
			}
			
			while (reviews.hasChildNodes()) {
				reviews.removeChild(reviews.childNodes[0]);
			}
			
			for (var i = 0; i < parent_opn.length; i++) {
				let opn = parent_opn[i];
				
				var div = createOpinionElement("parent", opn);				
				
				reviews.append(div);
				
				if (login_user_id !== "") {
					var div_top = document.getElementById(opn.opinion_idx);

					// 의견등록 버튼 이벤트
					let btn_sub_opn_reg = div_top.querySelector("button.btn-sub-opn-add");
					btn_sub_opn_reg.addEventListener("click", function() {
						addSubOpinionElement(btn_sub_opn_reg, opn);
					});
					
					// 삭제 버튼 이벤트
					if (login_user_id === opn.create_user) {
						let btn_opn_del = div_top.querySelector("button.btn-opn-del");
						btn_opn_del.addEventListener("click", function() {
							deleteSuggestionOpinion(btn_opn_del, opn);
						});
					}
				}
			}
			
			for (var j = 0; j < child_opn.length; j++) {
				let opn = child_opn[j];
				
				var div = createOpinionElement("child", opn);
				
				document.getElementById(opn.suggestion_ref).after(div);
				
				if (login_user_id !== "" && login_user_id === opn.create_user) {
					var div_top = document.getElementById(opn.opinion_idx);
					
					let btn_sub_opn_del = div_top.querySelector("button.btn-sub-opn-del");
					btn_sub_opn_del.addEventListener("click", function() {
						deleteSuggestionOpinion(btn_sub_opn_del, opn);
					});
				}
			}
		});
	}
	
	function createOpinionElement(type, data) {
		var opinion_content = data.opinion_content;
		if (data.del_chk === "Y") opinion_content = "삭제된 댓글입니다.";
		
		var div = document.createElement("div");
		div.classList.add("item");
		if (type === "child") div.classList.add("reply");
		div.id = data.opinion_idx;
		
		var html = 
			'<div class="meta">' +
				'<ul class="fp_meta">' +
					'<li class="list-inline-item float-left">' +
						'<img src="${pageContext.request.contextPath}/images/user.png" alt="user.png">' +
					'</li>' +
					'<li class="list-inline-item">' +
						'<p>' + data.create_user + '</p>' +
						'<p class="date">' + data.create_date + '</p>' +
					'</li>' +
				'</ul>' +
			'</div>' +
			'<div class="content">' +
				'<p>' + opinion_content + '</p>' +
			'</div>';
		div.innerHTML = html;
		
		if (login_user_id !== "") {
			if (type === "parent") {
				var div_bottom = document.createElement("div");
				div_bottom.classList.add("bottom");
				
				var html_button = "";
				
				if (login_user_id === data.create_user) {
					html_button = 
						'<button type="button" class="btn btn-like btn-opn-del" data-title="댓글">삭제 </button>' +
						'<button type="button" class="btn btn-like btn-sub-opn-add">의견등록 </button>';
				} else {
					html_button = '<button type="button" class="btn btn-like btn-sub-opn-add">의견등록 </button>'; 
				}

				div_bottom.innerHTML = html_button;
				
				div.querySelector("div.content").after(div_bottom);
			} else {
				if (login_user_id === data.create_user) {
					var li = document.createElement("li");
					li.classList.add("list-inline-item", "float-right");
					
					var html_button =
						'<button type="button" class="btn btn-like btn-sub-opn-del" data-title="댓글">삭제 </button>';
					
					li.innerHTML = html_button;
						
					div.querySelector("ul.fp_meta").appendChild(li);
				}
			}
		}
		
		return div;
	}
	
	function addSubOpinionElement(target, data) {
		var div_regist = reviews.querySelector("div.item.reply.regist");
		var input_sgst_ref = "";
		
		if (div_regist) {
			var input_sgst_ref = div_regist.querySelector("input[name='opinion_idx']").value;
			
			div_regist.remove();
		}
		
		if (input_sgst_ref !== data.opinion_idx) {
			var div = document.createElement("div");
			div.classList.add("item", "reply", "regist");
			
			var html = 
				'<div class="reply-write">' +
					'<form id="sub_opn_form">' +
						'<div class="form-group">' +
							'<textarea class="form-control" rows="2" name="opinion_content" placeholder="의견을 작성해주세요."></textarea>' +
							'<input type="hidden" name="suggestion_idx" value="${sgst.suggestion_idx}"/>' +
							'<input type="hidden" name="opinion_idx" value="' + data.opinion_idx + '"/>' +
						'</div>' +
						'<div class="form-group text-right">' +
							'<button type="button" class="btn btn-primary" id="sub_opn_reg_btn">등록</button>' +
						'</div>' +
					'</form>' +
				'</div>';
				
			div.innerHTML = html;
			
			target.closest("div.item").after(div);
			
			var sub_opn_reg_btn = document.getElementById("sub_opn_reg_btn");
			
			sub_opn_reg_btn.addEventListener("click", function() {
				registSuggestionOpinion(sub_opn_reg_btn);
			});
		}
	}
	
	function registSuggestionOpinion(target) {
		if (!confirm("댓글을(를) 등록 하시겠습니까?")) return false;
		
		var form = target.closest("form");
		
		var request = $.ajax({
			url: "/suggestion/suggestionOpinionRegist.do",
			method: "post",
			data: $(form).serialize()
		});
		
		request.done(function(data) {
			if (data === "success"){
				form.querySelector("textarea[name='opinion_content']").value = "";
				getSuggestionOpinionList();
			} else {
				//$("#chk-error-regist").text(data);
			}
		
		});
		
		request.fail(function(error) {
			console.log("request fail", error)
		});
	}
	
	function deleteSuggestionOpinion(target, opn) {
		if (!submitConfirm($(target))) return false;
		
		var request = $.ajax({
			url: "/suggestion/suggestionOpinionDelete.do",
			method: "post",
			data: opn
		});
		
		request.done(function(data) {
			if (data === "success") {
				getSuggestionOpinionList();
			} else {
				
			}
		});
	}

	var btn_like = document.querySelector("button.btn.btn-like.heart");
	
	btn_like.addEventListener("click", function(e) {
		if (login_user_id !== "") {
			changeUserLike();
		} else {
			if (!confirm("로그인이 필요한 기능입니다.\n로그인 페이지로 이동하시겠습니까?")) return false;
		}
	});
	
	function changeUserLike() {
		var type = "";
		var li_heart = btn_like.firstElementChild;
		
		if (li_heart.classList.contains("fa-heart-o"))		type = "reg";
		else if (li_heart.classList.contains("fa-heart"))	type = "del";
		
		var request = $.ajax({
			url: "/suggestion/suggestionUserLikeChange.do",
			method: "get",
			data: {
				suggestion_idx: "${sgst.suggestion_idx}",
				method_type: type
			}
		});
		
		request.done(function(data) {
			var li = "";
			
			if (type === "reg")	li = '<i class="fa-heart mr10"></i>';
			else				li = '<i class="fa-heart-o mr10"></i>';
			
			btn_like.innerHTML = li + " 공감 " + data;
			
		});
		
		request.fail(function(error) {
			console.log("suggestionLike.do fail", error);
		});
	}
</script>