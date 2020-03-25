package com.six.web.pay;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class TradeListDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public void insertTradeList(TradeListVO tradeListVO) {
		System.out.println("insertTradeList : " + tradeListVO.toString());
		sessionTemplate.update("PayListDAO.insertTradeList", tradeListVO);
		
	}

	public List<TradeListVO> getMemberTradeList(TradeListVO tradeListVO) {
		Map<String,Object> memberTradeList= new HashMap<>();
		memberTradeList.put("tradeListVO", tradeListVO);
		return sessionTemplate.selectList("PayListDAO.getMemberTradeList", tradeListVO);
	}
	
	public TradeListVO lectureBuyConfirm(String id, int lectureNum) {
		Map<String,Object> mp = new HashMap<>();
		mp.put("id2", id);
		mp.put("lectureNum", lectureNum);
		return sessionTemplate.selectOne("PayListDAO.lectureBuyConfirm", mp);
	}
	
	public void userBuyLecture(String id,int price) {
		Map<String,Object> mp = new HashMap<>();
		mp.put("id", id);
		mp.put("price", price);
		sessionTemplate.update("PayListDAO.userBuyLecture",mp);
	}
	
	public void userSellLecture(String id,int price) {
		Map<String,Object> mp = new HashMap<>();
		mp.put("id", id);
		mp.put("price", price);
		sessionTemplate.update("PayListDAO.userSellLecture",mp);
	}
}
