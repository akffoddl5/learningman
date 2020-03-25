package com.six.web.admin;

public class SumSalesVO {
	private String date;
	private int sumSales;
	private int sumMembers;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "SumSalesVO [date=" + date + ", sumSales=" + sumSales + ", sumMembers=" + sumMembers + "]";
	}
	public int getSumSales() {
		return sumSales;
	}
	public void setSumSales(int sumSales) {
		this.sumSales = sumSales;
	}
	public int getSumMembers() {
		return sumMembers;
	}
	public void setSumMembers(int sumMembers) {
		this.sumMembers = sumMembers;
	}
	
	
}
