package com.six.web.admin;

import java.util.Date;

public class AdminVO {

	private String id;
	private String password;
	private String email;
	private String phone;
	private Date regDate;
	
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "AdminVO [id=" + id + ", password=" + password + ", email=" + email + ", phone=" + phone + ", regDate="
				+ regDate + "]";
	}
	
	
	
	
}
