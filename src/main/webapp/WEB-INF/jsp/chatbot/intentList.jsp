<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<script type="text/javascript" src="${pageContext.request.contextPath}/js/intentInput.js"></script>

  
<div class="page">
	<!-- Sidebar -->
	<div class="page-aside">
		<div class="page-aside-switch">
			<i class="icon md-chevron-left" aria-hidden="true"></i> 
			<i class="icon md-chevron-right" aria-hidden="true"></i>
		</div>
		<div class="page-aside-inner">
			<!-- 			
			<div class="scenario-add-btn">
				<input type="button" class="form-control" id="tree-open-btn" style="cursor:pointer; color:blue" value="모두열기"/>
				<input type="button" class="form-control" id="tree-close-btn" style="cursor:pointer; color:blue" value="모두닫기"/>
			</div> 
			 -->
		
			<div class="input-search">
				<form class="form-group m-0" role="search">
					<div class="input-search">
						<input type="search" class="form-control" id="jstreeSearch" placeholder="Search ...">
						<button class="input-search-btn">
							<i class="icon md-search" aria-hidden="true"></i>
						</button>
					</div>
				</form>
			</div>

			<div class="dialog-list page-aside-scroll">
				<div data-role="container">
					<div data-role="content">
						<div id="jstree" class="dialog-list-jstree"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="page-main" style="overflow-y: scroll;">
        <div class="page-content" >

          <!-- Content -->
          <div class="panel panel-bordered intent" id="intent">
            <!-- Header -->
            <div class="panel-heading">
              <h3 id="intentTitle" class="intent-title panel-title" onclick="showDivIntentTitleInput('')">
                #<span class="title" id="title"></span>
              </h3>
              <div id="intentTitleInput"
                   class="intent-title-input panel-title form-group form-material w-500 pb-10 pt-5"
                   data-plugin="formMaterial" style="display: none;">
                <input type="text" name="title" placeholder="Please input intent title!"
                       class="form-control form-control-lg enter-focusout"
                       value="New Intent"
                       onchange="renameIntent('')"
                       onblur="hideDivIntentTitleInput('')"/>
              </div>
              <div class="panel-actions panel-actions-keep">
                <button type="button" class="btn btn-primary" id="chatbot-regist-btn" data-title="발화및응답">
                  <i class="icon fa-save" aria-hidden="true"></i>저장 </button>
                <button type="button" class="btn btn-default" id="chatbot-delete-btn" data-title="발화및응답">
                  <i class="icon fa-trash-o" aria-hidden="true"></i>삭제 </button>
              </div>
            </div>

            <!-- Body -->
            <div class="panel-body">

              <!-- Input Groups -->
              <!-- -------------------------------------------------------------------------------------- -->

              <!-- Input - Title -->
              <div class="">
                <div class="media">
                  <div class="pr-10">
                    <a class="avatar" href="javascript:void(0)">
                      <img src="${pageContext.request.contextPath}/images/user.png" alt="...">
                    </a>
                  </div>
                  <div class="media-body">
                    <h4 class="mt-5 mb-5">사용자 발화</h4>
                  </div>
                </div>
              </div>
              <!-- End Input - Title -->
			  <form id="input-text-form">
			  	<input type="hidden" id="intent-id" name="intent_id"/>
			    
	            <!-- Input Box - Input Sentences -->
	            <div class="box input">
	              <div class="panel box-main">
	                <div class="panel-heading">
	                  <h3 class="panel-title">사용자 발화 - 문장형</h3>
	                </div>
	                <div class="panel-body input-box p-15">
	                  <div class="form-group w-p100">
	                    <div class="input-group" id="tokenfield-div">
	                    
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
			  </form>
	              <!-- End Input Box - Input Sentences -->
			  
	              <!-- End Input Groups -->
	
	
	              <!-- Output Groups -->
	              <!-- -------------------------------------------------------------------------------------- -->
	              <!-- Output - Title -->
	              <div class="mt-50">
	                <div class="media">
	                  <div class="pr-10">
	                    <a class="avatar " href="javascript:void(0)">
	                      <img src="${pageContext.request.contextPath}/images/chatbot.png" alt="...">
	                    </a>
	                  </div>
	                  <div class="media-body">
	                    <h4 class="mt-5 mb-5">챗봇 응답</h4>
	                  </div>
	                </div>
	              </div>
	              <!-- End Output - Title -->
	
				  <!-- Output Box - Rule -->
				  <form id="response-list">
				  	<input type="hidden" name="intent_id" id="list_intent_id"/>
				  </form>
	              <!-- End Output Box - Rule -->
				
				
				
              <!-- Output - Button Group -->
              <div class="mt-30 mb-30 ml-50">
                <p class="mb-5 font-size-16 font-weight-400 " style="color: #616161;">+ 응답추가</p>
                <div class="btn-group mt-5">
                  <div class="btn-group" role="group">
                    <button type="button" class="btn w-80 px-0" data-title="text" id="outputTextbox">
                      <i class="icon md-comment-more font-size-20" aria-hidden="true"></i>
                      <br>
                      <span class="text-uppercase hidden-sm-down">텍스트</span>
                    </button>
                  </div>

                  <div class="btn-group" role="group">
                    <button type="button" class="btn w-80 px-0" data-title="image" id="outputImage">
                      <i class="icon md-comment-image font-size-20" aria-hidden="true"></i>
                      <br>
                      <span class="text-uppercase hidden-sm-down">이미지</span>
                    </button>
                  </div>

                  <div class="btn-group" role="group">
                    <button type="button" class="btn w-80 px-0" data-title="card" id="outputCard">
                      <i class="icon md-comment-edit font-size-20" aria-hidden="true"></i>
                      <br>
                      <span class="text-uppercase hidden-sm-down">카드</span>
                    </button>
                  </div>

                  <div class="btn-group" role="group">
                    <button type="button" class="btn w-80 px-0" data-title="list" id="outputList">
                      <i class="icon md-comment-list font-size-20" aria-hidden="true"></i>
                      <br>
                      <span class="text-uppercase hidden-sm-down">리스트</span>
                    </button>
                  </div>

                  <div class="btn-group " role="group">
                    <button type="button" class="btn w-80 px-0" data-title="skill" id="outputSkill">
                      <i class="icon fa-code font-size-18" aria-hidden="true"></i>
                      <br>
                      <span class="text-uppercase hidden-sm-down">스킬</span>
                    </button>
                  </div>

                  <div class="btn-group " role="group">
                    <button type="button" class="btn w-80 px-0" data-title="direct" id="outputQuick">
                      <i class="icon fa-location-arrow font-size-18" aria-hidden="true"></i>
                      <br>
                      <span class="text-uppercase hidden-sm-down">퀵버튼</span>
                    </button>
                  </div>

                  <div class="btn-group " role="group">
                    <button type="button" class="btn w-80 px-0" data-title="condition" id="outputCondition">
                      <i class="icon fa-code-fork font-size-18" aria-hidden="true"></i>
                      <br>
                      <span class="text-uppercase hidden-sm-down">조건</span>
                    </button>
                  </div>

                </div>
              </div>
              <!-- End Output - Button Group -->

              <!-- End Example Output Groups -->
            </div>
          </div>
        </div>
      </div>
