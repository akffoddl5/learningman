package com.six.web.websocket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.six.web.user.UserVO;

@Service
public class ChatServiceImpl implements ChatService {
	
	
	@Autowired
	private ChatDAO chatDAO;

	@Override
	public void insertChat(ChatDTO chatDTO) {
		chatDAO.insertChat(chatDTO);
		
	}

	@Override
	public List<ChatDTO> getChatList() {
		return chatDAO.getChatList();
	}
	

}
