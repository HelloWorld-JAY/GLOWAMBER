$(function(){
	SelectAllItem()
	
	/* 상품 전체 목록 출력 */
	function SelectAllItem(ItemSelect){
		$.ajax({
			type : 'post'
			, data : ItemSelect
			, dataType : 'json'
			, url : '/glowamber/selectitem'
			, success : function(result){
				$('#ItemTable').empty()
				for(ItemList of result){
					$('#ItemTable').append(
											$('<tr/>').append([
																$('<td/>').text(ItemList['itemNum'])
																,$('<td/>').text(ItemList['itemName'])
																,$('<td/>').text(ItemList['bigCateName'])
																,$('<td/>').text(ItemList['smallCateName'])  
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
	
	
	/* 상품 검색 버튼 클릭시 */
	$('#ItemSelectBtn').click(function(){
		/* 검색어에 해당하는 상품 출력 */
			let ItemSelect = { }
			ItemSelect[$('#ItemSelectCate').val()] = $('#ItemSelectCate').parent().next().children('input[type="text"]').val()
		
		SelectAllItem(ItemSelect)
	})
	
	/* 상품목록의 상품 클릭시 */
	$('#ItemTable').on('click','tr',function(e){
		 const itemNum = $(this).children(':eq(0)').text();
    const path = $('#path').val();

    // 폼 생성
    const form = $('<form>', {
        action: '/glowamber/itemUpdate',
        method: 'POST'
    });

    // 데이터 추가
    form.append($('<input>', {
        type: 'hidden',
        name: 'itemNum',
        value: itemNum
    }));

    form.append($('<input>', {
        type: 'hidden',
        name: 'path',
        value: path
    }));

    // 폼을 DOM에 추가하고 제출
    $('body').append(form);
    form.submit();
	})
})