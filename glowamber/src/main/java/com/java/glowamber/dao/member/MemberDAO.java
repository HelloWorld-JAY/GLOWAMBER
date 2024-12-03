package com.java.glowamber.dao.member;

import com.java.glowamber.model.dto.MemberDTO;


public interface MemberDAO {

	
	 int memberJoin(MemberDTO dto);
	 
	 MemberDTO memberLogin(MemberDTO dto);
	 
	 MemberDTO  idCheck( MemberDTO dto );

	 
}
