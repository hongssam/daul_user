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

<!-- Listing Grid Section -->
<section class="suggest-list-section bgc-fa mt0 pt0">
	<div class="container mt0">
		<div class="grid-list-header row">
			<div class="col-lg-6">
				<ul class="sort-type text-left">
					<li class="active">최신 순</li>
					<li>참여자 많은 순</li>
					<li>의견 많은 순</li>
				</ul>
			</div>
			<div class="col-lg-6">
				<div class="candidate_revew_select text-right">
					<div class="select-search-type">
						<select class="selectpicker show-tick" data-width="100%">
							<option>제목</option>
							<option>작성자</option>
						</select>
					</div>
					<div class="input-search">
						<i class="icon input-search-close flaticon-magnifying-glass" aria-hidden="true"></i>
						<input type="text" class="form-control" name="" placeholder="검색...">
					</div>
				</div>
			</div>
		</div>
		<div class="grid-list row">
			<div class="grid-item col-12">
				<div class="feat_property list style2" onclick="location.href='${pageContext.request.contextPath}/contest/contestDetailPage.do'">
					<div class="thumb">
						<img class="img-whp" src="${pageContext.request.contextPath}/images/property/fp1.jpg" alt="fp1.jpg">
					</div>
					<div class="details">
						<div class="tc_content">
							<div class="dtls_headr">
								<span class="status_tag outline-primary">공모진행중</span>
							</div>
							<h4>“코로나19 우리 함께 이겨내요”</h4>
							<p class="content">제4차 전라북도 종합계획(2021~2040)은 국가의 최상위 국토계획인 ‘제5차 국토종합계획 (2020~2040)’에서 제시한 국토관리 전략 및 정책방향을 따르면서 지역의 특성 및 여건을 반영하여 전라북도의 특성화된 발전을 유도하기 위한 장기발전계획입니다. 여러분이 생각하는 전라북도 적극행정 우수사례 2건을 직접 골라주세요! (도 1건, 시군 1건 선택)</p>
							<p class="date">
								<b>공모기간</b> | 2020.05.07 ~2020.05.21
							</p>
							<p class="date">
								<b>접수기간</b> | 2020.05.07 ~2020.05.21
							</p>

							<div class="bottom">
								<span class="item">
									<span class="icon flaticon-user"></span>
									참여 15
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="grid-item col-12">
				<div class="feat_property list style2" onclick="location.href='${pageContext.request.contextPath}/contest/contestDetailPage.do'">
					<div class="thumb">
						<img class="img-whp" src="${pageContext.request.contextPath}/images/property/fp1.jpg" alt="fp1.jpg">
					</div>
					<div class="details">
						<div class="tc_content">
							<div class="dtls_headr">
								<span class="status_tag default">공모종료</span>
							</div>
							<h4>“코로나19 우리 함께 이겨내요”</h4>
							<p class="content">제4차 전라북도 종합계획(2021~2040)은 국가의 최상위 국토계획인 ‘제5차 국토종합계획 (2020~2040)’에서 제시한 국토관리 전략 및 정책방향을 따르면서 지역의 특성 및 여건을 반영하여 전라북도의 특성화된 발전을 유도하기 위한 장기발전계획입니다. 여러분이 생각하는 전라북도 적극행정 우수사례 2건을 직접 골라주세요! (도 1건, 시군 1건 선택)</p>
							<p class="date">
								<b>공모기간</b> | 2020.05.07 ~2020.05.21
							</p>
							<p class="date">
								<b>접수기간</b> | 2020.05.07 ~2020.05.21
							</p>

							<div class="bottom">
								<span class="item">
									<span class="icon flaticon-user"></span>
									참여 15
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12 mt20">
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
</section>