$(function(){
	selectOrderList()
	/* 주문목록 출력 */
	function selectOrderList(orderSelect){
		$.ajax({
			type:'post'
			,data : orderSelect
			,dataType : 'json'
			,url : '/glowamber/selectOrderList'
			,success : function(result){
				alert('ok')
			/*	$('#orderTable').empty()
				for(order of result){
					$('#orderTable').append(
											 $('<tr/>').append([
											 				     $('<td/>').text(order['memberName'])
											 				     ,$('<td/>').text(order['memberId'])
											 				     ,$('<td/>').text(order['memberTel'])
										 				     ,$('<td/>').text(order['memberEmail'])
										 				     ,$('<td/>').text(order['memberJoinDate'])    
										 					  ])
											 )
				 }*/
			 }
		})
	}
})