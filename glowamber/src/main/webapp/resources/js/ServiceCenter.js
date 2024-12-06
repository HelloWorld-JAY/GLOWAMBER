$(function(){



	//공지사항 관련 출력함수
	function noticePrint() {
		$('.mtom,.question').removeClass('active');
		$('.mtom,.question').css({"font-weight":"","background":""})
		$('.mtom,.question').find('i').removeClass('bi-caret-right-fill');
		$('.mtom,.question').find('i').addClass('bi-caret-right');
		$('.notice').addClass('active');
		$('.notice').css({"font-weight":"600","background":"#f1f1f1"})
		$('.notice').find('i').removeClass('bi-caret-right');
		$('.notice').find('i').addClass('bi-caret-right-fill');
		$('.body_title').text('공지사항');
		$('.board_title').empty();
		$('.board_title').append('<div class="row text-center">'+
				'<div class="col-2">번호</div>'+
				'<div class="col-6">제목</div>'+
				'<div class="col-2">작성자</div>'+
				'<div class="col-2">작성일</div>'+
				'</div>');
	}//공지사항 관련 출력함수 -end

	//자주하는 질문 관련 출력함수
	function questionPrint() {
		$('.mtom,.notice').removeClass('active');
		$('.mtom,.notice').css({"font-weight":"","background":""})
		$('.mtom,.notice').find('i').removeClass('bi-caret-right-fill');
		$('.mtom,.notice').find('i').addClass('bi-caret-right');
		$('.question').addClass('active');
		$('.question').css({"font-weight":"600","background":"#f1f1f1"})
		$('.question').find('i').removeClass('bi-caret-right');
		$('.question').find('i').addClass('bi-caret-right-fill');
		$('.body_title').text('자주하는질문');
		$('.board_title').empty();
		$('.board_title').append('<div class="row text-center">'+
				'<div class="col-2">번호</div>'+
				'<div class="col-3">카테고리</div>'+
				'<div class="col-7">제목</div>'+
				'</div>');
	}//자주하는 질문 관련 출력함수 -end

	//1:1문의 관련 출력함수
	function mtomPrint() {
		$('.notice,.question').removeClass('active');
		$('.notice,.question').css({"font-weight":"","background":""})
		$('.notice,.question').find('i').removeClass('bi-caret-right-fill');
		$('.notice,.question').find('i').addClass('bi-caret-right');
		$('.mtom').addClass('active');
		$('.mtom').css({"font-weight":"600","background":"#f1f1f1"})
		$('.mtom').find('i').removeClass('bi-caret-right');
		$('.mtom').find('i').addClass('bi-caret-right-fill');
		$('.body_title').text('1:1 문의');

	}//1:1문의 관련 출력함수 -end

	// 처음 페이지 열릴때 파라메터 값 받아와서 해당 탭 눌러주기
	if(tab == 'notice') {
		noticePrint()
	}else if(tab == 'question'){
		questionPrint()
	}else if (tab == 'mtom') {
		mtomPrint()
	}




	// 공지사항 눌렀을때
	$('.notice').click(function(){
		noticePrint()
	});// 공지사항 눌렀을때-end

	// 자주하는질문 눌렀을때
	$('.question').click(function(){
		questionPrint()
	});// 자주하는질문 눌렀을때-end

	// 1:1문의 눌렀을때
	$('.mtom').click(function(){
		mtomPrint()
	});// 1:1문의 눌렀을때-end

	//탭팬 호버시
	$('#body_container').on('mouseenter mouseleave','.notice,.question,.mtom',function(e){
		// 엑션이 붙어있는건 변경금지
		if ($(this).hasClass('active')) return;

		if(e.type == 'mouseenter') {
			$(this).css({"font-weight":"600","background":"#f1f1f1"})
			$(this).find('i').removeClass('bi-caret-right');
			$(this).find('i').addClass('bi-caret-right-fill');
		}else {
			$(this).css({"font-weight":"","background":""})
			$(this).find('i').removeClass('bi-caret-right-fill');
			$(this).find('i').addClass('bi-caret-right');
		}
	});//탭팬 호버시 -end
});