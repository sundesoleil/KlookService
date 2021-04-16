package com.klook.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductVO {
	private Integer kp_seq;
	private String kp_name;
	private Integer kp_price;
	private String kp_description;
	private Integer kp_discount;
	private Integer kp_discount_rate;
	private Integer kp_point;
	private Integer kp_point_rate;
	private Date kp_reg_date;
	private Integer kp_city_seq;
	private Integer kp_mc_seq;
	private Integer kp_sc_seq;
	private Integer kp_pimg_seq;
	private Integer kp_rate;
	
	private String main_cate_name;
	private String sub_cate_name;
	private String city_name;
	private String kc_name;
	private String kpi_uri;
	private Double rate;
	
	private String discounted;
	private String originPrice;
	private String finalPrice;
	private String point;
	
	private Integer finalPriceInt;
	private Integer pointInt;

}
