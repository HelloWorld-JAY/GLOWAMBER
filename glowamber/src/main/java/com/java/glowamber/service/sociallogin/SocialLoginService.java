package com.java.glowamber.service.sociallogin;

import com.java.glowamber.model.dto.MemberDTO;

public interface SocialLoginService {

	public String getAccessToken (String authorize_code);
	public MemberDTO getUserInfo(String access_Token);
}
