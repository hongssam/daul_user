<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<nav class="site-navbar navbar navbar-default navbar-fixed-top navbar-mega" role="navigation">
  <div class="navbar-header">
    <button type="button" class="navbar-toggler hamburger hamburger-close navbar-toggler-left hided"
      data-toggle="menubar">
      <span class="sr-only">Toggle navigation</span>
      <span class="hamburger-bar"></span>
    </button>
    <button type="button" class="navbar-toggler collapsed" data-target="#site-navbar-collapse"
      data-toggle="collapse">
      <i class="icon md-more" aria-hidden="true"></i>
    </button>
    <div class="navbar-brand navbar-brand-center site-gridmenu-toggle" data-toggle="gridmenu">
      <img class="navbar-brand-logo" src="${pageContext.request.contextPath}/images/logo.png" title="Remark">
      <span class="navbar-brand-text hidden-xs-down"> Daul</span>
    </div>
    <button type="button" class="navbar-toggler collapsed" data-target="#site-navbar-search"
      data-toggle="collapse">
      <span class="sr-only">Toggle Search</span>
      <i class="icon md-search" aria-hidden="true"></i>
    </button>
  </div>

  <div class="navbar-container container-fluid">
    <!-- Navbar Collapse -->
    <div class="collapse navbar-collapse navbar-collapse-toolbar" id="site-navbar-collapse">
      <!-- Navbar Toolbar Right -->
      <ul class="nav navbar-toolbar navbar-right navbar-toolbar-right">
        <c:if test="${not empty login}">
        	<li class="nav-item hidden-float">
	        	<span class="nav-link"><c:out value="${login.email}"/></span>
        	</li>
        	<li class="nav-item hidden-float" id="testLoginBtn">
	        	<a class="nav-link" data-toggle="loginBtn" href="/login/logout.do" role="button">
	        		<i class="icon md-power"></i> Logout
	        	</a>
	        </li>
        </c:if>
        <c:if test="${empty login}">
	        <li class="nav-item hidden-float">
	        	<a class="nav-link" data-toggle="modal" data-target="#examplePositionCenter" href="#" id="nav-login" role="button">
		       		<i class="icon md-power"></i> Login
		       	</a>
	        </li>
        </c:if>
      </ul>
      <!-- End Navbar Toolbar Right -->
    </div>
    <!-- End Navbar Collapse -->

    <!-- Site Navbar Seach -->
    <div class="collapse navbar-search-overlap" id="site-navbar-search">
      <form role="search">
        <div class="form-group">
          <div class="input-search">
            <i class="input-search-icon md-search" aria-hidden="true"></i>
            <input type="text" class="form-control" name="site-search" placeholder="Search...">
            <button type="button" class="input-search-close icon md-close" data-target="#site-navbar-search"
              data-toggle="collapse" aria-label="Close"></button>
          </div>
        </div>
      </form>
    </div>
    <!-- End Site Navbar Seach -->
  </div>
</nav>
<div class="modal fade" id="examplePositionCenter" aria-hidden="true" aria-labelledby="examplePositionCenter" role="dialog" tabindex="-1">
  <div class="modal-dialog modal-simple modal-center">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">x</span>
        </button>
        <h4 class="modal-title">Login</h4>
      </div>
      <div class="modal-body">
        <form id="nav-login-form">
        	<div class="form-group form-material floating" data-plugin="formMaterial">
        		<input type="text" class="form-control" name="email" id="nav_email"/>
        		<label class="floating-label">Id</label>
        	</div>
        	<div class="form-group form-material floating" data-plugin="formMaterial">
        		<input type="password" class="form-control" name="pw" id="nav_pw"/>
        		<label class="floating-label">Password</label>
        	</div>
        	<span class="text-left" id="chk-error"></span>
        	<button type="button" class="btn btn-primary btn-block btn-lg mt-40" id="nav-login-btn">Sign in</button>
        </form>
        <p class="text-right">Still no account? Please go to <a href="/user/signUpPage.do">Sign up</a></p>
      </div>
      <div class="modal-footer">
        <!-- <button type="button" class="btn btn-default btn-pure" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>
<!-- End Modal -->

<script type="text/javascript">

	
	$(function() {
		
		if (getParameterByName("chk") === "1") {
			$("#nav-login").trigger("click");
		}
		
		$("#nav_email").keydown(function(key) {
			if (key.keyCode === 13) {
				login();
			}
		});
		
		$("#nav_pw").keydown(function(key) {
			if (key.keyCode === 13) {
				login();
			}
		});
		
		$("#nav-login-btn").click(function() {
			login();
		});
	});

	function login() {
		var request = $.ajax({
			url: "/login/login.do",
			method: "post",
			//contentType: "application/json",
			//dataType: "json",
			data: $("#nav-login-form").serialize()
		});
		request.done(function(data) {
			console.log(data);
			console.log("request done");
			
			if (data === "success") {
				location.href = "${pageContext.request.contextPath}/main/main.do";
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
	

	
	
</script>