<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
							<span class="status_tag outline-primary">공모진행중</span>
							<span class="status_tag default">공모종료</span>
						</div>
						<h4>“코로나19 우리 함께 이겨내요”</h4>
						<p class="date">
							<b>공모기간</b> | 2020.05.07 ~2020.05.21
						</p>
						<p class="date">
							<b>접수기간</b> | 2020.05.07 ~2020.05.21
						</p>
					</div>
					<hr />
					<div class="content">
						<p>지방정부의 관광산업이 침체된 것은 콘텐츠의 부족이 아닙니다.</p>
						<p>지방정부에서 이미 갖추고 있는 특성화 사업과 특산품 가공 및 기술에 대한 비즈니스 기반은 해외관광객 유치를 위한 테마관광 콘텐츠 개발이 가능합니다. 우수기업의 방문,견학을 통한 비즈니스 상담과 기술제휴 등 지역의 특성화 상품개발과 제조과정 및 유통까지를 포함하는 경제 중심 테마관광 콘텐츠의 개발과 활용을 기대합니다.</p>
					</div>
					<div class="files">
						<a href="#">
							<span class="fa-file-o mr10"></span>
							미리보는 전라북도 2030.pdf
						</a>
						<br>
						<a href="#">
							<span class="fa-file-o mr10"></span>
							미리보는 전라북도 2030.pdf
						</a>
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