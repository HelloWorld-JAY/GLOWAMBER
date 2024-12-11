package com.java.glowamber.dao.sociallogin;

import java.util.HashMap;

import com.java.glowamber.model.dto.MemberDTO;

public interface SocialLoginDAO {
	
	public void kakaoinsert(HashMap<String, Object> userInfo);
	public MemberDTO findkakao(HashMap<String, Object> userInfo);
	
}
