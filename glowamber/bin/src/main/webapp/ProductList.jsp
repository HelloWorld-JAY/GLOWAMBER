<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PRODUCT</title>
</head>
<!-- css연결 -->
<link href="resources/css/ProductList.css" rel="stylesheet">
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
<script type="text/javascript" src="resources/js/ProductList.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="Header.jsp" />
	<!-- 헤더 -->
	<!-- 퀵메뉴 -->
	<div id="quick_menu">
		<ul class="nav flex-column">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#"><i class="bi bi-clock-history fs-2"></i>
					<br />최근 본 상품</a></li>
			<hr />
			<li class="nav-item"><a class="nav-link" href="#"><i
					class="bi bi-bag fs-2"></i> <br />장바구니</a></li>
			<hr />
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="#"><i
					class="bi bi-arrow-up-square fs-2"></i><br />TOP </a></li>
		</ul>
	</div>
	<!-- 퀵메뉴 -->

	<!-- 메인 바디 컨테이너 -->
	<div class="container text-center" id="body_container">
		<h2>상품 대분류 카테고리 (클릭하고 들어온 카테고리명)</h2>
		<!-- 카테고리 컨테이너 -->
		<div class="container text-center" id="small_cate">
			<div class="row">
				<div class="col">
					<a href="#">소분류</a>
				</div>
				<div class="col">
					<a href="#">소분류</a>
				</div>
				<div class="col">
					<a href="#">소분류</a>
				</div>
				<div class="col">
					<a href="#">소분류</a>
				</div>
				<div class="col">
					<a href="#">소분류</a>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<a href="#">소분류</a>
				</div>
				<div class="col">
					<a href="#">소분류</a>
				</div>
				<div class="col">
					<a href="#">소분류</a>
				</div>
				<div class="col">
					<a href="#">소분류</a>
				</div>
				<div class="col">
					<a href="#">소분류</a>
				</div>
			</div>
		</div>
		<!-- 상품 정렬 -->
		<div id="product_array">
			<hr />
			<ul>
				<li><a href="#">추천순</a></li>
				<li>ㅣ</li>
				<li><a href="#">상품등록순</a></li>
				<li>ㅣ</li>
				<li><a href="#">판매량순</a></li>
				<li>ㅣ</li>
				<li><a href="#">가격순</a></li>
				<li>ㅣ</li>
				<li><a href="#">할인순</a></li>
			</ul>
		</div>
		<!-- 상품 리스트 시작 -->
		<div class="container" id="product_container">
			<div class="row">
				<div class="col-12 col-sm-6 col-md-3">
					<div class="row">
						<div class="col-12 col-sm-12 col-md-12">사진</div>
						<div class="col-12 col-sm-12 col-md-12">담기버튼</div>
						<div class="col-12 col-sm-12 col-md-12">상품명</div>
						<div class="col-12 col-sm-12 col-md-12">상품금액</div>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-md-3">
					<div class="row">
						<div class="col-12 col-sm-12 col-md-12">사진</div>
						<div class="col-12 col-sm-12 col-md-12">담기버튼</div>
						<div class="col-12 col-sm-12 col-md-12">상품명</div>
						<div class="col-12 col-sm-12 col-md-12">상품금액</div>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-md-3">
					<div class="row">
						<div class="col-12 col-sm-12 col-md-12">사진</div>
						<div class="col-12 col-sm-12 col-md-12">담기버튼</div>
						<div class="col-12 col-sm-12 col-md-12">상품명</div>
						<div class="col-12 col-sm-12 col-md-12">상품금액</div>
					</div>
				</div>
				<div class="col-12 col-sm-6 col-md-3">
					<div class="row">
						<div class="col-12 col-sm-12 col-md-12">사진</div>
						<div class="col-12 col-sm-12 col-md-12">담기버튼</div>
						<div class="col-12 col-sm-12 col-md-12">상품명</div>
						<div class="col-12 col-sm-12 col-md-12">상품금액</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 상품 리스트 끝 -->
		<!-- 상품 목록번호 -->
		<hr />
		<div id="page_number">
			<span><a href=""><i class="bi bi-chevron-double-left"></i></a></span><span><a
				href=""><i class="bi bi-chevron-left"></i></a></span><span><a
				href=""><i class="bi bi-chevron-right"></i></a></span><span><a
				href=""><i class="bi bi-chevron-double-right"></i></a></span>
		</div>
	</div>
	<!-- 풋터 -->
	<jsp:include page="Footer.jsp" />
	<!-- 풋터 -->
</body>
</html>