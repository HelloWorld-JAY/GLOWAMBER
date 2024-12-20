<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<% String path = request.getSession().getServletContext().getRealPath("/"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- css -->
	<link href="/glowamber/resources/css/Admin/ItemInsert.css" rel="stylesheet">
<!-- 부트스트랩 script -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous">
</script>

<!-- 스마트에디터 js -->
<script type="text/javascript" src="/glowamber/resources/smarteditor/js/HuskyEZCreator.js" charset="UTF-8"></script>
<!-- jquery js -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
 <!-- user js -->
<script type="text/javascript" src='/glowamber/resources/js/Admin/ItemInsert.js'></script>
</head>
<body>
	<!-- 관리자 페이지 헤더 -->
	<jsp:include page="AdminHeader.jsp" />
	
	<!-- 카테고리 생성-->
	<div class='container'>
		<div class='popup_layer' id='category'>
			<div class='col popup_box'>
				<div class='row'>
					<div class='col text-center'>
						<h4>카테고리</h4>
					</div>
					<div class='col-1 text-end'>
						<input type='button' id='categoryhide' value='x' />
					</div>
					<div class='text-end'>
						<input type='button' id='cateInsertBtn' value='등록' />
						<input type='button' id='cateUpdateBtn' value='수정' />
					</div>
				</div>
				<div class='row' id='catelist'>
					<!-- 대분류 카테고리 리스트 -->
					<div class='col listTable'>
						<div>
							<table class='text-center CateListHead' id='BigCateListHead'>
								<tr>
									<th>대분류</th>				
								</tr>
							</table>
						</div>
						<div id='bigcatelist'>
							<table class='text-center CateListBody' id='BigCateListBody'>
							</table>
						</div>
					</div>
					<!-- 소분류 카테고리 리스트 -->
					<div class='col listTable'>
						<div>
							<table class='text-center CateListHead' id='SmallCateListHead'>
								<tr>
									<th>소분류</th>						
								</tr>
							</table>
						</div>
						<div id='smallcatelist'>
							<table class='text-center CateListBody' id='SmallCateListBody'>
							</table>
						</div>
					</div>
				</div>
				<div class='row text-start'>
					<!-- 카테고리 입력 테이블 -->
						<div>
							<table class='cateInsert'>
								<tr>
									<td>분류</td>
									<td>
										<select id='InsertCateType'>
											<option value='big'>대분류</option>
											<option value='small'>소분류</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>대분류</td>
									<td>
										<select id='SelectBigCate'>
										</select>
									</td>
								</tr>
								<tr>
									<td>카테고리 명</td>
									<td><input type='text' id='InsertCateName' /></td>
								</tr>
							</table>
							<div class='col cateInsert text-end'>
								<input type='button' id='CateInsertBtn' value='등록' /> 
								<input type='button' id='CateInsertCancle' value='취소' />  
							</div>
						</div>
						<!-- 카테고리 수정 테이블 -->
						<div>
							<table class='cateUpdate'>
								<tr>
									<td>번호</td>
									<td><input type='text' id='CateNum' readonly/></td>
								</tr>
								<tr>
									<td>분류</td>
									<td>
										<input type='text' id='UpdateCateType' readonly>
									</td>
								</tr>
								<tr>
									<td>대분류 명</td>
									<td>
										<input type='hidden' id='BigCateNum' >
										<input type='text' id='UpdateBigCateName' readonly>
									</td>
								</tr>
								<tr>
									<td>카테고리 명</td>
									<td><input type='text' id='UpdateCateName' /></td>
								</tr>
							</table>
							<div class='col cateUpdate text-end'>
								<input type='button' id='CateUpdateBtn' value='수정' /> 
								<input type='button' id='CateUpdateCancle' value='취소' />  
							</div>
						</div>
					</div>		
			</div>
		</div>
		<div class='row'>
			<!-- 상품 정보 입력 -->
			<form action='/glowamber/iteminsert' name='iteminsert' method="post" enctype="multipart/form-data">
			
			<div>
				<div class='text-end'>
					<input type='submit' id='itemInsertBtn' value='저장'>
					<a href='ItemList'><input type='button' id='itemInsertCancle' value='취소' /> </a>
					<hr/>
				</div>
					<div>
						<div>
							<span>이미지</span>
						</div>
						<div>
							<input type='hidden' name='path' value='<%=path %>' />
							<input type='file' name='file'  id='itemThumnail' />
						</div>
					</div>
					<div>
						<div>
							<span>상품명</span>
						</div>
						<div>
							<input type='text' name='itemName' id='itemName' />
						</div>
						<div>
							<div class='row'>
								<div class='col'>
									대분류<input type='text' name='bigCateNum' id='bigCateNum' />
								</div>
								<div class='col'>
									소분류<input type='text' name='smallCateNum' id='smallCateNum' />
								</div>
							</div>	
							<div class='text-end'>
								<input type='button' id='categoryUp' value='선택' />
							</div>	
						</div>
						<div>
							<div>
								<span>판매가</span>
							</div>	
							<div>	
								<input type='text' name='itemPrice' id='itemPrice' />
							</div>	
						</div>
						<div>
							<div>
								<span>원가</span>
							</div>	
							<div>		
								<input type='text' name='itemCost' id='itemCost' />
							</div>	
						</div>				
						<div>
							<div>
								<span>원산지</span>
							</div>	
							<div>	
								<input type='text' name='itemOrigin' id='itemOrigin' />
							</div>	
						</div>
						<div>
							<div>
								<span>용량/중량</span>
							</div>
							<div>	
								<input type='text' name='itemVolume' id='itemVolume' />
							</div>
						</div>
						<div>
							<div>
								<span>판매단위</span>
							</div>
							<div>	
								<input type='text' name='itemUnit' id='itemUnit' />
							</div>
						</div>
						<div>
							<div>
								<span>공급업체</span>
							</div>
							<div>	
								<input type='text' name='itemSupplier' id='itemSupplier' />
							</div>
						</div>
						<div>
							<div>
								<span>알러지정보</span>
							</div>
							<div>			
								<textarea name='itemAllErgyinfo' id='itemAllErgyinfo'></textarea>
							</div>	
						</div>
						<div class='smarteditor'>
							<div>
								<span>상품설명</span>
							</div>
							<div >
								<textarea rows="20" cols="10" name='itemDetail' id="itemdetail" placeholder="내용을 입력해 주세요"></textarea>
							</div>
						</div>
						<div class='smarteditor'>
							<div>
								<span>상품상세</span>
							</div>
							<div >
								<textarea rows="20" cols="10" name='itemDetailSub' id="itemdetailsub" placeholder="내용을 입력해 주세요"></textarea>
							</div>
						</div>
					</div>
				</div>
			</form>
	</div>
</div>
</body>
</html>