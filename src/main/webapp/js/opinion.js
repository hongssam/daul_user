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
					'<img src="../images/user.png" alt="user.png">' +
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
	
	var opinion_idx = data.opinion_idx;
	var idx, name_idx;
	
	if (div_regist) {
		input_sgst_ref = div_regist.querySelector("input[name='opinion_idx']").value;
		
		div_regist.remove();
	}
	
	if (input_sgst_ref !== opinion_idx) {
		if (opinion_idx.indexOf("SG") > -1) {
			idx = data.suggestion_idx;
			name_idx = "suggestion_idx";
		} else if (opinion_idx.indexOf("SV") > -1) {
			idx = data.survey_idx;
			name_idx = "survey_idx";
		}
		
		var div = document.createElement("div");
		div.classList.add("item", "reply", "regist");
		
		var html = 
			'<div class="reply-write">' +
				'<form id="sub_opn_form">' +
					'<div class="form-group">' +
						'<textarea class="form-control" rows="2" name="opinion_content" placeholder="의견을 작성해주세요."></textarea>' +
						'<input type="hidden" name="' + name_idx + '" value="' + idx + '"/>' +
						'<input type="hidden" name="opinion_idx" value="' + opinion_idx + '"/>' +
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
			registOpinion(sub_opn_reg_btn);
		});
	}
}

var opinion_content = document.getElementById("opinion_content");

opinion_content.addEventListener("click", function() {
	if (login_user_id === "") {
		gotoLoginPage();
	}
});

var opn_reg_btn = document.getElementById("opn_reg_btn");

opn_reg_btn.addEventListener("click", function() {
	if (login_user_id === "") {
		gotoLoginPage();
	} else {
		registOpinion(opn_reg_btn);
	}
});