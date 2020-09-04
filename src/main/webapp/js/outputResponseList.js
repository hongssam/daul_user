function responseTypeHtml(obj, response_list_id, parentIdx) {
	switch (obj.name) {
		case "text"  :
		case "image" :
		case "card"  :
		case "list"  :
			return `<div class="panel-heading">
		              <h3 class="panel-title">챗봇 응답 - ${obj[obj.name]}</h3>
		              <span class="action-title">전송타입 </span>
		              <div class="action-btns">
		                <div class="sending-type-btns btn-group btn-group-sm panel-action" aria-label="Small button group" role="group">
		                  <input type="hidden" name="cardList[${parentIdx}][trans_type]" value="ran"/>
	                  	  <button type="button" class="btn cbtn-action w-60" id="${response_list_id+'_sending_btn_caro'}">케로셀</button>
		                  <button type="button" class="btn cbtn-action w-60 active" id="${response_list_id+'_sending_btn_ran'}">랜덤형</button>
		                </div>
		              </div>
		            </div>
		            <div class="panel-body response-card-box">
		              <div class="response-card-empty card ignore-elements bg-transparent" >
		                <span class="align-center" aria-hidden="true">
		                  <button type="button" class="btn btn-round cbtn-action btn-addcard" id="${response_list_id+'_add_card_btn'}"
		                          data-placement="right" data-toggle="tooltip" data-original-title="카드 추가">
		                    <i class="icon md-plus font-size-26" aria-hidden="true"></i>
		                  </button>
		                </span>
		              </div>
		            </div>`;
		case "skill"     :
		case "condition" :
			return `<div class="panel-heading">
				      <h3 class="panel-title">챗봇 응답 - ${obj[obj.name]}</h3>
				    </div>
				    <div class="panel-body response-rule-box">
				      <div class="response-card w-p100 mt-0" id="${response_list_id+'_select'}">
				        <div class="card skill-card response-card-body mb-5 w-p100" style="height: 100%">
				          <div class="card-block m-0">
				            <p class="card-title font-weight-400">
				              <i class="icon fa-code-fork font-size-18  mx-5 mb-5" aria-hidden="true"></i> ${obj[obj.name]} 함수
				            </p>
				            <select class="form-control select-response-rule" name="cardList[${parentIdx}][${obj.name}_item_id]"></select>
				          </div>
				        </div>
				      </div>
				    </div>`;
		case "direct" :
			return `<div class="panel-heading">
				      <h3 class="panel-title">챗봇 응답 - 바로연결</h3>
				    </div>
				    <div class="panel-body response-qbtn-box px-15 pt-15 pb-10">
				      <button type="button" class="btn btn-icon btn-round cbtn-action ignore-elements mb-2">
				        <i class="icon md-plus" aria-hidden="true"></i>
				      </button>
				    </div>`;
	}
}

