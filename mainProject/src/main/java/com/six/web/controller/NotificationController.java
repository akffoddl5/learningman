package com.six.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.six.web.noticeBoard.NoticeBoardService;
import com.six.web.notification.NotificationService;
import com.six.web.notification.NotificationVO;
import com.six.web.user.UserService;
import com.six.web.user.UserVO;

@Controller
public class NotificationController {
	@Autowired
	private NotificationService notificationService;
	@Autowired
	private NoticeBoardService noticeBoardService;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="getMyNotiList.do")
	public ModelAndView getNotificationList(ModelAndView mav, HttpServletRequest request) {
		System.out.println("get NotificationList exe");
		UserVO userVO = (UserVO) request.getSession().getAttribute("vo");
		System.out.println(userVO);
		List<NotificationVO> notificationList = notificationService.getNotificationList(userVO);
		System.out.println(notificationList);
		System.out.println(">>"+notificationList.size());
		mav.addObject("notificationList", notificationList);
		mav.setViewName("/ajax/notiAjax");
		return mav;
	}
	
	@RequestMapping(value="updateNotificationConfirm.do")
	public ModelAndView updateNotificationConfirm(ModelAndView mav, HttpServletRequest request, NotificationVO notificationVO) {
		System.out.println("update NotificationConfirm");
		UserVO userVO = (UserVO) request.getSession().getAttribute("vo");
		String num_s = request.getParameter("num");
		int num = 0;
		if(num_s != null) {
			num = Integer.parseInt(num_s);
		}
		System.out.println(userVO);
		notificationVO.setId(userVO.getId());
		notificationService.updateNotificationConfirm(notificationVO);
		mav.setViewName("redirect:index.do");
		return mav;
	}
	
	@RequestMapping(value="delAllNoti.do")
	public ModelAndView delAllNoti(ModelAndView mav, HttpServletRequest request, NotificationVO notificationVO) {
		System.out.println("delete All Notification");
		UserVO userVO = (UserVO) request.getSession().getAttribute("vo");
		notificationService.delAllNoti(userVO);
//		UserVO getUserVO = userService.getUser(userVO); //session 다시 뿌리기
//		request.getSession().setAttribute("vo", getUserVO);
		mav.setViewName("/lnuser/index");
		return mav;
	}
}
