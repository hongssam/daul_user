<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<div class="page">
	<!-- Sidebar -->
	<div class="page-aside">
		<div class="page-aside-switch">
			<i class="icon md-chevron-left" aria-hidden="true"></i> 
			<i class="icon md-chevron-right" aria-hidden="true"></i>
		</div>
		<div class="page-aside-inner">
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
                #<span class="title">New Intent</span>
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
                <button type="button" class="btn btn-primary" onclick="">
                  <i class="icon fa-save" aria-hidden="true"></i> 저장</button>
                <button type="button" class="btn btn-default" onclick="">
                  <i class="icon fa-trash-o" aria-hidden="true"></i> 삭제</button>
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

              <!-- Input Box - Input Sentences -->
              <div class="box input">
                <div class="panel box-main">
                  <div class="panel-heading">
                    <h3 class="panel-title">사용자 발화 - 문장형</h3>
                  </div>
                  <div class="panel-body input-box p-15">
                    <div class="form-group w-p100">
                      <div class="input-group">
                        <input type="text" class="form-control tokenfield"
                          value="안뇽|안녕|안녕하세용"
                          placeholder="해당 의도(Intent)에 대한 사용자의 예상 발화를 입력해주세요." />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
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

			  <div id="response-list">
			  </div>
              <!-- Output Box - Rule -->
              <!-- End Output Box - Rule -->

              <!-- Output Box - Text -->
              <!-- End Output Box - Text -->

              <!-- Output Box - Image -->
              <!-- End Output Box - Image -->

              <!-- Output Box - Card -->
              <!-- End Output Box - Card -->

              <!-- Output Box - List -->
              <!-- End Output Box - List -->

              <!-- Output Box - Skill -->
              <!-- End Output Box - Skill -->

              <!-- Output Box - Btns -->
              <!-- End Output Box - Btns -->

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
                    <button type="button" class="btn w-80 px-0" data-title="quick" id="outputQuick">
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

<!-- Popover Edit Text  -->
<div id="popoverEditTextHeader" class="popover-header" hidden>
  <p class="position-relative h-20">
    <span class="position-absolute" style="top: 10px; left: 5px;">텍스트 설정</span>
    <button type="button" class="btn btn-icon btn-pure float-right">
      <i class="icon md-delete mr-0" aria-hidden="true"></i></button>
  </p>
</div>
<div id="popoverEditText" class="popover-content" hidden>
  <div class="form-group">
    <label class="form-control-label mb-0">텍스트<span class="red-600 ml-5">*</span></label>
    <textarea class="form-control" rows="5" placeholder="텍스트를 입력해주세요." autocomplete="off" style="resize: none;"></textarea>
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
    <input type="text" class="form-control" />
  </div>
  <div class="form-group">
    <label class="form-control-label mb-0">버튼기능<span class="red-600 ml-5">*</span></label>
    <div class="position-relative">
      <div style="width:130px; float: left; "> <select class="form-control select-btn-type" ></select></div>
      <div class="div-select-intent" style="width:223px; float: left; margin-left: 5px; "> <select class="form-control select-intent" ></select></div>
      <div class="div-input-url" style="width:223px; float: left; margin-left: 5px;" > <input type="text" class="form-control input-url" /></div>
    </div>
  </div>
  <div class="form-group form-material float-right mt-20">
    <button type="button" class="btn btn-primary btn-save">저장</button>
    <button type="reset" class="btn btn-default btn-outline btn-cancel">취소</button>
  </div>
</div>
<!-- End Popover Edit Button -->

<%-- <script src="${pageContext.request.contextPath}/js/outputTextBox.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/outputResponseList.js"></script>
<script type="text/javascript">
$("body").addClass("app-notebook page-aside-left dialog");

initialize_jstree();


