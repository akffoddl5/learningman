package com.six.web.pay;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.six.web.user.UserVO;
@Repository
public class PayListDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public void insertPayList(PayListVO payListVO) {
		System.out.println("insertPayList : " + payListVO.toString());
		sessionTemplate.update("PayListDAO.insertPayList", payListVO);
	}

	public List<PayListVO> getMyPayList(UserVO userVO) {
		return sessionTemplate.selectList("PayListDAO.getMyPayList", userVO);
	}
}
