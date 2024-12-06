<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 스마트에디터 js -->
<script type="text/javascript"
	src="/glowamber/resources/smarteditor/js/HuskyEZCreator.js"
	charset="UTF-8"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript"
	src="/glowamber/resources/js/NoticeWriter.js"></script>


</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../headerfooter/Header.jsp" />
	<!-- 헤더 -->
	<div class="container">
		<div
			style="font-size: 32px; font-style: normal; margin-top: 40px; margin-bottom: 40px; text-align: center; font-weight: bold;">공지사항
			등록</div>

		<div class="row">
			<input type="text" placeholder="제목 입력" name="noticeTitle"
				id="noticeTitle">
		</div>

		<div class="row">

			<textarea rows="20" cols="50" id="notice_write"></textarea>

			<button>등록</button>
		</div>
	</div>
	<!-- 풋터 -->
	<jsp:include page="../headerfooter/Footer.jsp" />
	<!-- 풋터 -->
</body>
</html>