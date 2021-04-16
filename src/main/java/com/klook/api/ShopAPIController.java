package com.klook.api;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.klook.service.CartService;
import com.klook.service.ProductService;
import com.klook.vo.CartVO;

@RestController
public class ShopAPIController {
	@Autowired
	ProductService service;
	@Autowired
	CartService cartService;
	
	@PostMapping("/shop/cart")
	public Map<String, String> postShopCart(@RequestBody CartVO vo){
		Map<String, String> resultMap = new LinkedHashMap<String, String>();
		
		cartService.insertCartInfo(vo);
		
		resultMap.put("status", "success");
		resultMap.put("message", "선택하신 상품이 장바구니에 담겼습니다.");
		
		return resultMap;
	}
	
}
