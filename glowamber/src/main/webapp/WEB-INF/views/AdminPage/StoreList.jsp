<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- 부트스트랩 css -->
	<linkhref="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"  rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<!-- css -->
	<link href="/glowamber/resources/css/Admin/StoreList.css" rel="stylesheet">

<meta charset="UTF-8">
<title>GlowAmber</title>
	<!-- 부트스트랩 script -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<!-- JQUERY script -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<!-- script -->
	<script type="text/javascript" src='/glowamber/resources/js/Admin/StoreList.js'></script>

</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="AdminHeader.jsp" />
	<!-- 헤더 -->
<div class='container itemcontainer text-center'>
	<!-- 상품등록 -->
	<div class='row justify-content-start'>
		<div class='col-md-1 '>
			<b><span>재고관리</span></b>
		</div>
	</div>
	<!-- 상품검색 -->
	<div class='row'>
		<div class='col-1'>
			<input type='button' class='StoreStatus' value='전체' />
		</div>
		<div class='col-1'>
			<input type='button' class='StoreStatus' value='입고' />
		</div>
		<div class='col-1'>
			<input type='button' class='StoreStatus' value='출고' />
		</div>
	</div>
	<!-- 상품리스트 -->
	<div class='row' id='StoreListHead'>
		<div class='col'>
			<table>
				<tr>
					<th>날짜</th>
					<th>구분</th>
					<th>상품명</th>
					<th>입/출고가</th>
					<th>입/출고량</th>
				</tr>
			</table>
		</div>
	</div>
	<div class='row text-center' id='StoreListBody'>
		<div class='col'>
			<table id='StoreTable'>
			</table>
		</div>
	</div>
	<div class='row text-center' id='StoreListFooter'>
		<div class='col'>
			<table>
				<tr>
					<th></th>
					<th class='totalstoreprice'>전체 입고액</th>
					<th class='totalstoreprice' id="totalstoreprice"></th>
					<th class='totalsellprice'>전체 출고액</th>
					<th class='totalsellprice' id="totalsellprice"></th>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
</html>