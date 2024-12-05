<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- 부트스트랩 css -->
	<linkhref="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"  rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<!-- css -->
	<link href="/glowamber/resources/css/Admin/OrderList.css" rel="stylesheet">

<meta charset="UTF-8">
<title>GlowAmber</title>
	<!-- 부트스트랩 script -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<!-- JQUERY script -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<!-- script -->
	<!-- <script type="text/javascript" src='/glowamber/resources/js/Admin/ItemMain.js'></script> -->

</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="AdminHeader.jsp" />
	<!-- 헤더 -->
<div class='container itemcontainer text-center'>
	<!-- 상품등록 -->
	<div class='row justify-content-end'>
		<div class='col-md-1 '>
			<a href="ItemInsert"><input type='button' value='상품등록' /></a>
		</div>
	</div>
	<!-- 상품검색 -->
	<div class='row'>
		<div class='col-1'>
			<select id='orderStatus'>
				<option value='new'>신규</option>
				<option value='wait'>대기</option>
				<option value='delivery'>배송중</option>
				<option value='complete'>완료</option>
				<option value='refund'>환불</option>
				<option value='exchange'>교환</option>
			</select>
		</div>
		<div class='col'>
			<input type='text'/>
		</div>
		<div class='col-1'>
			<input type='button' id='orderSelectBtn' value='검색' />
		</div>
	</div>
	<!-- 상품리스트 -->
	<div class='row' id='itemListHead'>
		<div class='col'>
			<table>
				<tr>
					<th>주문번호</th>
					<th>상품명</th>
					<th>금액</th>
					<th>수량</th>
				</tr>
			</table>
		</div>
		
	</div>
	<div class='row text-center' id='orderListBody'>
		<div class='col'>
			<table id='orderTable'>
				
			</table>
		</div>
	</div>
</div>
</body>
</html>