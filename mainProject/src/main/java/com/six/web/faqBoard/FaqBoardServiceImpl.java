package com.six.web.faqBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FaqBoardServiceImpl implements FaqBoardService {
	
	@Autowired
	private FaqBoardDAO faqBoardDAO;
	
	@Override
	public void insertBoard(FaqBoardVO vo) {
		faqBoardDAO.insertBoard(vo);
	}

	@Override
	public FaqBoardVO getBoard(FaqBoardVO vo) {
		return faqBoardDAO.getBoard(vo);
	}

	@Override
	public List<FaqBoardVO> getBoardList(FaqBoardVO vo,int begin,int end) {
		
		return faqBoardDAO.getBoardList(vo,begin,end);
	}

	@Override
	public int getBoardSize() {
		return faqBoardDAO.getBoardSize();
	}

}
