$(function(){
 	
    $('.orderStatus').parent().hide()
	$('#orderStatusWait').parent().show()
	/* 날짜 지정 */
	const today = new Date().toISOString().split('T')[0];
	$('#orderdate').val(today)
   	let orderdate = $('#orderdate').val()
    selectOrderList(orderdate)
   
    
	/* 주문상태 변경 */
	$(".orderStatus").click(function(){
	
		/* 체크박스 체크된 상품들의 주문상세번호 가져오기 */
		let checkedItem = $('.orderitem').filter(function(){
								return $(this).is(':checked')
							})
							
		let allCheckedItemVal =[]
		checkedItem.each(function(){
			let checkedItemVal = $(this).parent().next().val()
			allCheckedItemVal.push(checkedItemVal)
	})
		let nowdate=$('#orderdate').val()
		/* 주문상태 변경 */
			let orderStatusParam = {
										allCheckedItemVal : allCheckedItemVal
										,orderDetailStatus : $(this).val()
									}
			$.ajax({
				type:'post'
				,data : orderStatusParam
				,url : '/glowamber/updateOrderStatus'
				,success : function(){
					selectOrderList(nowdate)
				}
			})
	})
	
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
		
		let clickedVal= $(this).val()
		let clickedClass = $(this).attr('class')
		
		
		let orderItemBox = $("input").filter(function(){
			return $(this).val() == clickedVal && $(this).attr('class') == clickedClass
		})
		
		let orderBox = $("input").filter(function(){
			return $(this).val() == clickedVal && $(this).attr('class') == "order"
		})
		
		/* 주문번호에 해당하는 상품갯수 */
		let totalOrderItemBox = orderItemBox.length
		let checkedOrderItemBox = orderItemBox.filter(":checked").length
		
		/* 전체 상품 갯수 */
		let totalItemBox = $(".orderitem").length
		let checkedItemBox = $(".orderitem:checked").length
		
		/* 주문번호에 해당하는 상품들이 체크되지않으면 주문번호 체크박스 해제, 그렇지 않으면 체크 */
		if(totalOrderItemBox != checkedOrderItemBox){
			orderBox.prop("checked",false)
		}else{
			orderBox.prop("checked",true)
		}
		
		/* 전체 상품이 체크되지않으면 전체선택 해제, 그렇지않으면 체크 */
		if(totalItemBox != checkedItemBox)	{
			$('.selectAll').prop("checked",false)
		}else{
			$('.selectAll').prop("checked",true)
		}
	})
	
	/* 주문목록 검색 */
	$('#orderStatus').change(function(){
		selectOrderList()
		if($('#orderStatus').val()=='신규'){
			$('.orderStatus').parent().hide()
			$('#orderStatusWait').parent().show()
		}
		if($('#orderStatus').val()=='대기'){
			$('.orderStatus').parent().hide()
			$('#orderStatusDelivery').parent().show()
		}
		if($('#orderStatus').val()=='배송중'){
			$('.orderStatus').parent().hide()
			$('#orderStatuscomplete').parent().show()
		}
		if($('#orderStatus').val()=='완료'){
			$('.orderStatus').parent().hide()
			$('#orderStatusRefund').parent().show()
			$('#orderStatusCancle').parent().show()
		}
		if($('#orderStatus').val()=='환불'||$('#orderStatus').val()=='교환'){
			$('.orderStatus').parent().hide()
		}
	})
	/* 날짜 변경시 */
	$('#orderdate').change(function(){
		let selectorderdate = $(this).val()
		selectOrderList(selectorderdate)
	})
	
	/* 주문목록 출력 */
	function selectOrderList(date){
		let OrderListParam={ orderDetailStatus : $('#orderStatus').val()
							,orderDate : date
							}
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
							$('#orderTable').append([ $('<tr class="orderNumber" />').append( $("<td/>",{ rowspan : order['orderItemCount']+1}).append($('<div/>').append($('<input type="checkbox" class="order" />').val(order['orderNum'])))
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