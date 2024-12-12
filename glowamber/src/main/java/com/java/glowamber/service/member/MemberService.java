package com.java.glowamber.service.member;

import java.util.List;

import com.java.glowamber.model.dto.MemberDTO;

public interface MemberService {

	public int memberJoin(MemberDTO dto);
	
	public MemberDTO idCheck_Login(MemberDTO dto);
	
	public List<MemberDTO> selectMemberList(MemberDTO dto);
	
	public MemberDTO selectMemberInfo(MemberDTO dto);
	
	public void updateMemberauth(MemberDTO dto);
}
