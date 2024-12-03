$(function(){

	/* 카테고리 대분류 등록 및 수정*/
	$('#BigCateAdd').click(function(){
		/* 대분류 번호가 있으면 */
		if($('#BigCateNum').val() == null){
			/* 수정 */
			let param = { }
			$.ajax({
				type :'post'
				,url  :'cateinsert'
				,success :function(){
					
				}
			})
		}else{			/* 없으면 등록 */
			$.ajax({
			
			})
		}
		
	})
	
	/* 카테고리 대분류 삭제	*/
	$('').click(function(){
		
	})
	
	/* 카테고리 대분류 취소	*/
	$('').click(function(){
		
	})
	
	/* 카테고리 소분류 등록 및 수정	*/
	$('').click(function(){
		
	})
	
	/* 카테고리 소분류 삭제	*/
	$('').click(function(){
		
	})
	
	/* 카테고리 소분류 취소	*/
	$('').click(function(){
		
	})
})