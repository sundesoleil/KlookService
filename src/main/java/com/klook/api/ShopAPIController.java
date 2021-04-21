package com.klook.api;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.klook.service.CartService;
import com.klook.service.ProductService;
import com.klook.service.ReviewService;
import com.klook.service.SettlementService;
import com.klook.vo.CartVO;
import com.klook.vo.ReviewVO;
import com.klook.vo.SettlementVO;

@RestController
public class ShopAPIController {
	@Autowired
	ProductService service;
	@Autowired
	CartService cartService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	SettlementService settlementService;
	
	@PostMapping("/shop/cart")
	public Map<String, String> postShopCart(@RequestBody CartVO vo){
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		cartService.insertCartInfo(vo);
		
		resultMap.put("status", "success");
		resultMap.put("message", "선택하신 상품이 장바구니에 담겼습니다.");
		
		return resultMap;
	}
	@DeleteMapping("/shop/cart/{seq}")
	public Map<String, String> deleteCart(@PathVariable Integer seq){
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		resultMap.put("status", "success");
		resultMap.put("message", "삭제되었습니다.");
		
		cartService.deleteCart(seq);
		
		return resultMap;
	}
	@DeleteMapping("/shop/all_cart/{seq}")
	public Map<String, String> deleteAllCart(@PathVariable Integer seq){
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		resultMap.put("status", "success");
		resultMap.put("message", "삭제되었습니다.");
		
		cartService.deleteAllCart(seq); 
		
		return resultMap;
	}
	@PostMapping("/api/insert_review")
	public Map<String, String> postInsertReview(@RequestBody ReviewVO vo){
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		resultMap.put("status", "success");
		resultMap.put("message", "댓글이 등록되었습니다");
		
		reviewService.insertReview(vo);
		return resultMap;
	}

//	 @PostMapping("/shop/settlement") public Map<String, String>
//	 postShopSettlement(@RequestBody SettlementVO vo){ 
//	
//	 Map<String, String> resultMap = new LinkedHashMap<String, String>();
//	 
//	 settlementService.insertSettlementInfo(vo);
//	 resultMap.put("status", "success");
//	 
//	 return resultMap; 
//	 }

}
