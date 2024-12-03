$(function(){
	$('.AdminTab').hide();
	
	$('.nav-item').click(function(){
		$('.AdminTab').hide();
		if($(this).text()=='상품관리'){
			$('#Item').show();
		}
		if($(this).text()=='재고관리'){
			$('#Inventory').show();
		}
		if($(this).text()=='주문관리'){
			$('#Order').show();
		}
		if($(this).text()=='회원관리'){
			$('#MemberManage').show();
		}
	})
	
	
	
	
	
	
	
	
	
	
	
	
	
})