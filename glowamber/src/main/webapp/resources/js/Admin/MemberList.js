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
				$('#memberTable').empty()
				for(member of result){
					$('#memberTable').append(
											 $('<tr/>').append([
											 				     $('<td/>').text(member['memberName']).append(
											 				     					$("<input type='hidden' id='memberNum' />").val(member['memberNum'])
											 				     				 )
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
		let num =$(this).find('#memberNum').val()
		console.log(num)
		$('.popup_layer').show()
		$.ajax({
			type:'post'
			,data : { memberNum : num }
			,dataType : 'json'
			,url : '/glowamber/member/selectMember'
			,success : function(result){	
				$('#usernum').val(result['memberNum'])
				$('#username').text(result['memberName'])
				$('#userid').text(result['memberId'])
				$('#usertel').text(result['memberTel'])
				$('#useremail').text(result['memberEmail'])
				$('#usertotalPrice').text(result['totalPrice'])
				$('#usertotalPurchase').text(result['totalCount'])
				$('#useraddr').text(result['memberAddr'])
				$('#useraddrdetail').text(result['memberAddrDetail'])
				
				if(result['memberAuth']=='1'){
					$('#memberAuth').prop('checked',true)
				}else{
					$('#memberAuth').prop('checked',false)
				}
			}
		})
	})
	
	/* 팝업창 확인버튼 누를시 */
	$('#popupCheck').click(function(){
		$('.popup_layer').hide()
		/*let auth=0;
		if($(this).parent().parent().find('#memberAuth').is('checked',true)){
			auth = 1;
		}
		$.ajax({
			type:'post'
			,data : { 
				memberNum :$(this).parent().parent().find('#usernum').val()
				,memberAuth : auth	
			 }
			,dataType : 'json'
			,url : '/glowamber/member/updateMember'
			,success : function(){
				console.log('ok')
			}
			
		}))*/
		
	}
	
	
})