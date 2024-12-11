package com.java.glowamber.dao.sociallogin;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.glowamber.model.dto.MemberDTO;

@Repository
public class SocialLoginDAOImpl implements SocialLoginDAO {

	@Autowired
	 private SqlSessionTemplate mybatis;

	// 정보 저장
	@Override
		public void kakaoinsert(HashMap<String, Object> userInfo) {
			mybatis.insert("member.kakaoInsert",userInfo);
		}

		// 정보 확인
	@Override
		public MemberDTO findkakao(HashMap<String, Object> userInfo) {
			System.out.println("RN:"+userInfo.get("nickname"));
			System.out.println("RE:"+userInfo.get("email"));
			return mybatis.selectOne("member.findKakao", userInfo);
		}
	    

}
