package com.six.web.admin;

public class CategorySalesVO {

	private String name;
;
	private String sales;
	@Override
	public String toString() {
		return "CategorySalesVO [name=" + name + ", sales=" + sales + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSales() {
		return sales;
	}
	public void setSales(String sales) {
		this.sales = sales;
	}
	
	
	
	
}