function addResponseListHtml(obj) {
	let parentIdx = globalIdx;
	let childIdx = 0;
	
	var response_list_id = "response_" + parentIdx;
	var response_card_id = "responseCard_" + parentIdx;
	
	var div = document.createElement("div");
	div.classList.add("box", "response");
	div.id = response_list_id;
	
	var typeHtml = responseTypeHtml(obj, response_list_id, parentIdx);
	
	var html = 
		   `<div class="box-aside" style="display:none;">
		   	  <input type="hidden" name="cardList[${parentIdx}][position]" value="${parentIdx}"/>
              <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-move-up">
                <i class="icon md-chevron-up" aria-hidden="true"></i>
              </button>
              <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-move-down">
                <i class="icon md-chevron-down" aria-hidden="true"></i>
              </button>
              <button type="button" class="btn btn-icon btn-sm btn-round cbtn-action btn-box-delete">
                <i class="icon md-delete" aria-hidden="true"></i>
              </button>
            </div>
            <div class="panel box-main">
			  <input type="hidden" name="cardList[${parentIdx}][type]" value="${obj.name}" />
              ${typeHtml}
            </div>`;
	
	div.innerHTML = html;
	// 챗봇응답 리스트 추가
	var response_div = document.getElementById("response-list");
	response_div.appendChild(div);
	
	// 생성된 리스트
	var response_list = document.getElementById(response_list_id);

	// 리스트 mouseover,out 이벤트 추가
	var box_aside = response_list.querySelector(".box-aside");

	response_list.addEventListener("mouseover", function() {
		box_aside.style.display = "";
	});
	
	response_list.addEventListener("mouseout", function() {
		box_aside.style.display = "none";
	});
	
	// 리스트 제거 버튼 이벤트
	var box_aside_del_btn = box_aside.querySelector(".btn-box-delete");
	
	box_aside_del_btn.addEventListener("click", function() {
		response_list.remove();
	});
	
	// 텍스트, 이미지, 카드, 리스트일 경우에만 전송타입, card 추가 버튼 이벤트
	if (obj.name === "text" || obj.name === "image" || obj.name === "card" || obj.name === "list") {
		var add_card_btn = response_list.querySelector("#" +response_list_id + "_add_card_btn");
		
		// 텍스트형, 이미지형, 카드형, 리스트형 리스트 추가시 card 갯수 제한
		var div_response_list = add_card_btn.closest("div.panel-body.response-card-box");
		
		observer.observe(div_response_list, {childList: true});
		
		// 리스트 전송타입 이벤트 추가
		var sending_btn_caro = response_list.querySelector("#" + response_list_id + "_sending_btn_caro");
		var sending_btn_ran = response_list.querySelector("#" + response_list_id + "_sending_btn_ran");
		
		function sendingBtnEvent(e) {
			var exist = e.target.classList.contains("active");
			
			if (!exist) {
				e.target.classList.add("active");
				
				var id_arr = e.target.id.split("_");
				
				//document.querySelector("input[name='trans_type']").value = id_arr[id_arr.length - 1];
				response_list.querySelector("input[type='hidden'][name*='trans_type']").value = id_arr[id_arr.length - 1];
			}
			
			if (e.target.id.indexOf("caro") > -1) 	sending_btn_ran.classList.remove("active");
			else									sending_btn_caro.classList.remove("active");
		}
		
		sending_btn_caro.addEventListener("click", sendingBtnEvent);
		sending_btn_ran.addEventListener("click", sendingBtnEvent);
		
		// 리스트형일 경우 전송타입은 랜덤형만
		if (obj.name === "list") sending_btn_caro.style = "display: none";
		
		// 리스트의 텍스트형,이미지형,카드형,리스트형 추가 버튼 이벤트
		add_card_btn.addEventListener("click", function() {
			addResponseCardHtml(childIdx, response_card_id, response_list, obj, parentIdx);
			
			childIdx++;
			
			// 텍스트형, 이미지형, 카드형, 리스트형 하위 card 추가시 button 또는 list 갯수 제한
			var last_response_card = add_card_btn.parentElement.parentElement.previousSibling;
			var div_btn_list = last_response_card.querySelector("div.card-block.card-block-btns");
			
			
			if (obj.name !== "image") {
				observer.observe(div_btn_list, {childList: true});

				if (obj.name === "list") {
					var ul_sub_list = last_response_card.querySelector("ul.list-group-dividered");
					
					observer.observe(ul_sub_list, {childList: true});
				}
			}
		});
	}
	
	if (obj.name === "direct") {
		// 리스트의 퀵버튼 추가 버튼 이벤트
		btnPopoverEvent(response_card_id, obj, parentIdx, childIdx, response_list_id);
	}
	
	if (obj.name === "skill" || obj.name === "condition") {
		var select = response_list.querySelector("select.select-response-rule");
		
		var resultArr = getSkillConditionList(obj.name);
		var dataArr = [];
		
		for (var i = 0; i < resultArr.length; i++) {
			var obj = {};
			obj.id = resultArr[i]["function"];
			obj.text = resultArr[i].title + " (" + obj.id + ")";
			
			dataArr.push(obj);
		}
		
        $(select).select2({
          dropdownCssClass: "increasedzindexclass",
          data: dataArr
        });
	}
	
	globalIdx++;
}

