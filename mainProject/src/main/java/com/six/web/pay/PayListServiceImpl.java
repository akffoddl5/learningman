package com.six.web.pay;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.six.web.user.UserVO;

@Service
public class PayListServiceImpl implements PayListService{
	
	@Autowired
	private PayListDAO payListDAO;
	
	@Override
	public void insertPayList(PayListVO payListVO) {
		payListDAO.insertPayList(payListVO);
	}

	@Override
	public List<PayListVO> getMyPayList(UserVO userVO) {
		return payListDAO.getMyPayList(userVO);
	}
	
}
