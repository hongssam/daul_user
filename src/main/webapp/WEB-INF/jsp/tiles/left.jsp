<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="site-menubar site-menubar-dark">
	<div class="site-menubar-body">
		<ul class="site-menu" data-plugin="menu">
			<li class="site-menu-item has-sub">
				<a href="javascript:void(0)">
					<i class="site-menu-icon md-account" aria-hidden="true"></i>
					<span class="site-menu-title">사용자</span>
					<span class="site-menu-arrow"></span>
				</a>
				<ul class="site-menu-sub">
					<li class="site-menu-item">
						<a class="animsition-link" href="/user/userListPage.do?auth_type=public">
							<span class="site-menu-title">일반회원</span>
						</a>
					</li>
					<li class="site-menu-item">
						<a class="animsition-link" href="/user/userListPage.do?auth_type=admin">
							<span class="site-menu-title">관리자</span>
						</a>
					</li>
				</ul>
			</li>
			<li class="site-menu-item has-sub">
				<a class="animsition-link">
					<i class="site-menu-icon md-twitch" aria-hidden="true"></i>
					<span class="site-menu-title">챗봇</span>
					<span class="site-menu-arrow"></span>
				</a>
				<ul class="site-menu-sub">
					<li class="site-menu-item">
						<a class="animsition-link" href="/chatbot/intentListPage.do">
							<span class="site-menu-title">의도-응답 관리</span>
						</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>
</div>
<script type="text/javascript">
	$("a.animsition-link").each(function(index) {
		var currPathname = window.location.pathname.split("/")[1];
		var pathname = $(this)[0].pathname.split("/")[1];

		if (currPathname === pathname) {
			if (currPathname !== "user") {
				$(this).parents("li.has-sub").addClass("active open");
				$(this).parent().addClass("active");
			} else {
				if (window.location.search.indexOf($(this)[0].search) > -1) {
					$(this).parents("li.has-sub").addClass("active open");
					$(this).parent().addClass("active");
				}
			}
		}
	});
</script>