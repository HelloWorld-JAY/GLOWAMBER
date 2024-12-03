$(function(){
	/* 상품 전체 목록 출력 */
	SelectAllItem()
	function SelectAllItem (){
		$.ajax({
			type : 'post'
			, dataType : 'json'
			, url : '/glowamber/selectitem'
			, success : function(result){
				$('#ItemTable').empty()
				for(ItemList of result){
					$('#ItemTable').append(
											$('<tr/>').append([
																$('<td/>').text(ItemList['itemNum'])
																,$('<td/>').text(ItemList['itemName'])
														/*		,$('<td/>').text(ItemList[''])
																,$('<td/>').text(ItemList[''])  */
																,$('<td/>').text(ItemList['itemUnit'])
																,$('<td/>').text(ItemList['itemVolume'])
																,$('<td/>').text(ItemList['itemPrice'])
																,$('<td/>').text(ItemList['itemSupplier'])
																,$('<td/>').text(ItemList['itemDate'])	
															 ])
										  )
				}
			} 
		})
	}

	
})