package com.klook.vo;



import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewVO {
	private Integer kr_seq;
	private String kr_title;
	private String kr_content;
	private Double kr_rate;
	private Date kr_reg_date;
	private String member_name;
}
