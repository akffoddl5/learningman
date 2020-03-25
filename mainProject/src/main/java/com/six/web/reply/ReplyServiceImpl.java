package com.six.web.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO replyDAO;
	
	@Override
	public List<LessonReplyVO> getLessonReplyList(int lessonNum) {
		return replyDAO.getLessonReplyList(lessonNum);
	}
	
	@Override
	public List<LectureReplyVO> getLectureReplyList(int lectureNum) {
		return replyDAO.getLectureReplyList(lectureNum);
	}
	
	@Override
	public void insertLessonReply(LessonReplyVO lessonReplyVO) {
		replyDAO.insertLessonReply(lessonReplyVO);
	}

	@Override
	public void insertLessonReReply(LessonReplyVO lessonReplyVO) {
		replyDAO.insertLessonReReply(lessonReplyVO);
	}

	@Override
	public void insertLectureReply(LectureReplyVO lectureReplyVO) {
		replyDAO.insertLectureReply(lectureReplyVO);
		
	}

	@Override
	public void insertLectureReReply(LectureReplyVO lectureReplyVO) {
		replyDAO.insertLectureReReply(lectureReplyVO);
		
	}

}
