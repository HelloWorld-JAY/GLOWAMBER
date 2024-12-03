$(function(){

  // 회원가입 정보 입력
  //아이디 입력
$('#confirm').click(function(){

 
    if($.trim($("#memberId").val()) ==''){
    $("#memberId").focus();
    return;
    }
   
    if($.trim($("#memberPass").val()) ==''){
    $("#memberPass").focus();
    return;
    }
    
    if($.trim($("#memberPass2").val()) !=$.trim($('#memberPass2').val())){
    $("#memberPass2").focus();
    return;
    }
    if($.trim($("#memberName").val()) ==''){
    $("#memberName").focus();
    return;
    }
    
    if($.trim($("#memberEmail").val()) ==''){
    $("#memberEmail").focus();
    return;
    }
    
    if($.trim($("#memberTel").val()) ==''){
    $("#memberTel").focus();
    return;
    }
    //자료 전송한다
    document.memberJoinAll.submit();
    

    
    
});// 회원가입 정보 입력 끝
    
    //아이디 중복체크
	//일부러극적인 효과를 위해 keyup이벤트를 쓰지만 실제롤 잘 안씀;
	$('#memberId').keyup(function(){
          clearTimeout(debounceTimeout); // 이전 타이머를 초기화
           debounceTimeout = setTimeout(() => {
       $.ajax({
       
          type : 'post'
          ,url : "idCheck"
          ,data: {memberId:$('#memberId').val()}
          ,contentType:'application/x-www-form-urlencoded;charset=utf-8'
          ,success: function(result){
          $('#idCheckResult').text(result);
          
          }
       });
       }, 300); // 300ms 대기 후 실행
	})//로그인
		





})
