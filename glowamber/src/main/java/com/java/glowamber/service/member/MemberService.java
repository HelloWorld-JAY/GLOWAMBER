package com.java.glowamber.service.member;

import com.java.glowamber.model.dto.MemberDTO;

public interface MemberService {

	public int memberJoin(MemberDTO dto);
	
	public MemberDTO idCheck_Login(MemberDTO dto);
	
	
}
