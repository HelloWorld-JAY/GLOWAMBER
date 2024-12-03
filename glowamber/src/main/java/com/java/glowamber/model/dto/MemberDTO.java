package com.java.glowamber.model.dto;

import lombok.Data;

@Data
public class MemberDTO {

	private Integer memberNum;     //회원번호   
	private String  memberId;      //회원아이디
	private String  memberPass;    //회원비밀번호
	private String  memberName;    //회원이름
	private String  memberTel;     //회원전화번호
	private String  memberEmail;   //회원 이메일
	private String  memberJoinDate;//회원 가입일 
	private String  memberAuth;    //관리자 권한
}