function addResponseCardHtml(childIdx, response_card_id, response_list, obj, parentIdx) {
	var div = document.createElement("div");
	div.classList.add("response-card");
	div.id = response_card_id + "_" + childIdx;
	
	var typeHtml = cardHtml(obj, parentIdx, childIdx);
	
	var html = 
		`<div class="response-card-actions" style="display:none">
			<input type="hidden" name="cardList[${parentIdx}][card][${childIdx}][position]" value="${childIdx}"/>
            <button type="button" class="btn btn-icon btn-pure m-0 p-5 float-left handle-card">
              <i class="icon md-code-setting font-size-16 mr-0" aria-hidden="true"></i>
            </button>
            <button type="button" class="btn btn-icon btn-pure m-0 p-5 float-right handle-del">
              <i class="icon md-delete font-size-16 mr-0" aria-hidden="true"></i>
            </button>
          </div>
          <div class="card response-card-body mt-30">
            ${typeHtml}
          </div>`;
	
	div.innerHTML = html;
	// 리스트에 추가
	var response_card_after = response_list.querySelector(".panel-body .response-card-empty");
	response_card_after.before(div);
	
	cardMouseAndRemoveEvent(div.id);

	addPopover(obj, div.id, parentIdx, childIdx);
}

// Output HTML
function cardHtml(obj, parentIdx, childIdx) {
	switch (obj.name) {
		case "text"  :
			return `<div class="card-block card-block-evt card-block-text">
	           	      <p class="card-text">내용을 입력하세요.</p>
	           	      <input type="hidden" name="cardList[${parentIdx}][card][${childIdx}][content]"/>
			        </div>
			        <div class="card-block card-block-btns">
			          <button type="button" class="btn btn-block card-btn-action">+ 버튼 추가</button>
			        </div>`;
		case "image" :
			return `
				<img class="card-img-top img-fluid card-block-evt card-block-img" src="../images/placeholder.png" alt="Card image cap" />
				<input type="file" style="display: none" class="card-img" name="${obj.name}"/>
				<input type="hidden" name="cardList[${parentIdx}][card][${childIdx}][img_attach_id]" value=""/>`;
		case "card"  :
			return `<img class="card-img-top img-fluid card-block-evt card-block-img" src="../images/placeholder.png" alt="Card image cap" />
					<input type="file" style="display: none" class="card-img" name="${obj.name}"/>
					<input type="hidden" name="cardList[${parentIdx}][card][${childIdx}][img_attach_id]" value=""/>
                    <div class="card-block card-block-evt card-block-title-text">
                      <h5 class="card-title">타이틀을 입력하세요.</h5>
                      <input type="hidden" name="cardList[${parentIdx}][card][${childIdx}][title]"/>
                      <p class="card-text">내용을 입력하세요.</p>
                      <input type="hidden" name="cardList[${parentIdx}][card][${childIdx}][content]"/>
                    </div>
                    <div class="card-block card-block-btns">
                      <button type="button" class="btn btn-block card-btn-action ignore-elements">+ 버튼 추가</button>
                    </div>`;
		case "list"  :
			return `<div class="card-header card-header-transparent card-header-bordered card-block-list-title card-block-evt">
			          <h5 class="card-title text-center">타이틀을 입력하세요.</h5>
			          <input type="hidden" name="cardList[${parentIdx}][card][${childIdx}][title]"/>
				    </div>
				    <div class="card-block card-block-list">
				      <ul class="list-group list-group-full list-group-dividered">
				        <li class="list-group-item">
				          <button type="button" class="btn btn-block btn-pure w-p100 h-p100">+ 목록 추가</button>
				        </li>
				      </ul>
				    </div>
				    <div class="card-block card-block-btns">
				      <button type="button" class="btn btn-block card-btn-action ignore-elements">+ 버튼 추가</button>
				    </div>`;
	}
}

//response card의 mouseover,out 이벤트, 제거 버튼 이벤트 추가
function cardMouseAndRemoveEvent(id) {
	var response_card = document.getElementById(id);
	var response_card_header = response_card.querySelector(".response-card-actions");
	
	response_card.addEventListener("mouseover", function() {
		response_card_header.style.display = "";
	});
	
	response_card.addEventListener("mouseout", function() {
		response_card_header.style.display = "none";
	});
	
	var response_card_header_del_btn = response_card.querySelector(".response-card-actions .handle-del");
	
	response_card_header_del_btn.addEventListener("click", function() {
		response_card.remove();
	});
}

