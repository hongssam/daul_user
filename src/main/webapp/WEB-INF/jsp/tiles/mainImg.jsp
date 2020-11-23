<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<section id="main_img_section"></section>
<div>
	<input type="hidden" id="session_id" value="${login.user_id }">
</div>
<script type="text/javascript">
	var pathname = window.location.pathname;

	var main_img_section = document.getElementById("main_img_section");
	if (pathname.indexOf("main") > -1 || pathname.length == 1) {
		if (pathname.indexOf("privacy") > -1 || pathname.indexOf("provision") > -1) {
			main_img_section.classList.add("inner_page_breadcrumb", "style2");

			var div = '<div class="container">' + 
					  	'<div class="row posr">' + 
					  		'<div class="col-12">' + 
			 	      			'<div class="breadcrumb_content">' + 
			      	  				'<h4 class="fz55">' + '시민 참여 소통 플랫폼' + 
					  					'<span class="focus-text">e-다울마당</span>' + 
				  	  					'<br>여러문의 목소리가 전주시를 바꾸는 정책이 됩니다.' +
				  	  				'</h4>'+
				      				'<button type="button" class="btn btn-lg btn-thm banner-btn" onclick="goSuggestionRegist()">제안하기</button>' + 
					 			 '</div>' + 
					  		'</div>' + 
				      	'</div>' + 
					  '</div>';

			main_img_section.innerHTML = div;	
		} else {
			main_img_section.classList.add("home-seven");
	
			var div = 
				'<section class="inner_page_breadcrumb style2">'+
				'<div class="container">' + 
					'<div class="row posr">' + 
						'<div class="col-12">' + 
							'<div class="home_content home7">' + 
								'<div class="home-text text-center">' +
									'<h2 class="fz55 hidden-sm-down">시민 참여 소통 플랫폼 <span class="focus-text">e-다울마당</span><br><span class="sub-text">여러문의 목소리가 전주시를 바꾸는 정책이 됩니다.</span></h2>' + 
									'<h4 class="fz55 hidden-sm-up">시민 참여 소통 플랫폼<br><span class="focus-text">e-다울마당</span></h4>' +
									'<button type="button" class="btn btn-lg btn-thm banner-btn" onclick="goSuggestionRegist()">제안하기</button>' + 
								'</div>' + 
							'</div>' +
						'</div>' + 
					'</div>' + 
				'</div>'+
				'</style>';
	
			main_img_section.innerHTML = div;
		}
	} else if (pathname.indexOf("login") > -1) {
		main_img_section.classList.add("inner_page_breadcrumb", "style1");

		var div = '<div class="container">' + '<div class="breadcrumb_content">' + '<h4 class="breadcrumb_title">로그인</h4>' + '</div>' + '</div>';

		main_img_section.innerHTML = div;
	}else if (pathname.indexOf("user/idInquiryPage") > -1) {
		main_img_section.classList.add("inner_page_breadcrumb", "style1");

		var div = '<div class="container">' + '<div class="breadcrumb_content">' + '<h4 class="breadcrumb_title">아이디 찾기</h4>' + '</div>' + '</div>';

		main_img_section.innerHTML = div;
	}else if (pathname.indexOf("user/pwInquiryPage") > -1) {
		main_img_section.classList.add("inner_page_breadcrumb", "style1");

		var div = '<div class="container">' + '<div class="breadcrumb_content">' + '<h4 class="breadcrumb_title">비밀번호 찾기</h4>' + '</div>' + '</div>';

		main_img_section.innerHTML = div;
	} else if (pathname.indexOf("user") > -1) {
		if (pathname.indexOf("mypage") > -1) {
			main_img_section.remove();
		} else {
			 main_img_section.classList.add("inner_page_breadcrumb", "style1");
	
			var div = '<div class="container">' + '<div class="breadcrumb_content">' + '<h4 class="breadcrumb_title">회원가입</h4>' + '</div>' + '</div>';
	
			main_img_section.innerHTML = div;			
		}
	} else {
		main_img_section.classList.add("inner_page_breadcrumb", "style2");
	
		var div = 
			'<section class="inner_page_breadcrumb style2">'+
			'<div class="container">' + 
				  	'<div class="row posr">' + 
				  		'<div class="col-12">' + 
				      			'<div class="breadcrumb_content">' + 
			  	  				'<h4 class="fz55">' + '시민 참여 소통 플랫폼' + 
				  					'<span class="focus-text">e-다울마당</span>' + 
			  	  					'<br>여러문의 목소리가 전주시를 바꾸는 정책이 됩니다.' +
			  	  				'</h4>'+
			      				'<button type="button" class="btn btn-lg btn-thm banner-btn" onclick="goSuggestionRegist()">제안하기</button>' + 
				 			 '</div>' + 
				  		'</div>' + 
			      	'</div>' + 
				  '</div>'+
					'</style>';
		main_img_section.innerHTML = div;
	}

	function goSuggestionRegist() {
		var session_id = $("#session_id").val();
		if(session_id == '' || session_id == null){
			gotoLoginPage();
		}else{
			location.href = "${pageContext.request.contextPath}/suggestion/suggestionRegistPage.do";
		}
	}
</script>