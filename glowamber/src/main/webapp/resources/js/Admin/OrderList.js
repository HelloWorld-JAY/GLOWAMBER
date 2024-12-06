$(function(){
	selectOrderList()
	/* 주문상태 변경 */
	
	/* 주문목록 선택 */
	/* 테이블헤드 체크박스 클릭시 */
	/* 주문내역 전체 선택 */
	$('.selectAll').click(function(){
		if($(this).is(":checked")){
			$(".order").prop("checked",true)
			$(".orderitem").prop("checked",true)
		}else{
			$(".order").prop("checked",false)
			$(".orderitem").prop("checked",false)
		}
	})
		
	/* 주문번호 옆 체크박스 클릭시 해당주문 상품 전체 선택 */
	$("#orderTable").on('click','.order',function(){
		if($(this).is(":checked")){
			$(`input[value = '${$(this).val()}']`).prop("checked",true)
		}else{
			$(`input[value = '${$(this).val()}']`).prop("checked",false)
		}
		
		/* 체크된 갯수 비교해서  */
		let total = $(".order").length
		let checked = $(".order:checked").length
		
		/* 전체선택 버튼 체크,해제 */
		if(total != checked){
			$('.selectAll').prop("checked",false)
		}else{
			$('.selectAll').prop("checked",true)
		}
		
	})
	
	/* 주문한 상품명 옆 체크박스 클릭시 */
	$("#orderTable").on('click','.orderitem',function(){
		let total = $(`input[value = '${$(this).val()}']`).length
		alert(total)
		let checked = $(`input[value = '${$(this).val()}']:checked`).length
		alert(checked)
	})
	
	/* 주문목록 검색 */
	$('#orderStatus').change(function(){
		selectOrderList()
	})
	
	/* 주문목록 출력 */
	function selectOrderList(){
		let OrderListParam={ orderDetailStatus : $('#orderStatus').val()}
		$.ajax({
			type:'post'
			,data : OrderListParam
			,dataType : 'json'
			,url : '/glowamber/selectOrderList'
			,success : function(result){
			let check = 0;
				$('#orderTable').empty()
				for(order of result){
					if(check != order['orderNum']){
							$('#orderTable').append([ $('<tr/>').append( $("<td/>",{ rowspan : order['orderItemCount']+1}).append($('<div/>').append($('<input type="checkbox" class="order" />').val(order['orderNum'])))
																		,$("<td/>",{ rowspan : order['orderItemCount']+1}).append([ 
																																	,$('<div/>').html(order['orderNum']+'<br/>')
																																	,$('<div/>').html(order['orderDate']+'<br/>')
																																	,$('<div/>').html(order['memberName'])
																																])
																	   )
													 ,$('<tr/>').append([
													 						  $('<td/>').append($('<input type="checkbox" class="orderitem" />').val(order['orderNum']))
														 					 ,$('<input type="hidden" />').val(order['orderDetailNum'])
													 				    	 ,$('<td/>').text(order['itemName'])
													 				    	 ,$('<td/>').text(order['orderDetailPrice'])
												 				     		 ,$('<td/>').text(order['orderDetailCount'])
											 				     	    ])   
											 		])		  
												 
							check = order['orderNum']
					}
				
					 else{
					 	$('#orderTable').append( $('<tr/>').append([ 
					 												  $('<td/>').append($('<input type="checkbox" class="orderitem" />').val(order['orderNum']))
					 												 ,$('<input type="hidden" />').val(order['orderDetailNum'])
					 												 ,$('<td/>').text(order['itemName'])
												 				     ,$('<td/>').text(order['orderDetailPrice'])
											 				     	 ,$('<td/>').text(order['orderDetailCount'])   
											 					  ])
												 )
					 }	
				 }
			 }
		})
	}
})