</div>

<!-- WebuiPopover -->

<!-- Popover Edit Text  -->
<div id="popoverEditTextHeader" class="popover-header" hidden>
  <p class="position-relative h-20">
    <span class="position-absolute" style="top: 10px; left: 5px;">텍스트 설정</span>
    <!-- <button type="button" class="btn btn-icon btn-pure float-right">
      <i class="icon md-delete mr-0" aria-hidden="true"></i>
    </button> -->
  </p>
</div>
<div id="popoverEditText" class="popover-content" hidden>
  <div class="form-group">
    <label class="form-control-label mb-0">텍스트<span class="red-600 ml-5">*</span></label>
    <textarea class="form-control" rows="5" placeholder="내용을 입력하세요." autocomplete="off" style="resize: none;"></textarea>
  </div>
  <div class="form-group form-material float-right">
    <button type="button" class="btn btn-primary btn-save">저장</button>
    <button type="reset" class="btn btn-default btn-outline btn-cancel">취소</button>
  </div>
</div>
<!-- End Popover Edit Text -->

<!-- Popover Edit Button  -->
<div id="popoverEditBtnHeader" class="popover-header" hidden>
  <p class="position-relative h-20">
    <span class="position-absolute" style="top: 10px; left: 5px;">버튼 설정</span>
    <button type="button" class="btn btn-icon btn-pure float-right">
      <i class="icon md-delete mr-0" aria-hidden="true"></i></button>
  </p>
