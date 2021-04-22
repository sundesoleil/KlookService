package com.klook.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.klook.service.CartService;
import com.klook.service.CategoryService;
import com.klook.service.CityService;
import com.klook.service.ProductService;
import com.klook.service.ReviewService;
import com.klook.service.SettlementService;
import com.klook.vo.CartVO;
import com.klook.vo.CategoryVO;
import com.klook.vo.CityVO;
import com.klook.vo.ProductVO;
import com.klook.vo.ReviewVO;
import com.klook.vo.SettlementVO;

@Controller
public class ShopController {
	@Autowired
	ProductService prodService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	CartService cartService;
	@Autowired
	CityService cityService;
	@Autowired
	CategoryService cateService;
	@Autowired
	SettlementService settlementService;

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

		Map<Integer, String> ratingOptions = new HashMap<Integer, String>();
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
	public String getShopCart(@RequestParam Integer member_seq, HttpSession session) {

		List<CartVO> cartList = cartService.selectCarts(member_seq);
		session.setAttribute("cartList", cartList);
		
		return "/shop/cart";
	}

	@GetMapping("/shop/settlement") 
	public String getSettlement() {	
		 return "/shop/settlement";
	 }

	@GetMapping("/shop/subcategory")
	public String getSubCategoryProd(@RequestParam Integer seq, Model model, HttpSession session) {

		List<CategoryVO> subCategory = cateService.selectSubCateBySeq(seq);
		session.setAttribute("subCategory", subCategory);

		List<ProductVO> subList = prodService.selectSubCategoryProd(seq);
		session.setAttribute("subList", subList);

		return "/shop/subcategory";
	}

	@GetMapping("/shop/maincategory")
	public String getMainCategoryProd(@RequestParam Integer seq, Model model, HttpSession session) {

		List<CategoryVO> mainCategory = cateService.selectMainCateBySeq(seq);
		session.setAttribute("mainCategory", mainCategory);

		List<ProductVO> mainList = prodService.selectMainCategoryProd(seq);
		session.setAttribute("mainList", mainList);

		List<ProductVO> subCateList = prodService.selectSubCateList(seq);
		session.setAttribute("subCateList", subCateList);

		return "/shop/maincategory";
	}

	@GetMapping("/shop/city")
	public String getCityProd(@RequestParam @Nullable Integer seq, @Nullable String keyword, HttpSession session) {
		
		
		List<CityVO> city = cityService.selectCityBySeq(seq, keyword);
		session.setAttribute("city", city);

		List<ProductVO> cityProdList = prodService.selectCityProd(seq, keyword);
		session.setAttribute("cityProdList", cityProdList);

		return "/shop/city";
	}
}


