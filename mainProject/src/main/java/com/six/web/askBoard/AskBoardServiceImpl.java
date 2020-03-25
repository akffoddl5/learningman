package com.six.web.askBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AskBoardServiceImpl implements AskBoardService {
	
	@Autowired
	private AskBoardDAO askBoardDAO;
	
	@Override
	public void insertBoard(AskBoardVO vo) {
		askBoardDAO.insertBoard(vo);
	}

	@Override
	public AskBoardVO getBoard(AskBoardVO vo) {
		return askBoardDAO.getBoard(vo);
	}
	@Override
	public AskBoardVO getAnswerBoard(AskBoardVO vo) {
		return askBoardDAO.getAnswerBoard(vo);
	}
	
	@Override
	public List<AskBoardVO> getBoardList(AskBoardVO vo,int begin, int end) {
		return askBoardDAO.getBoardList(vo,begin,end);
	}

	@Override
	public int getBoardSize() {
		return askBoardDAO.getBoardSize();
	}

	

}
