<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PRODUCT</title>
</head>
<!-- css연결 -->
<link href="/glowamber/resources/css/ProductDetail.css" rel="stylesheet">
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
<!-- 쿠키사용 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
<!-- 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- js파일연결 -->
<script type="text/javascript"
	src="/glowamber/resources/js/ProductDetail.js"></script>

<body>
	<!-- 헤더 -->
	<jsp:include page="../headerfooter/Header.jsp" />
	<!-- 헤더 -->
	<!-- 퀵메뉴 -->
	<div id="quick_menu">
		<ul class="nav flex-column">
			<li class="nav-item"><a class="nav-link" aria-current="page"
				href="#"><i class="bi bi-clock-history fs-2"></i> <br />최근 본 상품</a></li>
			<hr />
			<li class="nav-item"><a class="nav-link"
				href="/glowamber/products/Cart"><i class="bi bi-bag fs-2"></i> <br />장바구니</a></li>
			<hr />
			<li class="nav-item"><a class="nav-link" aria-current="page"
				href="#"><i class="bi bi-arrow-up-square fs-2"></i><br />TOP </a></li>
		</ul>
	</div>
	<!-- 퀵메뉴 -->

	<!-- 바디 컨테이너 시작 -->
	<div class="container" id="body_container">
		<div class="container" id="product_container">
			<div class="row">
				<div class="col-5 text-center" id="product_img">
					<img alt="상품관련사진" src="${itemDTO.itemThumnail}">
				</div>
				<div class="col-7" id="product_detail">
					<div class="row">
						<div class="col-12">
							<h2 style="font-weight: 600;">${ itemDTO.itemName }</h2>
						</div>
						<br />
						<div class="col-12">
							<h3 style="color: #888888;">
								<fmt:formatNumber value="${itemDTO.itemPrice}" type="number"
									groupingUsed="true" />원</h3>
						</div>
						<br /> <br /> <br /> <br />
						<hr />
						<div class="col-3">
							<span class="font_title">판매단위</span>
						</div>
						<div class="col-9">
							<span class="font_content">${ itemDTO.itemUnit }</span>
						</div>
						<hr />
						<div class="col-3">
							<span class="font_title">용량/중량</span>
						</div>
						<div class="col-9">
							<span class="font_content">${ itemDTO.itemVolume }</span>
						</div>
						<hr />
						<div class="col-3">
							<span class="font_title">원산지</span>
						</div>
						<div class="col-9">
							<span class="font_content">${ itemDTO.itemOrigin }</span>
						</div>
						<hr />
						<c:if test="${ itemDTO.itemAllErgyinfo != null }">
							<div class="col-3">
								<span class="font_title">알레르기정보</span>
							</div>
							<div class="col-9">
								<span class="font_content">${ itemDTO.itemAllErgyinfo } </span>
							</div>
							<hr />
						</c:if>
						<c:if test="${ itemDTO.itemAllErgyinfo == null }">
							<div class="col-3">
								<span class="font_title">알레르기정보</span>
							</div>
							<div class="col-9">
								<span class="font_content">상품설명/상세정보 참조</span>
							</div>
							<hr />
						</c:if>
						<div class="col-3">
							<span class="font_title">상품</span>
						</div>
						<div class="col-9">
							<span class="font_title">${ itemDTO.itemName }</span>
						</div>
						<br /> <br />
						<div class="col-3"></div>
						<div class="col-6 align-self-center" id="product_counter">
							<div>
								<span><i class="bi bi-dash fs-5"></i></span><span id="product_count" draggable="false">0</span><span><i class="bi bi-plus fs-5"></i></span>
							</div>
						</div>
						<div class="col-3 text-end">
							<span class="font_content" id='product_price'
								style="display: inline-block; margin-top: 8px;" value="${ itemDTO.itemPrice }"><fmt:formatNumber value="${itemDTO.itemPrice}" type="number"
									groupingUsed="true" />원</span>
						</div>

						<hr />
						<div class="col-12 text-end">
							<span class="font_title">총 상품금액:</span> <span id="total_price" style="font-size: 30px; font-weight: 600;">0원</span>
						</div>
						<div class="col-12 text-end">
							<button id="product_add" value="${ itemDTO.itemNum }">장바구니 담기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container" id="detail_container">
			<div class="row text-center" id="detail_box">
				<div class="col-3 detail_button scroll_move"><a href="#scroll1" >상품설명</a></div>
				<div class="col-3 detail_button scroll_move"><a href="#scroll1" >상세정보</a></div>
				<div class="col-3 detail_button scroll_move"><a href="#scroll3" >리뷰</a></div>
				<div class="col-3 detail_button scroll_move"><a href="#scroll4" >문의</a></div>
			</div>
			<div class="row text-center detail_img ">
				<div class="col-12" id="scroll1">
					<img style="width: 100%;" alt="상품상세설명"
						src="${itemDTO.itemDetail}">
				</div>
			</div>
		</div>
		<div class="container scroll2" id="reply_container">
			<div class="row" id="scroll3">
				<div class="col-12">
					<h1 style="font-weight: 600;">상품후기</h1>
				</div>
				<div class="col-12 text-end">
					<a href="">추천순</a> <span>l</span> <a href="">최근등록순</a>
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col-3 text-center">사용자명</div>
				<div class="col-9">댓글 내용입니다요잉 추후에 for문으로 여럿출력예쩡</div>
			</div>
			<hr />
			<div class="col-12 text-center" id="reply_page_button">
				<a href=""><i class="bi bi-chevron-left fs-3"></i></a> <a href=""><i
					class="bi bi-chevron-right fs-3"></i></a>
			</div>
		</div>
		<div class="container" id="board_container">
			<div class="row" id="scroll4">
				<div class="col-6">
					<h1 style="font-weight: 600;">1:1문의</h1>
				</div>
				<div class="col-6 text-end">
					<button id="q_button">문의하기</button>

				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col-6 text-center borad_header">제목</div>
				<div class="col-2 text-center borad_header">작성자</div>
				<div class="col-2 text-center borad_header">작성일</div>
				<div class="col-2 text-center borad_header">답변상태</div>
			</div>
			<hr />
			<div class="row">
				<div class="col-6 text-center borad_content">이곳에 제목이 작성될것임다</div>
				<div class="col-2 text-center borad_content">홍길동이요</div>
				<div class="col-2 text-center borad_content">오늘이요</div>
				<div class="col-2 text-center borad_content">답변대기</div>

			</div>
			<hr />
			<div class="col-12 text-center" id="reply_page_button">
				<a href=""><i class="bi bi-chevron-left fs-3"></i></a> <a href=""><i
					class="bi bi-chevron-right fs-3"></i></a>
			</div>
		</div>
	</div>
	<!-- 바디 컨테이너 끝 -->

	<!-- 풋터 -->
	<jsp:include page="../headerfooter/Footer.jsp" />
	<!-- 풋터 -->
</body>
</html>