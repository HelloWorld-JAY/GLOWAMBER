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
		<form action='/glowamber/itemupdate' name='iteminsert' method="post" enctype="multipart/form-data">
			
			<div class='text-end'>
				<input type='submit' id='itemUpdateBtn' value='저장'>
				<a href='AdminPage/ItemList'><input type='button' id='itemUpdateCancle' value='취소' /></a>
				<hr/>
			</div>
			<div class='col'>
					<div>
						<div>
							<span>이미지</span>
						</div>
						<div>
							<img src='${item.itemThumnail}' id='Thumnail' />
							<input type='hidden' value='${item.itemThumnail}' name='afteritemThumnail' id='afteritemThumnail' />
							<input type='hidden' value='${item.realFileName}' name='afterFilename' id='afterFilename' />
						</div>
						<div>
							<input type='hidden' name='path' value='<%=path %>' />
							<input type='file' name='file'  id='itemThumnail'  />
						</div>
					</div>
					<div>
						<div>
							<input type='hidden' name='itemNum' id='itemNum' value='${item.itemNum}' />
							<span>상품명</span>
						</div>
						<div>
							<input type='text' name='itemName' id='itemName' value='${item.itemName}' />
						</div>
						<div>
							<div>
								<span>카테고리</span>
							</div>	
							<div>
								<input type='text' name='smallCateNum' id='smallCateNum' value='${item.smallCateNum}' />
								<input type='button' id='categoryUp' value='선택' />
							</div>	
						</div>
						<div>
							<div>
								<span>판매가</span>
							</div>	
							<div>	
								<input type='text' name='itemPrice' id='itemPrice' value='${item.itemPrice}' />
							</div>	
						</div>
						<div>
							<div>
								<span>원가</span>
							</div>	
							<div>		
								<input type='text' name='itemCost' id='itemCost' value='${item.itemCost}' />
							</div>	
						</div>				
						<div>
							<div>
								<span>원산지</span>
							</div>	
							<div>	
								<input type='text' name='itemOrigin' id='itemOrigin' value='${item.itemOrigin}' />
							</div>	
						</div>
						<div>
							<div>
								<span>용량/중량</span>
							</div>
							<div>	
								<input type='text' name='itemVolume' id='itemVolume' value='${item.itemVolume}' />
							</div>
						</div>
						<div>
							<div>
								<span>판매단위</span>
							</div>
							<div>	
								<input type='text' name='itemUnit' id='itemUnit' value='${item.itemUnit}' />
							</div>
						</div>
						
						<div>
							<div>
								<span>공급업체</span>
							</div>
							<div>	
								<input type='text' name='itemSupplier' id='itemSupplier' value='${item.itemSupplier}' />
							</div>
						</div>
						<div>
							<div>
								<span>알러지정보</span>
							</div>
							<div>	
								<c:choose>
									<c:when test="${item.itemAllErgyinfo == null}">
										<textarea name='itemAllErgyinfo' id='itemAllErgyinfo'></textarea>
									</c:when>
									<c:otherwise>
										<textarea name='itemAllErgyinfo' id='itemAllErgyinfo'>${item.itemAllErgyinfo}</textarea>
									</c:otherwise>
									
								</c:choose>			
							</div>	
						</div>
						<div class='smarteditor'>
							<div>
								<span>상품설명</span>
							</div>
							<div>
								<textarea rows="20" cols="10" name='itemDetail' id="itemdetail" placeholder="내용을 입력해 주세요">${item.itemDetail}</textarea>
							</div>
						</div>
						<div class='smarteditor'>
							<div>
								<span>상품상세</span>
							</div>
							<div >
								<textarea rows="20" cols="10" name='itemDetailsub' id="itemdetailsub" placeholder="내용을 입력해 주세요">${item.itemDetailSub}</textarea>
							</div>
						</div>
					</div>
				</div>
			</form>
			<!-- 재고입력 -->
			<div id='storeInsert'>
				<div>
					<div>
						<span>재고</span>
						<input type='text' value="${storecount}" readonly>
					</div>
					<div>
						<span>입고수량</span>
						<input type='text' id='storeItemCount' />
					</div>
					<div>
						<span>유통기한</span>	
						<input type='date' id='storeExpirDate' />
					</div>
					<div>
						<span>입고가</span>
						<input type='text' id='storePrice' />
					</div>
					<div class='text-end'>
						<input type='button' id='inventoryStoreBtn' value='입고'>
						<input type='button' id='inventoryStoreCancle' value='취소' /> 
					</div>
				
				</div>
			</div>
		</div>
	</div>

	
</body>
</html>