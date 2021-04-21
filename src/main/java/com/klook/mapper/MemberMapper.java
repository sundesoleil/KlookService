package com.klook.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.klook.vo.LoginVO;
import com.klook.vo.MemberVO;
import com.klook.vo.SimpleMemberVO;

@Mapper
public interface MemberMapper {
	public Integer memberLogin(LoginVO vo);
	public SimpleMemberVO selectSimpleMemberInfo(LoginVO vo);
	public void insertMemberInfo(MemberVO vo);
	public Integer selectUserCntByEmail(String email);
	public void updateMemberInfo(MemberVO vo);
}
