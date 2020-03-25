package com.six.web.askBoard;

import java.util.List;

public interface AskBoardService {
	
	public void insertBoard(AskBoardVO vo);
	public AskBoardVO getBoard(AskBoardVO vo);
	public AskBoardVO getAnswerBoard(AskBoardVO vo);
	public int getBoardSize();
	public List<AskBoardVO> getBoardList(AskBoardVO vo,int begin,int end);
}
