package com.six.web.askBoard;

import java.util.Date;

public class AskBoardVO {
	private int rNum;
	private int num;
	private String type;
	private String title;
	private String writer;
	private String content;
	private Date regDate;
	private int cnt;
	private String secret="N";
	//answer
	private int answerNum;
	private String answerTitle;
	private String answerContent;
	private String answerId;
	private String answerRegdate;
	private String answerRef;
	
	
	
	
	public int getAnswerNum() {
		return answerNum;
	}
	public void setAnswerNum(int answerNum) {
		this.answerNum = answerNum;
	}
	public String getAnswerTitle() {
		return answerTitle;
	}
	public void setAnswerTitle(String answerTitle) {
		this.answerTitle = answerTitle;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	public String getAnswerId() {
		return answerId;
	}
	public void setAnswerId(String answerId) {
		this.answerId = answerId;
	}
	public String getAnswerRegdate() {
		return answerRegdate;
	}
	public void setAnswerRegdate(String answerRegdate) {
		this.answerRegdate = answerRegdate;
	}
	public String getAnswerRef() {
		return answerRef;
	}
	public void setAnswerRef(String answerRef) {
		this.answerRef = answerRef;
	}
	public int getrNum() {
		return rNum;
	}
	@Override
	public String toString() {
		return "AskBoardVO [rNum=" + rNum + ", num=" + num + ", type=" + type + ", title=" + title + ", writer="
				+ writer + ", content=" + content + ", regDate=" + regDate + ", cnt=" + cnt + ", secret=" + secret
				+ "]";
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
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	
	
	
	
	
	

}
