package com.six.web.reply;

import java.util.List;

public interface ReplyService {
	public List<LessonReplyVO> getLessonReplyList(int lessonNum);
	public List<LectureReplyVO> getLectureReplyList(int lectureNum);
	public void insertLessonReply(LessonReplyVO lessonReplyVO);
	public void insertLessonReReply(LessonReplyVO lessonReplyVO);
	public void insertLectureReply(LectureReplyVO lectureReplyVO);
	public void insertLectureReReply(LectureReplyVO lectureReplyVO);
}
