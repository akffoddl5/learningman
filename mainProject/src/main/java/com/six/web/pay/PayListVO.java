package com.six.web.pay;

import java.util.Date;

public class PayListVO {
	private int num;
	private String id;
	private int price;
	private String type;
	private Date regDate;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "PayListVO [num=" + num + ", id=" + id + ", price=" + price + ", type=" + type + ", regDate=" + regDate
				+ "]";
	}
	
}
