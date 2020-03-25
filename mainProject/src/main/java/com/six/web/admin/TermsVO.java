package com.six.web.admin;

public class TermsVO {

	private int termsnum;
	private String termsname;
	private String termscontent;
	
	@Override
	public String toString() {
		return "TermsVO [termsnum=" + termsnum + ", termsname=" + termsname + ", termscontent=" + termscontent + "]";
	}
	public int getTermsnum() {
		return termsnum;
	}
	public void setTermsnum(int termsnum) {
		this.termsnum = termsnum;
	}
	public String getTermsname() {
		return termsname;
	}
	public void setTermsname(String termsname) {
		this.termsname = termsname;
	}
	public String getTermscontent() {
		return termscontent;
	}
	public void setTermscontent(String termscontent) {
		this.termscontent = termscontent;
	}
	
	
	
}
