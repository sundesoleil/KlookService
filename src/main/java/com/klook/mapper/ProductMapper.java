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
	public List<ProductVO> selectCityProd(Integer seq);
	
	public List<ProductVO> selectSubCategoryProd(Integer category);
	public List<ProductVO> selectMainCategoryProd(Integer category);
	public List<ProductVO> selectSubCateList(Integer category);

}
