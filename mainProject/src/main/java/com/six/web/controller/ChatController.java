package com.six.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.six.web.websocket.ChatDTO;
import com.six.web.websocket.ChatService;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@RequestMapping(value = "insertChat.do")
	public ModelAndView insertChat(ModelAndView mav, ChatDTO chatDTO) {
		
		if(chatDTO.getUserId() == null) chatDTO.setUserId("dont_delete_this_account_never");
		if(chatDTO.getAdminId() == null) chatDTO.setAdminId("dont_delete_this_account_never");
		chatService.insertChat(chatDTO);
		mav.setViewName("index.do");
		return mav;
	}
	
	
	
}
