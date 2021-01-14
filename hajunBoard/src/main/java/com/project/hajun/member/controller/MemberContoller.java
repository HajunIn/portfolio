package com.project.hajun.member.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.hajun.member.Service.MemberService;
import com.project.member.Vo.Member;

@Controller
@SessionAttributes("loginMember")
public class MemberContoller {
	
	 @Autowired 
	 MemberService service;
	 
	
	
	
	//로그인
	@RequestMapping("/member/memberLogin.do")
	public String loginMember(String userId, String password, Model m) {
		String loc = "";
		return loc;
	}
	

	//회원가입 페이지 전환
	@RequestMapping("/members/enrollMember.do")
	public String memberEnroll() {
	
	
		return "/member/enrollMember";
	}
	//회원가입 하기
	@RequestMapping("/member/memberEndenroll.do")
	public String memberEndenroll(Model m2,
			Member m) {
		System.out.println("되는건가요?"+m);
		int result=service.memberList(m);
		System.out.println("찍히니?"+result);

	
		m2.addAttribute("msg", result > 0 ? "회원가입 완료" : "회원가입 실패");
		m2.addAttribute("loc", "/");
		return "common/msg";
	}
	
	

}
