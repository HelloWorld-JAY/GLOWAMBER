<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 열람 페이지</title>
<link href="/glowamber/resources/css/Notice.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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

	<div class="container notice">

		<div style="font-size: 32px; font-style: normal; margin-top: 40px; margin-bottom: 40px; text-align: center; font-weight: bold;">공지사항
		</div>
		<hr>
		<div class="row">
			<div class="col-12">

				<div class="row">
					<div class="col-2"><div>제목</div></div>
					<div class="col-10" id="noticeTitle" name="noticeTitle">wqe</div>
				</div>

				<div class="row">
					<div class="col-2"><div>작성자</div></div>
					<div class="col-10" id="memberName" name="memberName">qwe</div>
				</div>

				<div class="row">
					<div class="col-2"><div>작성일</div></div>
					<div class="col-10" id="noticeDate" name="noticeDate">qwe</div>
				</div>
				
				<div class="row">
					<div class="col-12" id="noticeContent" name="noticeContent">
					eqw
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