package com.six.web.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.six.web.askBoard.AskBoardService;
import com.six.web.askBoard.AskBoardVO;
import com.six.web.faqBoard.FaqBoardService;
import com.six.web.faqBoard.FaqBoardVO;
import com.six.web.lesson.CategoryVO;
import com.six.web.lesson.LessonService;
import com.six.web.noticeBoard.NoticeBoardService;
import com.six.web.noticeBoard.NoticeBoardVO;
import com.six.web.notification.NotificationService;
import com.six.web.notification.NotificationVO;
import com.six.web.user.UserVO;


@Controller
public class BoardController {
	
	@Autowired
	private AskBoardService askBoardService;
	@Autowired
	private FaqBoardService faqBoardService;
	@Autowired
	private NoticeBoardService noticeBoardService;
	@Autowired
	private LessonService lessonService;
	@Autowired
	private NotificationService notificationService;
	
	@RequestMapping(value="/insertAskBoard.do")
	public String insertAskBoard(AskBoardVO vo) {
		System.out.println("질문 등록중");
		askBoardService.insertBoard(vo);
		System.out.println("질문 등록완료");
		return "redirect:/serviceCenter.do";
	}
	
	@RequestMapping(value="/getAskBoardList.do")
	public ModelAndView getAskBoardList(ModelAndView mav, HttpServletRequest request) {
		System.out.println("ask ajax exe");
		AskBoardVO vo = new AskBoardVO();
		String currentPage = request.getParameter("currentPage");
		
		
		if(currentPage==null) currentPage = "1";
		
		int total = askBoardService.getBoardSize();
		System.out.println("total 값 :" + total);
		int pageSize = 10;
		int blockSize = 3;
		int currentPage1 = Integer.parseInt(currentPage);
		int begin = (currentPage1-1)*pageSize +1 ;
		int end = (currentPage1-1)*pageSize +pageSize ;
		System.out.println("begin 값 : " + begin + "end 값 " + end);
		List<AskBoardVO> askBoardList=null;
		try {
		askBoardList = askBoardService.getBoardList(vo,begin,end);
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("getBoardList size 값 : " + askBoardList.size());
		int pageNum = (total-1)/pageSize +pageSize ;
		int blockTotal = (total-1)/pageSize +1 ;
		int blockNum = (blockTotal-1)/blockSize +1;
		int currentBlock = (currentPage1-1)/blockSize +1;
		int startBlock = (currentBlock-1)*blockSize + 1;
		int endBlock = currentBlock * blockSize;
		
		mav.addObject("askBoardList",askBoardList);
		mav.addObject("pageSize",pageSize);
		mav.addObject("blockSize",blockSize);
		mav.addObject("total",total);
		mav.addObject("currentPage",currentPage1);
		mav.addObject("begin",begin);
		mav.addObject("end",end);
		mav.addObject("pageNum",pageNum);
		mav.addObject("blockTotal",blockTotal);
		mav.addObject("blockNum",blockNum);
		mav.addObject("currentBlock",currentBlock);
		mav.addObject("startBlock",startBlock);
		mav.addObject("endBlock",endBlock);
		mav.setViewName("/ajax/askBoardAjax");
		return mav;
		
	}
	
	@RequestMapping(value="getFaqBoardList.do")
	public ModelAndView getFaqBoardList(ModelAndView mav,HttpServletRequest request) {
		System.out.println("getFaqBoardList exe");
		String currentPages = request.getParameter("fcurrentPage");
		if(currentPages == null) currentPages="1";
		int currentPage = Integer.parseInt(currentPages);
		int total = faqBoardService.getBoardSize();
		int pageSize = 10;
		int blockSize = 3;
		int begin = (currentPage-1)*pageSize +1 ;
		int end = (currentPage-1)*pageSize +pageSize ;
		System.out.println("begin 값 : " + begin + "end 값 " + end);
		List<FaqBoardVO> faqBoardList=null;
		try {
		FaqBoardVO vo = new FaqBoardVO();
		faqBoardList = faqBoardService.getBoardList(vo,begin,end);
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("faqgetBoardList size 값 : " + faqBoardList.size());
		int pageNum = (total-1)/pageSize +pageSize ;
		int blockTotal = (total-1)/pageSize +1 ;
		int blockNum = (blockTotal-1)/blockSize +1;
		int currentBlock = (currentPage-1)/blockSize +1;
		int startBlock = (currentBlock-1)*blockSize + 1;
		int endBlock = currentBlock * blockSize;
		
		mav.addObject("faqBoardList",faqBoardList);
		mav.addObject("fpageSize",pageSize);
		mav.addObject("fblockSize",blockSize);
		mav.addObject("ftotal",total);
		mav.addObject("fcurrentPage",currentPage);
		mav.addObject("fbegin",begin);
		mav.addObject("fend",end);
		mav.addObject("fpageNum",pageNum);
		mav.addObject("fblockTotal",blockTotal);
		mav.addObject("fblockNum",blockNum);
		mav.addObject("fcurrentBlock",currentBlock);
		mav.addObject("fstartBlock",startBlock);
		mav.addObject("fendBlock",endBlock);
		mav.setViewName("/ajax/faqBoardAjax");
		return mav;
	}
	
	@RequestMapping(value="serviceCenter.do")
	public ModelAndView getServiceCenter(ModelAndView mav, HttpServletRequest request) {
		System.out.println("serviceCenter exe");
		
		FaqBoardVO fvo = new FaqBoardVO();
		int ftotal = faqBoardService.getBoardSize();
		System.out.println("total 값 :" + ftotal);
		int fpageSize = 10;
		int fblockSize = 3;
		int fcurrentPage1 = 1;
		int fbegin = (fcurrentPage1-1)*fpageSize +1 ;
		int fend = (fcurrentPage1-1)*fpageSize +fpageSize ;
		System.out.println("begin 값 : " + fbegin + "end 값 " + fend);
		List<FaqBoardVO> faqBoardList=null;
		try {
		faqBoardList = faqBoardService.getBoardList(fvo,fbegin,fend);
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("getBoardList size 값 : " + faqBoardList.size());
		int fpageNum = (ftotal-1)/fpageSize +fpageSize ;
		int fblockTotal = (ftotal-1)/fpageSize +1 ;
		int fblockNum = (fblockTotal-1)/fblockSize +1;
		int fcurrentBlock = (fcurrentPage1-1)/fblockSize +1;
		int fstartBlock = (fcurrentBlock-1)*fblockSize + 1;
		int fendBlock = fcurrentBlock * fblockSize;
		
		mav.addObject("faqBoardList",faqBoardList);
		mav.addObject("fpageSize",fpageSize);
		mav.addObject("fblockSize",fblockSize);
		mav.addObject("ftotal",ftotal);
		mav.addObject("fcurrentPage",fcurrentPage1);
		mav.addObject("fbegin",fbegin);
		mav.addObject("fend",fend);
		mav.addObject("fpageNum",fpageNum);
		mav.addObject("fblockTotal",fblockTotal);
		mav.addObject("fblockNum",fblockNum);
		mav.addObject("fcurrentBlock",fcurrentBlock);
		mav.addObject("fstartBlock",fstartBlock);
		mav.addObject("fendBlock",fendBlock);
		mav.setViewName("/lnuser/serviceCenter");
		
		
		
		////////////////////////////////////////////////////////////////////
		AskBoardVO vo = new AskBoardVO();
		int total = askBoardService.getBoardSize();
		System.out.println("total 값 :" + total);
		int pageSize = 10;
		int blockSize = 3;
		int currentPage1 = 1;
		int begin = (currentPage1-1)*pageSize +1 ;
		int end = (currentPage1-1)*pageSize +pageSize ;
		System.out.println("begin 값 : " + begin + "end 값 " + end);
		List<AskBoardVO> askBoardList=null;
		try {
		askBoardList = askBoardService.getBoardList(vo,begin,end);
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("getBoardList size 값 : " + askBoardList.size());
		int pageNum = (total-1)/pageSize +pageSize ;
		int blockTotal = (total-1)/pageSize +1 ;
		int blockNum = (blockTotal-1)/blockSize +1;
		int currentBlock = (currentPage1-1)/blockSize +1;
		int startBlock = (currentBlock-1)*blockSize + 1;
		int endBlock = currentBlock * blockSize;
		
		mav.addObject("askBoardList",askBoardList);
		mav.addObject("pageSize",pageSize);
		mav.addObject("blockSize",blockSize);
		mav.addObject("total",total);
		mav.addObject("currentPage",currentPage1);
		mav.addObject("begin",begin);
		mav.addObject("end",end);
		mav.addObject("pageNum",pageNum);
		mav.addObject("blockTotal",blockTotal);
		mav.addObject("blockNum",blockNum);
		mav.addObject("currentBlock",currentBlock);
		mav.addObject("startBlock",startBlock);
		mav.addObject("endBlock",endBlock);
		mav.setViewName("/lnuser/serviceCenter");
		
		List<CategoryVO> categoryList = lessonService.getCategoryList();
		mav.addObject("categoryList",categoryList);
		
		//알람 받기
		UserVO userVO = (UserVO)request.getSession().getAttribute("vo");
		if(userVO != null) {
			List<NotificationVO> notificationList = notificationService.getNotificationList(userVO);
			System.out.println(notificationList);
			System.out.println(">>"+notificationList.size());
			mav.addObject("notificationList", notificationList);
		}
		
		return mav;
		
	}
	
	@RequestMapping(value="notice.do")
	public ModelAndView getNoticeBoard(ModelAndView mav,HttpServletRequest request) {
		String currentPage_s = request.getParameter("currentPage");
		if(currentPage_s == null) {
			currentPage_s = "1";
			mav.setViewName("/lnuser/notice");
		}else {
			mav.setViewName("/ajax/noticeBoardAjax");
		}
		int currentPage = Integer.parseInt(currentPage_s);
		int total = noticeBoardService.getBoardSize();
		int pageSize = 10;
		int blockSize = 3;
		int begin = (currentPage-1)*pageSize +1 ;
		int end = (currentPage-1)*pageSize +pageSize ;
		System.out.println("begin 값 : " + begin + "end 값 " + end);
		List<NoticeBoardVO> noticeBoardList=null;
		try {
		noticeBoardList = noticeBoardService.getBoardList(begin,end);
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("noticeBoardList size 값 : " + noticeBoardList.size());
		int pageNum = (total-1)/pageSize +pageSize ;
		int blockTotal = (total-1)/pageSize +1 ;
		int blockNum = (blockTotal-1)/blockSize +1;
		int currentBlock = (currentPage-1)/blockSize +1;
		int startBlock = (currentBlock-1)*blockSize + 1;
		int endBlock = currentBlock * blockSize;
		mav.addObject("noticeBoardList",noticeBoardList);
		mav.addObject("pageSize",pageSize);
		mav.addObject("blockSize",blockSize);
		mav.addObject("total",total);
		mav.addObject("currentPage",currentPage);
		mav.addObject("begin",begin);
		mav.addObject("end",end);
		mav.addObject("pageNum",pageNum);
		mav.addObject("blockTotal",blockTotal);
		mav.addObject("blockNum",blockNum);
		mav.addObject("currentBlock",currentBlock);
		mav.addObject("startBlock",startBlock);
		mav.addObject("endBlock",endBlock);
		
		List<CategoryVO> categoryList = lessonService.getCategoryList();
		mav.addObject("categoryList",categoryList);
		
		//알림
				UserVO userVO = (UserVO)request.getSession().getAttribute("vo");
				if(userVO != null) {
					List<NotificationVO> notificationList = notificationService.getNotificationList(userVO);
					System.out.println(notificationList);
					System.out.println(">>"+notificationList.size());
					mav.addObject("notificationList", notificationList);
				}
		
		
		return mav;
	}
	
	@RequestMapping(value="getAskBoard.do")
	public ModelAndView getAskBoard(ModelAndView mav, HttpServletRequest request,AskBoardVO vo) {
		System.out.println("getAskBoard exe");
		String num_s = request.getParameter("num");
		int num = 0 ;
		if(num_s != null)
		num = Integer.parseInt(num_s);
		System.out.println("get num = " + vo.getNum());
		AskBoardVO askBoardVO = askBoardService.getBoard(vo);
		System.out.println(askBoardVO.getContent() +";"+ askBoardVO.getTitle()+";" + askBoardVO.getType());
		mav.addObject("askBoardVO", askBoardVO);
		mav.setViewName("/lnuser/askBoard");
		
		List<CategoryVO> categoryList = lessonService.getCategoryList();
		mav.addObject("categoryList",categoryList);
		return mav;
	}
	
	@RequestMapping(value="getAnswerBoard.do")
	public ModelAndView getAnswerBoard(ModelAndView mav, HttpServletRequest request,AskBoardVO vo) {
		System.out.println("getAnswerBoard exe");
		String num_s = request.getParameter("num");
		int num = 0 ;
		if(num_s != null)
		num = Integer.parseInt(num_s);
		System.out.println("get num = " + vo.getNum());
		AskBoardVO askBoardVO = askBoardService.getAnswerBoard(vo);
		System.out.println(askBoardVO.getContent() +";"+ askBoardVO.getTitle()+";" + askBoardVO.getType());
		mav.addObject("askBoardVO", askBoardVO);
		mav.setViewName("/lnuser/answerBoard");
		
		List<CategoryVO> categoryList = lessonService.getCategoryList();
		mav.addObject("categoryList",categoryList);
		return mav;
	}
	
	@RequestMapping(value="getFaqBoard.do")
	public ModelAndView getFaqBoard(ModelAndView mav, HttpServletRequest request, FaqBoardVO vo) {
		System.out.println("getFaqBoard exe");
		String num_s = request.getParameter("num");
		int num = 0 ;
		if(num_s != null)
		num = Integer.parseInt(num_s);
		System.out.println("get num = " + vo.getNum());
		FaqBoardVO faqBoardVO = faqBoardService.getBoard(vo);
		System.out.println(faqBoardVO.getContent() +";"+ faqBoardVO.getTitle());
		mav.addObject("faqBoardVO", faqBoardVO);
		mav.setViewName("/lnuser/faqBoard");
		List<CategoryVO> categoryList = lessonService.getCategoryList();
		mav.addObject("categoryList",categoryList);
		return mav;
	}
	
	@RequestMapping(value="getNoticeBoard.do")
	public ModelAndView getNoticeBoard(ModelAndView mav, HttpServletRequest request, NoticeBoardVO vo) {
		System.out.println("getNoticeBoard exe");
		String num_s = request.getParameter("num");
		int num = 0 ;
		if(num_s != null)
		num = Integer.parseInt(num_s);
		System.out.println("get num = " + vo.getNum());
		NoticeBoardVO noticeBoardVO = noticeBoardService.getBoard(vo);
		System.out.println(noticeBoardVO.getContent() +";"+ noticeBoardVO.getTitle());
		mav.addObject("noticeBoardVO", noticeBoardVO);
		
		List<CategoryVO> categoryList = lessonService.getCategoryList();
		mav.addObject("categoryList",categoryList);
		
		mav.setViewName("/lnuser/noticeBoard");
		return mav;
	}
	
}
