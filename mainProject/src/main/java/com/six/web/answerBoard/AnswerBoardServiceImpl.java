package com.six.web.answerBoard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class AnswerBoardServiceImpl implements AnswerBoardService{
	@Autowired
	private AnswerBoardDAO answerBoardDAO;
	
	@Override
	public void insertAnswerQna(AnswerBoardVO vo) {
		answerBoardDAO.insertAnswerQna(vo);
	}
	
	@Override
	public AnswerBoardVO getBoard(AnswerBoardVO vo) {
		return answerBoardDAO.getBoard(vo);
	}
	@Override
	public AnswerBoardVO getBoard2(AnswerBoardVO vo) {
		return answerBoardDAO.getBoard2(vo);
	}
}
