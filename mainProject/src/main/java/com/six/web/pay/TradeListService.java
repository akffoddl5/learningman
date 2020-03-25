package com.six.web.pay;

import java.util.List;


public interface TradeListService {
	public void insertTradeList(TradeListVO tradeListVO);
	public List<TradeListVO> getMemberTradeList(TradeListVO tradeListVO);
	public TradeListVO lectureBuyConfirm(String id, int lectureNum);
	public void userBuyLecture(String id,int price);
	public void userSellLecture(String id,int price);
}
