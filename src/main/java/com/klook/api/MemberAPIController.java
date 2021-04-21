package com.klook.api;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.klook.service.MemberService;
import com.klook.utils.AESAlgorithm;
import com.klook.vo.LoginVO;
import com.klook.vo.MemberVO;
import com.klook.vo.SimpleMemberVO;

@RestController
public class MemberAPIController {
	@Autowired
	MemberService service;
	
	@PostMapping("/member/login")
	// httpservletresponse: ajax 없이 브라우저로 바로 통신
	public Map<String, String> postLogin(
			@RequestBody LoginVO vo, 
			HttpServletResponse response,
			HttpSession session){
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		if(vo.getEmail() == null || vo.getPwd() == null) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST); 
			resultMap.put("message", "필드명 [email] 또는 [pwd]가 비어 있습니다.");
			return resultMap;
		}
		
		String pwd = vo.getPwd();
		try {
			pwd = AESAlgorithm.Encrypt(pwd);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		vo.setPwd(pwd);
		
		if(service.memberLogin(vo)) {
			response.setStatus(HttpServletResponse.SC_ACCEPTED);
			resultMap.put("message", "로그인 되었습니다.");
			
			SimpleMemberVO memberInfo = service.selectSimpleMemberInfo(vo);
			session.setAttribute("memberInfo", memberInfo);

		}
		else {
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			resultMap.put("message", "로그인에 실패하였습니다.");
		}
		
		return resultMap;
		
	}
	
	@PostMapping("/member/join")
	public Map<String, String> postMemberJoin(@RequestBody MemberVO vo){
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		service.insertMemberInfo(vo);
		
		resultMap.put("status", "success");
		resultMap.put("message", "가입되었습니다.");
		
		return resultMap;
	}
	
	@PostMapping("/api/modify")
	public Map<String, String> postMemberModify(@RequestBody MemberVO vo){
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		if(vo.getKm_pwd() != null && vo.getKm_pwd() != "") {
			LoginVO login = new LoginVO();
			login.setEmail(vo.getKm_email());
			try {
				login.setPwd(AESAlgorithm.Encrypt(vo.getKm_pwd()));
			}catch(Exception e) {e.printStackTrace();}
			
			boolean authPwd = service.memberLogin(login);
			
			if(!authPwd) {
				resultMap.put("result", "auth failed");
				resultMap.put("message", "기존 비밀번호가 일치하지 않습니다.");
				return resultMap;
			}
			try {
				vo.setConfirm_pwd(AESAlgorithm.Encrypt(vo.getConfirm_pwd()));
			}
			catch(Exception e) {e.printStackTrace();}
			service.updateMemberInfo(vo);
			resultMap.put("result", "success");
			resultMap.put("message", "변경되었습니다.");
			return resultMap;
		}
		service.updateMemberInfo(vo);
		resultMap.put("result", "success");
		resultMap.put("message", "변경되었습니다.");
		
		return resultMap;
	}

	@GetMapping("/member/email_check")
	public Map<String, String> getMemberEmailCheck(@RequestParam String email){
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		if(service.userEmailCheck(email)) {
			resultMap.put("status", "OK");
			resultMap.put("message", "가입 가능한 이메일입니다.");
		}else {
			resultMap.put("status", "OK");
			resultMap.put("message", "이미 등록된 이메일입니다.");
		}
		
		return resultMap;
	}
}
