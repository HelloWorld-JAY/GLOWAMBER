<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<link href="/glowamber/resources/css/Login.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<!-- 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<%
	String clientId = "dKYs7trxDJBkPUXsQkKk";//애플리케이션 클라이언트 아이디값";
	String redirectURI = URLEncoder.encode("http://localhost:8080/glowamber/member/Login", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code" + "&client_id=" + clientId
			+ "&redirect_uri=" + redirectURI + "&state=" + state;
	session.setAttribute("state", state);
	%>


	<!-- 헤더 -->
	<jsp:include page="../headerfooter/Header.jsp" />
	<!-- 헤더 -->

	<div class="container" id="login_div">
		<div>로그인</div>

		<form name="form" action="login" method="post">
			<div>
				<input type="text" name="memberId" placeholder="아이디를 입력하세요">
			</div>
			<div>
				<input type="password" name="memberPass" placeholder="비밀번호를 입력하세요">
			</div>
			<div>
				<label for="id_save"><input type="checkbox">아이디저장</label> <span><a
					href="">아이디찾기</a></span> <span>ㅣ</span> <span><a href="">비밀번호찾기</a></span>
			</div>
			<div>
				<button id="Login" name="Login">로그인</button>
			</div>
			<div>
				<button>회원가입</button>
			</div>
			<div class="container text-center">
				<div class="row">
					<div class="col-4">
						<a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
					</div>
					<div class="col-4">카카오</div>
					<div class="col-4">구글</div>
				</div>
			</div>

		</form>
	</div>


	<!-- 풋터 -->
	<jsp:include page="../headerfooter/Footer.jsp" />
	<!-- 풋터 -->
</body>
</html>
