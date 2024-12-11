package com.java.glowamber.controller.sociallogin;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.glowamber.model.dto.MemberDTO;
import com.java.glowamber.service.sociallogin.SocialLoginService;

@Controller
@RequestMapping(value="/member/*")
public class SocialLoginController {

    @Autowired
    private SocialLoginService socialLoginService;

    @RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
    public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
		System.out.println("#########" + code);
		String access_Token = socialLoginService.getAccessToken(code);
		MemberDTO userInfo = socialLoginService.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		
		/* System.out.println("###email#### : " + userInfo.get("email")); */
		return "member/testPage";
    	}
    
    
    
	}