</div>
<div id="popoverEditBtn" class="popover-content" hidden>
  <div class="form-group">
    <label class="form-control-label mb-0">버튼명<span class="red-600 ml-5">*</span></label>
    <input type="text" class="form-control input-btn-name" placeholder="Default"/>
  </div>
  <div class="form-group">
    <label class="form-control-label mb-0">버튼기능<span class="red-600 ml-5">*</span></label>
    <div class="position-relative">
      <div style="width:130px; float: left; "> 
      	<select class="form-control select-btn-type">
      		<option value="intent">INTENT 링크</option>
      		<option value="url">URL 링크</option>
      	</select>
      </div>
      <div class="div-select-intent" style="width:223px; float: left; margin-left: 5px; ">
      	<select class="form-control select-intent">
      		<option value="">- 선택 -</option>
      		<option value="0">의도 0</option>
      		<option value="1">의도 1</option>
      	</select>
      </div>
      <div class="div-input-url" style="width:223px; float: left; margin-left: 5px;" > <input type="text" class="form-control input-url" /></div>
    </div>
  </div>
  <div class="form-group form-material float-right mt-20">
    <button type="button" class="btn btn-primary btn-save">저장</button>
    <button type="reset" class="btn btn-default btn-outline btn-cancel">취소</button>
  </div>
</div>
<!-- End Popover Edit Button -->

<!-- Popover Edit Image  -->
<div id="popoverEditImgHeader" class="popover-header" hidden>
  <p class="position-relative h-20">
    <span class="position-absolute" style="top: 10px; left: 5px;">이미지 설정</span>
    <!-- <button type="button" class="btn btn-icon btn-pure float-right">
      <i class="icon md-delete mr-0" aria-hidden="true"></i>
    </button> -->
  </p>
</div>
<div id="popoverEditImg" class="popover-content" hidden>
  <div class="form-group">
    <label class="form-control-label mb-0">이미지 업로드<span class="red-600 ml-5">*</span></label>
    <input type="file" class="form-control">
  </div>
  <div class="form-group form-material float-right">
    <!-- <button type="button" class="btn btn-primary btn-save">저장</button> -->
    <button type="reset" class="btn btn-default btn-outline btn-close">닫기</button>
  </div>
</div>
<!-- End Popover Edit Image -->

<!-- Popover Edit Title Text  -->
<div id="popoverEditTitleTextHeader" class="popover-header" hidden>
  <p class="position-relative h-20">
    <span class="position-absolute" style="top: 10px; left: 5px;">텍스트 설정</span>
    <!-- <button type="button" class="btn btn-icon btn-pure float-right">
      <i class="icon md-delete mr-0" aria-hidden="true"></i>
    </button> -->
  </p>
</div>
<div id="popoverEditTitleText" class="popover-content" hidden>
  <div class="form-group">
    <label class="form-control-label mb-0">타이틀</label>
    <input type="text" class="form-control" placeholder="타이틀을 입력하세요." autocomplete="off" />
  </div>
  <div class="form-group">
    <label class="form-control-label mb-0">텍스트</label>
    <textarea class="form-control" rows="5" placeholder="내용을 입력하세요." autocomplete="off" style="resize: none;"></textarea>
  </div>
  <div class="form-group form-material float-right">
    <button type="button" class="btn btn-primary btn-save">저장</button>
    <button type="reset" class="btn btn-default btn-outline btn-cancel">취소</button>
  </div>
</div>
<!-- End Popover Edit Title Text -->

<!-- Popover Edit List Title Text  -->
<div id="popoverListTitleHeader" class="popover-header" hidden>
	<p class="position-relative h-20">
		<span class="position-absolute" style="top: 10px; left: 5px;">타이틀 설정</span>
		<!-- <button type="button" class="btn btn-icon btn-pure float-right">
			<i class="icon md-delete mr-0" aria-hidden="true"></i>
		</button> -->
	</p>
</div>
<div id="popoverListTitle" class="popover-content" hidden>
  <div class="form-group">
    <label class="form-control-label mb-0">타이틀<span class="red-600 ml-5">*</span></label>
    <input type="text" class="form-control" placeholder="타이틀을 입력하세요." autocomplete="off" />
  </div>
  <div class="form-group form-material float-right">
    <button type="button" class="btn btn-primary btn-save">저장</button>
    <button type="reset" class="btn btn-default btn-outline btn-cancel">취소</button>
  </div>
</div>
<!-- End Popover Edit Title Text -->

<!-- Popover Edit List Title Text  -->
<div id="popoverListItemHeader" class="popover-header" hidden>
  <p class="position-relative h-20">
    <span class="position-absolute" style="top: 10px; left: 5px;">리스트목록 설정</span>
    <button type="button" class="btn btn-icon btn-pure float-right">
      <i class="icon md-delete mr-0" aria-hidden="true"></i></button>
  </p>
