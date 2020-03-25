package com.six.web.lesson;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.six.web.reply.LessonReplyVO;
import com.six.web.user.UserVO;

/**
 * create table pickList (

 num number(8) primary key,
 id varchar2(90) references member(id),
 lectureNum number(8) references lecture(num)
);

create table lecture(
num number(8) primary key,
name varchar2(100) not null,
category varchar2(100) references category(name),
id varchar2(90) references member(id),
likeCnt number(8) default 0,
thumnailPath varchar2(100),
price number(8) default 0,
content1 varchar2(100),
content2 varchar2(100),
content3 varchar2(100),
content4 varchar2(100)

);

commit;

create table category(
name varchar2(100) primary key,
constructor varchar2(90) references member(id),
regdate date default sysdate
);

create table member(
id varchar2(90) primary key,
position varchar2(80) default 'user',
regdate date default sysdate
);

create sequence lecture_sec;
create sequence pickList_sec;
select* from pickList;
select* from lecture;
select* from category;
select* from member;
insert into member ( id , position )  values ( 'cat' , 'teacher' ) ;
insert into category(name,constructor) values('컴퓨터','cat');
insert into lecture values(lecture_sec.nextVal , '알고리즘 강의' , '컴퓨터','cat','0','','','','','','');
insert into lecture values(lecture_sec.nextVal , '자바 강의' , '컴퓨터','cat','0','','','','','','');
insert into lecture values(lecture_sec.nextVal , 'C++ 강의' , '컴퓨터','cat','0','','','','','','');
delete from lecture where num = 2 ; 
insert into pickList values (pickList_sec.nextVal , 'cat' , 1 ); 
insert into pickList values (pickList_sec.nextVal , 'cat' , 3 ); 
insert into pickList values (pickList_sec.nextVal , 'cat' , 4 ); 

desc askBoard;
desc lnuser;
select* from tab;
select* from lnuser;
select* from askboard;

commit ; 
 * 
 * @author KGITBank
 *
 */

@Repository
public class LessonDAO {

	@Autowired
	SqlSessionTemplate sessionTemplate ; 
	
	public List<LectureVO> getMyPickList(UserVO userVO){
		return sessionTemplate.selectList("LessonDAO.getMyPickList",userVO);
	}
	
	public List<LectureVO> getMyLikeList(UserVO userVO){
		return sessionTemplate.selectList("LessonDAO.getMyLikeList",userVO);
	}
	
	public List<LectureVO> getMyLectureList(UserVO userVO){
		return sessionTemplate.selectList("LessonDAO.getMyLectureList",userVO);
	}
	public List<LectureVO> getCategoryLectureList(List<CategoryVO> categoryList){
		Map<String,Object> mp = new HashMap<>();
		mp.put("categoryList", categoryList);
		mp.put("size", categoryList.size());
		return sessionTemplate.selectList("LessonDAO.getCategoryLectureList",mp);
	}
	public List<CategoryVO> getCategoryList(){
		return sessionTemplate.selectList("LessonDAO.getCategoryList");
	}
	public void insertLesson(LessonVO lessonVO) {
		sessionTemplate.update("LessonDAO.insertLesson",lessonVO);
	}
	public void insertLecture(LectureVO lectureVO) {
		sessionTemplate.update("LessonDAO.insertLecture",lectureVO);
	}
	public void deletePick(String id , int num) {
		Map<String,Object> mp = new HashMap<>();
		mp.put("id", id);
		mp.put("num", num);
		sessionTemplate.update("LessonDAO.deletePick",mp);
	}
	public void insertPick(String id , int num) {
		Map<String,Object> mp = new HashMap<>();
		mp.put("id", id);
		mp.put("num", num);
		sessionTemplate.update("LessonDAO.insertPick",mp);
	}
	public void insertLike(String id , int num) {
		Map<String,Object> mp = new HashMap<>();
		mp.put("id", id);
		mp.put("num", num);
		sessionTemplate.update("LessonDAO.insertLike",mp);
	}
	public void deleteLike(String id , int num) {
		Map<String,Object> mp = new HashMap<>();
		mp.put("id", id);
		mp.put("num", num);
		sessionTemplate.update("LessonDAO.deleteLike",mp);
	}
	
	public LectureVO getLecture(int lectureNum) {
		return sessionTemplate.selectOne("LessonDAO.getLecture",lectureNum);
	}
	public LessonVO getLesson(int lessonNum) {
		return sessionTemplate.selectOne("LessonDAO.getLesson",lessonNum);
	}
	public List<LessonVO> getLessonList(LectureVO lectureVO){
		return sessionTemplate.selectList("LessonDAO.getLessonList",lectureVO);
	}
	public void lectureUpCount(LectureVO lectureVO) {
		sessionTemplate.update("LessonDAO.lectureUpcount",lectureVO);
	}
	// about chat
	public List<LectureVO> searchKey(String keyword){
		Map<String,String> mp = new HashMap<>();
		mp.put("keyword",keyword);
		return sessionTemplate.selectList("LessonDAO.searchKey",mp);
	}
	
	public List<SearchListVO> getSearchRank(){
		return sessionTemplate.selectList("LessonDAO.getSearchRank");
	}
	
	public List<SearchListVO> getSearchHistory(UserVO userVO){
		return sessionTemplate.selectList("LessonDAO.getSearchHistory",userVO);
	}
	
	public void insertSearchHistory(SearchListVO searchListVO) {
		sessionTemplate.update("LessonDAO.insertSearchHistory",searchListVO);
	}
	
	public void insertSearchRank(String keyword) {
		Map<String,String> mp = new HashMap<>();
		mp.put("keyword", keyword);
		sessionTemplate.update("LessonDAO.insertSearchRank",keyword);
	}
	
	public void searchUpCount(String keyword) {
		Map<String,String> mp = new HashMap<>();
		mp.put("keyword", keyword);
		sessionTemplate.update("LessonDAO.searchUpCount",keyword);
	}
	
	public SearchListVO getSearchRankOne(String keyword) {
		Map<String,String> mp = new HashMap<>();
		mp.put("keyword", keyword);
		return sessionTemplate.selectOne("LessonDAO.getSearchRankOne",keyword);
	}
	
	public void deleteHistory(UserVO userVO) {
		sessionTemplate.update("LessonDAO.deleteHistory",userVO);
	}
	
	//
	public void updateLikeCnt() {
		sessionTemplate.update("LessonDAO.updateLikeCnt");
	}
	
	public void updatePickCnt() {
		sessionTemplate.update("LessonDAO.updatePickCnt");
	}
	
	public void insertMyLectureList(String id, int lectureNum) {
		Map<String,Object> mp = new HashMap<>();
		mp.put("id", id);
		mp.put("lectureNum", lectureNum);
		sessionTemplate.update("LessonDAO.insertMyLectureList",mp);
	}
	
	public List<MyLectureListVO> getMyHistoryLectureList(UserVO userVO) {
		return sessionTemplate.selectList("LessonDAO.getMyHistoryLectureList",userVO);
	}
	
	public List<LectureVO> getSimilarLectureList(CategoryVO categoryVO){
		return sessionTemplate.selectList("LessonDAO.getSimilarLectureList", categoryVO);
	}
	
	
	
	
	
}
