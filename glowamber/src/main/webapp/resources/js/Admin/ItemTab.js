/* 스마트에디터 설정 */
let oEditors=[];
	smartEditor= function (){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors
			, elPlaceHolder : "itemdetail"
			, sSkinURI : "/glowamber/resources/smarteditor/SmartEditor2Skin.html"
			, fCreator : "createSEditor2"
		})
	}
	
$(function(){
	/* 카테고리 화면 숨기기*/
	$('#category').hide()
	
	/* 스마트에디터 출력 */
	smartEditor()
	
	/* 카테고리 출력 */
	selectBigCate()
	
	/*************************************** 상품정보페이지 ********************************/
	/* 저장버튼 누르면 수정한 상품정보 저장 */
	$('#itemUpdateBtn').click(function(){
		oEditors.getById['itemdetail'].exec("UPDATE_CONTENTS_FIELD",[])
	})
	
	
	
	/* 입고버튼 클릭시 해당상품 재고입고 */
	$('#inventoryStoreBtn').click(function(){
		let inventoryStoreParam ={ 
		 	  itemNum	: $('#itemNum').val()
		  	 ,storeCount : $('#storeItemCount').val()
		  	 ,storeExpirDate : $('#storeExpirDate').val()
		  	 ,storePrice : $('#storePrice').val()
		 }
		$.ajax({
			type : 'post'
			, data : inventoryStoreParam
			, url : '/glowamber/itemStore'
			, success : function(){
				$('#storeItemCount').val("")
				,$('#storeExpirDate').val("")
				,$('#storePrice').val("")
			}
		})
	})
	
	
	/****************************** 상품 등록 페이지 **************************/
	
	/* 저장버튼 클릭시 상품 정보 입력 */
	$('#itemInsertBtn').click(function(){
		oEditors.getById['itemdetail'].exec("UPDATE_CONTENTS_FIELD",[])
	})
	
	
/****************************** 상품 수정/등록 공통기능 *****************************/
	/* 카테고리 등록*/
	$('#CateInsertBtn').click(function(){
	
		/* 대분류 등록 */
		if($('#InsertCateType').val()=='big'){
			let bigcateparam = {bigCateName:$('#InsertCateName').val()}
			$.ajax({
				type : 'post'
				,data : bigcateparam
				,url  : '/glowamber/bigcateinsert'
				,success : selectBigCate()
			})
			
		}
		
		/* 소분류 등록 */
		else{
			let smallcateparam = { 
							  	bigCateNum : $('#SelectBigCate').val()
							  	,smallCateName : $('#InsertCateName').val()
			}
			$.ajax({
				type :'post'
				,data : smallcateparam
				,url  :'/glowamber/smallcateinsert'
				,success : function(){
					$('#SmallCateList').empty()
					$.ajax({
						type : 'post'
						,data: smallcateparam
						,dataType : 'json'
						,url  : '/glowamber/selectsmallcate'
						,success : function (result){
										$('#SmallCateList').empty();
											for( smallcate of result ){
											$('#SmallCateList').append(
															$('<tr/>').append([
																			$('<td/>').append([$('<input type="hidden" />').val(smallcate['smallCateNum'])
																							 ,$('<input type="hidden" />').val(smallcate['bigCateNum'])
																									  					 ,smallcate['smallCateName']])
																			,$('<td/>').append($('<input type="button" class="delete" />').val('x'))]))
											}
									}
					})
				}
			})
		}	
	})
	/* 카테고리 수정*/
	$('#CateUpdateBtn').click(function(){
	
		/* 대분류 수정 */
		if($('#UpdateCateType').val()=='대분류'){
			let UpdateBigCateParam = {
										bigCateNum  :$('#CateNum').val()
										,bigCateName :$('#UpdateCateName').val() 
									  }
			$.ajax({
				type  : 'post'
				,data :	UpdateBigCateParam
				,url  : '/glowamber/bigcateupdate'
				,success : selectBigCate()
			})
		}
		
		/* 소분류 수정 */
		else{
			let UpdateSmallCateParam = {
										SmallCateNum  :$('#CateNum').val()
										,bigCateNum   :$('#BigCateNum').val()
										,SmallCateName :$('#UpdateCateName').val() 
									  }
			$.ajax({
				type  : 'post'
				,data :	UpdateSmallCateParam
				,url  : '/glowamber/smallcateupdate'
				,success : function(){
					$.ajax({
						type  : 'post'
						,data :	UpdateSmallCateParam
						,dataType : 'json'
						,url  : '/glowamber/selectsmallcate'
						,success :function (result){
										$('#SmallCateList').empty();
											for( smallcate of result ){
											$('#SmallCateList').append(
															$('<tr/>').append([
																			$('<td/>').append([$('<input type="hidden" />').val(smallcate['smallCateNum'])
																							 ,$('<input type="hidden" />').val(smallcate['bigCateNum'])
																									  					 ,smallcate['smallCateName']])
																			,$('<td/>').append($('<input type="button" class="delete" />').val('x'))]))
											}
									}
					})
				}
			})
		}
	})
	
	/* 카테고리 삭제	*/
	/* 대분류 카테고리 삭제 */
	$('#BigCateList').on('click','.delete',function(){
		$.ajax({
				type : 'post'
				,data : {bigCateNum : $(this).parents('tr').find('input').val()}
				,url  : '/glowamber/bigcatedelete'
				,success : selectBigCate()
			})
	})
	
	/* 소분류 카테고리 삭제 */
	$('#SmallCateList').on('click','.delete',function(){
			let deleteparam={
				SmallCateNum : $(this).parents('tr').find('input:eq(0)').val()
				,bigCateNum : $(this).parents('tr').find('input:eq(1)').val()
			}
			$.ajax({
				type : 'post'
				,data : deleteparam
				,url  : '/glowamber/Smallcatedelete'
				,success : function(){
					$.ajax({
						type  : 'post'
						,data :	deleteparam
						,dataType : 'json'
						,url  : '/glowamber/selectsmallcate'
						,success : function (result){
										$('#SmallCateList').empty();
											for( smallcate of result ){
											$('#SmallCateList').append(
															$('<tr/>').append([
																			$('<td/>').append([$('<input type="hidden" />').val(smallcate['smallCateNum'])
																							 ,$('<input type="hidden" />').val(smallcate['bigCateNum'])
																									  					 ,smallcate['smallCateName']])
																			,$('<td/>').append($('<input type="button" class="delete" />').val('x'))]))
											}
									}
					})
				}
			})
	})
	
	/* 카테고리 출력 */
	/* 대분류 출력 */
	function selectBigCate(){
					$.ajax({
						type : 'post'
						,dataType : 'json'
						,url  : '/glowamber/selectbigcate'
						,success : function(result){
							$('#BigCateList').empty()
							$('#SelectBigCate').empty()
							for( bigcate of result ){
								$('#BigCateList').append(
												$('<tr/>').append([
																  $('<td/>').append([$('<input type="hidden" />').val(bigcate['bigCateNum'])
																  					 ,bigcate['bigCateName']])
																  ,$('<td/>').append($('<input type="button" class="delete" />').val('x'))]))
								$('#SelectBigCate').append($('<option>').val(bigcate['bigCateNum']).text(bigcate['bigCateName']))
							}
						}
					})
				}
				
	/* 대분류 리스트 클릭시 */
	$('#BigCateList').on('click','td',function(){
	
		/* 해당 소분류 출력 */
		let smallcatelist = $('#SmallCateList')
		smallcatelist.empty()
			$.ajax({
				type : 'post'
				,data:{bigCateNum:$(this).find('input').val()}
				,dataType : 'json'
				,url  : '/glowamber/selectsmallcate'
				,success : function (result){
								$('#SmallCateList').empty();
									for( smallcate of result ){
									$('#SmallCateList').append(
													$('<tr/>').append([
																	$('<td/>').append([$('<input type="hidden" />').val(smallcate['smallCateNum'])
																					 ,$('<input type="hidden" />').val(smallcate['bigCateNum'])
																							  					 ,smallcate['smallCateName']])
																	,$('<td/>').append($('<input type="button" class="delete" />').val('x'))]))
									}
							}
				
			})
		
		/* 대분류 번호, 이름 수정 폼에 출력 */
		$('#CateNum').val($(this).find('input').val())
		$('#UpdateCateType').val('대분류')
		$('#BigCateNum').val($(this).find('input').val())
		$('#UpdateBigCateName').val($(this).text())
		$('#UpdateCateName').val($(this).text())
	})
	
	/* 소분류 리스트 클릭시 */
	$('#SmallCateList').on('click','td',function(){
		$('#CateNum').val($(this).find('input').val())
		$('#UpdateCateType').val('소분류')
		$('#UpdateCateName').val($(this).text())
		$('#smallCateNum').val($(this).children().first().val())
	})
	
	/* 카테고리 화면 띄우기 */
	$('#categoryUp').click(function(){
		$('#category').show()
	})
	
	$('#categoryhide').click(function(){
		$('#category').hide()
	})
	
})