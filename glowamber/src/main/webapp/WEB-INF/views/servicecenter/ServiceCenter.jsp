<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ServiceCenter</title>
<link href="/glowamber/resources/css/ServiceCenter.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript"
	src="/glowamber/resources/js/MtomService.js"></script>
<!-- 부트스트랩 아이콘CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- 부트스트랩css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- 부트스트랩 js -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../headerfooter/Header.jsp" />
	<!-- 헤더 -->

	<div class="container" id="dd">
		<div class="row">
			<!-- 고객센터 버튼 -->
			<div class="col-2">
				<div class="row service_center">
					<div class="center_h">고객센터</div>
					<div class="ser_rec  ">

						<ul class="nav nav-tabs flex-column" id="myTab" role="tablist">

							<div class="row rec_ser">
								<div class="col-12">
									<li class="nav-item" role="presentation">
										<button class="nav-link active" id="notice-tab"
											data-bs-toggle="tab" data-bs-target="#notice" type="button"
											role="tab" aria-controls="notice" aria-selected="true">공지사항</button>
									</li>
								</div>
							</div>
							<div class="row rec_ser">
								<div class="col">
									<li class="nav-item" role="presentation">
										<button class="nav-link " id="question-tab"
											data-bs-toggle="tab" data-bs-target="#question" type="button"
											role="tab" aria-controls="question" aria-selected="false">자주하는
											질문</button>
									</li>
								</div>
							</div>
							<div class="row rec_ser">
								<div class="col">
									<li class="nav-item" role="presentation">
										<button class="nav-link " id="mtom-tab" data-bs-toggle="tab"
											data-bs-target="#mtom" type="button" role="tab"
											aria-controls="mtom" aria-selected="false">1:1 문의</button>
									</li>
								</div>
							</div>
						</ul>
					</div>
				</div>
			</div>
			<!-- tab content -->
			<div class="col-10">
				<div class="tab-content" id="myTabContent">
					<div class="row sc_board tab-pane fade show active" role="tabpanel"
						aria-labelledby="notice-tab" id="notice">
						<div class="board_h">공지사항</div>
						<hr />
						<div class="row head_line">

							<div class="col-1">번호</div>
							<div class="col-7">제목</div>
							<div class="col-2">작성자</div>
							<div class="col-2">날짜</div>

						</div>
						<hr />
						<div class="row board_line">
							<div class="col-1">번호</div>
							<div class="col-7">제목</div>
							<div class="col-2">작성자</div>
							<div class="col-2">날짜</div>

						</div>
						<hr />
						<div class="row">

							<div class=" ak">
								<a href="" id="left"><i class="bi bi-chevron-left"></i></a> <a
									href="" id="right"><i class="bi bi-chevron-right"></i></a>
							</div>
						</div>
						<div class="row">
							<button><a href="NoticeWriter">글쓰기</a></button>
						</div>

					</div>

					<div class="row sc_question tab-pane fade " role="tabpanel"
						aria-labelledby="question-tab" id="question">
						<div class="board_h">자주하는 질문</div>
						<hr />
						<div class="row head_line">

							<div class="col-1">번호</div>
							<div class="col-3">카테고리</div>
							<div class="col-8">제목</div>


						</div>
						<hr />
						<div class="">
							<div class="row board_line">
								<div class="col-1">번호</div>
								<div class="col-3">카테고리</div>
								<div class="col-8">제목</div>


							</div>
							<hr />
							<div class="ak">
								<a href="" id="left_1"><i class="bi bi-chevron-left"></i></a> <a
									href="" id="right_1"><i class="bi bi-chevron-right"></i></a>
							</div>
						</div>
					</div>

					<div class="row sc_mtom tab-pane fade " role="tabpanel"
						aria-labelledby="mtom-tab" id="mtom">
						<div class="board_h">1:1 문의</div>
						<hr />
						<div class="row head_line">

							<div class="col-6">제목</div>
							<div class="col-3">작성일</div>
							<div class="col-3">답변상태</div>


						</div>
						<hr />
						<div class="">
							<div class="row board_line">
								<div class="col-6">제목</div>
								<div class="col-3">작성일</div>
								<div class="col-3">답변상태</div>


							</div>
							<hr />
							<div class="qna">
								<button>
									<a href="/glowamber/servicecenter/Mtom">문의하기</a>
								</button>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS (for interactive tabs) -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- 풋터 -->
	<jsp:include page="../headerfooter/Footer.jsp" />
	<!-- 풋터 -->


</body>
</html>