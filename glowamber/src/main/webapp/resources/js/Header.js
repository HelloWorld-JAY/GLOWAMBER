$(function(){
	
	// 최초 대분류 카테고리 에이젝스 통신
	$.ajax({
		type:'post',
		url:'/glowamber/selectbigcate',
		dataType:'json',
		success: function(result){
			let bigCateLi = $('<li class="dropdown-submenu"><a class="dropdown-item text-center" ></a></li>')
			for(bigcate of result) {
				bigCateLi.find('a').attr('href','/glowamber/bigProductList?bigCateNum='+bigcate["bigCateNum"]);
				$('#bigcate').append(bigCateLi.clone().val(bigcate['bigCateNum']).find('a').text(bigcate['bigCateName']).end());
			}
		}
	});// 최초 대분류 카테고리 에이젝스 통신 -end
	// 대분류 호버시 해당 대분류 카테고리 소분류 에이젝스 통신
	$('#bigcate').on('mouseenter','li',function(){
		$.ajax({
			data:{bigCateNum:$(this).val()},
			type:'post',
			url:'/glowamber/selectsmallcate',
			dataType:'json',
			success: function(result){
				let smallCateUl = $('<ul class="dropdown-menu"/>');
				
				
				for(smallCate of result) {
					smallCateUl.append('<li><a class="dropdown-item" href="/glowamber/smallProductList?smallCateNum='+smallCate["smallCateNum"]+'">'+smallCate["smallCateName"]+'</a></li>');
				}
				$(this).append(smallCateUl);
			}.bind(this)
		});
	});// 대분류 호버시 해당 대분류 카테고리 소분류 에이젝스 통신 -end
	
	//헤더 메인네비게이션 sticky 효과주기
	const sticky = $('.main_nav');
	const offsetTop = sticky.offset().top;
	
	$(window).scroll(function(){
		if($(this).scrollTop() > offsetTop) {
			sticky.css({position:'fixed',top:'0',width:'100%'});
		}else {
			sticky.css({position:'static'});
		}
	});//헤더 메인네비게이션 sticky 효과주기 -end
});