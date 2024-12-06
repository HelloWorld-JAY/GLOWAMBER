	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
/* 주소값합치기 */
function combineAddress() {
    const postcode = document.getElementById('sample6_postcode').value;
    const address = document.getElementById('sample6_address').value;
    const detailAddress = document.getElementById('sample6_detailAddress').value;
    const extraAddress = document.getElementById('sample6_extraAddress').value;

    // 하나의 문자열로 합치기
    const memberAddr = `${postcode} ${address} ${detailAddress} ${extraAddress}`.trim();
    return memberAddr;
}



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
		
		
/*  ********************************************************  */		
	

		
		
})
