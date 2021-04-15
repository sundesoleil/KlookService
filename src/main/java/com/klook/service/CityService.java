package com.klook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klook.mapper.CityMapper;
import com.klook.vo.CityVO;

@Service
public class CityService {
	@Autowired
	CityMapper mapper;
	
	public List<CityVO> selectCities(){
		return mapper.selectCities();
	}
}