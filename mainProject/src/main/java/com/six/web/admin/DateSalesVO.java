package com.six.web.admin;

public class DateSalesVO {

	private String date;
	private String paycount;
	private String totalpay;
	@Override
	public String toString() {
		return "DateSalesVO [date=" + date + ", paycount=" + paycount + ", totalpay=" + totalpay + "]";
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPaycount() {
		return paycount;
	}
	public void setPaycount(String paycount) {
		this.paycount = paycount;
	}
	public String getTotalpay() {
		return totalpay;
	}
	public void setTotalpay(String totalpay) {
		this.totalpay = totalpay;
	}
	
	
}
