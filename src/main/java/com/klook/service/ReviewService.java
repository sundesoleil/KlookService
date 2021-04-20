package com.klook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klook.mapper.ReviewMapper;
import com.klook.vo.ReviewVO;

@Service
public class ReviewService {
	@Autowired
	ReviewMapper mapper;
	
	public List<ReviewVO> selectReviews(Integer seq){
		return mapper.selectReviews(seq);
	}
	public List<ReviewVO> selectAllReivews(Integer seq){
		return mapper.selectAllReivews(seq);
	}
	public ReviewVO selectReviewBySeq(Integer seq) {
		return mapper.selectReviewBySeq(seq);
	}
	public void insertReview(ReviewVO vo) {
		mapper.insertReview(vo);
	}
}
