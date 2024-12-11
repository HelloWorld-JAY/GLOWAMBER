$(function(){
	SelectStoreList()
	
	/* 리스트 검색 */
	$('.StoreStatus').click(function(){
		StoreListParam = {storeStatus : $(this).val()}
		
		if($(this).val()=='전체'){
			SelectStoreList()
			$('.totalstoreprice').show()
			$('.totalsellprice').show()
		}
		if($(this).val()=='입고'){
			SelectStoreList(StoreListParam)
			$('.totalstoreprice').show()
			$('.totalsellprice').hide()
		}
		if($(this).val()=='출고'){
			SelectStoreList(StoreListParam)
			$('.totalsellprice').show()
			$('.totalstoreprice').hide()
		}
	})
	
	/* 재고리스트 출력 */
	function SelectStoreList(StoreListParam){
		$.ajax({
			type:'post'
			,data : StoreListParam
			,dataType : 'json'
			,url : '/glowamber/selectStoreList'
			,success : function(result){
				$('#StoreTable').empty()
				
				let totalstoreprice = 0
				let totalsellprice = 0
				
				for(StoreList of result){
					$('#StoreTable').append(
											  $('<tr/>').append([
											  					  $('<td/>').text(StoreList['storeDate'])
											  					  ,$('<td/>').text(StoreList['storeStatus'])
											  					  ,$('<td/>').text(StoreList['itemName'])
											  					  ,$('<td/>').text(StoreList['storeCount'])
											  					  ,$('<td/>').text(StoreList['storePrice'])
											  					 
											  					])
											)
					if(StoreList['storeStatus'] == "입고" ) {
						totalstoreprice += StoreList['storePrice']
					}else {
						totalsellprice += StoreList['storePrice']
					}
				}
				$('#totalstoreprice').text(totalstoreprice + "원")
				
				$('#totalsellprice').text(totalsellprice + "원")
			}
		})
	}
})