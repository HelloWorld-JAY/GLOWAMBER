<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHOPPING CART</title>
</head>
<!-- css연결 -->
<link href="/glowamber/resources/css/Cart.css" rel="stylesheet">
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
<script type="text/javascript" src="/glowamber/resources/js/Cart.js"></script>
<body>
	<!-- 헤더 -->
	<jsp:include page="../headerfooter/Header.jsp" />
	<!-- 헤더 -->

	<!-- 바디시작 -->

	<div class="container " id="body_container">
		<div class="col-12 text-center">
			<h1 style="color: #DEBD7E; font-weight: 600;">장바구니</h1>
		</div>
		<br /> <br />
		<div class="row" id="cart_container">
			<div class="col-7">
				<div class="container" id="cart_list">
					<div class="row d-flex align-items-center" id="cart_check">
						<div class="col-1 text-end">
							<i class="bi bi-app fs-3"></i>
						</div>
						<div class="col-6">
							<span class="cart_title">전체선택</span> <span class="cart_title">0/0</span>
						</div>
						<div class="col-5 text-end">
							<button class="cart_title" id="cart_deselect">선택삭제</button>
						</div>
					</div>

					<div class="col-12 text-center">
						<h1 style="margin-top: 110px; font-weight: 600; color: #DEBD7E;">장바구니에 담긴 상품이
							없습니다</h1>
					</div>
					<div class="col-12" id="product_list"></div>
				</div>
			</div>
			<div class="col-5">
				<div class="container" id="cart_order">
					<div class="row">
						<div class="col-12">
							<h2 style="font-weight: 600;">결제금액</h2>
						</div>
						<br /> <br /> <br />
						<div class="col-6">
							<span class="cart_title">상품금액</span>
						</div>
						<div class="col-6 text-end">
							<span>0원</span>
						</div>
						<br /> <br />
						<div class="col-6">
							<span class="cart_title">상품할인금액</span>
						</div>
						<div class="col-6 text-end">
							<span>0원</span>
						</div>
						<br /> <br />
						<div class="col-6">
							<span class="cart_title">배송비</span>
						</div>
						<div class="col-6 text-end">
							<span>0원</span>
						</div>
						<div class="col-12">
							<hr />
						</div>

						<div class="col-6">
							<span class="cart_title">결제예정금액</span>
						</div>
						<div class="col-6 text-end">
							<span style="font-size: 30px; font-weight: 600;">0원</span>
						</div>
					</div>
					<div class="row">
						<button id="pay_button">주문하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 바디끝 -->

	<!-- 풋터 -->
	<jsp:include page="../headerfooter/Footer.jsp" />
	<!-- 풋터 -->
</body>
</html>