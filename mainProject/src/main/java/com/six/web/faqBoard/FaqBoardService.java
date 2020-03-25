package com.six.web.faqBoard;

import java.util.List;


public interface FaqBoardService {
	
	public void insertBoard(FaqBoardVO vo);
	public FaqBoardVO getBoard(FaqBoardVO vo);
	public int getBoardSize();
	public List<FaqBoardVO> getBoardList(FaqBoardVO vo,int begin,int end);
	
}
