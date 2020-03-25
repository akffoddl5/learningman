package com.six.web.notification;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.six.web.user.UserVO;

@Repository
public class NotificationDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	
	public List<NotificationVO> getNotificationList(UserVO userVO){
		return sessionTemplate.selectList("NotificationDAO.getNotificationList", userVO);
	}

	public void updateNotificationConfirm(NotificationVO notificationVO) {
		sessionTemplate.update("NotificationDAO.updateNotificationConfirm", notificationVO);
	}
	public void delAllNoti(UserVO userVO){
		sessionTemplate.update("NotificationDAO.delAllNoti", userVO);
	}
}
