<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOIN</title>
<!-- css연결 -->
<link href="/glowamber/resources/css/Join.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/Join.js"></script>
<!-- 부트스트랩 아이콘CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- 부트스트랩 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- 부트스트랩 js -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="../headerfooter/Header.jsp" />
	<!-- 헤더 -->

	<div class='container' id="join_membership">
		<div class="row">
			<div class="col-4"></div>
			<div class="col-4 tit">회원가입</div>
			<div class="col-4"></div>
			<hr>
			<div class="col-2"></div>
			<div class="col-8">
				<div class="row">
					<div class="col-2 join_tit text-end align-self-center">ID</div>
					<div class="col-8 bm text-center">
						<input type="text" placeholder="아이디를 입력하세요" name="memberId" id="memberId"> 
						<span id="idCheckResult" style="width: 150px; color: red" ></span>
					</div>
					<div class="col-2"></div>
				</div>
				<div class="row">
					<div class="col-2 join_tit text-end align-self-center">비밀번호</div>
					<div class="col-8 bm text-center">

						<input type="text" placeholder="비밀번호를입력하세요" name="memberPass" id="memberPads">

					</div>
					<div class="col-2"></div>
				</div>
				<div class="row">
					<div class="col-2 join_tit text-end align-self-center">비밀번호
						확인</div>
					<div class="col-8 bm text-center ">

						<input type="text" placeholder="비밀번호를 다시 입력하세요" name="memberPass2" id="memberPass2">

					</div>
					<div class="col-2"></div>
				</div>
				<div class="row">
					<div class="col-2 join_tit text-end align-self-center">이름</div>
					<div class="col-8 bm text-center">
						<input type="text" placeholder="이름을 입력하세요" name="memberName" id="">
					</div>
					<div class="col-2"></div>
				</div>

				<!-- 이메일 -->
				<div class="row">
					<div class="col-2 join_tit text-end align-self-center">E-mail</div>
					<div class="col-8 em text-center">


						<input type="text" placeholder="이메일을 입력하세요"> <span>@
						</span> <select class="combo">
							<option>선택하기</option>
							<option>gmail.com</option>
							<option>naver.com</option>
							<option>daum.net</option>
							<option>hanmail.net</option>
						</select>


					</div>
					<div class="col-2">
						<button class="ejoin">이메일 인증</button>
					</div>
				</div>
				<!-- 이메일 끝-->
				<div class="row">
					<div class="col-2 join_tit text-end align-self-center">전화번호</div>
					<div class="col-8 bm text-center">
						<input type="text" placeholder="전화번호를 입력하세요">
					</div>
					<div class="col-2"></div>
				</div>
				<div class="row">
					<div class="col-2 join_tit text-end align-self-center">주소</div>
					<div class="col-8 bm text-center">
						<button class="addr_btn">주소 찾기</button>
					</div>
					<div class="col-2"></div>
				</div>
			</div>
		</div>

		<!-- 약관동의 -->

		<div class='container' id="join_agree">
			<hr />
			<div class="row">
				<div class="col-3 text-end">이용약관 동의</div>
				<div class="col-6">
					<div class="row">
						<div class="col-1 join_check">
							<i class="bi bi-check-circle fs-2"></i>
						</div>
						<div class="col-9">
							<div class="join_font">전체 동의합니다.</div>
						</div>
					</div>
					<div class="row">
						<div class="col-1"></div>
						<div class="col-11" id="join_detail">선택항목에 동의하지 않은 경우도 회원가입
							및 일반적인 서비스를 이용할 수 있습니다.</div>
					</div>
					<div class="row">
						<div class="col-1 join_check">
							<i class="bi bi-check-circle fs-2"></i>
						</div>
						<div class="col-6">
							<div class="join_d">이용약관 동의(필수)</div>
						</div>
						<div class="col-5 text-end">
							<a href=""><div class="join_about">약관보기</div></a>
						</div>
					</div>
					<div class="row">
						<div class="col-1 join_check">
							<i class="bi bi-check-circle fs-2"></i>
						</div>
						<div class="col-6">
							<div class="join_d">개인정보 수집, 이용 동의(필수)</div>
						</div>
						<div class="col-5 text-end">
							<a href=""><div class="join_about">약관보기</div></a>
						</div>
					</div>
					<div class="row">
						<div class="col-1 join_check">
							<i class="bi bi-check-circle fs-2"></i>
						</div>
						<div class="col-6 ">
							<div class="join_d">개인정보 수집, 이용 동의(선택)</div>
						</div>
						<div class="col-5 text-end">
							<a href=""><div class="join_about">약관보기</div></a>
						</div>
					</div>
					<div class="row">
						<div class="col-1 join_check">
							<i class="bi bi-check-circle fs-2"></i>
						</div>
						<div class="col-9">
							<div class="join_d">무료배송, 할인 쿠폰 등 혜택/정보 수신 동의(선택)</div>
						</div>
					</div>
					<div class="row">
						<div class="col-2 text-end">
							<i class="bi bi-check-circle fs-2"></i>
						</div>
						<div class="col-4 join_check">
							<div class="join_s align-middle">SMS</div>
						</div>
						<div class="col-2 text-end">
							<i class="bi bi-check-circle fs-2"></i>
						</div>
						<div class="col-4 join_check">
							<div class="join_s">이메일</div>
						</div>

					</div>
					<div class="row">
						<div class="col-1 join_check">
							<i class="bi bi-check-circle fs-2"></i>
						</div>
						<div class="col-9">
							<div class="join_d">본인은 만 14세 이상입니다.(필수)</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- 가입하기 버튼 -->
		<div class="row" id="join_button">
			<div class="col-2"></div>
			<div class="col-2"></div>
			<div class="col-4">
				<button name="confirm" id="confirm">가입하기</button>
			</div>
			<div class="col-4"></div>
		</div>
	</div>

	<!-- 풋터 -->
	<jsp:include page="../headerfooter/Footer.jsp" />
	<!-- 풋터 -->
</body>
</html>
