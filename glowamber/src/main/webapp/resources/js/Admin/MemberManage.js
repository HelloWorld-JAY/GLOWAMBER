$(function(){
	SelectMember()
	
	/* 전체회원 목록검색 */
	function SelectMember(){
		$.ajax({
			type:'post'
			,dataType : 'json'
			,url : '/glowamber/selectMember'
			,success : function(result){
							$('#memberTable').empty()
							for(member of result){
								$('#memberTable').append(
														 $('<tr/>').append([
														 				     $('<td/>').text(member['1'])
														 				     ,$('<td/>').text(member['2'])
														 				     ,$('<td/>').text(member['3'])
													 				     ,$('<td/>').text(member['4'])
													 				     ,$('<td/>').text(member['5'])    
													 			])
							)
				  	}
			 }
		})
	}
	
	/* 검색버튼 클릭시 */
	$('#memberSelectBtn').click(function(){
		let membercate = $('#memberSelectCate').val()
		let memberSelect = { 
				membercate : $('#memberSelectCate').next().val()
		}
		
		/* 검색어에 해당하는 회원목록 검색 */
		$.ajax({
		type :'post'
		,data : memberSelect
		,dataType:'json'
		,url:'/glowamber/selectMember'
		,success : function(result){
						$('#memberTable').empty();
						for(member of result){
							$('#memberTable').append(
													 $('<tr/>').append([
													 				     $('<td/>').text(member['1'])
													 				     ,$('<td/>').text(member['2'])
													 				     ,$('<td/>').text(member['3'])
													 				     ,$('<td/>').text(member['4'])
													 				     ,$('<td/>').text(member['5'])    
													 			])
											  )
				  		}
					}
		})	
	})
	
})