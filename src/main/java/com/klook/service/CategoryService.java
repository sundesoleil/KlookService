package com.klook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klook.mapper.CategoryMapper;
import com.klook.vo.CategoryVO;
import com.klook.vo.CityVO;

@Service
public class CategoryService {
	@Autowired
	CategoryMapper mapper;
	
	public List<CategoryVO> selectCategories(){
		return mapper.selectCategories();
	}
	public List<CategoryVO> selectSubCateBySeq(Integer seq) {
		return mapper.selectSubCateBySeq(seq);
	}
	public List<CategoryVO> selectMainCateBySeq(Integer seq) {
		return mapper.selectMainCateBySeq(seq);
	}
}
