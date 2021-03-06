<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="advanced search custom, agency, agent, business, clean, corporate, directory, google maps, homes, listing, membership packages, property, real estate, real estate agent, realestate agency, realtor">
<meta name="description" content="FindHouse - Real Estate HTML Template">
<meta name="CreativeLayers" content="ATFN">
<!-- css file -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chartist/chartist.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/e-daul.css">
<!-- Responsive stylesheet -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
<!-- Title -->
<title>e-다울마당</title>
<!-- Favicon -->
<link href="${pageContext.request.contextPath}/images/favicon.png" sizes="128x128" rel="shortcut icon" type="image/x-icon" />
<link href="${pageContext.request.contextPath}/images/favicon.png" sizes="128x128" rel="shortcut icon" />

<!-- Script -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.mmenu.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ace-responsive-menu.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/isotop.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/snackbar.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/simplebar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/parallax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/scrollto.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-scrolltofixed-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.counterup.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/wow.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/slider.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/timepicker.js"></script>
<!-- Custom script for all pages --> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/script.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/chartist.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/progressbar.js"></script>




<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script type="text/javascript">
	var CTX = "${pageContext.request.contextPath}";
	
	Kakao.init('972ec73374a2119054f2120585980a8a');
	
	if (!Element.prototype.matches) {
	  Element.prototype.matches = Element.prototype.msMatchesSelector || 
	                              Element.prototype.webkitMatchesSelector;
	}

	if (!Element.prototype.closest) {
	  Element.prototype.closest = function(s) {
	    var el = this;

	    do {
	      if (el.matches(s)) return el;
	      el = el.parentElement || el.parentNode;
	    } while (el !== null && el.nodeType === 1);
	    return null;
	  };
	}
	
	(function (arr) {
	  arr.forEach(function (item) {
	    if (item.hasOwnProperty('after')) {
	      return;
	    }
	    Object.defineProperty(item, 'after', {
	      configurable: true,
	      enumerable: true,
	      writable: true,
	      value: function after() {
	        var argArr = Array.prototype.slice.call(arguments),
	          docFrag = document.createDocumentFragment();
	        
	        argArr.forEach(function (argItem) {
	          var isNode = argItem instanceof Node;
	          docFrag.appendChild(isNode ? argItem : document.createTextNode(String(argItem)));
	        });
	        
	        this.parentNode.insertBefore(docFrag, this.nextSibling);
	      }
	    });
	  });
	})([Element.prototype, CharacterData.prototype, DocumentType.prototype]);
	
	function getParameterByName(name) {
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
		var results = regex.exec(location.search);
		return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}

	function formatDate(date) { 
		var d = new Date(date), 
			month = '' + (d.getMonth() + 1), 
			day = '' + d.getDate(), 
			year = d.getFullYear(); 
		if (month.length < 2) month = '0' + month; 
		if (day.length < 2) day = '0' + day; 
		return [year, month, day].join('-'); 
	}

	function formatPreDate(date) { 
		var d = new Date(date), 
			month = '' + (d.getMonth() - 2 ), 
			day = '' + d.getDate(), 
			year = d.getFullYear(); 
		if (month.length < 2) month = '0' + month; 
		if (day.length < 2) day = '0' + day; 
		return [year, month, day].join('-'); 
	}
	
	function submitConfirm($type) {
		var type = $type.text();
		var title = $type.data("title");
		var msg = "";
		
		if (title !== undefined) msg += title + "을(를) ";
		msg += type + "하시겠습니까?";
		
		if (!confirm(msg)) return false;
		else return true;
	}
	
	var login_user_id = "${login.user_id}";
	
	function gotoLoginPage() {
		if (!confirm("로그인이 필요한 기능입니다.\n로그인 페이지로 이동하시겠습니까?")) return false;
		
		location.href="${pageContext.request.contextPath}/login/loginPage.do";
	}
	
	var sms_auth_pop = null;
</script>
