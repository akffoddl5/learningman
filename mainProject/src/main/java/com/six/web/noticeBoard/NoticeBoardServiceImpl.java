package com.six.web.noticeBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {
	
	@Autowired
	private NoticeBoardDAO noticeBoardDAO;
	
	@Override
	public void insertBoard(NoticeBoardVO vo) {
		noticeBoardDAO.insertBoard(vo);
	}

	@Override
	public NoticeBoardVO getBoard(NoticeBoardVO vo) {
		return noticeBoardDAO.getBoard(vo);
	}

	@Override
	public int getBoardSize() {
		return noticeBoardDAO.getBoardSize();
	}

	@Override
	public List<NoticeBoardVO> getBoardList(int begin, int end) {
		return noticeBoardDAO.getBoardList(begin, end);
	}

}
