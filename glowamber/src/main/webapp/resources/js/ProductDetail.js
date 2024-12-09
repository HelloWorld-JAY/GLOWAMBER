$(function(){

	// 퀵매뉴 맨위로
	$('.scroll_top').click(function(){
		$('html').scrollTop(0);
	});

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
					url:'memberCartAdd',
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
					url:'nonMemberCartAdd',
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

	// 상세설명 버튼 누를시 스크롤이동
	$('.scroll_move').click(function(e){
		e.preventDefault();
		$('html,body').animate({scrollTop:$($(this).find('a').attr('href')).offset().top}, 1);
		$('.scroll_move').css({"border-bottom":'','font-weight':'','background':''});
		$(this).css({"border-bottom":'none','font-weight':'600','background':'white'});
	});// 상세설명 버튼 누를시 스크롤이동 -end
	// 스크롤이동시 해당 버튼 위치면 눌려지고 벗어나면 해제하기
	$(window).scroll(function() {
		$('.scroll_move').each(function() {
			let sectionOffset = $($(this).find('a').attr('href')).offset().top - 200;
			let sectionHeight = $($(this).find('a').attr('href')).outerHeight();
			let scrollPos = $(window).scrollTop();


			if (scrollPos >= sectionOffset && scrollPos < sectionOffset + sectionHeight) {
				// 섹션이 화면에 보이면 버튼 활성화
				$('.scroll_move').css({"border-bottom": '', 'font-weight': '', 'background': ''});
				$(this).css({"border-bottom": 'none', 'font-weight': '600', 'background': 'white'});
			} else {
				// 섹션이 화면에 보이지 않으면 버튼 비활성화
				$(this).css({"border-bottom": '', 'font-weight': '', 'background': ''});
			}
		});
	});// 스크롤이동시 해당 버튼 위치면 눌려지고 벗어나면 해제하기 -end

});		