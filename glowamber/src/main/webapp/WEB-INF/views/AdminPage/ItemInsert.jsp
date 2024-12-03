<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%  String FilePath = request.getSession().getServletContext().getRealPath("/");  %>
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
<script type="text/javascript" src='/glowamber/resources/js/Admin/ItemTab.js'></script>
</head>
<body>
	<!-- 관리자 페이지 헤더 -->
<%-- 	<jsp:include page="AdminHeader.jsp" /> --%>
	
	
	<div class='container-xxl'>
		<div class='row'>
			<!-- 카테고리 생성-->
			<div class='col'>
				<div class='row text-center'>
					<div class='col'>
						<span>카테고리</span>
					</div>
				</div>
				<div class='row' id='cate'>
					<!-- 대분류 카테고리 리스트 -->
					<div class='col listTable'>
						<div>
							<table class='cate text-center' id='BigCateList'>
								<colgroup>
						            <col width="30%" />
						            <col width="*"  />
				      			</colgroup>
								<tr>
									<th>대분류</th>				
								</tr>
							</table>
						</div>
					</div>
					<!-- 소분류 카테고리 리스트 -->
					<div class='col listTable'>
						<div>

							<table class='cate text-center' id='SmallCateList'>
								<colgroup>
						            <col width="30%" />
						            <col width="*"  />
				      			</colgroup>
								<tr>
									<th>소분류</th>						
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class='row text-start'>
						<div class='col'>
						<!-- 카테고리 입력 테이블 -->
							<table id='cateInsert'>
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
											<option value=1>대분류</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>카테고리 명</td>
									<td><input type='text' id='InsertCateName' /></td>
								</tr>
							</table>
						</div>
						<div class='col'>
						<!-- 카테고리 수정 테이블 -->
							<table id='cateUpdate'>
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
						</div>
					</div>		
					<div class='row text-center'>
						<div class='col'>
							<input type='button' id='CateInsertBtn' value='등록' /> 
							<input type='button' id='CateInsertCancle' value='취소' />  
						</div>
						<div class='col'>
							<input type='button' id='CateUpdateBtn' value='수정' /> 
							<input type='button' id='CateUpdateCancle' value='취소' />  
						</div>
					</div>
			</div>
			
			<!-- 상품 정보 입력 -->
			<div class='col'>
				<div>
					<div>
						<span>이미지</span>
						<input type='hidden' value='<%= FilePath%>'>
					</div>
					<div>
						<input type='text' id='itemThumnail' />
					</div>
				</div>
				<div>
					<div>
						<span>상품명</span>
					</div>
					<div>
					<div>
						<input type='text' id='itemName' />
					</div>
				</div>
				<div>
					<div>
						<span>카테고리</span>
					</div>	
					<div>
						<input type='text' id='samllCateNum' />
					</div>	
				</div>
				<div>
					<div>
						<span>판매가</span>
					</div>	
					<div>	
						<input type='text' id='itemPrice' />
					</div>	
				</div>
				<div>
					<div>
						<span>원가</span>
					</div>	
					<div>		
						<input type='text' id='itemCost' />
					</div>	
				</div>				
				<div>
					<div>
						<span>원산지</span>
					</div>	
					<div>	
						<input type='text' id='itemOrigin' />
					</div>	
				</div>
				<div>
					<div>
						<span>용량/중량</span>
					</div>
					<div>	
						<input type='text' id='itemVolume' />
					</div>
				</div>
				<div>
					<div>
						<span>판매단위</span>
					</div>
					<div>	
						<input type='text' id='itemUnit' />
					</div>
				</div>
				<div>
					<div>
						<span>공급업체</span>
					</div>
					<div>	
						<input type='text' id='itemSupplier' />
					</div>
				</div>
				<div>
					<div>
						<span>알러지정보</span>
					</div>
					<div>	
						<textarea id='itemAllErgyinfo'></textarea>
					</div>	
				</div>
				<div>
					<div>
						<span>상품설명</span>
					</div>
					<div id='smarteditor'>
						<textarea rows="20" cols="10" name='editorTxt' id="itemdetail" placeholder="내용을 입력해 주세요"
						style="width:500px"></textarea>
					</div>
				</div>
			</div>
			<div>
				<input type='button' id='itemInsertBtn' value='등록'>
				<input type='button' id='itemInsertCancle' value='취소' /> 
			</div>
		</div>
	</div>
<!-- 	<form action="insertStudentInfoForm" method='post'> -->
		
<!-- 	</form> -->

		
	
</body>
</html>