</div>
<div id="popoverListItem" class="popover-content" hidden>
  <div class="form-group">
    <label class="form-control-label mb-0">타이틀<span class="red-600 ml-5">*</span></label>
    <input type="text" class="form-control title" placeholder="타이틀을 입력하세요." autocomplete="off" />
  </div>
  <div class="form-group">
    <label class="form-control-label mb-0">내용</label>
    <input type="text" class="form-control content" placeholder="내용을 입력하세요." autocomplete="off" />
  </div>
  <div class="form-group">
    <label class="form-control-label mb-0">썸네일 이미지</label>
    <input type="file" class="form-control image">
  </div>
  <div class="form-group form-material float-right">
    <button type="button" class="btn btn-primary btn-save">저장</button>
    <button type="reset" class="btn btn-default btn-outline btn-cancel">취소</button>
  </div>
</div>
<!-- End Popover Edit Title Text -->

<!-- WebuiPopover -->

<script src="${pageContext.request.contextPath}/js/outputResponseList.js"></script>
<script type="text/javascript">
$("body").addClass("app-notebook page-aside-left dialog");

var intentId;

initialize_jstree();

function initialize_jstree(){
	refresh=true;
	
    //===== jstree category/intent node tree ==================
    $('#jstree').jstree({
      'core': {
        "check_callback": true,
        'data' : {
        	url:"/chatbot/getIntentList.do",
        	dataType:"json"
        }
      },
      "types" : {
        "#" : {
          "max_children" : 100,
          // "max_depth" : 3,
          "valid_children" : ["R"]
        },
        "R" : {
          "icon" : "fa-hashtag",
          "valid_children" : ["C", "I"]
        },
        "C" : {
          "icon" : "fa-folder-o",
          "valid_children" : ["C", "I"]
        },
        "I" : {
          "icon" : "fa-comments-o",
          "valid_children" : []
        }
      },
      "contextmenu":{
        "items": function($node) {
            return {
              "Create_Category": {
                "separator_before": false,
                "separator_after": false,
                "label": "시나리오생성",
                "icon": "fa-folder-o",
             
                "action": function (obj) {
                	let ref = $('#jstree').jstree(true)
                    let sel = ref.get_selected();
                	
                    if(!sel.length) {
                      return false;
                    }
                    
                    sel = sel[0];
                    let parent = ref.get_node(sel);

                	if(parent.type !== "R"){
                		alert("루트노드에서만 생성이 가능합니다.");
                		return false;
                	}
             
                	createScenario();
                }
              },
              "Create_Intent": {
                  "separator_before": false,
                  "separator_after": false,
                  "label": "블록생성",
                  "icon": "fa-comments-o",
                  "action": function (obj) {
                    let ref = $('#jstree').jstree(true)
                    let sel = ref.get_selected();
                    
                    if(!sel.length) {
                      return false;
                    }
                    
                    sel = sel[0];
                    let parent = ref.get_node(sel);
                    
                    if (parent.type === 'I'){
                      alert("블록노드는 블록을 생성할 수 없습니다.")
                      return false;
                    }
                    
                    if (parent.type === 'R'){
                        alert("루트노드는 블록을 생성할 수 없습니다.")
                        return false;
                     }
                 
                    createBlock(parent.id);
                  }
                },
                "Rename": {
                    "separator_before": false,
                    "separator_after": false,
                    "label":"이름변경",
                    "icon": "fa-edit",
                    "action": function (obj) {
                      let ref = $('#jstree').jstree(true), sel = ref.get_selected();
                     
                      if(!sel.length) { return false; }
                      
                      sel = sel[0];
                      let node = ref.get_node(sel);
                      
                      if (node.type === 'R'){
                        alert("루트노드는 수정할 수 없습니다.");
                      }
                    
                      ref.edit(sel);
                    }
                  },
                    "Remove": {
                      "separator_before": false,
                      "separator_after": false,
                      "label": "삭제",
                      "icon": "fa-trash",
                      "action": function (obj) {
	              	    let ref = $('#jstree').jstree(true)
	                    let sel = ref.get_selected();
	              	  
	                    if(!sel.length) {
	                      return false;
	                    }
	                    
	                    sel = sel[0];
	                    let parent = ref.get_node(sel);
	
	                   	if(parent.type === "R"){
	                   		alert("루트노드는 삭제할 수 없습니다.");
	                   		return false;
	                   	}
	                   	
	                   	if(parent.children.length > 0){
	                   		alert("하위 블록이 있을 경우 삭제할 수 없습니다.");
	                   		return false;
	                   	}
	                   	
	               		deleteCategory(parent.id);
                    }
                },
                "Open": {
                    "separator_before": false,
                    "separator_after": false,
                    "label": "전체열기",
                    "icon": "fa-folder-open",
                    "action": function (obj) {
                  	 	treeOpen();
                  }
              },
                "Close": {
                    "separator_before": false,
                    "separator_after": false,
                    "label": "전체닫기",
                    "icon": "fa-folder",
                    "action": function (obj) {
                  	 	treeClose();
                  }
              }
            }
        }
      },
      'plugins': [ 'search', "types", 'state', "wholerow", 'contextmenu']
    }).on("ready.jstree",function (){
    	//$("#jstree").jstree("close_all");
    })
    .on("select_node.jstree", function (event, data) {
    	// 노드가 선택된 뒤 처리할 이벤트
		var type = data.instance.get_node(data.selected).type;
    	if( type === 'I'){
    		loadRightPage(data);
		}
   	})
   	.on('rename_node.jstree', function (e, data) {
      var ref = $('#jstree').jstree(true);
      console.log("rename node", data.node.id);
      if (data.text === data.old){
        return;
      }
      if (!confirm("이름을 수정하시겠습니까?")) return false;
      
      rename(data.text,data.node.id);
    });
}
  
	
	function createScenario(){
		console.log("create scenario click");	
		var request = $.ajax({
			url : "/chatbot/addScenario.do",
			method : "get"
		});

		request.done(function(data) {
			$("#jstree").jstree("refresh");
		});

		request.fail(function(error) {
			console.log(error);
		});
		
	}
	
	function createBlock(id){
		console.log("create block" + id);	
		 
		var request = $.ajax({
			url : "/chatbot/addBlock.do?intent_id="+id,
			method : "get"
		});

		request.done(function(data) {
			$("#jstree").jstree("refresh");
		});

		request.fail(function(error) {
			console.log(error);
		});
		 
	}
	
	
	function deleteCategory(id){
		console.log("delete category" + id);
		
		var request = $.ajax({
			url : "/chatbot/deleteCategory.do?intent_id="+id,
			method : "get"
		});

		request.done(function(data) {
			$("#jstree").jstree("refresh");
		});

		request.fail(function(error) {
			console.log(error);
		});
		
	}
	
	function rename(text,id){
		
		var request = $.ajax({
			url : "/chatbot/renameCategory.do?intent_id="+id+"&title="+text,
			method : "get"
		});

		request.done(function(data) {
			$("#jstree").jstree("refresh");
		});

		request.fail(function(error) {
			console.log(error);
		});
	}
	
	function treeOpen(){
		$("#jstree").jstree("open_all");
	}
	
	function treeClose(){
		$("#jstree").jstree("close_all");
	}
	
	function loadRightPage(data){
    	var id = data.instance.get_node(data.selected).id;
    	var text = data.instance.get_node(data.selected).text;
    	
    	intentId = id;
    	document.getElementById("list_intent_id").value = id;
    	$("#intent-id").val(id);
    	$("#title").text('');
    	$("#title").append(text);
    	
    	var request = $.ajax({
			url : "/chatbot/getInputText.do?intent_id="+id,
			method : "get"
		});

		request.done(function(data) {
			console.log("getInputText", data);
			setInputText(data);
			
			getResponseList(id);			
		});

		request.fail(function(error) {
			console.log(error);
		});
	}
	
	function getResponseList(intent_id) {
		var request = $.ajax({
			url: "/chatbot/getRespone.do?intent_id=" + intent_id,
			method: "get",

		});
		request.done(function(data) {
			console.log("getResponseList", data);
			if (typeof data !== "string") setResponseList(data);
		});
		request.fail(function(error) {
			console.log(error);
			console.log("request fail");
		});
	}
	
	function setResponseList(data) {
		var allResponseList = document.querySelectorAll("div[id*='response_']");
		
		if (allResponseList.length > 0) {
			for (var responseList of allResponseList) {
				responseList.remove();
			}
			
			globalIdx = 0;
		}
		// data length(size)만큼 뺑뺑이
		for (var i = 0; i < data.length; i++) {
			console.log("response list", data[i]);
			var type = data[i].type;
			
			// list 추가
			document.querySelector("button[data-title='" + type + "']").click();
			
			// type, intent_id, position, trans_type 설정
			var response_list = document.getElementById("response_" + i);
			response_list.querySelector("input[name*='type']").value = data[i].type;
			response_list.querySelector("input[name*='position']").value = data[i].position;
			if (data[i].hasOwnProperty("trans_type")) {
				//response_list.querySelector("input[name*='trans_type']").value = data[i].trans_type;
				response_list.querySelector("#response_" + i + "_sending_btn_" + data[i].trans_type).click();
			}
			
			switch (type) {
				case "text":
					var card = data[i].card;
					
					for (var j = 0; j < card.length; j++) {
						//card 추가
						document.getElementById("response_" + i + "_add_card_btn").click();
						
						// content, position
						var response_card = document.getElementById("responseCard_" + i + "_" + j);
						if (card[j].content)	response_card.querySelector("p.card-text").innerHTML = card[j].content;
						else				 	response_card.querySelector("p.card-text").innerHTML = "내용을 입력하세요";
						response_card.querySelector("input[name*='content']").value = card[j].content;
						response_card.querySelector("input[name*='position']").value = card[j].position;
						
						var button = card[j].button;
						
						for (var k = 0; k < button.length; k++) {
							// button 추가
							response_card.querySelector("button.card-btn-action").click();
							
							var response_button = document.getElementById("responseCard_" + i + "_" + j + "_btn_" + k);
							if (button[k].name)	response_button.querySelector("div.btn-name").innerHTML = button[k].name;
							else				response_button.querySelector("div.btn-name").innerHTML = "Default";
							response_button.querySelector("input[name*='name']").value = button[k].name;
							response_button.querySelector("input[name*='position']").value = button[k].position;
							response_button.querySelector("input[name*='function1']").value = button[k].function1;
							response_button.querySelector("input[name*='function2']").value = button[k].function2;
						}
					}
					
					break;
				case "image":
					var card = data[i].card;
					
					for (var j = 0; j <card.length; j++) {
						//card 추가
						document.getElementById("response_" + i + "_add_card_btn").click();
						
						// position, img
						var response_card = document.getElementById("responseCard_" + i + "_" + j);
						response_card.querySelector("input[name*='position']").value = card[j].position;
						response_card.querySelector("input[name*='img_attach_id']").value = card[j].img_attach_id;
						response_card.querySelector("img").src = "/chatbot/getImg.do?img_attach_id=" + card[j].img_attach_id;
					}
					break;
				case "card":
					var card = data[i].card;
					
					for (var j = 0; j <card.length; j++) {
						//card 추가
						document.getElementById("response_" + i + "_add_card_btn").click();
						
						// title, content, position
						var response_card = document.getElementById("responseCard_" + i + "_" + j);
						if (card[j].title)	response_card.querySelector("h5.card-title").innerHTML = card[j].title;	
						else 				response_card.querySelector("h5.card-title").innerHTML = "타이틀을 입력하세요.";
						response_card.querySelector("input[name*='title']").value = card[j].title;
						if (card[j].content)	response_card.querySelector("p.card-text").innerHTML = card[j].content;	
						else					response_card.querySelector("p.card-text").innerHTML = "내용을 입력하세요.";
						response_card.querySelector("input[name*='content']").value = card[j].content;
						response_card.querySelector("input[name*='position']").value = card[j].position;
						response_card.querySelector("input[name*='img_attach_id']").value = card[j].img_attach_id;
						response_card.querySelector("img").src = "/chatbot/getImg.do?img_attach_id=" + card[j].img_attach_id;
						
						var button = card[j].button;
						
						for (var k = 0; k < button.length; k++) {
							// button 추가
							response_card.querySelector("button.card-btn-action").click();
							
							var response_button = document.getElementById("responseCard_" + i + "_" + j + "_btn_" + k);
							if (button[k].name)	response_button.querySelector("div.btn-name").innerHTML = button[k].name;
							else				response_button.querySelector("div.btn-name").innerHTML = "Default";
							response_button.querySelector("input[name*='position']").value = button[k].position;
							response_button.querySelector("input[name*='name']").value = button[k].name;
							response_button.querySelector("input[name*='function1']").value = button[k].function1;
							response_button.querySelector("input[name*='function2']").value = button[k].function2;
						}
					}

					break;
				case "list":
					var card = data[i].card;
					
					for (var j = 0; j < card.length; j++) {
						//card 추가
						document.getElementById("response_" + i + "_add_card_btn").click();
						
						// title, position
						var response_card = document.getElementById("responseCard_" + i + "_" + j);
						if (card[j].title)	response_card.querySelector("h5.card-title").innerHTML = card[j].title;
						else				response_card.querySelector("h5.card-title").innerHTML = "타이틀을 입력하세요.";
						response_card.querySelector("input[name*='title']").value = card[j].title;
						response_card.querySelector("input[name*='position']").value = card[j].position;
						
						var button = card[j].button;
						
						for (var k = 0; k < button.length; k++) {
							// button 추가
							response_card.querySelector("button.card-btn-action").click();
							
							var response_button = document.getElementById("responseCard_" + i + "_" + j + "_btn_" + k);
							if (button[k].name)	response_button.querySelector("div.btn-name").innerHTML = button[k].name;
							else				response_button.querySelector("div.btn-name").innerHTML = "Default";
							response_button.querySelector("input[name*='position']").value = button[k].position;
							response_button.querySelector("input[name*='name']").value = button[k].name;
							response_button.querySelector("input[name*='function1']").value = button[k].function1;
							response_button.querySelector("input[name*='function2']").value = button[k].function2;
						}
						
						var list = card[j].list;
						
						for (var l = 0; l < list.length; l++) {
							// list 추가
							response_card.querySelector("button.btn.btn-block.btn-pure").click();
							
							var response_list = document.getElementById("responseCard_" + i + "_" + j + "_list_btn_" + l);
							if (list[l].title)	response_list.querySelector("p.title").innerHTML = list[l].title;
							else 				response_list.querySelector("p.title").innerHTML = "타이틀을 입력하세요.";
							response_list.querySelector("input[name*='title']").value = list[l].title;
							if (list[l].content)	response_list.querySelector("p.content").innerHTML = list[l].content;
							else					response_list.querySelector("p.content").innerHTML = "내용을 입력하세요.";
							response_list.querySelector("input[name*='content']").value = list[l].content;
							response_list.querySelector("input[name*='img_attach_id']").value = list[l].img_attach_id;
							response_list.querySelector("img").src = "/chatbot/getImg.do?img_attach_id=" + list[l].img_attach_id;
						}
					}
					
					break;
				case "skill":
				case "condition":
					break;
				case "direct":
					var card = data[i].card;
					
					for (var j = 0; j < card.length; j++) {
						// button 추가
						response_list.querySelector("button.ignore-elements").click();
						
						var button = card[j].button[0];
						
						var response_button = document.getElementById("responseCard_" + i + "_" + j + "_btn_0");
						response_button.querySelector("input[name*='position']").value = button.position;
						response_button.querySelector("input[name*='name']").value = button.name;
						response_button.querySelector("div.btn-name").innerHTML = button.name;
						response_button.querySelector("input[name*='function1']").value = button.function1;
						response_button.querySelector("input[name*='function2']").value = button.function2;
					}
					
					break;
			}
		}
	}
	
	var globalIdx = 0;
	  
 	var defaults = Plugin.getDefaults("webuiPopover");
 	
 	var popEditTextHeader = $('#popoverEditTextHeader').html();
    var popEditTextContent = $('#popoverEditText').html();
    var popEditTextSettings = {
      	title:popEditTextHeader,
      	content: popEditTextContent,
      	placement:'auto',
      	width: 400,
      	animation:'fade',
      	backdrop:true,
      	closeable: true
    };
    
    var popEditBtnHeader = $('#popoverEditBtnHeader').html()
    var popEditBtnContent = $('#popoverEditBtn').html()
    var popEditBtnSettings = {
      title:popEditBtnHeader,
      content:popEditBtnContent,
      placement:'auto',
      width: 400,
      animation:'fade',
      backdrop:true,
      closeable: true
    };
    
    var popEditImgHeader = $('#popoverEditImgHeader').html()
    var popEditImgContent = $('#popoverEditImg').html()
    var popEditImgSettings = {
      title:popEditImgHeader,
      content:popEditImgContent,
      placement:'auto',
      width: 400,
      animation:'fade',
      backdrop:true,
      closeable: true
    };
    
    var popEditTitleTextHeader = $('#popoverEditTitleTextHeader').html()
    var popEditTitleTextContent = $('#popoverEditTitleText').html()
    var popEditTitleTextSettings = {
      title:popEditTitleTextHeader,
      content: popEditTitleTextContent,
      placement:'auto',
      width: 400,
      animation:'fade',
      backdrop:true,
      closeable: true
    };
    
    var popEditListTitleHeader = $('#popoverListTitleHeader').html()
    var popEditListTitleContent = $('#popoverListTitle').html()
    var popEditListTitleSettings = {
      title:popEditListTitleHeader,
      content: popEditListTitleContent,
      placement:'auto',
      width: 400,
      animation:'fade',
      backdrop:true,
      closeable: true
    };

    var popoverListItemHeader = $('#popoverListItemHeader').html()
    var popoverListItemContent = $('#popoverListItem').html()
    var popoverListItemSettings = {
      title:popoverListItemHeader,
      content: popoverListItemContent,
      placement:'auto',
      width: 400,
      animation:'fade',
      backdrop:true,
      closeable: true
    };
    
    var observer = new MutationObserver(function(mutations) {
		mutations.forEach(function(mutation) {
			var child_count = mutation.target.childElementCount;
			
			//if (mutation.target.isEqualNode(div_btn_list)) {
			if (mutation.target.classList.contains("card-block-btns")) {
				if (child_count >= 4)	mutation.target.lastElementChild.style.display = "none";
				else					mutation.target.lastElementChild.style.display = "";
			} else if (mutation.target.classList.contains("list-group-dividered")){
				if (child_count >= 6)	mutation.target.lastElementChild.style.display = "none";
				else					mutation.target.lastElementChild.style.display = "";
			} else {
				if (child_count >= 11)	mutation.target.lastElementChild.style.display = "none";
				else					mutation.target.lastElementChild.style.display = "";
			}
		});
	});
    
 	window.onload = function() {
 		//document.getElementById("jstree").querySelectorAll("ul.jstree-no-dots ul.jstree-children ul.jstree-children")[0].querySelector("a").click();
 		
	 	var allOutputAddBtn = document.querySelectorAll("[id^='output']");
	 	
	 	allOutputAddBtn.forEach(function(t) {
	 		t.addEventListener("click", function() {
	 			var title = t.querySelector(".hidden-sm-down").innerHTML;
	 			var tKey = t.dataset.title;
	 			
	 			var obj = {name: tKey};
	 			obj[obj.name] = title;
	 			
	 			addResponseListHtml(obj);
	 		});
	 	});
 	}
 	
 	$("#chatbot-regist-btn").click(function() {
 		if (!submitConfirm($(this))) return false;
 		
 		saveChatbotData();
 	});
 	
 	$("#chatbot-delete-btn").click(function() {
		if (!submitConfirm($(this))) return false;
		
		deleteChatbotData();
	});
 	
 	function saveChatbotData() {
 		chatbotReg();
 		
 		var formData2 = new FormData(document.getElementById("response-list"));
 		
 		for (var data of formData2.entries()) {
 			console.log(data);
 		}
 		
 		var request = $.ajax({
 			url: "/chatbot/serializedObj.do",
			method: "post",
			contentType: "application/json",
			//enctype: "multipart/form-data",
			//dataType: "json",
			data: JSON.stringify($("#response-list").serializeObject())
 		});
 		
 		request.done(function(data) {
 			console.log("saveChatbotData", data);
 		});
 		
 		request.fail(function(error) {
			console.log(error);
			console.log("request fail");
		});	
 	}
 	
 	function deleteChatbotData() {
 		var request = $.ajax({
 			url: "/chatbot/deleteResponse.do",
			method: "post",
			data: $("#input-text-form").serialize()
 		});
 		
 		request.done(function(data) {
 			request.done("registImg succees");
 			location.href = "/chatbot/intentListPage.do";
 		});
 		
 		request.fail(function(error) {
 			console.log("fail", error);
 		});
 	}
 	
 	function registImgFile(target) {
 		var formData = new FormData();
 		var input_file = target.siblings("input[type='file']");
 		formData.append(input_file.attr("name"), input_file[0].files[0]);
 		
 		var request = $.ajax({
 			url: "/chatbot/registImg.do",
 			method: "post",
 			enctype: "multipart/form-data",
 			processData: false,
 			contentType: false,
 			data: formData
 		});
 		
 		request.done(function(data) {
 			request.done("testSave succees");
 			console.log(data);
 			target.siblings("input[name*='img_attach_id']").val(data[0]);
 			//location.href = "/chatbot/intentListPage.do";
 		});
 		
 		request.fail(function(error) {
 			console.log("fail", error);
 		});
 	}
 	
 	function getIntentListInBtn(target) {
 		var request = $.ajax({
 			url: "/chatbot/getIntentListInBtn.do",
 			method: "get",
 			async: false
		});
 		
 		request.done(function(data) {
 			target.empty();
 			target.append("<option value=''>- 선택 -</option>");
 			
 			for (var i = 0; i < data.length; i++) {
 				var option = $("<option value='" + data[i].intent_id + "'>" + data[i].title + "</option>");
 				target.append(option);
 			}
		});
 		
 		request.fail(function(error) {
			console.log("getIntentListInBtn request fail", error);
		});
 	}
 	
 	function getSkillConditionList(type) {
 		var result = [];
 		var type_url = "/chatbot";
 		
 		if (type === "skill")			type_url += "/getSkillList.do";
 		else if (type === "condition")	type_url += "/getConditionList.do";
 	
 		var request = $.ajax({
 			url: type_url,
 			method: "get",
 			async: false
		});
 		
 		request.done(function(data) {
 			result = data;
 		});
 		
 		request.fail(function(error) {
 			console.log("getSkillConditionList request fail", error);
 		});
 		
 		return result;
 	}
 	
</script>
