package com.klook.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.klook.vo.CityVO;

@Mapper
public interface CityMapper {
	public List<CityVO> selectCityBySeq(Integer seq);
	public List<CityVO> selectCities();
}
