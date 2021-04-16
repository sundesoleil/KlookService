package com.klook.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.klook.vo.CartVO;
import com.klook.vo.MemberVO;
import com.klook.vo.ProductVO;
import com.klook.vo.ReviewVO;

@Mapper
public interface ProductMapper {
	public List<Integer> selectProductSeqList(Integer limit);
	public ProductVO selectProduct(Integer seq);
	public ProductVO selectProductBySeq(Integer seq);
}
