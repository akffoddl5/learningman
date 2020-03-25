package com.six.web.admin;

import java.util.List;

import com.six.web.lesson.LectureVO;

public class CategoryChartVO {
	String categoryName;
	List<LectureVO> lectureList ;
	int haveLecture ;
	double lectureRate;
	int count;
	int sum ; 
	String start;
	String end ;
	
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public double getLectureRate() {
		return lectureRate;
	}
	public void setLectureRate(double lectureRate) {
		this.lectureRate = lectureRate;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public List<LectureVO> getLectureList() {
		return lectureList;
	}
	public void setLectureList(List<LectureVO> lectureList) {
		this.lectureList = lectureList;
	}
	public int getHaveLecture() {
		return haveLecture;
	}
	public void setHaveLecture(int haveLecture) {
		this.haveLecture = haveLecture;
	}
	
	

}
