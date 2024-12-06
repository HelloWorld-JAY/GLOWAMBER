package com.java.glowamber.dao.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.glowamber.model.dto.MemberDTO;


@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	//회원가입 입력
	@Override
	public int memberJoin(MemberDTO dto) {
		System.out.println("===>  MemberMapper memberInsert() 호출");
		return mybatis.insert("member.memberInsert", dto);
	}

	@Override
	public MemberDTO memberLogin(MemberDTO dto) {
		System.out.println("===> MemberMapper idCheck 호출");
		return mybatis.selectOne("member.idCheck", dto);
	}
	@Override
	public MemberDTO  idCheck( MemberDTO dto ) {
		System.out.println("===> MemberMapper idCheck 호출");
		return mybatis.selectOne("member.idCheck",dto);
	}
	
	
	/* 관리자 페이지 */
	/* 회원목록 검색 */
	@Override
	public List<MemberDTO> selectMemberList(MemberDTO dto) {
		return mybatis.selectList("member.selectMemberList",dto);
	}
	
	/* 회원정보 출력 */
	@Override
	public MemberDTO selectMemberInfo(MemberDTO dto) {
		return mybatis.selectOne("member.selectMemberInfo",dto);
	}
	
}
