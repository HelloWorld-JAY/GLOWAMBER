<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Glow Amber</title>
<!-- css -->
<link href="resources/css/Admin.css" rel="stylesheet">
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
<!-- jquery script -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- script -->
<script type="text/javascript" src='resources/js/admin.js'></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="AdminHeader.jsp" />
	<!-- 헤더 -->
	<div class='container-xxl' id='inventory' >
		<div class='row'>
			<div class='col text-center' id='inventory_data'>
				<input type='date' id='' value=''  /> - 
				<input type='date' id='' value=''  />
			</div>
		</div>
		<div class='row'>
			<div class='col text-start'>
				<input type='button' id='' value='전체'  />
				<input type='button' id='' value='입고' />
				<input type='button' id='' value='출고' />
			</div>
			<div class='col text-end'>
				<select id=''>
					<option value=''></option>
					<option value=''></option>
					<option value=''></option>
					<option value=''></option>
					<option value=''></option>
				</select>
				<input type='text' id='' />
				<input type='button' id='' value='검색' />
			</div>
		</div>
		<div class='row' id='inventory_table'>
			<table>
				<colgroup>
		            <col width="5%" />
		            <col width="*"  />
		            <col width="8%" />
		            <col width="20%"/>
		            <col width="7%" />
		            <col width="7%" />
		            <col width="13%"/>
		            <col width="9%" />
	       		 </colgroup>

				<tr>
					<th>유형</th>
					<th>상품명</th>
					<th>수량</th>
					<th>유통기한</th>
					<th>대분류</th>
					<th>소분류</th>
					<th>공급업체</th>
					<th>날짜</th>
				</tr>

			<c:forEach begin="0" end="20" step="1">
				<tr>
					<td>유형</td>
					<td>상품명</td>
					<td>수량</td>
					<td>유통기한</td>
					<td>대분류</td>
					<td>소분류</td>
					<td>공급업체</td>
					<td>날짜</td>
				</tr>
			</c:forEach>
				
			</table>
		</div>
	</div>
	<div hidden>
		상품번호<input type='text'/>
		수량<input type='text'/>
		유통기한<input type='text'/>
	</div>
	
	<form>
		
	
	</form>
	
</body>
</html>