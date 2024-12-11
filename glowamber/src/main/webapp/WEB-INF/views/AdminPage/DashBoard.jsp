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
	
<!-- css -->
	<link href="/glowamber/resources/css/Admin/DashBoard.css" rel="stylesheet">
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
	<div class='container'>
		<div>
			<div>
				<div class='row'>
					<div class='col' id='alrimpan'>
						<div class='row text-center'>
							<span> 알림판 </span>
						</div>
						<div class='row'>
							<table>
								<tr>
									<td>상품의 재고가 부족합니다</td>
								</tr>
								<tr>
									<td>재고의 상품가 부족합니다</td>
								</tr>
								<tr>
									<td>부족의 재고가 상품합니다</td>
								</tr>
								<tr>
									<td>재고의 부족가 상품합니다</td>
								</tr>
								<tr>
									<td>읽지않은 문의가 있습니다</td>
								</tr>
								<tr>
									<td>읽지않은 문의가 있습니다</td>
								</tr>
								<tr>
									<td>읽지않은 문의가 있습니다</td>
								</tr>
								<tr>
									<td>읽지않은 문의가 있습니다</td>
								</tr>
							</table>
						</div>
						
					</div>
					<div class='col' id ='targetSaleChart'>
						<div class='row text-center'>
							<span>목표 매출</span>
						</div>
						<div class='row justify-content-center'>
							<div class='col-2'>
								<select id='month'></select>
							</div>
						</div>
						<div class='row'>
							<div class='col align-content-center text-center'>
								<div>
									<h3>전체 매출액</h3>
									<h1 id='totalsale'>12312</h1>
								</div>
							</div>
							<div class='col'>
								<canvas id="targetSaleCanvas" width="100%" height="100%" ></canvas>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			<div class='row'>
				<div class='col' id='monthlyPSChart'>
					<div class='row text-center'>
						<span>월별 매입매출액</span>
					</div>
					<div class='row justify-content-center'>
						<div class='col-1 '>
							<select id='year'></select>
						</div>
					</div>
					<div class='row'>
						<canvas id="monthlyPSCanvas" ></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
</body>
</html>