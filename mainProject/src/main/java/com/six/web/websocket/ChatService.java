package com.six.web.websocket;

import java.util.List;


public interface ChatService {
	
	public void insertChat(ChatDTO chatDTO);
	public List<ChatDTO> getChatList();
	

}
