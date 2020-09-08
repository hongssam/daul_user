<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!-- Subpage Nav Tabs -->
<div class="nav-tabs style2 bgc-fa">
	<div class="container">
		<div class="wizard">
			<div class="wizard-item first active">
				<a href="/contest/conestListPage.do">공모제안</a>
			</div>
			<div class="wizard-item last">
				<a href="">공지사항</a>
			</div>
		</div>
	</div>
</div>

<!-- Suggest Detail Section -->
<section class="suggest-detail-section bgc-fa">
	<div class="container">
		<div class="row">
			<div class="col-lg-10 offset-lg-1">
				<div class="ed-content">
					<div class="title">
						<div class="tag">
							<c:if test="${contestVo.ing eq '공모진행중' }">
								<span class="status_tag outline-primary">${contestVo.ing }</span>
							</c:if>
							<c:if test="${contestVo.ing eq '공모전' }">
								<span class="status_tag default">${contestVo.ing }</span>
							</c:if>
							<c:if test="${contestVo.ing eq '공모종료' }">
								<span class="status_tag default">${contestVo.ing }</span>
							</c:if>
						</div>
						<h4>${contestVo.title}</h4>
						<p class="date">
							<b>공모기간</b> | ${contestVo.contest_s_date} ~${contestVo.contest_e_date}
						</p>
						<p class="date">
							<b>접수기간</b> | ${contestVo.submit_s_date} ~${contestVo.submit_e_date}
						</p>
					</div>
					<hr />
					<div class="content">
						<p>${contestVo.content}</p>
					</div>
					<div class="files" id="file-list">
					</div>
					<div class="bottom">
						<button class="btn btn-primary btn-survey" data-toggle="modal" data-target=".contest-edit-modal">
							<i class="fa-comments-o"></i>
							공모 참여하기
						</button>
						<button class="btn btn-dark btn-survey" data-toggle="modal" data-target=".contest-edit-modal">
							<i class="fa-edit"></i>
							내 제안 보기
						</button>
					</div>
				</div>
			</div>
			<div class="col-lg-10 offset-lg-1">
				<div class="board-table mt20">
					<p>총 126건의 공모가 있습니다.</p>
					<div class="table-responsive mt0">
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col">번호</th>
									<th scope="col">작성자</th>
									<th scope="col">제안명</th>
									<th scope="col">작성일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="text-center">1</td>
									<td class="text-center">홍OO</td>
									<td>미리보는 대한민국의 미래는?</td>
									<td class="text-center">2020.08.21</td>
								</tr>
								<tr>
									<td class="text-center">2</td>
									<td class="text-center">홍OO</td>
									<td>미리보는 대한민국의 미래는?</td>
									<td class="text-center">2020.08.21</td>
								</tr>
								<tr>
									<td class="text-center">3</td>
									<td class="text-center">홍OO</td>
									<td>미리보는 대한민국의 미래는?</td>
									<td class="text-center">2020.08.21</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="table-nav">
						<ul class="page-navigation">
							<li class="page-item disabled">
								<a class="page-link" href="#">
									<span class="fa-angle-double-left"></span>
								</a>
							</li>
							<li class="page-item disabled">
								<a class="page-link" href="#">
									<span class="fa-angle-left"></span>
								</a>
							</li>
							<li class="page-item text">
								<a class="page-link" href="#">1</a>
							</li>
							<li class="page-item text active" aria-current="page">
								<a class="page-link" href="#">2</a>
							</li>
							<li class="page-item text">
								<a class="page-link" href="#">3</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">
									<span class="fa-angle-right"></span>
								</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">
									<span class="fa-angle-double-right"></span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Contest Modal -->
<div class="contest-edit-modal modal fade " tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<p>공모제안</p>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<h4 class="title">“코로나19 우리 함께 이겨내요”</h4>
				<hr>
				<div class="board-detail-table edit-style">
					<div class="caption">
						<ul>
							<li>
								<i>&#149;</i>
								공모신청서 양식을 다운로드하지 않으신 분은 다운받아 작성하시기 바랍니다.
							</li>
							<li>
								<i>&#149;</i>
								제안 제시기준에 맞지 않는 부적절한 게시물은 이동 또는 삭제 조치됩니다.
							</li>
							<li>
								<i>&#149;</i>
								<span class="color-red ml5">*</span>
								표시는 필수 입력입니다.
							</li>
						</ul>
					</div>
					<div class="table-responsive mt0">
						<table class="table">
							<tbody>
								<tr>
									<td class="text-left board-content">
										<div class="form-group row">
											<div class="col-lg-2">
												<label>제목<span class="color-red ml5">*</span></label>
											</div>
											<div class="col-lg-10">
												<input type="text" class="form-control" placeholder="">
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td class="text-left board-file">
										<div class="form-group row">
											<div class="col-lg-2">
												<label>제안서<span class="color-red ml5">*</span></label>
											</div>
											<div class="col-lg-10">
												<span class="color-red ml5">※ 반드시 공모신청서 양식을 다운로드 받아 작성하여 올려주세요.</span>
												<input type="file" class="form-control" placeholder="">
												<p class="first">
													<a href="#">
														<span class="fa-file-o mr10"></span>
														미리보는 전라북도 2030.pdf
													</a>
													<button class="btn btn-pure">
														<span class="fa-trash-o"></span>
													</button>
												</p>
												<p>
													<a href="#">
														<span class="fa-file-o mr10"></span>
														미리보는 전라북도 전라북도 2030.pdf
													</a>
													<button class="btn btn-pure">
														<span class="fa-trash-o"></span>
													</button>
												</p>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="board-btns text-center">
						<button type="submit" class="btn btn-primary">등록</button>
						<button type="button" class="btn btn-default">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var fileList = new Array();
	
	<c:forEach var="file" items="${fileList}">
		var file = {};
		file.contest_idx 	= "${file.admin_contest_idx}";
		file.org_file_name 	= "${file.org_file_name}";
		file.save_file_name = "${file.save_file_name}";
		file.file_size 		= "${file.file_size}";
		file.create_user 	= "${file.create_user}";
		file.del_chk 		= "${file.del_chk}";
		file.attach_type 	= "${file.attach_type}";
		fileList.push(file);
	</c:forEach>	
	
	console.log(fileList);
	
	if (fileList.length > 0) {
		for (var file of fileList) {
			if (file.attach_type.indexOf("contest") > -1) {
				var str = 	'<a href="#">'
						+	'	<span class="fa-file-o mr10"></span>'
						+	file.org_file_name
						+	'</a>'
						+   '<br>';
				$("#file-list").append(str);
			} else if (file.attach_type.indexOf("prop") > -1) {
				var str =	'<a href="#">'
						+	'	<span class="fa-file-o mr10"></span>'
						+	file.org_file_name
						+	'</a>'
						+   '<br>';
				$("#file-list").append(str);
			} else if (file.attach_type.indexOf("rep") > -1){
			}
		}
	}
	
</script>