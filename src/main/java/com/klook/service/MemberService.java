package com.klook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klook.mapper.MemberMapper;
import com.klook.utils.AESAlgorithm;
import com.klook.vo.LoginVO;
import com.klook.vo.MemberVO;
import com.klook.vo.SimpleMemberVO;

@Service
public class MemberService {
	@Autowired
	MemberMapper mapper;
	
	public boolean memberLogin(LoginVO vo) {
		/* if (mapper.memberLogin(vo) == 1 return true;
		 else return false; */
		return mapper.memberLogin(vo) == 1; 
	}
	
	public SimpleMemberVO selectSimpleMemberInfo(LoginVO vo) {
		return mapper.selectSimpleMemberInfo(vo);
	}
	
	public void insertMemberInfo(MemberVO vo) {
		String password = vo.getKm_pwd();
		try {
			password = AESAlgorithm.Encrypt(password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		vo.setKm_pwd(password);
		mapper.insertMemberInfo(vo);
	}

	public boolean userEmailCheck(String email) {
		return !(mapper.selectUserCntByEmail(email) > 0);
	}
	public void updateMemberInfo(MemberVO vo) {
		mapper.updateMemberInfo(vo);
	}
}
