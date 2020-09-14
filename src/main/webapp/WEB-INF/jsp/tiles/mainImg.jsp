<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<section id="main_img_section">
</section>

<script type="text/javascript">
	var pathname = window.location.pathname;

	var main_img_section = document.getElementById("main_img_section");

	if (pathname.indexOf("main") > -1) {
		main_img_section.classList.add("home-seven");

		var div = 
			'<div class="container">' + 
				'<div class="row posr">' + 
					'<div class="col-lg-10 offset-lg-1">' + 
						'<div class="home_content home7">' + 
							'<div class="home-text text-center">' + 
								'<h2 class="fz55 ">시민 참여 소통 플랫폼 <span class="focus-text">e-다울마당</span><br>여러문의 목소리가 전주시를 바꾸는 정책이 됩니다.</h2>' + 
								'<button type="button" class="btn btn-lg btn-thm banner-btn" onclick="goSuggestionRegist()">제안하기</button>' + 
							'</div>' + 
						'</div>' + 
					'</div>' + 
				'</div>' + 
			'</div>';

		main_img_section.innerHTML = div;
	} else if (pathname.indexOf("login") > -1) {
		main_img_section.classList.add("inner_page_breadcrumb", "style1");
		
		var div = 
			'<div class="container">' +
				'<div class="breadcrumb_content">' +
					'<h4 class="breadcrumb_title">로그인</h4>' +
				'</div>' +
			'</div>';
			
		main_img_section.innerHTML = div;
	} else if (pathname.indexOf("user") > -1) {
		main_img_section.classList.add("inner_page_breadcrumb", "style1");
		
		var div = 
			'<div class="container">' +
				'<div class="breadcrumb_content">' +
					'<h4 class="breadcrumb_title">회원가입</h4>' +
				'</div>' +
			'</div>';
			
		main_img_section.innerHTML = div;
	} else {
		main_img_section.classList.add("inner_page_breadcrumb", "style2");

		var div = 
			'<div class="container">' + 
				'<div class="breadcrumb_content">' + 
					'<h4 class="fz55">' + 
						'시민 참여 소통 플랫폼' + 
						'<span class="focus-text">e-다울마당</span>' + 
						'<br>여러문의 목소리가 전주시를 바꾸는 정책이 됩니다.' + 
					'</h4>' + 
					'<button type="button" class="btn btn-lg banner-btn" onclick="goSuggestionRegist()">제안하기</button>' + 
				'</div>' + 
			'</div>';

		main_img_section.innerHTML = div;
	}
	
	function goSuggestionRegist() {
		location.href = "${pageContext.request.contextPath}/suggestion/suggestionRegistPage.do";
	}
</script>