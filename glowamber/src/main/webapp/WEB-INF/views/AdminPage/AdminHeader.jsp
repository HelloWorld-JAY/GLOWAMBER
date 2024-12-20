<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Glow Amber</title>
<!-- css -->
<link href="/glowamber/resources/css/Admin/AdminHeader.css" rel="stylesheet">
<!-- 부트스트랩 css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- 부트스트랩 script -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<div class="container-xxl header_background">
			<div class="container text-end" id="admin_login">
				<ul class="nav justify-content-end" id="header_nav">
				<li class="nav-item nav-letter"><a href="/glowamber/mainpage/MainPage">메인페이지</a></li>
					<%if(session.getAttribute("id")!= null){%>
										<li class="nav-item nav-division">ㅣ</li>
					<li class="nav-item nav-letter"><a href="/glowamber/member/logout">로그아웃</a></li>
					<%} %>

					

					
				</ul>
			</div>
			<div class="container header_logo_search d-flex justify-content-center text-center">
				<span id='admin_font'> 
					<a href="#">
						<img id="logo_img" alt="로고이미지"src="/glowamber/resources/imgs/glow_amber_logo.png">
					</a><br/>
					관리자 페이지
				</span> 
			</div>
		</div>
		<div id='nav' class="container main_nav">
			<ul class="nav nav-pills nav-fill main_nav_ui">
				<li class="nav-item"><a href="/glowamber/AdminPage/DashBoard">대시보드</a></li>
				<li class="nav-item"><a href='/glowamber/AdminPage/ItemList'>상품관리</a></li>
				<li class="nav-item"><a href='/glowamber/AdminPage/StoreList'>재고관리</a></li>
				<li class="nav-item"><a href='/glowamber/AdminPage/OrderList'>주문관리</a></li>
				<li class="nav-item"><a href='/glowamber/AdminPage/MemberList'>회원관리</a></li>
			</ul>
		</div>
	</header>
</body>
</html>