function initialize_jstree(){
    //===== jstree category/intent node tree ==================
    $('#jstree').jstree({
      'core': {
        "check_callback": true,
        'data' : [
            {"id": 1, "text": "\uc758\ub3c4 \ud2b8\ub9ac", "parent": "#", "type": "R", "position": 0, "module": 2},
            {"id": 2, "text": "new category", "parent": 1, "type": "C", "position": 0, "module": 2},
            {"id": 3, "text": "new Intent", "parent": 2, "type": "I", "position": 1, "module": 2},
            {"id": 4, "text": "new Intent", "parent": 2, "type": "I", "position": 2, "module": 2},
            {"id": 5, "text": "new Intent", "parent": 2, "type": "I", "position": 3, "module": 2},
            {"id": 6, "text": "new Intent", "parent": 2, "type": "I", "position": 4, "module": 2},
            {"id": 7, "text": "new Intent", "parent": 2, "type": "I", "position": 5, "module": 2},
            {"id": 8, "text": "new Intent", "parent": 2, "type": "I", "position": 6, "module": 2},
            {"id": 9, "text": "new Intent", "parent": 2, "type": "I", "position": 7, "module": 2},
            {"id": 10, "text": "new Intent", "parent": 2, "type": "I", "position": 8, "module": 2}
          ]
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
                "label": "add category",
                "icon": "fa-folder-o",
                "action": function (obj) {
                  let ref = $('#jstree').jstree(true)
                  let sel = ref.get_selected();
                  if(!sel.length) {
                    return false;
                  }
                  sel = sel[0];
                  let parent = ref.get_node(sel);
                  if (parent.type === 'I'){
                    alertify.alert("인텐트노드는 자식노드를 생성할 수 없습니다.")
                  }
                  sel = ref.create_node(sel, {
                    'text': 'new category',
                    "type" : "C"
                  });
                  if(sel) {
                    ref.edit(sel);
                  }
                }
              },
              "Create_Intent": {
                "separator_before": false,
                "separator_after": false,
                "label": "add intent",
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
                    alertify.alert("인텐트노드는 자식노드를 생성할 수 없습니다.")
                  }
                  sel = ref.create_node(sel, {
                    'text': 'new Intent',
                    "type" : "I"
                  });
                  if(sel) {
                    ref.edit(sel);
                  }
                }
              },
              "Rename": {
                "separator_before": false,
                "separator_after": false,
                "label": "rename",
                "icon": "fa-edit",
                "action": function (obj) {
                  let ref = $('#jstree').jstree(true), sel = ref.get_selected();
                  if(!sel.length) { return false; }
                  sel = sel[0];
                  let node = ref.get_node(sel);
                  if (node.type === 'R'){
                    alertify.alert("루트노드는 수정할 수 없습니다.");
                  }
                  ref.edit(sel);
                }
              },
              "Remove": {
                "separator_before": false,
                "separator_after": false,
                "label": "delete",
                "icon": "fa-trash",
                "action": function (obj) {
                  let ref = $('#jstree').jstree(true), sel = ref.get_selected();
                  if (!sel.length) {
                    return false;
                  }
                  sel = sel[0];
                  let node = ref.get_node(sel);
                  if (node.type === 'C'){
                    alertify.confirm("카테고리노드 ["+node['text']+"] 를 삭제하시겠습니까? (하위노드까지 함께 삭제됩니다.)", function () {
                      ref.delete_node(sel);
                    });
                  }
                  else if (node.type === 'I'){
                    alertify.confirm("인텐트노드 ["+node['text']+"] 를 삭제하시겠습니까?", function () {
                      ref.delete_node(sel);
                    });
                  }
                  else if (node.type === 'R') {
                    alertify.alert("루트 노드는 삭제할 수 없습니다.");
                  }
                }
              },
              "Refresh": {
                "separator_before": true,
                "separator_after": false,
                "label": "새로고침",
                "icon": "fa-refresh",
                "action": function (obj) {
                  let ref = $('#jstree').jstree(true);
                  ref.refresh();
                }
              }
            };
        }
      },
      'plugins': ['dnd', 'search', "types", 'state', "wholerow", 'contextmenu']
    })
    .on('create_node.jstree', function (e, data) {
      var ref = $('#jstree').jstree(true);
      let old_node = data.node;
      $.ajax({
        type: 'POST',
        url: "{% url 'dialog:add_intent_node' %}",
        data: {
          csrfmiddlewaretoken: '{{ csrf_token }}',
          data: JSON.stringify(old_node),
        },
        success: function (rst) {
          // 서버에 저장 후 새로 받은 ID setting
          ref.set_id(old_node.id, String(rst['id']))
          console.log('create_node', ref.get_node(String(rst['id'])))
        },
        error: function (rst,status) {
          alertify.alert('Error!!');
          ref.refresh()
        }
      })
    })
    .on('rename_node.jstree', function (e, data) {
      var ref = $('#jstree').jstree(true);
      if (data.text === data.old){
        return;
      }
      let node = data.node;
      $.ajax({
        type: 'POST',
        url: "{% url 'dialog:rename_intent_node' %}",
        data: {
          csrfmiddlewaretoken: '{{ csrf_token }}',
          data: JSON.stringify(node),
        },
        success: function (rst) {
          let node_id = rst['id'];
          console.log('rename_node', ref.get_node(node_id))
        },
        error: function (rst,status) {
          alertify.alert('Error!!');
          ref.refresh()
        }
      })
    })
    .on('delete_node.jstree', function (e, data) {
      var ref = $('#jstree').jstree(true);
      let node = data.node;
      $.ajax({
        type: 'POST',
        url: "{% url 'dialog:delete_intent_node' %}",
        data: {
          csrfmiddlewaretoken: '{{ csrf_token }}',
          data: JSON.stringify(node),
        },
        success: function (rst) {
          console.log('delete_node', node.id)
        },
        error: function (rst,status) {
          alertify.alert('Error!!');
          ref.refresh()
        }
      })
    })
    .on('move_node.jstree', function (e, data) {
      let ref = $('#jstree').jstree(true);

      let nodes = data.new_instance._model.data;

      var root_node_id = '';
      $.each(nodes, function( key, child ) {
        if (child.parent === '#') {
          root_node_id = key;
        }
      });

      function get_children(node_id){
          var list = [];
          $.each(nodes[node_id].children, function( index, child_id ) {
              list.push(get_children(child_id));
          });
          return {'id':node_id, 'children': list}
      }

      let parent = ref.get_node(data.parent)
      let node = data.node;
      $.ajax({
        type: 'POST',
        url: "{% url 'dialog:move_intent_node' %}",
        data: {
          csrfmiddlewaretoken: '{{ csrf_token }}',
          parent: JSON.stringify(parent),
          node: JSON.stringify(get_children(root_node_id))
        },
        success: function (rst) {
          console.log('move_node', node.id)
        },
        error: function (rst,status) {
          alertify.alert('Error!!');
          ref.refresh()
        }
      })
    })
    .on('changed.jstree', function (e, data) {
      if (data.action == 'select_node'){
        let node = data.node;
        reloadDetailView(node.id)
      }else {
        reloadDetailView(0);
      }
    });
}

