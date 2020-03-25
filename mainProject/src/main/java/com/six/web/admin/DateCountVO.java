package com.six.web.admin;

import java.util.Date;

public class DateCountVO {

	private String date;
	private String normalCount;
	private String kakaoCount;
	private String naverCount;
	@Override
	public String toString() {
		return "DateCountVO [date=" + date + ", normalCount=" + normalCount + ", kakaoCount=" + kakaoCount
				+ ", naverCount=" + naverCount + "]";
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getNormalCount() {
		return normalCount;
	}
	public void setNormalCount(String normalCount) {
		this.normalCount = normalCount;
	}
	public String getKakaoCount() {
		return kakaoCount;
	}
	public void setKakaoCount(String kakaoCount) {
		this.kakaoCount = kakaoCount;
	}
	public String getNaverCount() {
		return naverCount;
	}
	public void setNaverCount(String naverCount) {
		this.naverCount = naverCount;
	}

	
	
	
	
	
}
