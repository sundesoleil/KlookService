package com.klook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klook.mapper.CityMapper;
import com.klook.vo.CityVO;
import com.klook.vo.ProductVO;

@Service
public class CityService {
	@Autowired
	CityMapper mapper;
	
	public List<CityVO> selectCityBySeq(Integer seq, String keyword) {
		return mapper.selectCityBySeq(seq, keyword);
	}

	public List<CityVO> selectCities(){
		return mapper.selectCities();
	}
}
