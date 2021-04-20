package com.klook.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.klook.vo.CategoryVO;
import com.klook.vo.CityVO;

@Mapper
public interface CategoryMapper {
	public List<CategoryVO> selectCategories();
	public List<CategoryVO> selectSubCateBySeq(Integer seq);
	public List<CategoryVO> selectMainCateBySeq(Integer seq);
}
