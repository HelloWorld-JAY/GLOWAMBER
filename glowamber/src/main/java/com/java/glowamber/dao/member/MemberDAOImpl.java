package com.java.glowamber.dao.member;

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
	
}
