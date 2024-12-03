$(function(){

	// 메인페이지 추천화면 자료 가져오기
	$.ajax({
		type:'post',
		url:'../productAll',
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
							'<div class="modal-body"><div class="row "><div class="col-4" style="text-align:left;"><img class="modal_img" src="'+item["itemThumnail"]+'"></div>'+
							'<div class="col-8"><div class="row">'+
							'<div class="col-12 text-end" style="font-size: 20px;">'+item["itemName"]+'</div><br/><br/><br/>'+
							'<div class="col-12 align-self-center" style="text-align:right; font-size:14px;"><span>상품금액:</span> <span class="product_price" value="'+item["itemPrice"]+'">'+formatted+'원</span></div>'+
							'<div class="col-12 align-self-center text-end product_counter"><div><span class="minus"><i class="bi bi-dash fs-5"></i></span><span class="product_count" draggable="false">0</span><span class="plus"><i class="bi bi-plus fs-5"></i></span></div></div>'+
							
							'</div></div>'+
							'</div></div>'+
							'<div class="modal-footer d-flex justify-content-between w-100">'+
							'<div class="col-12 d-flex justify-content-between w-100" style="font-size: 20px; font-weight: 600; padding-right: 8px;"><span>합계</span><span><span class="total_price">0원</span></span></div>'+
							'<button type="button" class="btn_add " data-bs-dismiss="modal">취소</button>'+
							'<button type="button" class="btn_add ">장바구니 담기</button>'+
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
	// 해당 상품클릭시 상세페이지 이동	
	$('#product_carousel').on('click','.carousel_img,.carousel_name,.carousel_price',function(){
		location = '../selectProductDetail?itemNum='+$(this).attr('value');
		}); // 해당 상품클릭시 상세페이지 이동 -end

	
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
		
	
});