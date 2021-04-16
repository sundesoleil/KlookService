package com.klook.vo;



import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartVO {
	private Integer kb_seq;
	private Integer kb_count;
	private Integer kb_price;
	private Date kb_booking_date;
	private Integer kb_member_seq;
	private Integer kb_prod_seq;
}
