package com.klook.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.klook.vo.ReviewVO;

@Mapper
public interface ReviewMapper {
	public List<ReviewVO> selectReviews(Integer seq);
	public List<ReviewVO> selectAllReivews(Integer seq);
}
