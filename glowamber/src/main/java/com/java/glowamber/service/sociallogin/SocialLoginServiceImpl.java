package com.java.glowamber.service.sociallogin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.glowamber.dao.sociallogin.SocialLoginDAO;

@Service
public class SocialLoginServiceImpl implements SocialLoginService{

	

	@Autowired
	public SocialLoginDAO socialLoginDAO;

	
}
