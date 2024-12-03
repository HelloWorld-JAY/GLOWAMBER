$(function(){
	
	
	//디테일 수량 변경 버튼 클릭시 추가 or 감소 -start
	$('#product_counter>div').children().last().click(function(){
	let counterplus = parseInt($('#product_counter').children().eq(0).children().eq(1).text());
	
		$('#product_counter').children().eq(0).children().eq(1).text(counterplus+1);
		$('#total_price').text((parseInt($('#product_price').attr('value'))*(counterplus+1)).toLocaleString()+'원');
	});
	$('#product_counter>div').children().first().click(function(){
		let counterminus = parseInt($('#product_counter').children().eq(0).children().eq(1).text());
	if(counterminus != 0){
		$('#product_counter').children().eq(0).children().eq(1).text(counterminus-1);
		$('#total_price').text((parseInt($('#product_price').attr('value'))*(counterminus-1)).toLocaleString()+'원');
		}else{
		$('#product_counter').children().eq(0).children().eq(1).text('0');
		$('#total_price').text((parseInt($('#product_price').attr('value'))*(counterminus)).toLocaleString()+'원');
		}
	});//디테일 수량 변경 버튼 클릭시 추가 or 감소 -end
	
	
	// 장바구니 담기 버튼 클릭시 쿠키에 저장
	$('#product_add').click(function(){
		
		let itemNum = $(this).attr('value');
		let itemcount =$('#product_count').text();
		if(itemcount != 0) {
		// 쿠키에 비회원 고유아이디가 없을시 생성
		let guestId = Cookies.get('guestId');
		if(!guestId) {
			guestId = 'guset-' + Math.random().toString(36).substr(2,9);
			Cookies.set('guestId',guestId,{expires:30 ,path:'/'});
		}
		
		// 에이젝스 통신으로 db에 쿠키의 고유 아이디 담아서 장바구니 전송
		$.ajax({
			type:'post',
			data:{guestId:guestId,itemNum:itemNum,cartItemCount:itemcount,memberId:null},
			dataType:'json',
			url:'non_member_cart_add',
			success:function(result){
				if(result == 1) {
				alert("장바구니에 상품을 담았습니다.");
				}else if(result == 10) {
				alert("장바구니에 이미 해당상품이 있습니다.");
				}
			},
			error: function(){
				alert("장바구니에 상품을 담는데 오류가 발생하였습니다.");
			}
		});
		}else {
			alert("최소구매 수량은 1개입니다.");
		}
	}); //에이젝스 통신으로 db에 쿠키의 고유 아이디 담아서 장바구니 전송 -end
	
	// 상세설명 버튼 누를시 스크롤이동
	$('.scroll_move').click(function(e){
		e.preventDefault();
		$('html,body').animate({scrollTop:$($(this).find('a').attr('href')).offset().top}, 1);
		$('.scroll_move').css({"border-bottom":'','font-weight':'','background':''});
		$(this).css({"border-bottom":'none','font-weight':'600','background':'white'});
	});// 상세설명 버튼 누를시 스크롤이동 -end
	
	
});		