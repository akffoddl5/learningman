package com.six.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class InterCepter extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if(request.getSession().getAttribute("vo") == null) {
			System.out.println("@@@@@@@@@@@@@@@@ 세션없음 @@@@@@@@@@@@@@");
			response.sendRedirect("/learningman/needLogin.go");
			return false;
			
		}else {
			System.out.println("@@@@@@@@@@@@@@@@ 세션있음 @@@@@@@@@@@@@@");
			return true;
		}
		
		
		//return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
	
	

}
