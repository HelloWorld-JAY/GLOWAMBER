package com.java.glowamber.dao.member;

import java.util.List;

import com.java.glowamber.model.dto.MemberDTO;


public interface MemberDAO {

	
	 int memberJoin(MemberDTO dto);
	 
	 MemberDTO memberLogin(MemberDTO dto);
	 
	 MemberDTO  idCheck( MemberDTO dto );

	 public List<MemberDTO> selectMemberList(MemberDTO dto);
	 
	 public MemberDTO selectMemberInfo(MemberDTO dto);
	 
	 public void updateMemberauth(MemberDTO dto);
}
