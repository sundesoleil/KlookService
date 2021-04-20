package com.klook.service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klook.mapper.ProductMapper;
import com.klook.vo.CartVO;
import com.klook.vo.MemberVO;
import com.klook.vo.ProductVO;
import com.klook.vo.ReviewVO;

@Service
public class ProductService {
	@Autowired
	ProductMapper mapper;
	
	public List<ProductVO> selectProduct(){
		List<Integer> seqList = mapper.selectProductSeqList(4);
		List<ProductVO> productList = new ArrayList<ProductVO>();
		
		for(int i=0; i<seqList.size(); i++) {
			Integer seq = seqList.get(i);
			ProductVO product = mapper.selectProduct(seq);
			DecimalFormat format = new DecimalFormat("###,###");
			
			if(product.getKp_discount() == 1) {
				Integer price = Math.round(
						product.getKp_price() - 
						product.getKp_price() * 
						product.getKp_discount_rate() / 100
						);
						product.setDiscounted(format.format(price));
			}

			product.setOriginPrice(format.format(product.getKp_price()));
			productList.add(product);
		}
		
		return productList;
	}
	public ProductVO selectProductBySeq(Integer seq) {
		ProductVO product = mapper.selectProductBySeq(seq);
		DecimalFormat formatter = new DecimalFormat("###,###");
		
		if(product.getKp_discount() != null) {
			if(product.getKp_discount() == 1) {
				Integer price = product.getKp_price();
				price = price - (int)Math.floor(price * product.getKp_discount_rate() / 100.0);
				
				product.setFinalPrice(formatter.format(price));
				product.setFinalPriceInt(price);
			}
			else {
				product.setFinalPrice(formatter.format(product.getKp_price()));
				product.setFinalPriceInt(product.getKp_price());
			}
		}
		
		product.setOriginPrice(formatter.format(product.getKp_price()));
	
		Integer point = null;
		
		if(product.getKp_point_rate() != null) {
			point = (int)(product.getKp_price() * product.getKp_point_rate() / 100.0);
		}else {
			point = 0;
		}

		product.setPoint(formatter.format(point));
		product.setPointInt(point);

		return product;
	}
	public List<ProductVO> selectSubCategoryProd(Integer category){
		return mapper.selectSubCategoryProd(category);
	}
	public List<ProductVO> selectMainCategoryProd(Integer category){
		return mapper.selectMainCategoryProd(category);
	}
	public List<ProductVO> selectSubCateList(Integer category){
		return mapper.selectSubCateList(category);
	}
	public List<ProductVO> selectCityProd(Integer seq){
		return mapper.selectCityProd(seq);
	}


}
