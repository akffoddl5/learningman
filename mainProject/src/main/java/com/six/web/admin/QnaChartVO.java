package com.six.web.admin;

public class QnaChartVO {
	private String type;
	private int quecount;
	private int answercount;
	
	@Override
	public String toString() {
		return "QnaChartVO [type=" + type + ", quecount=" + quecount + ", answercount=" + answercount + "]";
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getQuecount() {
		return quecount;
	}
	public void setQuecount(int quecount) {
		this.quecount = quecount;
	}
	public int getAnswercount() {
		return answercount;
	}
	public void setAnswercount(int answercount) {
		this.answercount = answercount;
	}
	
	
}
