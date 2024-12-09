$(function(){
	
	
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
	
});