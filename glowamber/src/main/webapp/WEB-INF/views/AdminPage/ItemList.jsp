<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- 부트스트랩 css -->
	<linkhref="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"  rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<!-- css -->
	<link href="/glowamber/resources/css/Admin/ItemList.css" rel="stylesheet">

	<meta charset="UTF-8">
	<title>GlowAmber</title>

	<!-- 부트스트랩 script -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<!-- JQUERY script -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<!-- script -->
	<script type="text/javascript" src='/glowamber/resources/js/Admin/ItemMain.js'></script>
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
				<select id='ItemSelectCate'>
					<option value='itemName'>이름</option>
					<option value='bigCateName'>대분류</option>
					<option value='smallCateName'>소분류</option>
					<option value='ItemSupplier'>공급처</option>
					<option value='itemDate'>등록일</option>
				</select>
			</div>
			<div class='col'>
				<input type='text'/>
			</div>
			<div class='col-1'>
				<input type='button' id='ItemSelectBtn' value='검색' />
			</div>
		</div>
		<!-- 상품리스트 -->
		<div class='row' id='itemListHead'>
			<div class='col'>
				<table>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>대분류</th>
						<th>소분류</th>
						<th>판매단위</th>
						<th>용량/중량</th>
						<th>판매가</th>
						<th>공급처</th>
						<th>등록일</th>
					</tr>
				</table>
			</div>
			
		</div>
		<div class='row text-center' id='itemListBody'>
			<div class='col'>
				<table id='ItemTable'>
					
				</table>
			</div>
		</div>
	</div>
</body>
</html>