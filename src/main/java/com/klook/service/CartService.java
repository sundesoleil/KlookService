package com.klook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klook.mapper.CartMapper;
import com.klook.vo.CartVO;

@Service
public class CartService {
	@Autowired
	CartMapper mapper;
	
	public void insertCartInfo(CartVO vo) {
		mapper.insertCartInfo(vo);
	}
	public CartVO selectCartBySeq(Integer seq) {
		return mapper.selectCartBySeq(seq);
	}
	public List<CartVO> selectCarts(Integer seq){
		return mapper.selectCarts(seq);
	}
	public void deleteCart(Integer seq) {
		mapper.deleteCart(seq);
	}
	public void deleteAllCart(Integer seq) {
		mapper.deleteAllCart(seq);
	}
}
