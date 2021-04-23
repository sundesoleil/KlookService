package com.klook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klook.mapper.SettlementMapper;
import com.klook.vo.SettlementVO;

@Service
public class SettlementService {
	@Autowired
	SettlementMapper mapper;
	
	public void insertSettlementInfo(SettlementVO vo) {
		mapper.insertSettlementInfo(vo);
	}
	public SettlementVO selectSettlementBySeq(Integer member_seq, Integer prod_seq) {
		return mapper.selectSettlementBySeq(member_seq, prod_seq);
	}
	public List<SettlementVO> selectSettlements(Integer seq){
		return mapper.selectSettlements(seq);
	}
	public void deleteSettlement(Integer seq) {
		mapper.deleteSettlement(seq);
	}
}
