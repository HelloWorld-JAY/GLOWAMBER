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
});