package com.klook.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.klook.vo.CartVO;

@Mapper
public interface CartMapper {
	public void insertCartInfo(CartVO vo);
	public List<CartVO> selectCarts(Integer seq);
	public CartVO selectCartBySeq(Integer seq);
}
