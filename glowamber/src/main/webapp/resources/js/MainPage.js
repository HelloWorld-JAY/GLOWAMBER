$(function(){
	const urlParams = new URLSearchParams(window.location.search);
	const successPay =  urlParams.get('resultCode'); 

	if(successPay) {
		alert('주문이 완료되어 초기페이지로 이동합니다.');
	}
	// 퀵매뉴 맨위로
	$('.scroll_top').click(function(){
		$('html').scrollTop(0);
	});
	
	//메인페이지로 넘어왔을때 로그인상태일때 확인후 게스트에서 장바구니 옮기기
	if (sessionId) {
		let guestId = Cookies.get('guestId');
		if(guestId) {
			$.ajax({
				type : 'post',
				data : {
					guestId : guestId,
					memberId : sessionId
				},
				dataType : 'json',
				url : '../memberCartAddGuestDelete',
				success : function() {
				}
			});
			Cookies.remove('guestId', { path: '/' });
		}
	}//메인페이지로 넘어왔을때 로그인상태일때 확인후 게스트에서 장바구니 옮기기 -end
	
	// 모달창 끌때마다 내용초기화
	$('#productCarousel').on('hidden.bs.modal','.modal',function(){
		$('.product_count').text('0');
		$('.total_price').text('0원');
	});// 모달창 끌때마다 내용초기화 -endS
	
	// 메인페이지 추천화면 자료 가져오기
	$.ajax({
		type:'post',
		url:'/glowamber/bestListAjax',
		dataType:'json',
		success:function(result){
			let carouselItem = $('<div class="carousel-item"/>');
			let carouselRow = $('<div class="row"/>');
			let addClassCheck = false;

			// row 의 자식이 4개면 item에 추가하고 새로운객채생성
			for(item of result) {
				let modalid = 'modal-'+ item["itemNum"];
				let formatted = new Intl.NumberFormat('ko-KR').format(item['itemPrice']);
				let modal = '<div class="modal fade" id="'+modalid+'" data-bs-backdrop="false" data-bs-keyboard="false" tabindex="-1" aria-labelledby="'+modalid+'Label" aria-hidden="true">'+
						'<div class="modal-dialog modal-dialog-centered modal-md" >'+
						'<div class="modal-content">'+
						'<div class="modal-header text-center"">'+
						'<h1 class="modal-title fs-4 mx-auto" id="'+modalid+'Label" style="font-weight: 600;">장 바 구 니</h1>'+
						'</div>'+
						'<div class="modal-body"><div class="row "><div class="col-1"></div><div class="col-3" ><img class="modal_img" src="'+item["itemThumnail"]+'"></div>'+
						'<div class="col-7 ext-end"><div class="row">'+
						'<div class="col-12 " style="font-size: 20px; text-align:left;">'+item["itemName"]+'</div><br/><br/><br/>'+
						'<div class="col-12 align-self-end text-end" style="text-align:left; font-size:16px;"><span>상품금액:</span> <span class="product_price" value="'+item["itemPrice"]+'">'+formatted+'원</span></div>'+
						'<div class="col-12 align-self-center text-end product_counter"><div><span class="minus"><i class="bi bi-dash fs-5"></i></span><span class="product_count" draggable="false">0</span><span class="plus"><i class="bi bi-plus fs-5"></i></span></div></div>'+
						'</div></div><div class="col-1"></div>'+
						'</div></div>'+
						'<div class="modal-footer d-flex justify-content-between w-100">'+
						'<div class="col-12 d-flex justify-content-between w-100" style="font-size: 20px; font-weight: 600; padding-right: 10%;padding-left: 10%;"><span>합계</span><span><span class="total_price">0원</span></span></div>'+
						'<button type="button" class="btn_cancel " data-bs-dismiss="modal">취소</button>'+
						'<button type="button" class="btn_add" data-bs-dismiss="modal" value="'+item["itemNum"]+'">장바구니 담기</button>'+
						'</div>'+'</div>'+'</div>'+'</div>'
						if(carouselRow.children().length < 4) {
							carouselRow.append('<div class="col-12 col-sm-6 col-md-3"><div class="row carousel_product"><div class="col-12 col-sm-12 col-md-12 carousel_img" value="'+item["itemNum"]+'"><img src="'+item["itemThumnail"]+'"></div><div class="col-12 col-sm-12 col-md-12 carousel_button"><button type="button" data-bs-toggle="modal" data-bs-target="#'+modalid+'"><i class="bi bi-bag"></i> 담기</button>'+modal+'</div><div class="col-12 col-sm-12 col-md-12 carousel_name" value="'+item["itemNum"]+'">'+item["itemName"]+'</div><div class="col-12 col-sm-12 col-md-12 carousel_price" value="'+item["itemNum"]+'">'+formatted+'원</div></div></div>');
						}else {
							if(addClassCheck == false) {
								carouselItem.addClass('active');
								addClassCheck = true;
							}
							carouselItem.append(carouselRow);
							$('#product_carousel').append(carouselItem);
							carouselRow = $('<div class="row"/>');
							carouselItem = $('<div class="carousel-item"/>');
							carouselRow.append('<div class="col-12 col-sm-6 col-md-3"><div class="row carousel_product"><div class="col-12 col-sm-12 col-md-12 carousel_img" value="'+item["itemNum"]+'"><img src="'+item["itemThumnail"]+'" ></div><div class="col-12 col-sm-12 col-md-12 carousel_button"><button type="button" data-bs-toggle="modal" data-bs-target="#'+modalid+'"><i class="bi bi-bag"></i> 담기</button>'+modal+'</div><div class="col-12 col-sm-12 col-md-12 carousel_name" value="'+item["itemNum"]+'">'+item["itemName"]+'</div><div class="col-12 col-sm-12 col-md-12 carousel_price" value="'+item["itemNum"]+'">'+formatted+'원</div></div></div>');
						}
			}
			// row에 4개가 안되서 추가못한 애들이 남아있을경우 추가하기
			if(carouselRow.children().length != 0) {
				carouselItem.append(carouselRow);
				$('#product_carousel').append(carouselItem);
			}
		}//function end
	});//ajax end
	// 메인페이지 추천화면 신상품 자료 가져오기
		$.ajax({
			type:'post',
			url:'/glowamber/newListAjax',
			dataType:'json',
			success:function(result){
				let carouselItem = $('<div class="carousel-item"/>');
				let carouselRow = $('<div class="row"/>');
				let addClassCheck = false;

				// row 의 자식이 4개면 item에 추가하고 새로운객채생성
				for(item of result) {
					let modalid = 'modal-'+ item["itemNum"];
					let formatted = new Intl.NumberFormat('ko-KR').format(item['itemPrice']);
					let modal = '<div class="modal fade" id="'+modalid+'" data-bs-backdrop="false" data-bs-keyboard="false" tabindex="-1" aria-labelledby="'+modalid+'Label" aria-hidden="true">'+
							'<div class="modal-dialog modal-dialog-centered modal-md" >'+
							'<div class="modal-content">'+
							'<div class="modal-header text-center"">'+
							'<h1 class="modal-title fs-4 mx-auto" id="'+modalid+'Label" style="font-weight: 600;">장 바 구 니</h1>'+
							'</div>'+
							'<div class="modal-body"><div class="row "><div class="col-1"></div><div class="col-3" ><img class="modal_img" src="'+item["itemThumnail"]+'"></div>'+
							'<div class="col-7 ext-end"><div class="row">'+
							'<div class="col-12 " style="font-size: 20px; text-align:left;">'+item["itemName"]+'</div><br/><br/><br/>'+
							'<div class="col-12 align-self-end text-end" style="text-align:left; font-size:16px;"><span>상품금액:</span> <span class="product_price" value="'+item["itemPrice"]+'">'+formatted+'원</span></div>'+
							'<div class="col-12 align-self-center text-end product_counter"><div><span class="minus"><i class="bi bi-dash fs-5"></i></span><span class="product_count" draggable="false">0</span><span class="plus"><i class="bi bi-plus fs-5"></i></span></div></div>'+
							'</div></div><div class="col-1"></div>'+
							'</div></div>'+
							'<div class="modal-footer d-flex justify-content-between w-100">'+
							'<div class="col-12 d-flex justify-content-between w-100" style="font-size: 20px; font-weight: 600; padding-right: 10%;padding-left: 10%;"><span>합계</span><span><span class="total_price">0원</span></span></div>'+
							'<button type="button" class="btn_cancel " data-bs-dismiss="modal">취소</button>'+
							'<button type="button" class="btn_add" data-bs-dismiss="modal" value="'+item["itemNum"]+'">장바구니 담기</button>'+
							'</div>'+'</div>'+'</div>'+'</div>'
							if(carouselRow.children().length < 4) {
								carouselRow.append('<div class="col-12 col-sm-6 col-md-3"><div class="row carousel_product"><div class="col-12 col-sm-12 col-md-12 carousel_img" value="'+item["itemNum"]+'"><img src="'+item["itemThumnail"]+'"></div><div class="col-12 col-sm-12 col-md-12 carousel_button"><button type="button" data-bs-toggle="modal" data-bs-target="#'+modalid+'"><i class="bi bi-bag"></i> 담기</button>'+modal+'</div><div class="col-12 col-sm-12 col-md-12 carousel_name" value="'+item["itemNum"]+'">'+item["itemName"]+'</div><div class="col-12 col-sm-12 col-md-12 carousel_price" value="'+item["itemNum"]+'">'+formatted+'원</div></div></div>');
							}else {
								if(addClassCheck == false) {
									carouselItem.addClass('active');
									addClassCheck = true;
								}
								carouselItem.append(carouselRow);
								$('#new_product_carousel').append(carouselItem);
								carouselRow = $('<div class="row"/>');
								carouselItem = $('<div class="carousel-item"/>');
								carouselRow.append('<div class="col-12 col-sm-6 col-md-3"><div class="row carousel_product"><div class="col-12 col-sm-12 col-md-12 carousel_img" value="'+item["itemNum"]+'"><img src="'+item["itemThumnail"]+'" ></div><div class="col-12 col-sm-12 col-md-12 carousel_button"><button type="button" data-bs-toggle="modal" data-bs-target="#'+modalid+'"><i class="bi bi-bag"></i> 담기</button>'+modal+'</div><div class="col-12 col-sm-12 col-md-12 carousel_name" value="'+item["itemNum"]+'">'+item["itemName"]+'</div><div class="col-12 col-sm-12 col-md-12 carousel_price" value="'+item["itemNum"]+'">'+formatted+'원</div></div></div>');
							}
				}
				// row에 4개가 안되서 추가못한 애들이 남아있을경우 추가하기
				if(carouselRow.children().length != 0) {
					carouselItem.append(carouselRow);
					$('#new_product_carousel').append(carouselItem);
				}
			}//function end
		});//ajax end
	// 해당 상품클릭시 상세페이지 이동	
	$('#product_carousel').on('click','.carousel_img,.carousel_name,.carousel_price',function(){
		location = '../selectProductDetail?itemNum='+$(this).attr('value');
	}); // 해당 상품클릭시 상세페이지 이동 -end
	// 해당 상품클릭시 상세페이지 이동	
		$('#new_product_carousel').on('click','.carousel_img,.carousel_name,.carousel_price',function(){
			location = '../selectProductDetail?itemNum='+$(this).attr('value');
		}); // 해당 상품클릭시 상세페이지 이동 -end

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
		$('#product_carousel').on('click','.btn_add',function(){

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