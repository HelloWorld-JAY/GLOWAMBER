let oEditors=[];
	smartEditor= function (){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors
			, elPlaceHolder : "mtom_service"
			, sSkinURI : "/glowamber/resources/smarteditor/SmartEditor2Skin.html"
			, fCreator : "createSEditor2"
		})
	}
	

	
	
$(function(){

/* 스마트에디터 출력 */
	smartEditor()


//ServiceCenter 탭팬
 $(document).ready(function () {
  const $tabButtons = $('.nav-link'); // 모든 탭 버튼 선택
  const $tabContents = $('.tab-pane'); // 모든 탭 콘텐츠 선택

  $tabButtons.on('click', function () {
    // 1. 모든 탭 버튼에서 active 클래스 제거
    $tabButtons.removeClass('active');
    // 2. 모든 탭 콘텐츠에서 활성화 클래스 제거
    $tabContents.removeClass('show active fade');

    // 3. 클릭된 탭 버튼에 active 클래스 추가
    $(this).addClass('active');

    // 4. 클릭된 버튼의 id와 연결된 콘텐츠 활성화
    const targetId = $(this).attr('id').replace('-tab', ''); // 'notice-tab' → 'notice'
    $(`#${targetId}`).addClass('show active');
  });
});


})	