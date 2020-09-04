<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
	    <!-- Page -->
	    <h1 class="page-title">Q&A</h1>
	    <ol class="breadcrumb">
	      <li class="breadcrumb-item"><a href="../index.html">Home</a></li>
	      <li class="breadcrumb-item"><a href="javascript:void(0)">챗봇</a></li>
	      <li class="breadcrumb-item active">스킬 관리</li>
	    </ol>
			
	    	<div class="panel">
		        <header class="panel-heading">
		          <div class="panel-actions"></div>
		        </header>
		        <br/>
		        <div class="panel-body">
		        	 <div id="skillListTable" class="text-break"></div>
		        </div>
	    	</div>
	    
	</div>
	<button type="button" style="display:none;" class="btn-sm btn-primary btn-outline  waves-effect waves-classic" data-toggle="modal" data-target="#skillDetailPositionCenter" id="skillDetailPositionBtn" href="#">상세</button>
	<button type="button" style="display:none;" class="btn-sm btn-primary btn-outline  waves-effect waves-classic" data-toggle="modal" data-target="#qnaUpdatePositionCenter" id="qnaUpdatePositionBtn" href="#">상세</button>
<!-- End Page -->
</div>



<!-- Q&A 상세 모달 -->
<div class="modal fade" id="skillDetailPositionCenter" aria-hidden="true" aria-labelledby="skillDetailPositionCenter" role="dialog" tabindex="-1">
   <div class="modal-dialog modal-simple modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">x</span>
        </button>
        <h4 class="modal-title">스킬 상세보기</h4>
      </div>
      <div class="modal-body">
        <form id="skill-modal-update-form">
        	<div class="example-wrap">
        		<h4 class="example-title">기능명</h4>
      			<input type="text" class="form-control" id="update_skill_title" />	
        		<h4 class="example-title">기능아이디</h4>
      			<input type="text" class="form-control" id="update_skill_function" />	

				<input type="hidden" id="skill_seq" name="seq"/>
      		</div>
        	
        	<span class="text-left" id="chk-error"></span>
        	<div style="text-align:center">
        	 	<button type="button" class="btn btn-primary waves-effect waves-classics" id="skill-modal-update-btn" data-title="SKILL">수정 </button>
        	 	<button type="button" class="btn btn-default waves-effect waves-classics" id="skill-modal-delete-btn3" data-title="SKILL">삭제 </button>
        	 	<button type="button" class="btn btn-default waves-effect waves-classics" data-dismiss="modal" aria-label="Close" id="qna-modal-cancel-btn3" >닫기 </button>
        	</div>
        </form>
       
      </div>
      <div class="modal-footer">
        <!-- <button type="button" class="btn btn-default btn-pure" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>
<!-- Q&A 상세 모달 끝 -->



<script type="text/javascript">


	function relpyBtnClick(){
		$("#reply_title").val("답변입니다.");
		$("#reply_content").val('');
		$("#chk-error-question-reg").text("");
		$("#chk-error-content-reg").text('');
	}
