$(function(){
	SelectStoreList()
	
	/* 리스트 검색 */
	$('.StoreStatus').click(function(){
		if($(this).val() == '입고'){
		
		}
		if($(this).val() == '출고'){
		
		}
		if($(this).val() == '전체'){
		
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
				}
			}
		})
	}
})