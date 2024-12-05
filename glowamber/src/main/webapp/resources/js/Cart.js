$(function(){
	//로그인 일때 게스트 일때 장바구니 불러오기
	if (!sessionId) {
		let guestId = Cookies.get('guestId');
		$.ajax({
			type:'post',
			data:{guestId:guestId},
			dataType:'json',
			url:'/glowamber/guestCartSelect',
			success:function(result){
				
			}
		});
	}else {}
	
	
	
	//장바구니 전체선택버튼 클릭시
	$('.select-all').click(function(){
		if($(this).children('i').hasClass('bi-square')) {
			$(this).empty();
			$(this).append('<i class="bi bi-check-square-fill fs-3"></i>');
		}else {
			$(this).empty();
			$(this).append('<i class="bi bi-square fs-3"></i>');
		}
	});	//장바구니 전체선택버튼 클릭시 -end
	
	
});