$(function() {
	
	$("#qnaPositionCenterBtn").click(function(){
		console.log("12312312321");
		$("#chk-error-question-reg").text("");
		$("#chk-error-content-reg").text('');
	});
	
	$("#qna-modal-btn").click(function() {
		if (!submitConfirm($(this))) return false;
		
		insertQnaReply();
	});	
	$("#qna-modal-update-btn").click(function() {
		if (!submitConfirm($(this))) return false;
		
		updateQnaReply();
	});

	$("#qna-modal-delete-btn2").click(function() {
		if (!submitConfirm($(this))) return false;
		
		deleteQnaReply();
		$("#qna-modal-cancel-btn2").trigger("click");
		
	});
	$("#qna-modal-delete-btn3").click(function() {
		if (!submitConfirm($(this))) return false;
		
		deleteQnaReply();
		$("#qna-modal-cancel-btn3").trigger("click");
	});
	
});

	
	function insertQnaReply(){
		var request = $.ajax({
			url: "/qna/insertQnaReply.do",
			method: "post",
			//contentType: "application/json",
			//dataType: "json",
			data: $("#qna-modal-reply-form").serialize()
		});
		request.done(function(data) {
			if(typeof(data) == "object"){
	    		valid_reg(data);
	    		return false;
	    	}
			
			if (data === "success") {
				getQnaList();
				$("#qna-modal-cancel-btn").trigger("click");
			} else {
				//alert(data);
				$("#chk-error").text(data);
			}
		});
		request.fail(function(error) {
			console.log(error);
			console.log("request fail");
		});
	}
	
	function updateQnaReply(){
		var request = $.ajax({
			url: "/qna/updateQnaReply.do",
			method: "post",
			//contentType: "application/json",
			//dataType: "json",
			data: $("#qna-modal-update-form").serialize()
		});
		request.done(function(data) {
			if(typeof(data) == "object"){
	    		valid_mod(data);
	    		return false;
	    	}
			
			if (data === "success") {
				getQnaList();
				$("#qna-modal-cancel-btn3").trigger("click");
			} else {
				//alert(data);
				$("#chk-error").text(data);
			}
		});
		request.fail(function(error) {
			console.log(error);
			console.log("request fail");
		});
	}
	
	function deleteQnaReply(){
		var request = $.ajax({
			url: "/qna/deleteQnaReply.do",
			method: "post",
			//contentType: "application/json",
			//dataType: "json",
			data: $("#qna-modal-update-form").serialize()
		});
		request.done(function(data) {
			
			if (data === "success") {
				getQnaList();
			} else {
				//alert(data);
				$("#chk-error").text(data);
			}
		});
		request.fail(function(error) {
			console.log(error);
			console.log("request fail");
		});
	}
	
	
	

	function setSkillListTable(skillList) {
		$('#skillListTable').jsGrid({
		    //height: "500px",
		    width: "100%",

		    //autoload:true,
		    sorting: true,
		    paging: true,
		    //pageIndex: 1, default: 1
		    pageSize: 10, // default: 20
			//pageButtonCount: 5, default: 15
		    
		    data: skillList,

		    
		    fields: [
		    	{name: "title",title: "스킬명", type: "text", width: 40, align: "center"},
		    	{name: "function",title: "스킬아이디", type: "text", width: 70, align: "center"},
		
		    	
	    	],
	    	rowClick: function(args) {
	    	
	    	
	    			
	    			/* increaseViewCount(args.item.qna_idx);
	    			$("#chk-error-question-mod").text('');
		    		$("#chk-error-content-mod").text('');
		    		
	    			var session_id = "${login.user_id}";
		    	
		    		document.getElementById("question_content").value = args.item.content;
					document.getElementById("detail_qustion").value = args.item.question;
					document.getElementById("detail_content").value = args.item.content;
					document.getElementById("detail_create_user").value = args.item.create_user;
					document.getElementById("update_qustion").value = args.item.question;
					document.getElementById("update_content").value = args.item.content;
					document.getElementById("update_create_user").value = args.item.create_user;
					document.getElementById("qna_idx_update").value = args.item.qna_idx;
					document.getElementById("qna_idx_detail").value = args.item.qna_idx;
					document.getElementById("parent_qna_idx_update").value = args.item.parent_qna_idx;
					document.getElementById("parent_qna_idx_detail").value = args.item.parent_qna_idx;
					
					if(args.item.create_user != session_id){
		    			$("#qnaDetailPositionBtn").trigger("click");
		    		}else{
		    			$("#qnaUpdatePositionBtn").trigger("click");
		    		} */
		    		
		    		document.getElementById("update_skill_title").value = args.item.title;
					document.getElementById("update_skill_function").value = args.item.function;
					document.getElementById("skill_seq").value = args.item.seq;
					
	    			$("#skillDetailPositionBtn").trigger("click");
	    		
			}
		});
	}
	

	function getQnaList() {
		var request = $.ajax({
			url: "/chatbot/getSkillList.do",
			method: "get"
		});
		
		request.done(function(data) {
			console.log(data);
			setSkillListTable(data);
		});
		
		request.fail(function(error) {
			console.log(error);
		});
	}
		
	$(function() {
		getQnaList();
	});
		
	$("#searchBtn").click(function() {
		getQnaList();
	});

	function enterKey() {
		if (window.event.keyCode === 13) {
			getQnaList();
		}
	}
		
	
	function valid_reg(data){	
		$("#chk-error-question-reg").text('');
		$("#chk-error-content-reg").text('');
	
		for(var i = 0; i < data.length; i++){
			var obj = data[i];
			
			for (var key in obj) {
				if(key=="question"){
					$("#chk-error-question-reg").text(obj[key]);
					
				}else if(key=="content"){
					$("#chk-error-content-reg").text(obj[key]);
				}
			
			}
		}
	}
	
	function valid_mod(data){	
		
		console.log("asdfasdf11");
		$("#chk-error-question-mod").text("");
		$("#chk-error-content-mod").text('');
	
		for(var i = 0; i < data.length; i++){
			var obj = data[i];
			
			for (var key in obj) {
				if(key=="question"){
					$("#chk-error-question-mod").text(obj[key]);
					
				}else if(key=="content"){
					$("#chk-error-content-mod").text(obj[key]);
				}
			
			}
		}
	}
	
	function increaseViewCount(qna_idx){
		var request = $.ajax({
			url: "/qna/increaseViewCount.do?qna_idx="+qna_idx,
			method: "get"
		});
		
		request.done(function(data) {
			getQnaList();
			console.log("success");
		});
		
		request.fail(function(error) {
			console.log(error);
		});
		
		
	}
</script>
	

