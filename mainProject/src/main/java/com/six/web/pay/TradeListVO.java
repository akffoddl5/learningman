package com.six.web.pay;

import java.util.Date;

public class TradeListVO {
	private int num;
	private String buyer;
	private int price;
	private String seller;
	private int lectureNum;
	private Date regDate;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
		
	public int getLectureNum() {
		return lectureNum;
	}
	public void setLectureNum(int lectureNum) {
		this.lectureNum = lectureNum;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "TradeListVO [num=" + num + ", buyer=" + buyer + ", price=" + price + ", seller=" + seller
				+ ", lectureNum=" + lectureNum + ", regDate=" + regDate + "]";
	}
	
}
