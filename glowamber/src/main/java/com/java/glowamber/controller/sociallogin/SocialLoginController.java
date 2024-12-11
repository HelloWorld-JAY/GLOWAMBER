package com.java.glowamber.controller.sociallogin;

import javax.servlet.http.HttpSession;

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
    
    

    @RequestMapping("/kakaoLogin")
    public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session) throws Exception {     	
    	
		System.out.println("#########" + code);
		String access_Token = socialLoginService.getAccessToken(code);
		MemberDTO userInfo = socialLoginService.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		
		/* System.out.println("###email#### : " + userInfo.get("email")); */
		
		// 아래 코드가 추가되는 내용
	if(session.getAttribute("id")!=null){
		session.removeAttribute("id");
		session.removeAttribute("admin");
		session.setAttribute("id", userInfo.getMemberEmail());
		session.setAttribute("admin", userInfo.getMemberAuth());
	}else {
		session.setAttribute("id", userInfo.getMemberEmail());
		session.setAttribute("admin", userInfo.getMemberAuth());
	}
		// 위 코드는 session객체에 담긴 정보를 초기화 하는 코드.
		
		
		// 위 2개의 코드는 닉네임과 이메일을 session객체에 담는 코드
		// jsp에서 ${sessionScope.kakaoN} 이런 형식으로 사용할 수 있다.
	    
		
		return "mainpage/MainPage";
    	}
    
    
    
	}

