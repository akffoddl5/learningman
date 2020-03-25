package com.six.web.websocket;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.six.web.user.UserVO;

@Repository
public class ChatDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public void insertChat(ChatDTO chatDTO) {
		sessionTemplate.update("ChatDAO.insertChat",chatDTO);
	}
	
	public List<ChatDTO> getChatList(){
		return sessionTemplate.selectList("ChatDAO.getChatList");
	}


}
	
	


