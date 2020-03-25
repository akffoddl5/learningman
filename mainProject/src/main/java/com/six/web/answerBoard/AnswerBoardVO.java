package com.six.web.answerBoard;

import java.util.Date;

public class AnswerBoardVO {
	private int num;
	private String title;
	private String content;
	private String id;
	private Date regDate;
	private int ref;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	@Override
	public String toString() {
		return "AnswerBoardVO [num=" + num + ", title=" + title + ", content=" + content + ", id=" + id + ", regDate="
				+ regDate + ", ref=" + ref + "]";
	}
	
}