// 텍스트형 내용입력 popover
function addPopover(obj, response_card_id, parentIdx, childIdx) {
	var response_card = document.getElementById(response_card_id);
	
	switch (obj.name) {
		case "text":
			// 내용 popover 이벤트
			contentPopoverEvent(response_card_id);
			// 버튼, popover 이벤트
			btnPopoverEvent(response_card_id, obj, parentIdx, childIdx);
			
			break;
		case "image":
			// 이미지 popover 이벤트
			imgPopoverEvent(response_card_id);
			
			break;
		case "card":
			// 이미지 popover 이벤트
			imgPopoverEvent(response_card_id);
			// 버튼, popover 이벤트
			btnPopoverEvent(response_card_id, obj, parentIdx, childIdx);
			// 타이틀 내용 popover 이벤트
			titleContentPopoverEvent(response_card_id);
			
			break;
		case "list":
			// 타이틀 popover 이벤트
			titlePopoverEvent(response_card_id);
			// 목록 추가 버튼
			listBtnPopoverEvent(response_card_id, parentIdx, childIdx);
			// 버튼, popover 이벤트
			btnPopoverEvent(response_card_id, obj, parentIdx, childIdx);
			
			break;
	}
}

function btnPopoverEvent(response_card_id, obj, parentIdx, childIdx, response_list_id) {
	var btnIdx = 0;
	
	var add_btn;
	
	if (obj.name === "text" || obj.name === "card" || obj.name === "list") {
		add_btn = document.getElementById(response_card_id).querySelector("button.btn.btn-block.card-btn-action");
	} else if (obj.name === "direct" && response_list_id !== undefined) {
		add_btn = document.getElementById(response_list_id).querySelector("button.ignore-elements");
	}
	
	add_btn.addEventListener("click", function() {
		var html;
		
		var button = document.createElement("button");
		
		if (obj.name === "text" || obj.name === "card" || obj.name === "list") {
			button.id = response_card_id + "_btn_" + btnIdx;
			button.classList.add("btn", "btn-block", "card-btn", "response-card-btn");
			
			html = `
				<input type="hidden" name="cardList[${parentIdx}][card][${childIdx}][button][${btnIdx}][position]" value="${btnIdx}"/>
				<i class="icon fa-sort handle-card-btn position-absolute" style="left:10px" aria-hidden="true"></i>
				<input type="hidden" name="cardList[${parentIdx}][card][${childIdx}][button][${btnIdx}][name]"/>
				<input type="hidden" name="cardList[${parentIdx}][card][${childIdx}][button][${btnIdx}][function1]" value="intent"/>
				<input type="hidden" name="cardList[${parentIdx}][card][${childIdx}][button][${btnIdx}][function2]" value=""/>
				<div class="btn-name">Default</div>`;
		} else if (obj.name === "direct") {
			button.id = `${response_card_id}_${btnIdx}_btn_${childIdx}`;
			button.classList.add("btn", "btn-round", "quick-btn", "mr-2", "mb-2", "pr-20");
			
			html = 
				`<div class="btn-group" style="display:none">
					<input type="hidden" name="cardList[${parentIdx}][card][${btnIdx}][button][${childIdx}][position]" value="${btnIdx}"/>
					<span class="btn btn-round btn-sm btn-icon quick-btn-action handle-qbtn bg-grey-50">
                    	<i class="icon md-code-setting" aria-hidden="true"></i>
                    </span>
				 </div>
				 <input type="hidden" name="cardList[${parentIdx}][card][${btnIdx}][button][${childIdx}][name]"/>
				 <input type="hidden" name="cardList[${parentIdx}][card][${btnIdx}][button][${childIdx}][function1]" value="intent"/>
				 <input type="hidden" name="cardList[${parentIdx}][card][${btnIdx}][button][${childIdx}][function2]" value=""/>
				 <div class="btn-name">Default</div>`;
		}
		
		button.innerHTML = html;
		
		this.before(button);
		
		$(button).webuiPopover($.extend({
			onShow: function($element) {
				var popover_id = $element[0].id;
				var div_select_intent = $("#" + popover_id + " .div-select-intent");
				var div_input_url = $("#" + popover_id + " .div-input-url");
				var select_btn_type = $("#" + popover_id + " .select-btn-type");
				var select_intent = $("#" + popover_id + " .select-intent");
				var input_url = $("#" + popover_id + " input.input-url");
				
				var input_function1_val = $(button).find("input[name*='function1']").val();
				var input_function2_val = $(button).find("input[name*='function2']").val();
				
				getIntentListInBtn(select_intent);
				
				if (obj.name !== "direct") {
					if (input_function1_val) {
						select_btn_type.val(input_function1_val);
						
						if (input_function1_val === "intent") {
							select_intent.val(input_function2_val);
							div_select_intent.show();
							div_input_url.hide();
						} else if (input_function1_val === "url") {
							div_select_intent.hide();
							input_url.val(input_function2_val);
							div_input_url.show();
						}
					} else {
						div_select_intent.show();
						div_input_url.hide();
					}
				} else {
					div_input_url.hide();
					select_btn_type.find("option[value='url']").hide();
					
					select_intent.val(input_function2_val);
				}
				
				select_btn_type.on("change", function(e) {
					var val = $(this).val();
					
					if (val === "intent") {
						div_select_intent.show();
						div_input_url.hide();
						input_url.val("");
					} else if (val === "url") {
						div_select_intent.hide();
						select_intent.val("");
						div_input_url.show();
					}
				});
				
				var input_btn_name = $("#" + popover_id + " .form-control.input-btn-name");
				var input_hidden_name = $(button).find("input[name*='name']").val();
				
				input_btn_name.val(input_hidden_name);
			}
		}, defaults, popEditBtnSettings));
		
		$(button).one("click", function() {
			var $this = $(this);
			var popover_id = $this.data("target");
			
			var save_btn = document.getElementById(popover_id).querySelector("button.btn-save");
			var cancel_btn = document.getElementById(popover_id).querySelector("button.btn-cancel");
			var input = document.getElementById(popover_id).querySelector("input.form-control.input-btn-name");
			var select = document.getElementById(popover_id).querySelector("select.select-btn-type");
			var select_intent = document.getElementById(popover_id).querySelector("select.select-intent");
			var input_url = document.getElementById(popover_id).querySelector("input.input-url");
			
			save_btn.addEventListener("click", function() {
				if (input.value)	$this.find(".btn-name").text(input.value);
				else				$this.find(".btn-name").text("Default");
				$this.find("input[name*='name']").val(input.value);
				$this.find("input[name*='function1']").val(select.value);
				
				if (select.value === "intent") {
					$this.find("input[name*='function2']").val(select_intent.value);
				} else if (select.value === "url") {
					$this.find("input[name*='function2']").val(input_url.value);
				}
				
				WebuiPopovers.hide($(button));
			});
			
			cancel_btn.addEventListener("click", function() {
				input.value = $this.find(".btn-name").text();
				WebuiPopovers.hide($(button));
			});
			
			var del_btn = document.getElementById(popover_id).querySelector("i.md-delete");
			
			del_btn.addEventListener("click", function() {
				WebuiPopovers.hide($(button));
				$this.remove();
			});
		});
		
		if (obj.name === "direct") {
			$(button).on("mouseover", function() {
				$(this).find(".btn-group").show();
			});
			
			$(button).on("mouseout", function() {
				$(this).find(".btn-group").hide();
			});
		}
		
		btnIdx++;
	});
}

