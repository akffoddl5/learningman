package com.six.web.admin;

public class ImgVO {

	private int num;
	private String imgmain;
	private String imgnew;
	private String imgteacher;
	
	@Override
	public String toString() {
		return "ImgVO [num=" + num + ", imgmain=" + imgmain + ", imgnew=" + imgnew + ", imgteacher=" + imgteacher + "]";
	}
	public String getImgmain() {
		return imgmain;
	}
	public void setImgmain(String imgmain) {
		this.imgmain = imgmain;
	}
	public String getImgnew() {
		return imgnew;
	}
	public void setImgnew(String imgnew) {
		this.imgnew = imgnew;
	}
	public String getImgteacher() {
		return imgteacher;
	}
	public void setImgteacher(String imgteacher) {
		this.imgteacher = imgteacher;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
	
}
