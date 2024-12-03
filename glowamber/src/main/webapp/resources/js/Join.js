$(function(){

//유효성검사에 필요한 변수 생성
 let checkID = RegExp(/^[a-z0-9]{6,20}$/);
        let checkPW = RegExp(/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[~!@#$%^&*()_+])[A-Za-z\d~!@#$%^&*()_+]{8,}$/);
        let checkName = RegExp(/^[가-힣]|[A-Z]|[a-z]$/);
        let checkPhone = RegExp(/^[0-9]+$/);        
        let checkEmail = RegExp(/^([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$/);
        let checkRecommendId = RegExp(/^[a-z0-9]{6,20}$/);

  // 회원가입 버튼눌렀을때 정보 입력이 다 안됐을경우 찾아냄 
$('#confirm').click(function(){

 //아이디
    if($.trim($("#memberId").val()) ==''){
    $("#memberId").focus();
    return false;
    }else if(!checkID.test($("#memberId").val())) {

                    $("#memberId").focus();                
                    return false;
                }else if(checkID.test($("#memberId").val())) {
                     
                    $("#memberPass").focus();
                    return true;
                }
           
    
    
    
   //비밀번호
    if($.trim($("#memberPass").val()) ==''){
    $("#memberPass").focus();
    return false;
    }
    //비밀번호 확인
    if($.trim($("#memberPass2").val()) !=$.trim($('#memberPass2').val())){
    $("#memberPass2").focus();
    return false;
    }
    //이름
    if($.trim($("#memberName").val()) ==''){
    $("#memberName").focus();
    return false;
    }
    //이메일
    if($.trim($("#memberEmail").val()) ==''){
    $("#memberEmail").focus();
    return false;
    }
    
    //이메일 도메인
    if($('select option:selected').val() == ""){ 
	$('select option:selected').focus();
	
	return false;
    }
    
    //전화번호
    if($.trim($("#memberTel").val()) ==''){
    $("#memberTel").focus();
    return false;
    }
    //자료 전송한다
    $('#frm').submit();
    

    
    
});// 회원가입 정보 입력 끝
    
    //아이디 중복체크
	//일부러극적인 효과를 위해 keyup이벤트를 쓰지만 실제롤 잘 안씀;
	$('#memberId').keyup(function(){
          
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
