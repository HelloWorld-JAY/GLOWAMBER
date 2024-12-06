<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Glow Amber</title>
<!-- css -->
<link href="/glowamber/resources/css/AdminMain.css" rel="stylesheet">
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
<!-- JQUERY script -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- script -->
<script type="text/javascript" src='/glowamber/resources/js/Admin/Admin.js'></script>
<script type="text/javascript" src='/glowamber/resources/js/Admin/ItemMain.js'></script>
<script type="text/javascript" src='/glowamber/resources/js/Admin/MemberManage.js'></script>

</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="AdminHeader.jsp" />
	<!-- 헤더 -->
	
	<!-- 주문관리 탭 -->
	<div id='Order' class='container-xxl AdminTab'>
		<div>
			<div class='row'>
				<div class='col text-center containBorder'>
					<input type='date' id='' value=''  />
					~
					<input type='date' id='' value=''  />
				</div>	
			</div>
			<div class='row'>
				<div class='col-4 containBorder' id='OrderInfo'>
					<div>
						<table class='infoTable'>
							<tr>
								<td>주문번호</td>
								<td></td>
							</tr>
							<tr>
								<td>상태</td>
								<td>
									<select id='orderStatus'>
										<option value='new'>신규</option>
										<option value='wait'>대기</option>
										<option value='delivery'>배송중</option>
										<option value='complete'>완료</option>
										<option value='refund'>환불</option>
										<option value='exchange'>교환</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>아이디</td>
								<td></td>
							</tr>
							<tr>
								<td>상품명</td>
								<td></td>
							</tr>
							<tr>
								<td>수량</td>
								<td></td>
							</tr>
							<tr>
								<td>환불/교환사유</td>
								<td>
									<textarea id="" name="" rows="11"></textarea>
								</td>
							</tr>
							<tr>
								<td>받는사람</td>
								<td></td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td></td>
							</tr>
							<tr>
								<td>주소</td>
								<td></td>
							</tr>
							<tr>
								<td>상세주소</td>
								<td></td>
							</tr>
							<tr>
								<td>배송요청사항</td>
								<td>
									<textarea id="" name="" rows="10"></textarea>
								</td>
							</tr>
						</table>
					</div>
					<div class='text-end'>
						<input type='button' id='' name='' value='확인' />
					</div>
				</div>
				<div class='col containBorder-noline' id='OrderList'>
					<div class='row containBorder'>
							<div class='col text-start'>
								<select>
									<option>전체</option>
									<option>신규</option>
									<option>대기</option>
									<option>배송중</option>
									<option>완료</option>
								</select>
							</div>
							<div class='col text-end'>
								<select>
									<option>전체</option>
									<option>이름</option>
									<option>날짜</option>
									<option>상품</option>
								</select>
								<input type='text' id='' name='' />
								<input type='button' id='' name='' value='검색' />
							</div>
						<div class='listTable'>
							<div>
								<table id='orderTable'>
									<colgroup>
							            <col width="8%"  />
							            <col width="11%" />
							            <col width="*"/>
							            <col width="8%" />
							            <col width="13%" />
							            <col width="15%"/>
							      	</colgroup>
									<tr>
										<th>주문번호</th>
										<th>이름</th>
										<th>상품명</th>
										<th>수량</th>
										<th>가격</th>
										<th>날짜</th>
									</tr>
									
									<!-- DB에 저장된 값 출력 -->
									
								</table>
							</div>
						</div>
					</div>
					<div class='row containBorder'>
						<div class='col text-start'>
							<select>
								<option>전체</option>
								<option>환불</option>
								<option>교환</option>
							</select>
						</div>
						<div class='col text-end'>
							<select>
								<option>전체</option>
								<option>이름</option>
								<option>날짜</option>
								<option>상품</option>
							</select>
							<input type='text' id='' name='' />
							<input type='button' id='' name='' value='검색' />
						</div>
						<div class='listTable'>
							<div>
								<table>
									<colgroup>
							            <col width="8%"  />
							            <col width="11%" />
							            <col width="*"/>
							            <col width="8%" />
							            <col width="13%" />
							            <col width="15%"/>
							      	</colgroup>
									<tr>
										<th>상태</th>
										<th>이름</th>
										<th>상품명</th>
										<th>수량</th>
										<th>가격</th>
										<th>날짜</th>
									</tr>
									
									<!-- DB에 저장된 값 출력 -->
									
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 고객관리 탭 -->
	<div id='MemberManage' class='container-xxl AdminTab'>
		<div class='container'>
			<div class='row'>
				<div id="MemberInfo" class='col containBorder'>
					<div>
						<table class='infoTable'>
							<colgroup>
								<col width='20%'>
								<col width='*'>
							</colgroup>
							<tr>
								<td>이름</td>	
								<td id='username'></td>
							</tr>
							<tr>
								<td>아이디</td>
								<td id='userid'></td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td id='usertel'></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td id='useremail'></td>
							</tr>
							<tr>
								<td>구매횟수</td>
								<td id='userbuycount'></td>
							</tr>
							<tr>
								<td>총액</td>
								<td id='usertotalamount'></td>
							</tr>
							<tr>
								<td>주소</td>
								<td id='useraddr'></td>
							</tr>
							<tr>
								<td>상세주소</td>
								<td id='useraddrdetail'></td>
							</tr>
						</table>
					</div>
					<div class='text-end'>
						<input type='button' name='' id='' value='확인' /> 
						<input type='button' name='' id='' value='취소' /> 
					</div>
				</div>
				
				<div id= 'PurchaseList' class='col containBorder'>
					<div>
						<div class='text-center'>
							<select>
								<c:forEach begin="1" end="12" step="1" varStatus='status'>
									<option>${status.index}월</option>
								</c:forEach>
							</select>
						</div>
						<div class='listTable'>
							<div>
								<table class='text-center'>
									<colgroup>
							            <col width="30%" />
							            <col width="*"  />
					      			</colgroup>
									<tr>
										<th>카테고리</th>
										<th>상품명</th>
									</tr>
									
									<!-- DB에 저장된 값 출력 -->
									
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- @@@@@@@@@@@@@ -->
			<div class='row containBorder' id='MemberList'>
				<div class='text-end'>
					<select id='memberSelectCate'>
						<option value='memberName'>이름</option>
						<option value='memberId'>아이디</option>
						<option value='memberTel'>전화번호</option>
				   <!-- <option value=''>구매횟수</option>
						<option value=''>구매총액</option> -->
						<option value='memberJoinDate'>가입일</option>
					</select>
					<input type='text' id='' name='' />
					<input type='button' id='memberSelectBtn' value='검색' />
				</div>
				<div class='listTable'>
					<div>
						<table id='memberTable'>
							<colgroup>
					            <col width="9%" />
					            <col width="11%" />
					            <col width="20%" />
					            <col width="*%"/>
					            <col width="20%" />
					      	</colgroup>
							<tr>
								<th>이름</th>
								<th>아이디</th>
								<th>전화번호</th>
								<th>이메일</th>
								<th>가입일</th>
								<!-- <th>접속일</th> -->
								<th>구매횟수</th>
								<th>구매총액</th>
								<!-- <th>회원등급</th> -->
								<th>탈퇴여부</th>
							</tr>
							
							<!-- DB에 저장된 값 출력 -->
							
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>