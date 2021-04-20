package com.klook.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.klook.vo.SettlementVO;

@Mapper
public interface SettlementMapper {
	public void insertSettlementInfo(SettlementVO vo);
	public List<SettlementVO> selectSettlements(Integer seq);
	public SettlementVO selectSettlementBySeq(Integer seq);
}
