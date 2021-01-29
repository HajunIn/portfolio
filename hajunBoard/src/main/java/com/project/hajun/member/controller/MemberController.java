package com.project.hajun.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.project.hajun.member.Service.MemberService;
import com.project.member.Vo.Member2;

@Controller
@SessionAttributes("commonLogin")
public class MemberController {
	
	 @Autowired 
	 MemberService service;
	 @Autowired 
	 BCryptPasswordEncoder pwEncoder;
	
	//로그인
	@RequestMapping("/member/memberLogin.do")
	public String loginMember(String userId,String password,HttpSession session,Model m) {

		System.out.println(userId);
		System.out.println(password);
		Member2 login=service.selectOneMember1(userId);

		System.out.println("로그인 테스트"+login);
		
		//로그인 처리하기
		// if(login.getPassword().equals(password)) {
		if(pwEncoder.matches(password, login.getPassword())) {
			//로그인 성공
		//session.setAttribute("commonLogin", login);
			m.addAttribute("commonLogin",login);
		}else{
			
			
		}
	
		return "redirect:/";
	}
	

	//회원가입 페이지 전환
	@RequestMapping("/members/enrollMember.do")
	public String memberEnroll() {
	
	
		return "/member/enrollMember";
	}
	//회원가입 하기
	@RequestMapping("/member/memberEndenroll.do")
	public String memberEndenroll(Model m2,
			Member2 m) {
		
		//패스워드 암호화 처리
		String oriPw=m.getPassword();
		System.out.println("원본 패슽스워드"+oriPw);
		
		//BcrtPassword 객체가 제공하는 암호회
		//encode -> 암호화한 스트링값 반환
		System.out.println(pwEncoder.encode(oriPw));

		m.setPassword(pwEncoder.encode(oriPw));
		
		int result=service.memberList(m);
	
		m2.addAttribute("msg", result > 0 ? "회원가입 완료" : "회원가입 실패");
		m2.addAttribute("loc", "/");
		return "common/msg";
	}
	
	@RequestMapping("/member/logout.do") // 로그아웃
	public String logoutMember(HttpSession session, SessionStatus ss) {
		
		// Sessionstatus를 객체를 이용해서 @SessionAttributes 로 등록한 값을
		// 제거할수 있음 -> SessionStayus.isComplate() -> 그세션이 살아있는지 확인하고
		//
		if (!ss.isComplete()) { // 죽지 않았니?
			// 살아있는 세션 삭제 하기 -> setComplate();
			ss.setComplete();
		}
		if (session != null)
			session.invalidate();

		return "redirect:/";
	}
	

	  
	  @RequestMapping("/member/Modifi.do")
	  public ModelAndView Modifi(HttpServletRequest request,ModelAndView mv, Member2 m) {
	
//		  
			int mem = service.memberModifi(m);
			mv.addObject("msg", mem > 0 ? "회원 정보 수정완료" : "회원 정보 수정실패");
			
			mv.addObject("loc", "/");
		  mv.setViewName( "common/msg");
		  return mv;
			
	  }
	  
	  @RequestMapping("/member/naverLogin.do")
	  public ModelAndView naverLogin( ModelAndView mv) {
		  System.out.println("skss");
		  mv.setViewName("/member/naverLogin");
		  
		  return mv;
				  
	  }
	  
	  @RequestMapping("/member/loginCheck")
	  @ResponseBody
		public int loginCheck(String userId) throws IOException {
		  	userId.trim();
			 System.out.println("들어오나요!?"+userId);
			int m=service.selectOneMember2(userId);
			
		
			System.out.println("==============="+m);
		
			
			return m; 
		
			
	  }
}
