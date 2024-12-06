

let oEditors2=[];
	smartEditor2= function (){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors2
			, elPlaceHolder : "notice_write"
			, sSkinURI : "/glowamber/resources/smarteditor/SmartEditor2Skin.html"
			, fCreator : "createSEditor2"
		})
	}
		
$(function(){
	

/* 스마트에디터 출력 */
	smartEditor2()
	
		
	})