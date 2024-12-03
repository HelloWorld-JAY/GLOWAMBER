package com.java.glowamber.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.glowamber.dao.member.MemberDAOImpl;
import com.java.glowamber.model.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAOImpl memberDAO;
	
	//회원가입 입력
	public int memberJoin(MemberDTO dto) {
		return memberDAO.memberJoin(dto);
	}

	//아이디 중복 체크
	public MemberDTO idCheck_Login(MemberDTO dto) {
		return memberDAO.idCheck(dto);
	}
	
}
