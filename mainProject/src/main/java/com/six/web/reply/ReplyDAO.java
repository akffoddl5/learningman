package com.six.web.reply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	public List<LessonReplyVO> getLessonReplyList(int lessonNum){
		return sessionTemplate.selectList("ReplyDAO.getLessonReplyList",lessonNum);
	}
	
	public List<LectureReplyVO> getLectureReplyList(int lectureNum){
		return sessionTemplate.selectList("ReplyDAO.getLectureReplyList",lectureNum);
	}
	
	public void insertLessonReply(LessonReplyVO lessonReplyVO) {
		sessionTemplate.update("ReplyDAO.insertLessonReply",lessonReplyVO);
	}
	
	public void insertLessonReReply(LessonReplyVO lessonReplyVO) {
		sessionTemplate.update("ReplyDAO.insertLessonReReply",lessonReplyVO);
	}
	
	public void insertLectureReply(LectureReplyVO lectureReplyVO) {
		sessionTemplate.update("ReplyDAO.insertLectureReply",lectureReplyVO);
	}
	
	public void insertLectureReReply(LectureReplyVO lectureReplyVO) {
		sessionTemplate.update("ReplyDAO.insertLectureReReply",lectureReplyVO);
	}
}
