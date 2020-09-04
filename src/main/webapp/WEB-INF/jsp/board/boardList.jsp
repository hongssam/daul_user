<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<script type="text/javascript">
/* $(document).ready(function() {
	$("#userTable").DataTable();
}); */
</script>
    
<!-- Page -->
<div class="page">
	<div class="page-content container-fluid">
	    <!-- Page -->
	    <ol class="breadcrumb">
	      <li class="breadcrumb-item"><a href="/main/main.do">Home</a></li>
	      <li class="breadcrumb-item">게시판</li>
	      <li class="breadcrumb-item active">공지사항</li>
	    </ol>
	
	    
	    <!-- 검색조건 -->
			<div class="panel">
				<div class="panel-body" style="padding-top: 20px; padding-bottom: 1px;">
					<form id="search-form">
						<div class="form-group row">
							<!-- 등록일 -->
							<label class="col-md-1 col-form-label"><strong>등록일 </strong></label>
							<div class="col-md-5">
								<div class="input-daterange" data-plugin="datepicker">
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> 
												<i class="icon md-calendar" aria-hidden="true"></i>
											</span>
										</div>
										<input type="text" class="form-control" name="search_s_date" />
									</div>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text">-</span>
										</div>
										<input type="text" class="form-control" name="search_e_date" />
									</div>
								</div>
							</div>
							<!-- 검색어 -->
							<label class="col-md-1 col-form-label"><strong>검색어 </strong></label>
							<div class="col-md-5">
								<div class="input-group">
									<div class="input-group-prepend w-p25">
										<select data-plugin="selectpicker" name="search_type">
											<option value="" selected>선택</option>
											<option value="title">제목</option>
											<option value="content">내용</option>
											<option value="create_user">작성자</option>
										</select>
									</div>
									<!-- <input type="text" class="form-control"> -->
									<input type="text" class="form-control" name="search" placeholder="검색어를 입력하세요." onkeyup="enterKey()"> 
								</div>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-lg-12">
								<button type="button" class="btn btn-primary btn-outline float-right waves-effect waves-classic" id="searchBtn">검색 </button>
							</div>
						</div>
					</form>
				</div>
			</div>
			
	    	<div class="panel">
		        <header class="panel-heading">
		        	<div class="panel-actions"></div>
		        </header>
		        <br/>
		        <div class="panel-body" style="padding-top: 20px; padding-bottom: 1px;">
		        	<div id="boardListTable" class="text-break"></div>
		        </div>
		        	<div class="col-lg-12">
		        	<div class="example example-buttons">  
		          		<div>
		          			<button class="btn btn-primary btn-outline float-right waves-effect waves-classic" id="noticeRegistButton">등록</button>
		          		</div>
		          	</div>
		        </div>
		   	</div>
	  
	</div>
<!-- End Page -->
</div>
<script type="text/javascript">
function setBoardListTable(BoardList) {
	$('#boardListTable').jsGrid({
	    //height: "500px",
	    width: "100%",

	    //autoload:true,
	    sorting: true,
	    paging: true,
	    //pageIndex: 1, default: 1
	    pageSize: 10, // default: 20
		//pageButtonCount: 5, default: 15
	    
	    data: BoardList,

	    fields: [
	    	{name: "num",title: "번호", type: "text", width: 40, align: "center"},
	    	{name: "create_user", title: "작성자", type: "text", width: 60},
	    	{name: "title", title: "제목", type: "text", width: 150}, 
	    	{title: "내용", width: 200,	    		
				itemTemplate: function(_, item) {
	    			var result="";
	    			if(item.content.length > 30){
	    				result = item.content.substring(0,30)+'...';		    				
	    			}else{
	    				result = item.content;
	    			}
	    			
	    			if(item.attach_count > 0){
	    				result +='&nbsp;&nbsp;<i class="icon wb-file" aria-hidden="true"></i>';
	    			}
	    			
	    			return result;
	    		}
	    	}, 
	    	{name: "create_date", title: "등록일", type: "text", width: 100, align: "center"},
	    	{name: "view_count", title: "조회수", type: "text", width: 50, align: "center"}
    	],
    	
    	rowClick: function(args) {
    		var idx = args.item.notice_idx;
    		
    		location.href = "${pageContext.request.contextPath}/board/boardDetail.do?notice_idx=" + idx;
    	}
	});
}
	
	$("#noticeRegistButton").click(function() {
		location.href = "${pageContext.request.contextPath}/board/boardWrite.do";
	});
	
	function getBoardList() {
		var request = $.ajax({
			url: "/board/getBoardList.do",
			method: "get",
			data: $("#search-form").serialize()
		});
		
		request.done(function(data) {
			setBoardListTable(data);
		});
		
		request.fail(function(error) {
			console.log(error);
		});
	}
	
	$(function() {
		var today = formatDate(new Date());
		var preday = formatPreDate(new Date());
		console.log(today);
		$("input[name='search_s_date']").val(preday);
		$("input[name='search_e_date']").val(today);
		getBoardList();
	});
	
	$("#searchBtn").click(function() {
		

		getBoardList();
	});

	function enterKey() {
		if (window.event.keyCode === 13) {
			getBoardList();
		}
	}
	
	
</script>
