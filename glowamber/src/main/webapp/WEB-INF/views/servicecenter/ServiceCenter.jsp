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
<!-- js파일연결 -->
<script type="text/javascript"
	src="/glowamber/resources/js/ServiceCenter.js"></script>
	<script type="text/javascript">	let tab = '${param.tab}'</script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../headerfooter/Header.jsp" />
	<!-- 헤더 -->
	<!-- 바디컨테이너 시작 -->
	<div class="container" id="body_container">

		<div class="row">
			<!-- 좌측 탭 시작 -->
			<div class="col-3" id="menu_container">
				<div class="col-12" style="margin-bottom: 30px;">
					<h2 style="font-weight: 600;">고객센터</h2>
				</div>
				<div class="col-12 tap-style d-flex justify-content-between notice"
					style="border-bottom: none;">
					<span>공지사항</span><i class="bi bi-caret-right"></i>
				</div>
				<div
					class="col-12 tap-style d-flex justify-content-between question"
					style="border-bottom: none;">
					<span>자주하는 질문</span><i class="bi bi-caret-right"></i>
				</div>
				<div class="col-12 tap-style d-flex justify-content-between mtom">
					<span>1:1 문의</span><i class="bi bi-caret-right"></i>
				</div>
			</div>
			<!-- 좌측 탭 끝 -->

			<!-- 게시판 본문 시작 -->
			<div class="col-9" id="borad_container">
				<div class="col-12" style="margin-bottom: 33px;">
					<h3 class="body_title">공지사항</h3>
				</div>
				<div class="col-12">
					<hr style="border: 0; height: 2px; background: #444; opacity: 100%" />
				</div>
				<div class="col-12 board_title">
					<div class="row text-center">
						<div class="col-2">번호</div>
						<div class="col-6">제목</div>
						<div class="col-2">작성자</div>
						<div class="col-2">작성일</div>
					</div>
				</div>
				<!-- hr -->
				<div class="col-12">
					<hr style="border: 0; height: 1px; background: #444; opacity: 100%" />
				</div>
				<!-- hr -->
				<div class="col-12 board_content"></div>
				<!-- hr -->
				<div class="col-12">
					<hr />
				</div>
				<!-- hr -->
				<div class="col-12 text-center" id="page_button">
					<a href=""><i class="bi bi-chevron-left fs-3"></i></a> <a href=""><i
						class="bi bi-chevron-right fs-3"></i></a>
				</div>
			</div>
			<!-- 게시판 본문 끝 -->

		</div>

	</div>
	<!-- 바디컨테이너 끝 -->

	<!-- 풋터 -->
	<jsp:include page="../headerfooter/Footer.jsp" />
	<!-- 풋터 -->


</body>
</html>