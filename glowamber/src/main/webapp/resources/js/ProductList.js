$(function(){

	// url 파라메터 얻어서 각 소분류 pk 비교해서 색상변경
	let urlParams = new URLSearchParams(window.location.search);
	let smallcatenum = urlParams.get('smallCateNum');
	if(smallcatenum) {
		$('.smallcate').each(function(){
			if($(this).attr('value') == smallcatenum) {
				$(this).addClass('smallcate_active');
			}
		});
	}// url 파라메터 얻어서 각 소분류 pk 비교해서 색상변경 -end
	// 소분류 클릭시 에이젝스
	$('.smallcate').click(function(){
		$('.smallcate').removeClass('smallcate_active')
		$(this).addClass('smallcate_active')
		$.ajax({
			type:'post',
			url:'smallProductList',
			data:{smallCateNum:$(this).attr('value')},
			dataType:'json',
			success:function(result){
				$('#product_container').empty();
				for(product of result) {
					let formatted = new Intl.NumberFormat('ko-KR').format(product['itemPrice']);
					$('#product_container').append('<div class="col-12 col-sm-6 col-md-3"><div class="row" id="product_four"><div class="col-12 col-12 col-sm-12 col-md-12 carouesl_img" value="'+product['itemNum']+'"><img alt="상품사진 ^^" src="'+product['itemThumnail']+'"></div><div class="col-12 col-sm-12 col-md-12 carouesl_button"><button><i class="bi bi-bag"></i> 담기</button></div><div class="col-12 col-sm-12 col-md-12 carouesl_name" value="'+product['itemName']+'">'+product['itemName']+'</div><div class="col-12 col-sm-12 col-md-12 carouesl_price" value="'+product['itemPrice']+'">'+formatted+'원</div></div></div>')
				}
			}
		});
	});// 소분류 클릭시 에이젝스 -end

	// 상품 클릭시 상세페이지로 이동
	$('#product_container').on('click','.carouesl_img,.carouesl_name,.carouesl_price',function(){

		location = '/glowamber/selectProductDetail?itemNum='+$(this).attr('value');
	});// 상품 클릭시 상세페이지로 이동 -end
	
	// 장바구니 모달창에서 숫자 변경 클릭시 숫자 변경 및 합계금액 변경
		$(document).on('click','.plus',function(){
			let counterplus = parseInt($(this).prev().text());
			$(this).prev().text(counterplus+1);
			$(this).parents('.modal-body').next().find('.total_price').text((parseInt($(this).parent().parent().prev().find('.product_price').attr('value'))*(counterplus+1)).toLocaleString()+'원');
		});
		$(document).on('click','.minus',function(){
			let counterminus = parseInt($(this).next().text());
			if(counterminus != 0){
				$(this).next().text(counterminus-1);
				$(this).parents('.modal-body').next().find('.total_price').text((parseInt($(this).parent().parent().prev().find('.product_price').attr('value'))*(counterminus-1)).toLocaleString()+'원');
			}else{
				$(this).next().text('0');
				$(this).parents('.modal-body').next().find('.total_price').text((parseInt($(this).parent().parent().prev().find('.product_price').attr('value'))*(counterminus)).toLocaleString()+'원');
			}
		});// 장바구니 모달창에서 숫자 변경 클릭시 숫자 변경 및 합계금액 변경 -end

		// 모달창에서 장바구니 담기 버튼 눌렸을대 장바구니에 담기
		// 장바구니 담기 버튼 클릭시 쿠키에 저장
			$('.btn_add').click(function(){
				
				let itemNum = $(this).attr('value');
				let itemcount =$(this).parent().prev().find('.product_count').text();
				// 최소수량체크
				if(itemcount != 0) {
					let guestId = Cookies.get('guestId');
					// 세션에 로그인 됬는지 확인
					if(!sessionId) {
						// 로그인 안되있고 쿠키에 비회원 고유아이디가 없을시 생성
						if(!guestId) {
							guestId = 'guset-' + Math.random().toString(36).substr(2,9);
							Cookies.set('guestId',guestId,{expires:30 ,path:'/'});
						}
					} //세션 로그인 확인 및 비회원시 쿠키 고유값생성 -end

					// 아이디 있고 게스트아이디 없음 아이디만 카트에 추가
					if(sessionId && !guestId) {
						// 에이젝스 통신으로 db에 쿠키의 고유 아이디 담아서 장바구니 전송
						$.ajax({
							type:'post',
							data:{guestId:"",itemNum:itemNum,cartItemCount:itemcount,memberId:sessionId},
							dataType:'json',
							url:'/glowamber/memberCartAdd',
							success:function(result){
								if(result == 1) {
									alert("장바구니에 상품을 담았습니다.");
								}else if(result == 10) {
									alert("장바구니에 이미 해당상품이 있어서 수량을 추가하였습니다.");
								}
							},
							error: function(){
								alert("장바구니에 상품을 담는데 오류가 발생하였습니다.");
							}
						});// 에이젝스 통신으로 db에 쿠키의 고유 아이디 담아서 장바구니 전송 -end
					}// 아이디 있고 게스트아이디 없고 -end

					// 아이디는 없고 게스트아이디만 있어서 비회원으로 카트에 담기
					else if(!sessionId && guestId) {
						// 에이젝스 통신으로 db에 쿠키의 고유 아이디 담아서 장바구니 전송
						$.ajax({
							type:'post',
							data:{guestId:guestId,itemNum:itemNum,cartItemCount:itemcount,memberId:""},
							dataType:'json',
							url:'/glowamber/nonMemberCartAdd',
							success:function(result){
								if(result == 1) {
									alert("장바구니에 상품을 담았습니다.");
								}else if(result == 10) {
									alert("장바구니에 이미 해당상품이 있어서 수량을 추가하였습니다.");
								}
							},
							error: function(){
								alert("장바구니에 상품을 담는데 오류가 발생하였습니다.");
							}
						});// 에이젝스 통신으로 db에 쿠키의 고유 아이디 담아서 장바구니 전송 -end
					}// 아이디 없고 게스트아이디 있고 -end

				}// 최소수량체크 if -end
				else {
					alert("최소구매 수량은 1개입니다.");
				}// 최소수량체크 else -end
			}); // 장바구니 담기 버튼 클릭시 쿠키에 저장 -end
	
			
			
});