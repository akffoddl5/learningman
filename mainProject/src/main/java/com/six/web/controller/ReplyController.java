package com.six.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.six.web.reply.LectureReplyVO;
import com.six.web.reply.LessonReplyVO;
import com.six.web.reply.ReplyService;
import com.six.web.user.UserVO;

@Controller
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value="insertLessonReply.do")
	public ModelAndView insertLessonReply(ModelAndView mav,HttpServletRequest request, LessonReplyVO lessonReplyVO) {
		try {
		System.out.println("insertLessonReply exe");
		String ref = request.getParameter("ref");
		System.out.println(ref);
		UserVO userVO = (UserVO)request.getSession().getAttribute("vo");
		if(userVO == null) {
			lessonReplyVO.setThumbnail("default.jpg");
		}else {
			lessonReplyVO.setThumbnail(userVO.getThumbnail());
		}
		replyService.insertLessonReply(lessonReplyVO);
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("/lnuser/index");
		return mav;
	}
	
	@RequestMapping(value="insertLessonReReply.do")
	public ModelAndView insertLessonReReply(ModelAndView mav,HttpServletRequest request, LessonReplyVO lessonReplyVO) {
		try {
		System.out.println("insertLessonReReply 대댓글 exe");
		System.out.println(lessonReplyVO.getRef());
		
		UserVO userVO = (UserVO)request.getSession().getAttribute("vo");
		if(userVO == null) {
			lessonReplyVO.setThumbnail("default.jpg");
		}else {
			lessonReplyVO.setThumbnail(userVO.getThumbnail());
		}
		
		
		replyService.insertLessonReReply(lessonReplyVO);
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("/lnuser/index");
		return mav;
	}
	
	@RequestMapping(value="insertLectureReply.do")
	public ModelAndView insertLectureReply(ModelAndView mav,HttpServletRequest request, LectureReplyVO lectureReplyVO) {
		try {
		System.out.println("insertLectureReply exe");
		
		UserVO userVO = (UserVO)request.getSession().getAttribute("vo");
		if(userVO == null) {
			lectureReplyVO.setThumbnail("default.jpg");
		}else {
			lectureReplyVO.setThumbnail(userVO.getThumbnail());
		}
		
		
		replyService.insertLectureReply(lectureReplyVO);
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("/lnuser/index");
		return mav;
	}
	
	@RequestMapping(value="insertLectureReReply.do")
	public ModelAndView insertLectureReReply(ModelAndView mav,HttpServletRequest request, LectureReplyVO lectureReplyVO) {
		try {
		System.out.println("insertLectureReReply 대댓글 exe");
		System.out.println(lectureReplyVO.getRef());
		
		UserVO userVO = (UserVO)request.getSession().getAttribute("vo");
		if(userVO == null) {
			lectureReplyVO.setThumbnail("default.jpg");
		}else {
			lectureReplyVO.setThumbnail(userVO.getThumbnail());
		}
		
		
		replyService.insertLectureReReply(lectureReplyVO);
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("/lnuser/index");
		return mav;
	}
}
