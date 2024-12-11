$(function(){
	SelectMember()
	$('.popup_layer').hide()
	/* 전체회원 목록출력 */
	function SelectMember(memberSelect){
		$.ajax({
			type:'post'
			,data : memberSelect
			,dataType : 'json'
			,url : '/glowamber/member/selectMemberList'
			,success : function(result){
				//alert('ok')
				$('#memberTable').empty()
				for(member of result){
					$('#memberTable').append(
											 $('<tr/>').append([
											 				     $('<td/>').text(member['memberName'])
											 				     ,$('<td/>').text(member['memberId'])
											 				     ,$('<td/>').text(member['memberTel'])
										 				     ,$('<td/>').text(member['memberEmail'])
										 				     ,$('<td/>').text(member['memberJoinDate'])    
										 					  ])
											 )
				 }
			 }
		})
	}
	
	/* 검색버튼 클릭시 */
	$('#memberSelectBtn').click(function(){
		
		let memberSelect = { }
		memberSelect[$('#memberSelectCate').val()] = $('#memberSelectCate').parent().next().children('input[type="text"]').val()
		
		/* 검색어에 해당하는 회원목록 검색 */
		
		SelectMember(memberSelect)
	})
	
	/* 회원상세정보 출력 */
	$('#memberTable').on('click','tr',function(){
		$('.popup_layer').show()
		$.ajax({
			type:'post'
			,data : { memberId : $(this).children(':eq(1)').text() }
			,dataType : 'json'
			,url : '/glowamber/member/selectMember'
			,success : function(result){
				$('#username').text(result['memberName'])
				$('#userid').text(result['memberId'])
				$('#usertel').text(result['memberTel'])
				$('#useremail').text(result['memberEmail'])
				$('#userbuycount').text(result[''])
				$('#usertotalamount').text(result[''])
				$('#useraddr').text(result['emailAddr'])
				$('#useraddrdetail').text(result[''])
			}
		})
	})
	
	/* 팝업창 확인버튼 누를시 */
	$('#popupCheck').click(function(){
		$('.popup_layer').hide()
	})
	
	
})