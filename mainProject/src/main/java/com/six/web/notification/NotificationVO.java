package com.six.web.notification;

import java.util.Date;

public class NotificationVO {
	private int num;
	private String id;
	private String content;
	private Date regDate;
	private String confirm;
	private String url;
	
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
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "NotificationVO [num=" + num + ", id=" + id + ", content=" + content + ", regDate=" + regDate
				+ ", confirm=" + confirm + ", url=" + url + "]";
	}
		
}
