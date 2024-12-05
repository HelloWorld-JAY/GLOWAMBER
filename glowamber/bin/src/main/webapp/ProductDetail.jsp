<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PRODUCT</title>
</head>
<!-- css연결 -->
<link href="resources/css/ProductDetail.css" rel="stylesheet">
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
<script type="text/javascript" src="resources/js/ProductDetail.js"></script>
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

	<!-- 바디 컨테이너 시작 -->
	<div class="container" id="body_container">
		<div class="container" id="product_container">
			<div class="row">
				<div class="col-5 text-center" id="product_img">
					<img alt="상품관련사진" src="resources/imgs/testimgs/상품상세_테스트.jpg">
				</div>
				<div class="col-7" id="product_detail">
					<div class="row">
						<div class="col-12">
							<h2 style="font-weight: 600;">[이연복의 목란]짬뽕 2인분</h2>
						</div>
						<br />
						<div class="col-12">
							<h3 style="color: #888888;">[25%] 10,350원</h3>
						</div>
						<br /> <br /> <br /> <br />
						<hr />
						<div class="col-3">
							<span class="font_title">판매단위</span>
						</div>
						<div class="col-9">
							<span class="font_content">1팩</span>
						</div>
						<hr />
						<div class="col-3">
							<span class="font_title">용량/중량</span>
						</div>
						<div class="col-9">
							<span class="font_content">1.46kg</span>
						</div>
						<hr />
						<div class="col-3">
							<span class="font_title">원산지</span>
						</div>
						<div class="col-9">
							<span class="font_content">상품설명/상세정보 참조</span>
						</div>
						<hr />
						<div class="col-3">
							<span class="font_title">알레르기정보</span>
						</div>
						<div class="col-9">
							<span class="font_content">- 목란 중화면: 밀 함유 <br>- 이 제품은
								대두, 메밀, 우유, 알류를 사용한 제품과 같은 제조시설에서 제조하고 있습니다. <br>- 목란 짬뽕탕
								마일드: 오징어, 조개류(굴, 홍합), 쇠고기, 닭고기, 돼지고기, 우유, 대두 밀 함유 <br>- 이
								제품은 알류, 메밀, 땅콩, 고등어, 게, 새우, 복숭아, 토마토, 아황산류, 호두, 조개류(전복), 잣을 포함한
								제품과 같은 제조시설에서 제조하고 있습니다. <br>- 목란 짬뽕탕 오리지널: 오징어, 돼지고기,
								조개류(굴, 홍합), 닭고기, 쇠고기, 대두, 우유, 밀 함유 <br>- 이 제품은 알류, 메밀, 땅콩,
								고등어, 게, 새우, 복숭아, 토마토, 아황산류, 호두, 조개류(전복), 잣을 포함한 제품과 같은 제조시설에서
								제조하고 있습니다.
							</span>
						</div>
						<hr />
						<div class="col-3">
							<span class="font_title">상품</span>
						</div>
						<div class="col-9">
							<span class="font_title">[이연복의 목란]짬뽕 2인분</span>
						</div>
						<br /> <br />
						<div class="col-3"></div>
						<div class="col-6" id="product_counter">
							<div>
								<span><a href="#"><i class="bi bi-dash"></i></a></span><span>0</span><span><a
									href="#"><i class="bi bi-plus"></i></a></span>
							</div>
						</div>
						<div class="col-3 text-end">
							<span class="font_content"
								style="display: inline-block; margin-top: 8px;">10,350원</span>
						</div>

						<hr />
						<div class="col-12 text-end">
							<span class="font_title">총 상품금액:</span> <span
								style="font-size: 30px; font-weight: 600;">0원</span>
						</div>
						<div class="col-12 text-end">
							<button id="product_add">장바구니 담기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container" id="detail_container">
			<div class="row text-center">
				<div class="col-3 detail_button">상품설명</div>
				<div class="col-3 detail_button">상세정보</div>
				<div class="col-3 detail_button">리뷰</div>
				<div class="col-3 detail_button">문의</div>
			</div>
			<div class="row text-center detail_img">
				<div class="col-12">
					<img style="width: 100%;" alt="상품상세설명"
						src="resources/imgs/testimgs/상품상세설명_테스트1.jpg"> <img
						style="width: 100%;" alt="상품상세설명"
						src="resources/imgs/testimgs/상품상세설명_테스트.jpg">
				</div>
			</div>
		</div>
		<div class="container" id="reply_container">
			<div class="row">
				<div class="col-12">
					<h1 style="font-weight: 600;">상품후기</h1>
				</div>
				<div class="col-12 text-end">
					<a href="">추천순</a> <span>l</span> <a href="">최근등록순</a>
				</div>
			</div>
			<hr/>
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
			<div class="row">
				<div class="col-6">
					<h1 style="font-weight: 600;">1:1문의</h1>
				</div>
				<div class="col-6 text-end">
					<button id="q_button">문의하기</button>
					
				</div>
			</div>
			<hr />
			<div class="row">
				<div class="col-8 text-center borad_header">제목</div>
				<div class="col-2 text-center borad_header">작성자</div>
				<div class="col-1 text-center borad_header">작성일</div>
				<div class="col-1 text-center borad_header">답변상태</div>
			</div>
			<hr/>
			<div class="row">
				<div class="col-8 text-center borad_content">이곳에 제목이 작성될것임다</div>
				<div class="col-2 text-center borad_content">홍길동이요</div>
				<div class="col-1 text-center borad_content">오늘이요</div>
				<div class="col-1 text-center borad_content">답변대기</div>
				
			</div>
			<hr/>
			<div class="row">
				<div class="col-8 text-center borad_content">이곳에 제목이 작성될것임다</div>
				<div class="col-2 text-center borad_content">홍길동이요</div>
				<div class="col-1 text-center borad_content">오늘이요</div>
				<div class="col-1 text-center borad_content">답변완료</div>
			</div>
			<hr/>
			<div class="col-12 text-center" id="reply_page_button">
				<a href=""><i class="bi bi-chevron-left fs-3"></i></a> <a href=""><i
					class="bi bi-chevron-right fs-3"></i></a>
			</div>
		</div>
	</div>
	<!-- 바디 컨테이너 끝 -->

	<!-- 풋터 -->
	<jsp:include page="Footer.jsp" />
	<!-- 풋터 -->
</body>
</html>