function reloadDetailView(node_id){
    let div_detail = $('#dlgIntents');
    if (node_id === '' || node_id === 0 || node_id === null){
      div_detail.html("");
      console.log("renderIntents", node_id, "fail");
      return;
    }
    console.log("renderIntents", node_id, "start");
    // div_detail.addClass('loader');
    $.post("{% url 'development:get_intent_html' %}",
      {
        csrfmiddlewaretoken: '{{ csrf_token }}',
        page: '{{page}}',
        node_id: node_id,
      },
      (function(data, status){
        div_detail.html(data);
        // div_detail.removeClass('loader');
        console.log("renderIntents", node_id, "end");
      }).bind(this)
    )
}

function showDivIntentTitleInput(){
    console.log("showDivIntentTitleInput")
    $("#intentTitle").hide();
    $("#intentTitleInput").show();
    let input = $("#intentTitleInput input");
    input.focus();
    input.focusTextToEnd();
}

  function hideDivIntentTitleInput(){
    console.log("hideDivIntentTitleInput")
    $("#intentTitle").show();
    $("#intentTitleInput").hide();
}

  function renameIntent(intent_id){
    console.log("renameIntent")
    let text = $("#intentTitleInput input").val();
    $("#intentTitle .title").html(text);
    $("#intentTitleInput input").val(text);
    $('#jstree').jstree('rename_node', intent_id , text);
    hideDivIntentTitleInput();
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
    
 	window.onload = function() {
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
</script>
