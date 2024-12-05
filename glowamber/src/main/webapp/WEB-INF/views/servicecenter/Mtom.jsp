<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mtom</title>
<link href="resources/css/Mtom.css" rel="stylesheet">
<!-- 부트스트랩 아이콘CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../headerfooter/Header.jsp" />
	<!-- 헤더 -->

	<div class="container" id="dd">
		<div class="row">
			<!-- 고객센터 버튼 -->
			<div class="col-2">
				<div class="row service_center">
					<div class="center_h">고객센터</div>
					<div class="ser_rec">
						<div class="row rec_ser">
							<div class="col-12">
								<button>공지사항</button>
							</div>
						</div>
						<div class="row rec_ser">
							<div class="col">
								<button>자주하는 질문</button>
							</div>
						</div>
						<div class="row rec_ser">
							<div class="col">
								<button>1:1 문의</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-10 mtom">
				<div class="sc_mtom_question">
					<div class="mtom_h">1:1 문의</div>
					<hr />
					<div class="container">
						<div class="row">
							<!-- 유형 제목 내용 -->
							<div class="col-2">
								<div class="row mtom_title">
									<div>유형</div>
								</div>
								<div class="row mtom_title">
									<div>제목</div>
								</div>
								<div class="row mtom_title">
									<div>내용</div>
								</div>
								<!-- 기입란 -->
							</div>
							<div class="col-10">
								<div class="row mtom_con">
									<input type="co">
								</div>
								<div class="row mtom_con">
									<input type="text" placeholder="제목을 입력해 주세요.">
								</div>
								<div>
									<div class="row mtom_con">
										<textarea rows="20" cols="50"></textarea>
									</div>
								</div>
								<div class="row">
								<div class="col-12">
									<button class="photo_btn">사진 첨부</button>
									</div>
									<div class="mtom_photo">
										-30MB 이하의 이미지만 업로드 가능합니다.<br /> -상품과 무관한 내용이거나 음란 및 불법적인 내용은
										통보없이 삭제 될 수 있습니다.<br /> -사진은 최대 8장까지 등록가능합니다.<br />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr>
				<!-- 답변 수신 -->
				<div class="container">
					<div class="row">
						<div class="col-2">
							<div class="row mtom_title">
								<div>답변</div>
							</div>
						</div>
						<div class="col-10">
							<div class="row">
								<div class="col-3 res_in">
									<input type="text" placeholder="010-XXXX-XXXX">
								</div>
								<div class="col-1 text-end">
									<i class="bi bi-check-circle fs-2"></i>
								</div>
								<div class="col-5 res_in">
									<div>알림 메세지 받기</div>
								</div>
								<div class="col-3 text-end res_in">
									<div>개인정보 수정</div>
								</div>
							</div>
							<div class="row res_msg">&#8251; 야간에도 답변 완료 메세지가 발송 되는 점 참고
								부탁 드립니다.</div>
						</div>
					</div>
				</div>
				<hr>
				<div class="container">
					<div class="row">
						<div class="col-2"></div>
						<!-- 등록 버튼 -->
						<div class="col-10 mtom_checkin">
							<button>등록</button>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>






	</div>
	<!-- 풋터 -->
	<jsp:include page="../headerfooter/Footer.jsp" />
	<!-- 풋터 -->
</body>
</html>