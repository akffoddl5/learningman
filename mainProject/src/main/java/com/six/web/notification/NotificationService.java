package com.six.web.notification;

import java.util.List;

import com.six.web.user.UserVO;

public interface NotificationService {
	public List<NotificationVO> getNotificationList(UserVO userVO);
	public void updateNotificationConfirm(NotificationVO notificationVO);
	public void delAllNoti(UserVO userVO);
}
