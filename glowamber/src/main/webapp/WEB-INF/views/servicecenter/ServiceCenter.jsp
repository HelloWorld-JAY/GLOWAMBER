<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ServiceCenter</title>
<link href="resources/css/ServiceCenter.css" rel="stylesheet">
<!-- 부트스트랩 아이콘CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
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
					<div class="ser_rec">
						<div class="row rec_ser">
							<div class="col-12">
								<button>공지사항</button>
							</div>
						</div>
						<div class="row rec_ser">
							<div class="col">
								<button>자주하는 질문</button>
							</div>
						</div>
						<div class="row rec_ser">
							<div class="col">
								<button>1:1 문의</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-10">

				<div class=" sc_board" id="notice">
					<div class="board_h">공지사항</div>
					<hr />
					<div class="row head_line">

						<div class="col-1">번호</div>
						<div class="col-7">제목</div>
						<div class="col-2">작성자</div>
						<div class="col-2">날짜</div>

					</div>
					<hr />
					<div class="">
						<div class="row board_line">
							<div class="col-1">번호</div>
							<div class="col-7">제목</div>
							<div class="col-2">작성자</div>
							<div class="col-2">날짜</div>

						</div>
						<hr />
						<div class="ak">
							<a href="" id="left"><i class="bi bi-chevron-left"></i></a> <a
								href="" id="right"><i class="bi bi-chevron-right"></i></a>
						</div>
					</div>

				</div>
				<div class="row sc_question" id="question">
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
							<a href="" id="left"><i class="bi bi-chevron-left"></i></a> <a
								href="" id="right"><i class="bi bi-chevron-right"></i></a>
						</div>
					</div>
				</div>
				<div class="row sc_mtom" id="mtom">
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
							<button>문의하기</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>


	<!-- 풋터 -->
	<jsp:include page="../headerfooter/Footer.jsp" />
	<!-- 풋터 -->
</body>
</html>