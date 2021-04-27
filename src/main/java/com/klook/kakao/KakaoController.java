package com.klook.kakao;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.klook.service.MemberService;
import com.klook.vo.MemberVO;

@Controller
@RequestMapping("/kakao")
public class KakaoController {

	private KakaoRestAPI kakaoRestApi = new KakaoRestAPI();
	
	@GetMapping(value="/oauth")
	public String kakaoConnect() {
		
		StringBuffer url = new StringBuffer();
		
		url.append("https://kauth.kakao.com/oauth/authorize?");
		url.append("client_id=" + "29d07e300a76fdf0fad3ec1691cd41cc");
		url.append("&redirect_uri=http://localhost:8092/kakao/login");
		url.append("&response_type=code");
		
		return "redirect:" + url.toString();
	}
	
	@RequestMapping(value="/callback", produces="application/json", method= {RequestMethod.GET, RequestMethod.POST})
	public String kakaoLogin(
			@RequestParam("code")String code, 
			RedirectAttributes ra, 
			HttpSession session, 
			HttpServletResponse response)
	throws IOException{
		
		System.out.println("kakao code:" + code);
		JsonNode access_token = kakaoRestApi.getKakaoAccessToken(code);
		JsonNode userInfo = KakaoUserInfo.getKakaoUserInfo(access_token.get("access_token"));
		 
		
         String member_id = userInfo.get("id").asText();
         String member_name = null;
         String member_img = null;
        
         // 유저정보 카카오에서 가져오기 
         JsonNode properties = userInfo.path("properties");
         JsonNode kakao_account = userInfo.path("kakao_account");
         member_name = properties.path("nickname").asText();
         member_img = properties.path("thumbnail_image").asText();
         
         if(member_name != null) {
             session.setAttribute("member_id", member_name);   
             session.setAttribute("member_img", member_img);
         }
         
         System.out.println("id : " + member_id);    
         System.out.println("name : " + member_name);
         System.out.println("img" + member_img);

		return "redirect:/";
	}
	@RequestMapping(value = "/logout_callback", produces = "application/json")
    public String Logout(HttpSession session) {
 
		KakaoUserInfo kr = new KakaoUserInfo();
        JsonNode node = kr.Logout(session.getAttribute("token").toString());

        System.out.println("로그인 후 반환되는 아이디 : " + node.get("id"));
        return "redirect:/";
    }    

	

}
