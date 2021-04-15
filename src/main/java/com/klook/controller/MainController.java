package com.klook.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.klook.service.CategoryService;
import com.klook.service.CityService;
import com.klook.service.ProductService;
import com.klook.vo.CategoryVO;
import com.klook.vo.CityVO;
import com.klook.vo.ProductVO;

@Controller
public class MainController {

	@Autowired
	CategoryService categoryService;
	@Autowired
	ProductService productService;
	@Autowired
	CityService cityService;
	
	@GetMapping("/")
	public String getMain(Model model, HttpSession session) {
		
		List<CategoryVO> categoryList = categoryService.selectCategories();
		session.setAttribute("categoryList", categoryList);
		
		List<ProductVO> productList = productService.selectProduct();
		session.setAttribute("productList", productList);
		
		List<CityVO> cityList = cityService.selectCities();
		session.setAttribute("cityList", cityList);
		
		return "/main";
	}
}
