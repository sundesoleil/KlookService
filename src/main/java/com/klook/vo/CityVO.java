package com.klook.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CityVO {
	private Integer kc_seq;
	private String kc_name;
	private Date kc_reg_date;
}
