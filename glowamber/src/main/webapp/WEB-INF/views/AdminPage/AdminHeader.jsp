<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Glow Amber</title>
<!-- css -->
<link href="/glowamber/resources/css/AdminHeader.css" rel="stylesheet">
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
				관리자1234
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
				<li class="nav-item">대시보드</li>
				<li class="nav-item">상품관리</li>
				<li class="nav-item">재고관리</li>
				<li class="nav-item">주문관리</li>
				<li class="nav-item">회원관리</li>
			</ul>
		</div>
	</header>
</body>
</html>
