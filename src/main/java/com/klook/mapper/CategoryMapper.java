package com.klook.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.klook.vo.CategoryVO;

@Mapper
public interface CategoryMapper {
	public List<CategoryVO> selectCategories();
}
