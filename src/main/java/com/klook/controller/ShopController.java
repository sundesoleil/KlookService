package com.klook.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.klook.service.ProductService;
import com.klook.service.ReviewService;
import com.klook.vo.ProductVO;
import com.klook.vo.ReviewVO;

@Controller
public class ShopController {
	@Autowired
	ProductService prodService;
	@Autowired
	ReviewService reviewService;
	
	@GetMapping("/shop/detail")
	public String getShopDetail(@RequestParam Integer prod_seq, Model model, HttpSession session) {
		
		ProductVO product = prodService.selectProductBySeq(prod_seq); 
		model.addAttribute("product", product);
		
		List<ReviewVO> reviewList = reviewService.selectReviews(prod_seq);
		session.setAttribute("reviewList", reviewList);
		
		List<ReviewVO> allReviewList = reviewService.selectAllReivews(prod_seq);
		session.setAttribute("allReviewList", allReviewList);
		
		Map ratingOptions = new HashMap();
		ratingOptions.put(0, "☆☆☆☆☆");
		ratingOptions.put(1, "★☆☆☆☆");
		ratingOptions.put(2, "★★☆☆☆");
		ratingOptions.put(3, "★★★☆☆");
		ratingOptions.put(4, "★★★★☆");
		ratingOptions.put(5, "★★★★★");
		model.addAttribute("ratingOptions", ratingOptions);
		
		return "/shop/detail";
	}
}