function imgPopoverEvent(response_card_id) {
	var popover_target = $("#" + response_card_id + " .card-block-img");
	popover_target.webuiPopover($.extend({}, defaults, popEditImgSettings));
	
	popover_target.one("click", function() {
		var popover_id = $(this).data("target");
		
		var close_btn = document.getElementById(popover_id).querySelector("button.btn-close");
		var inputFile = document.getElementById(popover_id).querySelector(".form-control");
		
		close_btn.addEventListener("click", function() {
			WebuiPopovers.hide(popover_target);
		});
		
		inputFile.addEventListener("change", function() {
			var file = inputFile.files[0];
			
			if (file) {
				var reader = new FileReader();
				
				reader.onload = function(e) {
					popover_target.attr("src", e.target.result).width(popover_target.width()).height(popover_target.height());
					popover_target.next()[0].files = inputFile.files;
					registImgFile(popover_target);
				}
				
				reader.readAsDataURL(file);
				
			} else {
				popover_target.attr("src", "../images/placeholder.png").width(popover_target.width()).height(popover_target.height());
				popover_target.next().attr("type", "text");
				popover_target.next().attr("type", "file");
			}
			
			WebuiPopovers.hide(popover_target);
		});
	});	
}

function contentPopoverEvent(response_card_id) {
	var response_card = document.getElementById(response_card_id);
	
	var popover_target = $("#" + response_card_id + " .card-block-text");
	popover_target.webuiPopover($.extend({
		onShow: function($element) {
			var popover_id = $element[0].id;
			var textarea = $("#" + popover_id + " textarea");
			var input_hidden_content = popover_target.find("input[name*='content']");
			
			textarea.val(input_hidden_content.val());
		}
	}, defaults, popEditTextSettings));
	
	popover_target.one("click", function() {
		var popover_id = $(this).data("target");
		
		var save_btn = document.getElementById(popover_id).querySelector("button.btn-save");
		var cancel_btn = document.getElementById(popover_id).querySelector("button.btn-cancel");
		var textarea = document.getElementById(popover_id).querySelector("textarea.form-control");

		save_btn.addEventListener("click", function() {
			if (textarea.value)	response_card.querySelector("p.card-text").innerHTML = textarea.value;
			else				response_card.querySelector("p.card-text").innerHTML = "내용을 입력하세요.";
			response_card.querySelector("input[name*='content']").value = textarea.value;
			
			WebuiPopovers.hide(popover_target);
		});
		
		cancel_btn.addEventListener("click", function() {
			textarea.value = response_card.querySelector("input[name*='content']").value;
			WebuiPopovers.hide(popover_target);
		});
	});
}

