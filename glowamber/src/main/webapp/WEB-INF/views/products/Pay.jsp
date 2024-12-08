<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAY</title>
<!-- css연결 -->
<link href="/glowamber/resources/css/Pay.css" rel="stylesheet">
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
<script type="text/javascript" src="/glowamber/resources/js/Pay.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../headerfooter/Header.jsp" />
	<!-- 헤더 -->

	<!-- 바디시작 -->

	<div class="container" id="body_container">
		<div class="row">
			<div class="col-12 text-center">
				<h1
					style="font-weight: 600; color: #DEBD7E; text-shadow: 0 0 10px #222; font-family: 'Gyeonggi_Batang_Regular';">주
					문 서</h1>
			</div>
			<div class="col-7">
				<div class="col-12" id="order_product">
					<div class="order_title">주문상품</div>
					<hr />
					<div class="col-12">
						<c:forEach var="product" items="${cart}">
							<div class="row">
								<div class="col-3 product_img">
									<img alt="" src="${ product.ITEMTHUMNAIL }">
								</div>
								<div class="col-9">
									<div class="row text-end">
										<div class="col-12">
											<h5 style="font-weight: 600;">${ product.ITEMNAME }</h5>
										</div>
										<div class="col-12" style="margin-top: 50px;"> <h6> 수량 : ${ product.CARTITEMCOUNT }${ product.ITEMUNIT.substring(1) }</h6></div>
										<div class="col-12"> <h6> 개당금액 : <fmt:formatNumber value="${product.ITEMPRICE}" type="number" groupingUsed="true"/>원 </h6></div>
										<div class="col-12 orderProductPrice"> <h6 style="font-weight: 600;"> 주문금액 : <fmt:formatNumber value="${ product.ITEMPRICE * product.CARTITEMCOUNT }" type="number" groupingUsed="true"/>원</h6> <input type="hidden" value="${ product.ITEMPRICE * product.CARTITEMCOUNT }"> </div>
									</div>
								</div>
							</div>
							<hr style="height: 1px; opacity: 50%" />
						</c:forEach>
						<div class="col-12 text-center totalProductPrice"> <h4 style="font-weight: 600;"></h4> </div>
					</div>

				</div>
				<div class="col-12" id="order_member">
					<div class="order_title">주문자 정보</div>
					<hr />
					<div class="row">

						<div class="col-3">받는분</div>
						<div class="col-9">${ cart[0].MEMBERNAME }</div>
						<br /> <br />
						<div class="col-3">휴대폰</div>
						<div class="col-9">${ cart[0].MEMBERTEL }</div>
						<br /> <br />
						<div class="col-3">이메일</div>
						<div class="col-9">${ cart[0].MEMBEREMAIL }</div>
						<br /> <br />
					</div>
				</div>
				<div class="col-12" id="order_delivery">
					<div class="order_title">배송 정보</div>
					<hr />
					<div class="row">
						<div class="col-3">배송지</div>
						<div class="col-9">기본배송지</div>
						<br /> <br />
						<div class="col-3"></div>
						<div class="col-9">땡땡시 땅땅구 덩덩동 나머지주소</div>
						<br /> <br />
						<div class="col-3"></div>
						<div class="col-9">
							<button class="delivery_button">변경</button>
						</div>
						<br /> <br />
					</div>
					<hr style="opacity: 50%; height: 1px;" />
					<div class="row">
						<div class="col-3">배송 요청사항</div>
						<div class="col-9">배송요청사항을 적어주심시오~~</div>
						<br /> <br />
						<div class="col-3"></div>
						<div class="col-9">김동구리구리씨,010-0000-0000</div>
						<br /> <br />
						<div class="col-3"></div>
						<div class="col-9">
							<button class="delivery_button">수정</button>
						</div>
						<br /> <br />
					</div>
				</div>

				<div class="col-12" id="order_agree">
					<div class="order_title">개인정보 및 결제 동의</div>
					<hr />
					<div class="row ">
						<div class="col-10">개인정보 및 결제동의</div>
						<div class="col-2 text-end">
							<a href="">보기</a>
						</div>
						<br /> <br />
						<div class="col-10">전자지급 결제대행 서비스 이용약관 동의</div>
						<div class="col-2 text-end">
							<a href="">보기</a>
						</div>
						<br /> <br />
						<div class="col-10 align-self-center order_title">위 내용을 확인
							하였으며 결제에 동의합니다.</div>
						<div class="col-2 text-end">
							<i class="bi bi-app fs-3"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="col-5">
				<div class="container" id="order_pay">
					<div class="col-12" id="order_discount">
						<div class="order_title">할인&결제금액</div>
						<hr />
						<div class="row">
							<div class="col-6">상품금액</div>
							<div class="col-6 text-end priceProduct">0원</div>
							<br /> <br />
							<div class="col-6 ">할인금액</div>
							<div class="col-6 text-end">0원</div>
							<br /> <br />
							<div class="col-6 ">배송비</div>
							<div class="col-6 text-end priceDelivery">0원</div>
							<br /> <br />
							<div class="col-6 order_title">총결제금액</div>
							<div class="col-6 text-end order_title total">0원</div>
						</div>
					</div>
					<div class="col-12">
						<div class="col-12 text-center" id="order_button">
							<button>결제하기</button>
						</div>
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