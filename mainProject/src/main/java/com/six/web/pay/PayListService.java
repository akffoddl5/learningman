package com.six.web.pay;

import java.util.List;

import com.six.web.user.UserVO;

public interface PayListService {
	public void insertPayList(PayListVO payListVO);
	public List<PayListVO> getMyPayList(UserVO userVO);
}
