package com.six.web.faqBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.six.web.askBoard.AskBoardVO;

/**
 * create table faqboard(
num number(8) primary key,
title varchar2(60) not null,
writer varchar2(60) not null,
content varchar2(1000) not null,
regdate date default sysdate,
cnt number(8) default 0

);
 * 
 * 
 * 
 *
 */
@Repository
public class FaqBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public void insertBoard(FaqBoardVO vo) {
		sessionTemplate.update("FaqBoardDAO.insertBoard", vo);
	}
	
	public List<FaqBoardVO> getBoardList(FaqBoardVO vo,int begin,int end) {
		Map<String,Object> mp = new HashMap<>();
		mp.put("vo",vo);
		mp.put("begin", begin);
		mp.put("end", end);
		return sessionTemplate.selectList("FaqBoardDAO.getBoardList",mp);
	}
	
	public int getBoardSize() {
		return sessionTemplate.selectOne("FaqBoardDAO.getBoardSize");
	}
	
	public FaqBoardVO getBoard(FaqBoardVO vo) {
		return sessionTemplate.selectOne("FaqBoardDAO.getBoard",vo);
		
	}

}
