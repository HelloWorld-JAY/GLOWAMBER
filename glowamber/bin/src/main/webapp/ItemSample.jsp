<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- css -->
<link href="resources/css/ItemSample.css" rel="stylesheet">
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
<meta charset="UTF-8">
<title>Sample</title>
</head>
<body>
	<div id='item' class='container-xxl'>
		<div class='row'>
			<div id="iteminsert" class='col'>
				<div>
					<table>
						<tr>
							<td><span>썸네일</span></td>
							<td><input type='file' name='' id='' /></td>
						</tr>
						<tr>
							<td><span>상품명</span></td>
							<td><input type='text' name='' id='' /></td>
							<td><span>카테고리</span></td>
							<td>
								<select>
									<option value=''></option>
									<!-- 나중에 DB값 받아오기 -->
								</select>
							</td>
						</tr>
						<tr>
							<td><span>판매단위</span></td>
							<td><input type='text' name='' id='' /></td>
							<td><span>용량/중량</span></td>
							<td><input type='text' name='' id='' /></td>
							
						</tr>
						<tr>
							<td><span>판매가</span></td>
							<td><input type='text' name='' id='' /></td>
							<td><span>공급업체</span></td>
							<td><input type='text' name='' id='' /></td>
						</tr>
						<tr>
							<td><span>원산지</span></td>
							<td><input type='text' name='' id='' /></td>
							<td><span>상품설명</span></td>
							<td><input type='file' name='' id='' /></td>
						</tr>
						<tr>
							<td><span>알러지정보</span></td>
							<td colspan=3><input type='text' name='' id='' /></td>
							
						</tr>
					</table>
				</div>
				<div class='text-end'>
					<input type='button' name='' id='' value='등록' /> 
					<input type='button' name='' id='' value='취소' /> 
					<input type='button' name='' id='' value='수정' /> 
					<input type='button' name='' id='' value='삭제' />
				</div>
			</div>
		
			<!-- ------------------------------------------------------- -->
			<div id='category' class='col-5' >
				<div class='row text-center'>
					<div class='col'>
						<span>대분류</span>
					</div>
					<div class='col'>
						<span>소분류</span>
					</div>
				</div>
				<div class='row' id='cate'>
					<div class='col categoryTable'>
						<table class='text-center'>
							<colgroup>
					            <col width="30%" />
					            <col width="*"  />
			      			</colgroup>
							<tr>
								<th>번호</th>
								<th>이름</th>
							</tr>
							
							<!-- DB에 저장된 값 출력 -->
							
						</table>
					</div>
					<div class='col categoryTable'>
						<table class='cate text-center' >
							<colgroup>
					            <col width="30%" />
					            <col width="*"  />
			      			</colgroup>
							<tr>
								<th>번호</th>
								<th>이름</th>
								
								<!-- DB에 저장된 값 출력 -->
								
							</tr>
						</table>
					</div>
				</div>
				<div class='row text-end'>
					<div class='col'>
						<input type='text' name='' id='' /> 
					</div>
					<div class='col'>
						<input type='text' name='' id='' /> 
					</div>
				</div>
				<div class='row text-center'>
					<div class='col'>
						<input type='button' name='' id='' value='등록' /> 
						<input type='button' name='' id='' value='취소' /> 
						<input type='button' name='' id='' value='수정' /> 
						<input type='button' name='' id='' value='삭제' />
					</div>
					<div class='col'>
						<input type='button' name='' id='' value='등록' /> 
						<input type='button' name='' id='' value='취소' /> 
						<input type='button' name='' id='' value='수정' /> 
						<input type='button' name='' id='' value='삭제' />
					</div>
				</div>
			</div>
		</div>
		
		<!-- ----------------------------------------------------- -->
		<div class='text-end'>
			<table>
				<tr>
					<td>
						<select>
							<option value=''>이름</option>
							<option value=''>대분류</option>
							<option value=''>소분류</option>
							<option value=''>공급처</option>
							<option value=''>등록일</option>
						</select>
					</td>
					<td><input type='text' id='' name='' /></td>
					<td><input type='button' id='' name='' value='검색' /></td>
				</tr>
			</table>
		</div>
		<div class='row' id='allitem'>
			<table>
				<colgroup>
		            <col width="5%" />
		            <col width="*"  />
		            <col width="8%" />
		            <col width="8%"/>
		            <col width="7%" />
		            <col width="10%" />
		            <col width="10%"/>
		            <col width="13%" />
		      	</colgroup>
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
				
				<!-- DB에 저장된 값 출력 -->
				
			</table>
		</div>
	</div>
</body>
</html>