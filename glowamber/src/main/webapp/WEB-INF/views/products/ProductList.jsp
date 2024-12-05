<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PRODUCT</title>
</head>
<!-- css연결 -->
<link href="/glowamber/resources/css/ProductList.css" rel="stylesheet">
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
	<!-- 세션값 설정후 js 파일에 보내기 -->
<script>
    let sessionId = "<%= session.getAttribute("id") != null ? session.getAttribute("id") : "" %>";
</script>	
	<!-- 쿠키사용 스크립트 -->
<script
	src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
<!-- 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- js파일연결 -->
<script type="text/javascript"
	src="/glowamber/resources/js/ProductList.js"></script>
</head>
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

	<!-- 메인 바디 컨테이너 -->
	<div class="container text-center" id="body_container">
		<h2>${ cate[0].BIGCATENAME }</h2>
		<!-- 카테고리 컨테이너 -->
		<div class="container text-center" id="small_cate">
			<div class="row" >
				<c:forEach var="list" items="${ cate }">
					<div class="col-3">
						<span class="smallcate" value="${ list.SMALLCATENUM }">${ list.SMALLCATENAME }</span>
					</div>
				</c:forEach>
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
		<div class="container">
			<div class="row" id="product_container">
				<c:forEach var="product" items="${ item }">
					<div class="col-12 col-sm-6 col-md-3">
						<div class="row" id="product_four">
							<div class="col-12 col-12 col-sm-12 col-md-12 carouesl_img" value="${ product.itemNum }">
								<img alt="상품사진 ^^" src="${ product.itemThumnail }">
							</div>
								<div class="col-12 col-sm-12 col-md-12 carouesl_button"><button type="button" data-bs-toggle="modal" data-bs-target="#modal-${ product.itemNum }"><i class="bi bi-bag"></i> 담기</button>
									<div class="modal fade" id="modal-${ product.itemNum }" data-bs-backdrop="false" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modal-${ product.itemNum }Label" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered modal-md" >
										<div class="modal-content">
										<div class="modal-header text-center"">
										<h1 class="modal-title fs-4 mx-auto" id="modal-${ product.itemNum }Label" style="font-weight: 600;">장 바 구 니</h1>
										</div>
										<div class="modal-body"><div class="row "><div class="col-1"></div><div class="col-3" ><img class="modal_img" src="${ product.itemThumnail }"></div>
										<div class="col-7 text-end"><div class="row">
										<div class="col-12 text-end" style="font-size: 20px; text-align:left;">${ product.itemName }</div><br/><br/><br/>
										<div class="col-12 align-self-end text-end" style="text-align:left; font-size:16px;"><span>상품금액:</span> <span class="product_price" value="${product.itemPrice}"><fmt:formatNumber value="${product.itemPrice}" type="number" groupingUsed="true" />원</span></div>
										<div class="col-12 align-self-center text-end product_counter"><div><span class="minus"><i class="bi bi-dash fs-5"></i></span><span class="product_count" draggable="false">0</span><span class="plus"><i class="bi bi-plus fs-5"></i></span></div></div>
										</div></div><div class="col-1"></div>
										</div></div>
										<div class="modal-footer d-flex justify-content-between w-100">
										<div class="col-12 d-flex justify-content-between w-100" style="font-size: 20px; font-weight: 600; padding-right: 10%;padding-left: 10%;"><span>합계</span><span><span class="total_price">0원</span></span></div>
										<button type="button" class="btn_cancel " data-bs-dismiss="modal">취소</button>
										<button type="button" class="btn_add" data-bs-dismiss="modal" value="${ product.itemNum }">장바구니 담기</button>
										</div></div></div></div>
								</div>

							<div class="col-12 col-sm-12 col-md-12 carouesl_name" value="${ product.itemNum }">${ product.itemName }</div>
							<div class="col-12 col-sm-12 col-md-12 carouesl_price" value="${ product.itemNum }"><fmt:formatNumber value="${product.itemPrice}" type="number" groupingUsed="true" />원</div>
						</div>
					</div>
				</c:forEach>
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
	<jsp:include page="../headerfooter/Footer.jsp" />
	<!-- 풋터 -->
</body>
</html>