function titleContentPopoverEvent(response_card_id) {
	var response_card = document.getElementById(response_card_id);
	
	var popover_target = $("#" + response_card_id + " .card-block-title-text");
	popover_target.webuiPopover($.extend({
		onShow: function($element) {
			var popover_id = $element[0].id;
			var input_title = $("#" + popover_id + " input");
			var textarea = $("#" + popover_id + " textarea");
			var input_hidden_title = popover_target.find("input[name*='title']");
			var input_hidden_content = popover_target.find("input[name*='content']");
			
			input_title.val(input_hidden_title.val());
			textarea.val(input_hidden_content.val());
		}
	}, defaults, popEditTitleTextSettings));
	
	popover_target.one("click", function() {
		var popover_id = $(this).data("target");

		var save_btn = document.getElementById(popover_id).querySelector("button.btn-save");
		var cancel_btn = document.getElementById(popover_id).querySelector("button.btn-cancel");
		var input = document.getElementById(popover_id).querySelector("input.form-control");
		var textarea = document.getElementById(popover_id).querySelector("textarea.form-control");
		
		save_btn.addEventListener("click", function() {
			response_card.querySelector("input[name*='title']").value = input.value;
			if (input.value)	response_card.querySelector("h5.card-title").innerHTML = input.value;
			else				response_card.querySelector("h5.card-title").innerHTML = "타이틀을 입력하세요.";
			
			response_card.querySelector("input[name*='content']").value = textarea.value;
			if (textarea.value)	response_card.querySelector("p.card-text").innerHTML = textarea.value;
			else				response_card.querySelector("p.card-text").innerHTML = "내용을 입력하세요.";
			
			WebuiPopovers.hide(popover_target);
		});
		
		cancel_btn.addEventListener("click", function() {
			input.value = response_card.querySelector("input[name*='title']").value;
			textarea.value = response_card.querySelector("input[name*='content']").value; 
			
			WebuiPopovers.hide(popover_target);
		});
	});
}

function titlePopoverEvent(response_card_id) {
	var response_card = document.getElementById(response_card_id);
	
	var popover_target = $("#" + response_card_id + " .card-block-list-title");
	popover_target.webuiPopover($.extend({
		onShow: function($element) {
			var popover_id = $element[0].id;
			var input_title = $("#" + popover_id + " input");
			var input_hidden_title = popover_target.find("input[name*='title']");
			
			input_title.val(input_hidden_title.val());
		}
	}, defaults, popEditListTitleSettings));
	
	popover_target.one("click", function() {
		var popover_id = $(this).data("target");
		
		var save_btn = document.getElementById(popover_id).querySelector("button.btn-save");
		var cancel_btn = document.getElementById(popover_id).querySelector("button.btn-cancel");
		var input = document.getElementById(popover_id).querySelector("input.form-control");
		
		save_btn.addEventListener("click", function() {
			response_card.querySelector("input[name*='title']").value = input.value;
			if (input.value)	response_card.querySelector("h5.card-title").innerHTML = input.value;
			else 				response_card.querySelector("h5.card-title").innerHTML = "타이틀을 입력하세요.";
			
			WebuiPopovers.hide(popover_target);
		});
		
		cancel_btn.addEventListener("click", function() {
			input.value = response_card.querySelector("input[name*='title']").value; 
			
			WebuiPopovers.hide(popover_target);
		});
	});
}

