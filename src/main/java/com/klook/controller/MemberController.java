package com.klook.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.klook.service.MemberService;
import com.klook.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	MemberService service;
	
	@GetMapping("/member/login")
	public String getLogin() {
		return "/member/login";
	}
	@GetMapping("/member/logout")
		public String getLogout(HttpSession session) {
			session.setAttribute("memberInfo", null);
			session.invalidate();
			return "redirect:/";
		}
	@GetMapping("/member/join")
	public String getMemberJoin() {
		return "/member/join";
	}
	@GetMapping("member/modify")
	public String getMemeberModify() {
		return "/member/modify";
	}

}