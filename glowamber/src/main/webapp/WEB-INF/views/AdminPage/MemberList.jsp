<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 css -->
<linkhref ="https://cdn.jsdelivr.net/npm/bootstrap
	@5.3.3/dist/css/bootstrap.min.css"  rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous"> <!-- css -->
<link href="/glowamber/resources/css/Admin/MemberList.css" rel="stylesheet">

<meta charset="UTF-8">
<title>GlowAmber</title>
<!-- 부트스트랩 script --> <script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script> <!-- JQUERY script --> <script
	src="https://code.jquery.com/jquery-3.7.1.min.js"></script> <!-- script -->
<script type="text/javascript"
	src='/glowamber/resources/js/Admin/MemberList.js'></script>
</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="AdminHeader.jsp" />
	<!-- 헤더 -->
	<div class='container itemcontainer text-center'>
		<div class='row popup_layer'>
			<div  class='col '>
				<div class='popup_box'>
					<div>
						<table class='infoTable text-center'>
							<tr>
								
								<td>이름<input type='hidden' id='usernum' /></td>
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
								<td id='usertotalPurchase'></td>
							</tr>
							<tr>
								<td>총액</td>
								<td id='usertotalPrice'></td>
							</tr>
							<tr>
								<td>주소</td>
								<td id='useraddr'></td>
							</tr>
							<tr>
								<td>상세주소</td>
								<td id='useraddrdetail'></td>
							</tr>
							<tr>
								<td>권한설정</td>
								<td>관리자<input type='checkbox' id='memberAuth'></td>
							</tr>
						</table>
					</div>
					<div class='text-end'>
						<input type='button' id='popupCheck' value='확인' /> 
					</div>
				</div>
			</div>
		</div>
		<!-- 회원검색 -->
		<div>
			<div class='row'>
				<div class='col-1'>
					<select id='memberSelectCate'>
						<option value='memberName'>이름</option>
						<option value='memberId'>아이디</option>
						<option value='memberTel'>전화번호</option>
						<!-- <option value=''>구매횟수</option>
					<option value=''>구매총액</option> -->
						<option value='memberJoinDate'>가입일</option>
					</select>
				</div>
				<div class='col'>
					<input type='text' />
				</div>
				<div class='col-1'>
					<input type='button' id='memberSelectBtn' value='검색' />
				</div>
			</div>
			<!-- 회원리스트 -->
			<div class='row' id='memberListHead'>
				<div class='col'>
					<table>
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
					</table>
				</div>
	
			</div>
			<div class='row text-center' id='memberListBody'>
				<div class='col'>
					<table id='memberTable'>
	
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>