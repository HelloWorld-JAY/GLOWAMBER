/* 스마트에디터 설정 */
let oEditors=[];

let oEditors2=[];

	smartEditor= function (){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors
			, elPlaceHolder : "itemdetail"
			, sSkinURI : "/glowamber/resources/smarteditor/SmartEditor2Skin.html"
			, fCreator : "createSEditor2"
		})
	}
	
	smartEditor2= function (){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors2
			, elPlaceHolder : "itemdetailsub"
			, sSkinURI : "/glowamber/resources/smarteditor/SmartEditor2Skin.html"
			, fCreator : "createSEditor2"
		})
	}
$(function(){
	/* 카테고리 화면 숨기기*/
	$('#category').hide()
	
	$('.cateInsert').hide()
	$('.cateUpdate').hide()
	$('#InsertCateType').parent().parent().next().hide()
	$('#UpdateCateType').parent().parent().next().hide()
	
	/* 카테고리 등록버튼 누를때  */
	$('#cateInsertBtn').click(function(){
		$('.cateUpdate').hide()
		$('.cateInsert').show()
		$('#InsertCateType').parent().parent().next().hide()
		
		/* 초기화 */
		$('#InsertCateType').val("")
		$('#SelectBigCate').val("")
		$('#InsertCateName').val("")
	})
	/* 카테고리 수정버튼 누를때 */
	$('#cateUpdateBtn').click(function(){
		$('.cateInsert').hide()
		$('.cateUpdate').show()
		$('#UpdateCateType').parent().parent().next().hide()
		
		/* 초기화 */
		$('#UpdateCateType').val("")
		$('#UpdateBigCateName').val("")
		$('#UpdateCateName').val("")
		$('#CateNum').val("")
	})
	
	$('#CateUpdateCancle').click(function(){
		$('.cateUpdate').hide()
	})
	
	$('#CateInsertCancle').click(function(){
		$('.cateInsert').hide()
	})
	$('#InsertCateType').change(function(){
		if($(this).val()=='small'){
			$(this).parent().parent().next().show()
		}else{
			$(this).parent().parent().next().hide()
		}
	})
	/* 스마트에디터 출력 */
	smartEditor();
	smartEditor2();
	/* 카테고리 출력 */
	selectBigCate()
	
	/*************************************** 상품정보페이지 ********************************/
	/* 저장버튼 누르면 수정한 상품정보 저장 */
	$('#itemUpdateBtn').click(function(){
		oEditors.getById['itemdetail'].exec("UPDATE_CONTENTS_FIELD",[]);
		oEditors2.getById['itemdetailsub'].exec("UPDATE_CONTENTS_FIELD",[]);
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
		oEditors2.getById['itemdetailsub'].exec("UPDATE_CONTENTS_FIELD",[]);
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
				,success : selectBigCate
			})
			
		}
		
		/* 소분류 등록 */
		else{
			let SelectSmallCateParam = { 
								  	bigCateNum : $('#SelectBigCate').val()
								  	,smallCateName : $('#InsertCateName').val()
			}
			$.ajax({
				type :'post'
				,data : SelectSmallCateParam
				,url  :'/glowamber/smallcateinsert'
				,success :  SelectSmallCate(SelectSmallCateParam)
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
				,success : selectBigCate
			})
		}
		
		/* 소분류 수정 */
		else{
			let SelectSmallCateParam = {
										SmallCateNum  : $('#CateNum').val()
										,bigCateNum   : $('#BigCateNum').val()
										,SmallCateName : $('#UpdateCateName').val() 
									  }
			
			$.ajax({
				type  : 'post'
				,data :	SelectSmallCateParam
				,url  : '/glowamber/smallcateupdate'
				,success : SelectSmallCate(SelectSmallCateParam)
			})
		}
	})
	
	/* 카테고리 삭제	*/
	/* 대분류 카테고리 삭제 */
	$('#BigCateListBody').on('click','.deletecate',function(e){
		$.ajax({
				type : 'post'
				,data : {bigCateNum : $(this).parents('tr').find('input').val()}
				,url  : '/glowamber/bigcatedelete'
				,success : selectBigCate
			})
		e.stopPropagation()
	})
	
	/* 소분류 카테고리 삭제 */
	$('#SmallCateListBody').on('click','.deletecate',function(e){
		
			let SelectSmallCateParam={
				SmallCateNum : $(this).parents('tr').find('input:eq(0)').val()
				,bigCateNum : $(this).parents('tr').find('input:eq(1)').val()
			}
			
			$.ajax({
				type : 'post'
				,data : SelectSmallCateParam
				,url  : '/glowamber/Smallcatedelete'
				,success : SelectSmallCate(SelectSmallCateParam)
			})
			e.stopPropagation()
	})
	
	/* 카테고리 출력 */
	/* 대분류 출력 */
	function selectBigCate(){
					$.ajax({
						type : 'post'
						,dataType : 'json'
						,url  : '/glowamber/selectbigcate'
						,success : function(result){
							$('#BigCateListBody').empty()
							$('#SelectBigCate').empty()
							for( bigcate of result ){
								$('#BigCateListBody').append(
												$('<tr/>').append([
																  $('<td/>').append([$('<input type="hidden" />').val(bigcate['bigCateNum'])
																  					 ,bigcate['bigCateName']])
																  ,$('<td/>').append($('<input type="button" class="deletecate" />').val('x'))]))
								$('#SelectBigCate').append($('<option>').val(bigcate['bigCateNum']).text(bigcate['bigCateName']))
							}
						}
					})
				}
				
	/* 소분류 출력 */
	function SelectSmallCate(SelectSmallCateParam){
		$.ajax({
				type : 'post'
				,data: SelectSmallCateParam
				,dataType : 'json'
				,url  : '/glowamber/selectsmallcate'
				,success : function (result){
								$('#SmallCateListBody').empty();
								for( smallcate of result ){
									$('#SmallCateListBody').append(
													$('<tr/>').append([
																	$('<td/>').append([$('<input type="hidden" />').val(smallcate['smallCateNum'])
																					 ,$('<input type="hidden" />').val(smallcate['bigCateNum'])
																							  					 ,smallcate['smallCateName']])
																	,$('<td/>').append($('<input type="button" class="deletecate" />').val('x'))]))
							}
				}
		})
	}
	
	/* 대분류 리스트 클릭시 */
	$('#BigCateListBody').on('click','tr',function(){
		/* 해당 대분류의 소분류 출력 */
		SelectSmallCateParam = { bigCateNum : $(this).children().children('input').val() }
		SelectSmallCate(SelectSmallCateParam)
			
		/* 대분류 번호, 이름 수정 폼에 출력 */
		$('#CateNum').val($(this).find('input').val())
		$('#UpdateCateType').val('대분류')
		$('#BigCateNum').val($(this).find('input').val())
		$('#UpdateBigCateName').val($(this).text())
		$('#UpdateCateName').val($(this).text())
		$('#bigCateNum').val($(this).find('input').val())
	})
	
	/* 소분류 리스트 클릭시 */
	$('#SmallCateListBody').on('click','td',function(){
		$('#CateNum').val($(this).find('input').val())
		$('#UpdateCateType').val('소분류')
		$('#UpdateCateName').val($(this).text())
		$('#smallCateNum').val($(this).children().first().val())
		
		if($('#UpdateCateType').val()=='소분류'){
			$('#UpdateCateType').parent().parent().next().show()
		}else{
			$('#UpdateCateType').parent().parent().next().hide()
	}
	})
	
	/* 카테고리 화면 띄우기 */
	$('#categoryUp').click(function(){
		$('#category').show()
		selectBigCate()
	})
	
	$('#categoryhide').click(function(){
		$('#category').hide()
	})
	

})