package com.six.web.notification;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.six.web.user.UserVO;

@Service
public class NotificationServiceImpl implements NotificationService{
	
	@Autowired
	private NotificationDAO notificationDAO;
	
	
	@Override
	public List<NotificationVO> getNotificationList(UserVO userVO) {
		return notificationDAO.getNotificationList(userVO);
	}

	@Override
	public void updateNotificationConfirm(NotificationVO notificationVO) {
		notificationDAO.updateNotificationConfirm(notificationVO);
		
	}

	@Override
	public void delAllNoti(UserVO userVO) {
		notificationDAO.delAllNoti(userVO);
	}
}
