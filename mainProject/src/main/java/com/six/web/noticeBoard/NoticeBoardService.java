package com.six.web.noticeBoard;

import java.util.List;


public interface NoticeBoardService {
	
	public void insertBoard(NoticeBoardVO vo);
	public NoticeBoardVO getBoard(NoticeBoardVO vo);
	public int getBoardSize();
	public List<NoticeBoardVO> getBoardList(int begin,int end);
	
}
