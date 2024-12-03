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
					if(carouselRow.children().length < 4) {
						carouselRow.append('<div class="col-12 col-sm-6 col-md-3"><div class="row carouesl_product"><div class="col-12 col-sm-12 col-md-12 carouesl_img" value="'+item["itemNum"]+'"><img src="'+item["itemThumnail"]+'"></div><div class="col-12 col-sm-12 col-md-12 carouesl_button"><button><i class="bi bi-bag"></i> 담기</button></div><div class="col-12 col-sm-12 col-md-12 carouesl_name" value="'+item["itemNum"]+'">'+item["itemName"]+'</div><div class="col-12 col-sm-12 col-md-12 carouesl_price" value="'+item["itemNum"]+'">'+item["itemPrice"]+'원</div></div></div>');
					}else {
						if(addClassCheck == false) {
							carouselItem.addClass('active');
							addClassCheck = true;
						}
						carouselItem.append(carouselRow);
						$('#product_carousel').append(carouselItem);
						carouselRow = $('<div class="row"/>');
						carouselItem = $('<div class="carousel-item"/>');
						carouselRow.append('<div class="col-12 col-sm-6 col-md-3"><div class="row carousel_product"><div class="col-12 col-sm-12 col-md-12 carouesl_img" value="'+item["itemNum"]+'"><img src="'+item["itemThumnail"]+'" ></div><div class="col-12 col-sm-12 col-md-12 carouesl_button"><button><i class="bi bi-bag"></i> 담기</button></div><div class="col-12 col-sm-12 col-md-12 carouesl_name" value="'+item["itemNum"]+'">'+item["itemName"]+'</div><div class="col-12 col-sm-12 col-md-12 carouesl_price" value="'+item["itemNum"]+'">'+item["itemPrice"]+'원</div></div></div>');
					}
				}
				// row에 4개가 안되서 추가못한 애들이 남아있을경우 추가하기
				if(carouselRow.children().length != 0) {
					carouselItem.append(carouselRow);
					$('#product_carousel').append(carouselItem);
				}
		}//function end
	});//ajax end
	
	$('.carouesl_img,.carouesl_name,.carouesl_price').click(function(){
	
		location = '../selectProductDetail?itemNum='+$(this).attr('value');
		});
});