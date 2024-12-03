<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHOPPING CART</title>
</head>
<!-- css연결 -->
<link href="resources/css/Cart.css" rel="stylesheet">
<!-- 부트스트랩 아이콘CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- 부트스트랩 CSS -->
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
<!-- 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- js파일연결 -->
<script type="text/javascript" src="resources/js/Cart.js"></script>
<body>
	<!-- 헤더 -->
	<jsp:include page="Header.jsp" />
	<!-- 헤더 -->

	<!-- 바디시작 -->

	<div class="container" id="body_container">
		<div class="col-12 text-center">
			<h2>장바구니</h2>
		</div>
		<div class="row">
			<div class="col-7">
				<div class="row" id="cart_list">
				<div class="col-12" id="cart_check">
					<span></span><span></span><span></span>
				</div>
				<div class="col-12" id="product_list"></div>
				</div>
			</div>
			<div class="col-5">
			<div class="row" id="cart_order">
				
			</div>
			</div>
		</div>
	</div>

	<!-- 바디끝 -->

	<!-- 풋터 -->
	<jsp:include page="Footer.jsp" />
	<!-- 풋터 -->
</body>
</html>