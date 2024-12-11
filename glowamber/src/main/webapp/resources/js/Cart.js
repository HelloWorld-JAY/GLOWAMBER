$(function(){

	//총상품금액 변수
	let totalPrice = 0;

	//배송비 변수
	let deliveryChar = '';
	let deliveryNum = 0;

	// 금액 포맷변수
	let totalProductPriceFormatted ='';
	let totalPriceFormatted= '';
	let nonSelectAll = true;
	// 게스트 아이디 변수
	let guestId ='';
	//총금액 계산및 출력 함수
	function totalPricePrint(){
		totalPrice = 0
				// 총금액 구하기
				$('.productTotalPrice').each(function(){
					totalPrice += parseInt($(this).val());
				});
		// 총금액으로 배송비 구하기 5만원 이상 무료
		if(totalPrice < 50000 && totalPrice > 0) {
			deliveryChar = '3000원';
			deliveryNum = 3000;
		}else if(totalPrice == 0){
			deliveryChar = '무료';
			deliveryNum = 0;
		}else {
			deliveryChar = '무료';
			deliveryNum = 0;
		}
		// 금액 포맷하기
		totalProductPriceFormatted = new Intl.NumberFormat('ko-KR').format(totalPrice);
		totalPriceFormatted = new Intl.NumberFormat('ko-KR').format(totalPrice+deliveryNum);

		// 출력하기
		// 상품+배송비 출력
		$('.totalAndDelivery').text('상품 '+totalProductPriceFormatted+'원 + 배송비 '+deliveryChar);
		$('.leftTotalPrice').text(totalPriceFormatted+'원');
		// 오더 div 상품금액 출력
		$('.orderProductTotalPrice').text(totalProductPriceFormatted+'원');
		// 오더 div 배송비 출력
		$('.orderDeliveryPrice').text(deliveryChar);
		// 오더 최종 금액
		$('.orderTotalPrice').text(totalPriceFormatted+'원');

	};//총금액 계산및 출력 함수 -end

	//장바구니 총갯수&선택갯수 출력해주는 함수
	function cartItemcount() {
		$('.selectCartCount').text($('.bi-check-square-fill').length-1);
		$('.totalCartCount').text($('.check-box').length-1);
	}//장바구니 총갯수&선택갯수 함수 -end

	// 로그인일때 상품불러오기 함수
	function loginCartLoad(){
		$.ajax({
			type:'post',
			data:{memberId:sessionId,guestId:''},
			url:'../guestCartSelect',
			success:function(result){
				if(result && result.length > 0) {
					$('.cart-item').remove();
					let productList = $('#product_list');
					let productCol = $('<div class="col-12"></div>');

					for(let product of result) {
						let formatted = new Intl.NumberFormat('ko-KR').format(product['ITEMPRICE']);
						productCol.append('<div class="row SelectProduct" style="padding-top:20px; padding-bottom:20px; ">'+
								'<div class="col-1 align-self-top text-end"><i class="bi bi-check-square-fill fs-5 check-box" value="'+product['CARTNUM']+'"></i></div>'+
								'<div class="col-9 align-self-center"><div class="row" style="padding-top:5px;">'+
								'<div class="col-4"><div class="col-12"><img class="cartImg" src="'+product["ITEMTHUMNAIL"]+'"></div></div>'+
								'<div class="col-8"><div class="col-12 cart_letter">'+ product["ITEMNAME"]+'</div><div class="col-12 align-self-top cart_letter selectPrice" style="font-size:14px; margin-top:16%;" value="'+product['ITEMPRICE']+'">'+ formatted+'원</div><div class="col-12 align-self-center cart_letter product_counter" style=" margin-top: 5px;"><div><span class="minus" value="'+product["ITEMNUM"]+'"><i class="bi bi-dash fs-7"></i></span><span class="product_count" draggable="false" style="font-size:14px;">'+product["CARTITEMCOUNT"]+'</span><span class="plus" value="'+product["ITEMNUM"]+'"><i class="bi bi-plus fs-7"></i></span></div></div></div>'+
								'</div></div>'+
								'<div class="col-2 align-self-top text-end"><i class="bi bi-x fs-3 cancel-box"></i></i></div>'+
								'<input class="productTotalPrice" type="hidden" value="'+(product["ITEMPRICE"]*product["CARTITEMCOUNT"])+'">'+'<hr style="margin-top:20px;"/>'+'</div>');
						productList.append(productCol);

					}
					// 상품 금액 + 배송비 출력 & 최종금액 출력
					productList.append('<div class="col-12 cart_letter text-center totalAndDelivery"></div>');
					productList.append('<div class="col-12 cart_letter text-center leftTotalPrice" style="font-size: 22px;"></div>');
					//장바구니 총갯수&선택갯수 출력해주는 함수
					cartItemcount();
					// 최종금액 출력 함수
					totalPricePrint()
				}else {
					$('#product_list').css({background:"none"});
				}
			}
		});
	};// 로그인일때 상품불러오기 함수-end

	// 비로그인일때 상품불러오기 함수
	function nonLoginCartLoad() {
		//비로그인 중일때
		guestId = Cookies.get('guestId');
		if(!guestId) {
			guestId = 'guset-' + Math.random().toString(36).substr(2,9);
			Cookies.set('guestId',guestId,{expires:30 ,path:'/'});
		}
		$.ajax({
			type:'post',
			data:{guestId:guestId,memberId:''},
			url:'../guestCartSelect',
			success:function(result){
				console.log(result)
				if(result && result.length > 0) {
					$('.cart-item').remove();
					let productList = $('#product_list');
					let productCol = $('<div class="col-12"></div>');

					for(let product of result) {
						
						let formatted = new Intl.NumberFormat('ko-KR').format(product['ITEMPRICE']);
						productCol.append('<div class="row SelectProduct" style="padding-top:20px; padding-bottom:20px; ">'+
								'<div class="col-1 align-self-top text-end"><i class="bi bi-check-square-fill fs-5 check-box" value="'+product['CARTNUM']+'"></i></div>'+
								'<div class="col-9 align-self-center"><div class="row" style="padding-top:5px;">'+
								'<div class="col-4"><div class="col-12"><img class="cartImg" src="'+product["ITEMTHUMNAIL"]+'"></div></div>'+
								'<div class="col-8"><div class="col-12 cart_letter">'+ product["ITEMNAME"]+'</div><div class="col-12 align-self-top cart_letter selectPrice" style="font-size:14px; margin-top:16%;" value="'+product['ITEMPRICE']+'">'+ formatted+'원</div><div class="col-12 align-self-center cart_letter product_counter" style=" margin-top: 5px;"><div><span class="minus" value="'+product["ITEMNUM"]+'"><i class="bi bi-dash fs-7"></i></span><span class="product_count" draggable="false" style="font-size:14px;">'+product["CARTITEMCOUNT"]+'</span><span class="plus" value="'+product["ITEMNUM"]+'"><i class="bi bi-plus fs-7"></i></span></div></div></div>'+
								'</div></div>'+
								'<div class="col-2 align-self-top text-end"><i class="bi bi-x fs-3 cancel-box"></i></i></div>'+
								'<input class="productTotalPrice" type="hidden" value="'+(product["ITEMPRICE"]*product["CARTITEMCOUNT"])+'">'+'<hr style="margin-top:20px;"/>'+'</div>');
						productList.append(productCol);

					}
					// 상품 금액 + 배송비 출력 & 최종금액 출력
					productList.append('<div class="col-12 cart_letter text-center totalAndDelivery"></div>');
					productList.append('<div class="col-12 cart_letter text-center leftTotalPrice" style="font-size: 22px;"></div>');
					//장바구니 총갯수&선택갯수 출력해주는 함수
					cartItemcount();
					// 최종금액 출력 함수
					totalPricePrint()
				}else {
					$('#product_list').css({background:"none"});
				}
			}
		});
	};// 비로그인일때 상품불러오기 함수-end

	//로그인 일때 게스트 일때 
	if (!sessionId) {
		//비회원일때 주문하기 로그인으로 변경 및 클릭시 로그인화면으로 이동
		$('#pay_button').text('로그인');
		$('#pay_button').click(function(){
			location = '/glowamber/member/Login'
		});

		//비로그인중일때 장바구니 불러오기
		nonLoginCartLoad();

		// + 눌렀을때 숫자 변경 및 db ajax통신
		$('#product_list').on('click','.plus',function(){
			$.ajax({
				type:'post',
				url:'/glowamber/cartCounter',
				data:{memberId:'',cartItemCount:(parseInt($(this).prev().text())+1),itemNum:$(this).attr('value'),guestId:guestId},
				success:function(result){
					$(this).prev().text(parseInt($(this).prev().text())+1);
					$(this).parents('.SelectProduct').find('.productTotalPrice').val(parseInt($(this).parents('.SelectProduct').find('.productTotalPrice').val())+parseInt($(this).parent().parent().prev().attr('value')));
					totalPricePrint();

				}.bind(this)
			});
		});// + 눌렀을때 숫자 변경 및 db ajax통신 -end

		// - 눌렀을때 숫자 변경 및 db ajax통신
		$('#product_list').on('click','.minus',function(){
			$.ajax({
				type:'post',
				url:'/glowamber/cartCounter',
				data:{memberId:'',cartItemCount:(parseInt($(this).next().text())-1),itemNum:$(this).attr('value'),guestId:guestId},
				success:function(result){
					if(result == 1) {
						$(this).next().text(parseInt($(this).next().text())-1);
						$(this).parents('.SelectProduct').find('.productTotalPrice').val(parseInt($(this).parents('.SelectProduct').find('.productTotalPrice').val())-parseInt($(this).parent().parent().prev().attr('value')));
						totalPricePrint();
					}else if(result == 10){
						$(this).parents('.SelectProduct').remove();
						cartItemcount();
						totalPricePrint();
					}else if(result == 20) {
						$(this).parents('#product_list').empty();
						location.reload();
					}
				}.bind(this)
			});
		});// - 눌렀을때 숫자 변경 및 db ajax통신 -end
	}else {
		
		// 카트에 담긴상품들.
		
		
		//주문하기 눌렀을때 상품없으면 alert 띄우고 있으면 넘어가기
		$('#pay_button').click(function(){
			let cartNum = [];
			// 체크되있는 애들만 값가져오기
			$('#product_list').find('.check-box').each(function(){
				if($(this).hasClass('bi-check-square-fill')) {
					cartNum.push($(this).attr('value'));
				}
			});
			let cartNumString = cartNum.join(',');
			$.ajax({
				type:'post',
				url:'/glowamber/guestCartSelect',
				data:{memberId: (sessionId ? sessionId:''),guestId:(guestId?guestId:'')},
				dataType:'json',
				success:function(result){
					if(result.length == 0 ) {
						alert('현재 담긴 상품이 없습니다.')
					}else {
						$.ajax({
							type:'post',
							url:'/glowamber/sessionCartNum',
							data:{cartNum:cartNum.join(',')},
							success:function(result){
								location = '/glowamber/payPage?memberId='+sessionId+'&guestId=';
							}
						});
					}
				}
				
			});
		});//주문하기 눌렀을때 상품없으면 alert 띄우고 있으면 넘어가기 -end
		
		//로그인중일때 장바구니 불러오기
		loginCartLoad();
		// + 눌렀을때 숫자 변경 및 db ajax통신
		$('#product_list').on('click','.plus',function(){
			$.ajax({
				type:'post',
				url:'/glowamber/cartCounter',
				data:{memberId:sessionId,cartItemCount:(parseInt($(this).prev().text())+1),itemNum:$(this).attr('value'),guestId:''},
				success:function(result){
					$(this).prev().text(parseInt($(this).prev().text())+1);
					$(this).parents('.SelectProduct').find('.productTotalPrice').val(parseInt($(this).parents('.SelectProduct').find('.productTotalPrice').val())+parseInt($(this).parent().parent().prev().attr('value')));
					totalPricePrint();

				}.bind(this)
			});
		});// + 눌렀을때 숫자 변경 및 db ajax통신 -end

		// - 눌렀을때 숫자 변경 및 db ajax통신
		$('#product_list').on('click','.minus',function(){

			$.ajax({
				type:'post',
				url:'/glowamber/cartCounter',
				data:{memberId:sessionId,cartItemCount:(parseInt($(this).next().text())-1),itemNum:$(this).attr('value'),guestId:''},
				success:function(result){
					if(result == 1) {
						$(this).next().text(parseInt($(this).next().text())-1);
						$(this).parents('.SelectProduct').find('.productTotalPrice').val(parseInt($(this).parents('.SelectProduct').find('.productTotalPrice').val())-parseInt($(this).parent().parent().prev().attr('value')));
						totalPricePrint();
					}else if(result == 10){
						$(this).parents('.SelectProduct').remove();
						totalPricePrint();
						cartItemcount();
					}else if(result == 20) {
						$(this).parents('#product_list').empty();
						location.reload();
					}
				}.bind(this)
			});
		});// - 눌렀을때 숫자 변경 및 db ajax통신 -end

	}//로그인 일때 게스트 일때-end



	//장바구니 전체선택버튼 클릭시
	$('.select-all').click(function(){
		if($(this).hasClass('bi-square')) {
			$(this).removeClass('bi-square');
			$(this).addClass('bi-check-square-fill');
			$('.check-box').removeClass('bi-square');
			$('.check-box').addClass('bi-check-square-fill');
			$('.selectCartCount').text($('.bi-check-square-fill').length-1);
			$('.productTotalPrice').each(function(){
				$(this).val(parseInt($(this).closest('.SelectProduct').find('.selectPrice').attr('value'))* parseInt($(this).closest('.SelectProduct').find('.plus').prev().text()))
			});
			totalPricePrint();
		}else {
			$(this).removeClass('bi-check-square-fill');
			$(this).addClass('bi-square');
			$('.check-box').removeClass('bi-check-square-fill');
			$('.check-box').addClass('bi-square');
			$('.selectCartCount').text($('.bi-check-square-fill').length);
			$('.productTotalPrice').val(0)
			totalPricePrint();
		}
	});	//장바구니 전체선택버튼 클릭시 -end

	// 각 상품 버튼 클릭시 이벤트
	$('#product_list').on('click','.check-box',function(){
		if($(this).hasClass('bi-square')) {
			$(this).removeClass('bi-square');
			$(this).addClass('bi-check-square-fill');
			$('.selectCartCount').text($('#product_list').find('.bi-check-square-fill').length);
			//전체 상품수랑 선택 상품수가 같으면 전체선택 활성화
			if($('.selectCartCount').text()== $('.totalCartCount').text()) {
				$('.select-all').removeClass('bi-square');
				$('.select-all').addClass('bi-check-square-fill');
			}
			//총금액 수정 및 출력
			$(this).closest('.SelectProduct').find('.productTotalPrice').val(parseInt($(this).closest('.SelectProduct').find('.selectPrice').attr('value'))* parseInt($(this).closest('.SelectProduct').find('.plus').prev().text()))
			totalPricePrint()
		}else {
			// 하나라도 해제되면 전체선택도 해제
			$('.select-all').removeClass('bi-check-square-fill');
			$('.select-all').addClass('bi-square');
			// 상품 해제하기
			$(this).removeClass('bi-check-square-fill');
			$(this).addClass('bi-square');
			$('.selectCartCount').text($('#product_list').find('.bi-check-square-fill').length);
			//총금액 수정 및 출력
			$(this).closest('.SelectProduct').find('.productTotalPrice').val(0);
			totalPricePrint()
		}
	});

	//엑스버튼 누를시 해당상품 삭제
	$('#product_list').on('click','.cancel-box',function(){
		let itemNumber = $(this).closest('.SelectProduct').find('.plus').attr('value');
		$.ajax({
			type:'post',
			url:'/glowamber/deleteCartProduct',
			data:{memberId:sessionId,itemNum:itemNumber,guestId:guestId},
			success:function(result){
				if(result == 1) {
					$(this).parents('.SelectProduct').remove();
					totalPricePrint();
					cartItemcount();
				}else if(result == 20) {
					$(this).parents('#product_list').empty();
					location.reload();
				}
			}.bind(this)
		});
	});//엑스버튼 누를시 해당상품 삭제 -end

	// 선택삭제 버튼 클릭시 선택된 상품 전체 삭제
	$('#cart_deselect').click(function(){
		$('#product_list').find('.bi-check-square-fill').each(function(){
			let itemNumber = $(this).closest('.SelectProduct').find('.plus').attr('value');
			$.ajax({
				type:'post',
				url:'/glowamber/deleteCartProduct',
				data:{memberId:sessionId,itemNum:itemNumber,guestId:guestId},
				success:function(result){
					if(result == 1) {
						$(this).parents('.SelectProduct').remove();
						totalPricePrint();
						$('.selectCartCount').text($('.bi-check-square-fill').length);
						$('.totalCartCount').text($('.check-box').length-1);
					}else if(result == 20) {
						$(this).parents('#product_list').empty();
						location.reload();
					}
				}.bind(this)
			});
		});
	});// 선택삭제 버튼 클릭시 선택된 상품 전체 삭제 -end
});