function listBtnPopoverEvent(response_card_id, parentIdx, childIdx) {
	var listBtnIdx = 0;
	
	var response_card = document.getElementById(response_card_id);
	
	var list_add_btn = response_card.querySelector("button.btn.btn-block.btn-pure");
	
	list_add_btn.addEventListener("click", function() {
		var li = document.createElement("li");
		li.classList.add("list-group-item", "card-block-list-item", "card-block-evt");
		li.id = response_card_id + "_list_btn_" + listBtnIdx;
		
		var html = 
			`<div class="media">
               <div class="media-body">
                 <p class="title">타이틀을 입력하세요.</p>
                 <input type="hidden" name="cardList[${parentIdx}][card][${childIdx}][list][${listBtnIdx}][title]"/>
                 <p class="content text-truncate">내용을 입력하세요.</p>
                 <input type="hidden" name="cardList[${parentIdx}][card][${childIdx}][list][${listBtnIdx}][content]"/>
               </div>
               <div class="pl-20">
                 <a href="javascript:void(0)">
                   <img class="image w-50 h-50" src="../images/placeholder.png" alt="...">
                   <input type="file" style="display: none" class="card-img" name="list"/>
                   <input type="hidden" name="cardList[${parentIdx}][card][${childIdx}][list][${listBtnIdx}][img_attach_id]" value=""/>
                 </a>
               </div>
             </div>`;
		
		li.innerHTML = html;
		
		this.parentElement.before(li);
		
		$(li).webuiPopover($.extend({
			onShow: function($element) {
				var popover_id = $element[0].id;
				var input_title = $("#" + popover_id + " input.title");
				var input_content = $("#" + popover_id + " input.content");
				var input_hidden_title = $(li).find("input[name*='title']");
				var input_hidden_content = $(li).find("input[name*='content']");
				
				input_title.val(input_hidden_title.val());
				input_content.val(input_hidden_content.val());
			}
		}, defaults, popoverListItemSettings));
		
		$(li).one("click", function() {
			var $this = $(this);
			var popover_id = $this.data("target");
			
			var save_btn = document.getElementById(popover_id).querySelector("button.btn-save");
			var cancel_btn = document.getElementById(popover_id).querySelector("button.btn-cancel");
			var title = document.getElementById(popover_id).querySelector("input.form-control.title");
			var content = document.getElementById(popover_id).querySelector("input.form-control.content");
			var image = document.getElementById(popover_id).querySelector("input.form-control.image");
			
			save_btn.addEventListener("click", function() {
				$this.find("input[name*='title']").val(title.value);
				if (title.value)	$this.find("p.title").text(title.value);
				else				$this.find("p.title").text("타이틀을 입력하세요.");
				
				$this.find("input[name*='content']").val(content.value);
				if (content.value)	$this.find("p.content").text(content.value);
				else				$this.find("p.content").text("내용을 입력하세요.");
				
				WebuiPopovers.hide($(li));
			});
			
			cancel_btn.addEventListener("click", function() {
				title.value = $this.find("input[name='listTitle']").val();
				content.value = $this.find("input[name='listContent']").val();
				
				WebuiPopovers.hide($(li));
			});
			
			image.addEventListener("change", function() {
				var file = image.files[0];
				var img = $this.find("img.image");
				
				if (file) {
					var reader = new FileReader();
					
					reader.onload = function(e) {
						img.attr("src", e.target.result).width(img.width()).height(img.height());
						img.next()[0].files = image.files;
						registImgFile(img);
					}
					
					reader.readAsDataURL(file);
				} else {
					img.attr("src", "../images/placeholder.png").width(img.width()).height(img.height());
					popover_target.next().attr("type", "text");
					popover_target.next().attr("type", "file");
				}
			});
			
			var del_btn = document.getElementById(popover_id).querySelector("i.md-delete");
			
			del_btn.addEventListener("click", function() {
				WebuiPopovers.hide($this);
				$this.remove();
			});
		});
		
		listBtnIdx++;
	});
}