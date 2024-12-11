$(function(){

	//결제 주문키 생성 함수
	function generateKey() {
		const today = new Date();
		const date = today.toISOString().slice(0, 10).replace(/-/g, ''); // YYYYMMDD
		const random = Math.random().toString(36).substring(2, 6).toUpperCase(); // 4자리 랜덤 문자
		return `${date}${random}`;
	}//결제 주문키 생성-end

	// 결제 api
	var oPay = Naver.Pay.create({
		"mode" : "development", // development or production
		"clientId": "HN3GGCMDdTgGUfl0kFCo", // clientId
		"chainId": "clBWajc0akF3cVh", // chainId
	});
	let totalPayAmount = 0;
	let taxScopeAmount = 0;
	$('.productRow').each(function(){
		totalPayAmount += parseInt($(this).find('.product_price').attr('value'));
		taxScopeAmount += parseInt($(this).find('.product_price').attr('value'));
	});
	//직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요

	var elNaverPayBtn = document.getElementById("naverPayBtn");

	elNaverPayBtn.addEventListener("click", function() {
		if($('.bi').hasClass('bi-square')) {
			alert('결제이용약관을 동의하지 않았습니다. 동의후 다시 시도해주세요.')
		}else if($('.deliveryNowAddr').find('span').first().text().trim() == '' ) {
			alert('배송지를 설정후 다시 시도해주세요.')
		}else {

			oPay.open({
				"merchantPayKey": generateKey(),
				"productName": productsName = $('.productRow').find('.product_name').first().text()+' 외 '+ ($('.product_name').length-1)+'개',
				"totalPayAmount": totalPayAmount,
				"taxScopeAmount": taxScopeAmount,
				"taxExScopeAmount": "0",
				"returnUrl": "http://192.168.0.184:8080/glowamber/mainpage/MainPage"
			});
			 // 팝업이 닫혔을 때 처리
            var pollTimer = setInterval(function() {
                if (oPay.closed) {
                    clearInterval(pollTimer); // 타이머 정리
                    alert('주문이 완료되어서 처음으로 돌아갑니다.');
                    window.location.href = "mainpage/MainPage"; // 페이지 이동
                }
            }, 1000); // 1초마다 팝업 상태 확인
			// 에이젝스 통신 데이터베이스에 넣기
			// order에 넣기
			let orderNum = 0;
			let orderAjaxData = {
					memberNum:$('.order_name').attr('value'),
					orderName:$('.order_name').text(),
					orderAddr:$('.deliveryNowAddr').find('span').first().text(),
					orderAddrDetail:$('.deliveryNowAddr').find('span').eq(1).text(),
					orderRequest:"배송요청사항:"+$('.requestRider').text()+','+"업체요청사항:"+$('.requestCompany').text(),
			}
			$.ajax({
				type:'post',
				url:'/glowamber/order',
				data:orderAjaxData,
				dataType:'json',
				success:function(result){
					orderNum = result;
					// orderDetail에 넣기
					$('.productRow').each(function(){
						let orderDetailAjaxData = {
								orderNum:orderNum,
								itemNum:$(this).find('.product_img').attr('value'),
								orderDetailPrice:($(this).find('.product_price').val()/$(this).find('.product_count').attr('value')),
								orderDetailCount:$(this).find('.product_count').attr('value'),
								memberId:$(this).attr('value')
						}
						$.ajax({
							type:'post',
							url:'/glowamber/orderDetailAdd',
							data:orderDetailAjaxData,
							dataType:'json',
							success:function(result){

							}
						});
					});
				}
			});
		}
	});// 결제 api -end


	// 주소 api
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("delivery-addr").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("delivery-addrDetail").focus();
			}
		}).open();
	}	// 주소 api -end

	//주소변경후 등록완료 버튼 누를시
	$('.addr_complete').click(function(){
		$('.deliveryNowName').text($('#delivery-name').val());
		$('.deliveryNowAddr').find('span').first().text($('#delivery-addr').val()+' ');
		$('.deliveryNowAddr').find('span').eq(1).text($('#delivery-addrDetail').val())
	});

	//주소 api 버튼클릭
	$('.addrApi').click(function(){
		sample6_execDaumPostcode();
	});

	// 주문 총금액 출력
	let orderTotalPrice = 0;
	let deliveryPrice = '0';

	// 각상품 금액 더하기
	$('.orderProductPrice').each(function(){
		orderTotalPrice += parseInt($(this).find('input').val());
	});
	//배송비 금액 확인
	deliveryPrice = orderTotalPrice < 50000 ? '3000원' : '무료';
	let formatted = new Intl.NumberFormat('ko-KR').format(orderTotalPrice);
	$('.totalProductPrice').find('h4').text('주문 총금액 : '+formatted+'원 '+'+ 배송비 : '+deliveryPrice);
	$('.priceProduct').text(formatted+'원');
	$('.priceDelivery').text(deliveryPrice);
	$('.total').text( new Intl.NumberFormat('ko-KR').format(orderTotalPrice+(orderTotalPrice < 50000 ? 3000 : 0))+'원')

	// 주문 총금액 출력 -end

	//주소변경 눌렀을때 기존주소 띄우기
	$('#deliveryChange').on('show.bs.modal',function(){
		$('#delivery-name').val($('.deliveryNowName').text())
		$('#delivery-addr').val($('.deliveryNowAddr').text())
		$('#delivery-addrDetail').val('')
	});
	//요청사항 작성 눌렀을때
	$('#requestChange').on('show.bs.modal',function(){
		$('#request-company').val('')
		$('#request-rider').val('')
	});
	//요청사항 작성완료 눌렀을때
	$('.request_complete').click(function(){
		$('.requestRider').text($('#request-rider').val())
		$('.requestCompany').text($('#request-company').val())
	});

	//결제 동의 버튼 눌렀을때
	$('.bi').click(function(){
		if($(this).hasClass('bi-square')) {
			$(this).removeClass('bi-square');
			$(this).addClass('bi-check-square-fill');
		}else {
			$(this).removeClass('bi-check-square-fill');
			$(this).addClass('bi-square');
		}
	});

});