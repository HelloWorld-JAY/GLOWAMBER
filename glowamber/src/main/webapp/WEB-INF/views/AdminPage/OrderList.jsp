<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- 부트스트랩 css -->
	<linkhref="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"  rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<!-- css -->
	<link href="/glowamber/resources/css/Admin/OrderList.css" rel="stylesheet">
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>GlowAmber</title>
	<!-- 부트스트랩 script -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<!-- JQUERY script -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<!-- script -->
	<script type="text/javascript" src='/glowamber/resources/js/Admin/OrderList.js'></script>

</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="AdminHeader.jsp" />
	<!-- 헤더 -->
	<div class='container itemcontainer text-center'>
	
	<!-- 주문검색 -->
	<div class='row justify-content-end'>
		<div class='col-1 '>
			<select id='orderStatus'>
				<option value='신규'>신규</option>
				<option value='대기'>대기</option>
				<option value='배송중'>배송중</option>
				<option value='완료'>완료</option>
				<option value='환불'>환불</option>
				<option value='교환'>교환</option>
			</select>
		</div>
	</div>
	<!-- 주문상태변경 -->
	<div class='row'>
		<div class='col-1'>
			<input type='button' class='orderStatus' id='orderStatusWait' value='대기' />
		</div>
		<div class='col-1'>
			<input type='button' class='orderStatus' id='orderStatusDelivery' value='배송중' />
		</div>
		<div class='col-1'>
			<input type='button' class='orderStatus' id='orderStatuscomplete' value='완료' />
		</div>
		<div class='col-1'>
			<input type='button' class='orderStatus' id='orderStatusRefund' value='환불' />
		</div>
		<div class='col-1'>
			<input type='button' class='orderStatus' id='orderStatusCancle' value='교환' />
		</div>
	</div>
	<!-- 주문리스트 -->
	<div class='row' id='OrderListHead'>
		<div class='col'>
			<table>
				<tr>
					<th><input type='checkbox' class='selectAll' name='selectAll'></th>
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