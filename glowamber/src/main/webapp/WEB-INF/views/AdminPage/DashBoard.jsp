<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GlowAmber</title>
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
	crossorigin="anonymous">
</script>
<!-- chart script -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> 
<!-- JQUERY script -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- user script -->
<script type="text/javascript" src='/glowamber/resources/js/Admin/DashBoard.js'></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="AdminHeader.jsp" />
	<!-- 헤더 -->
	<select id='year'>
	</select>
	<canvas id="monthlyPurchaseSalesCanvas" width="300" height="100"></canvas>
	
	<canvas id="monthMostCateCanvas" width="300" height="100"></canvas>
	
</body>
</html>