package com.six.web.pay;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class TradeListServiceImpl implements TradeListService{
	
	@Autowired
	private TradeListDAO tradeListDAO;
	
	@Override
	public void insertTradeList(TradeListVO tradeListVO) {
		tradeListDAO.insertTradeList(tradeListVO);
	}

	@Override
	public List<TradeListVO> getMemberTradeList(TradeListVO tradeListVO) {
		return tradeListDAO.getMemberTradeList(tradeListVO);
	}
	
	@Override
	public TradeListVO lectureBuyConfirm(String id, int lectureNum) {
		return tradeListDAO.lectureBuyConfirm(id, lectureNum);
	}
	@Override
	public void userBuyLecture(String id, int price) {
		tradeListDAO.userBuyLecture(id, price);
	}
	@Override
	public void userSellLecture(String id, int price) {
		tradeListDAO.userSellLecture(id, price);
	}
}
