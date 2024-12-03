package com.java.glowamber.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.glowamber.model.dto.MemberDTO;
import com.java.glowamber.service.member.MemberService;



@Controller
@RequestMapping("member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	//회원가입 정보 입력
	@RequestMapping("memberJoin")
	public String memberJoin(MemberDTO dto){
		System.out.println("입력값" +dto.toString());
		int mj = memberService.memberJoin(dto);

		if(mj==1) { 
			return"member/Login";

		}
		return ""; }
	//로그인 실행
	@RequestMapping("login")
	private String login(MemberDTO dto,HttpSession session ) {

		MemberDTO result = memberService.idCheck_Login(dto);
		if(result==null || result.getMemberId()==null) {

			return "member/Login";

		}else {
			//로그인 성공한 경우 =>세션에 아이디값 저장하기
			session.setAttribute("id", result.getMemberId());
			return "mainpage/MainPage";
		}
	}
	//로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		return "member/Login";
	}

	@RequestMapping(value="idCheck", produces="application/text;charset=utf-8")
	//******
	@ResponseBody
	public String idCheck(MemberDTO dto ) {
	  System.out.println("입력값" +dto.toString());
	
	  String msg = "사용가능한 아이디 입니다";
	  MemberDTO result =memberService.idCheck_Login(dto);
	  if(result != null) {
		  msg="중복된 아이디가 있습니다";
	  }
	  return msg;
	}
	

}
