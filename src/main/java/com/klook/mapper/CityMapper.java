package com.klook.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.klook.vo.CityVO;

@Mapper
public interface CityMapper {
	public Integer selectCityByName(String name);
	public List<CityVO> selectCities();
}
