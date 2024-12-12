package com.java.glowamber.service.member;

import java.util.List;

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
	
	
	/* 관리자 페이지 */
	/* 회원목록 출력 */
	@Override
	public List<MemberDTO> selectMemberList(MemberDTO dto) {
		return memberDAO.selectMemberList(dto);
	}

	@Override
	public MemberDTO selectMemberInfo(MemberDTO dto) {
		return memberDAO.selectMemberInfo(dto);
	}

	@Override
	public void updateMemberauth(MemberDTO dto) {
		memberDAO.updateMemberauth(dto);
		
	}
	
}
