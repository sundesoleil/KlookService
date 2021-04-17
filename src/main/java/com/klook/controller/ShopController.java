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

import com.klook.service.CartService;
import com.klook.service.ProductService;
import com.klook.service.ReviewService;
import com.klook.vo.CartVO;
import com.klook.vo.CategoryVO;
import com.klook.vo.ProductVO;
import com.klook.vo.ReviewVO;

@Controller
public class ShopController {
	@Autowired
	ProductService prodService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	CartService cartService;

	
	@GetMapping("/shop/detail")
	public String getShopDetail(@RequestParam Integer prod_seq, Model model, HttpSession session) {
		
		ProductVO product = prodService.selectProductBySeq(prod_seq); 
		model.addAttribute("product", product);
		
		ReviewVO review = reviewService.selectReviewBySeq(prod_seq);
		model.addAttribute("review", review);
	
		
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
	
	@GetMapping("/shop/cart")
	public String getShopCart(@RequestParam Integer member_seq, Model model, HttpSession session) {
		
		
		/*
		 * CartVO cart = cartService.selectCartBySeq(member_seq);
		 * model.addAttribute("cart", cart);
		 */
	
		List<CartVO> cartList = cartService.selectCarts(member_seq);
		session.setAttribute("cartList", cartList);
		
		return "/shop/cart";
	}
	@GetMapping("/shop/settlement")
	public String getSettlement() {
		return "/shop/settlement";
	}
	@GetMapping("/shop/subcategory")
	public String getSubCategoryProd(@RequestParam Integer category, Model model, HttpSession session) {
		
		List<ProductVO> subList = prodService.selectSubCategoryProd(category);
		session.setAttribute("subList", subList);
		
		return "/shop/subcategory";
	}
	@GetMapping("/shop/maincategory")
	public String getMainCategoryProd(@RequestParam Integer category, Model model, HttpSession session) {
		
		List<ProductVO> mainList = prodService.selectMainCategoryProd(category);
		session.setAttribute("mainList", mainList);
		
		List<ProductVO> subCateList = prodService.selectSubCateList(category);
		session.setAttribute("subCateList", subCateList);
		
		return "/shop/maincategory";
	}
	@GetMapping("/shop/city")
	public String getCityProd(@RequestParam Integer seq, Model model, HttpSession session) {
		
		List<ProductVO> cityProdList = prodService.selectCityProd(seq);
		session.setAttribute("cityProdList", cityProdList);
		
		return "/shop/city";
	}
}
