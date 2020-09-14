<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Subpage Nav Tabs -->
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first">
				<a href="/contest/contestListPage.do?order=1">공모제안</a>
			</div>
			<div class="wizard-item last active">
				<a href="/contest/contestNoticeListPage.do">공지사항</a>
			</div>
		</div>
	</div>
</div>


<!-- Notice Detail Section -->
<section class="notice-detail-section bgc-fa">
	<div class="container">
		<div class="row">
			<div class="col-lg-10 offset-lg-1">
				<div class="board-detail-table">
					<div class="table-responsive mt0">
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col" class="text-left">${contestNoticeVo.title}</th>
									<th scope="col" class="text-right board-info">${contestNoticeVo.name} | ${contestNoticeVo.create_date} | 조회 ${surveyNoticeVo.view_count}</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="text-left board-content" colspan="2">
										<div style="min-height: 224px;">
											<img src="images/board-sample.png" class="w-75" />
											<br>
											${contestNoticeVo.content}
										</div>
									</td>
								</tr>
								<tr>
									<td class="text-left board-file" colspan="2">
										<a href="#">
											<span class="fa-file-o mr10"></span>
											미리보는 전라북도 2030.pdf
										</a>
										<br>
										<a href="#">
											<span class="fa-file-o mr10"></span>
											미리보는 전라북도 2030.pdf
										</a>
									</td>
								</tr>
								<tr>
									<td class="text-left board-nav" colspan="2">
										<a href="#">
											<span class="fa-caret-up mr10">&nbsp;&nbsp;&nbsp;윗글</span>
											미리보는 전라북도 2030.pdf
										</a>
										<hr>
										<a href="#">
											<span class="fa-caret-down mr10">&nbsp;&nbsp;&nbsp;아래글</span>
											'20년 폭염대책 효과적인 지원방안 설문참여 당첨자 안내
										</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="board-btns text-center">
						<button type="submit" class="btn btn-default" onclick="location.href='/contest/contestNoticeListPage.do'">목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
