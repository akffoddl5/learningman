package com.six.web.lesson;

import java.util.Date;

public class LectureVO {
	private int rNum;
	int num ;
	String name; 
	String category ;
	String id ;
	int likeCnt; 
	int pickCnt;
	String thumnailPath; 
	int price ;
	String content1;
	String content2 ;
	String content3 ;
	String content4 ;
	int cnt;
	Date regDate ;
	
	public int getPickCnt() {
		return pickCnt;
	}
	public void setPickCnt(int pickCnt) {
		this.pickCnt = pickCnt;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public String getThumnailPath() {
		return thumnailPath;
	}
	public void setThumnailPath(String thumnailPath) {
		this.thumnailPath = thumnailPath;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getContent1() {
		return content1;
	}
	public void setContent1(String content1) {
		this.content1 = content1;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public String getContent3() {
		return content3;
	}
	public void setContent3(String content3) {
		this.content3 = content3;
	}
	public String getContent4() {
		return content4;
	}
	public void setContent4(String content4) {
		this.content4 = content4;
	}
	@Override
	public String toString() {
		return "LectureVO [num=" + num + ", name=" + name + ", category=" + category + ", id=" + id + ", likeCnt="
				+ likeCnt + ", thumnailPath=" + thumnailPath + ", price=" + price + ", content1=" + content1
				+ ", content2=" + content2 + ", content3=" + content3 + ", content4=" + content4 + "]";
	}
	
	
}
