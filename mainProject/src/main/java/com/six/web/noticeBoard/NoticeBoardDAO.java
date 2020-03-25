package com.six.web.noticeBoard;
/**
 * select* from tab;

select* from lnuser;
select* from lnadmin;
select* from askboard;
select* from noticeboard;
insert into noticeboard (num,title,writer,content ) values (noticeboard_seq.nextVal, '세번째 공지입니다.','test','나는 test입니다' );
drop table noticeBoard;
desc askboard;
commit;
create sequence noticeBoard_seq;
CREATE TABLE noticeBoard (
	num	number(8)	NOT NULL,
	title	varchar2(100)	NULL,
	writer	varchar2(90)	NOT NULL,
	content	varchar2(800)	NULL,
	cnt	number(8)	default 0,
	regdate	date default sysdate
);

ALTER TABLE noticeBoard ADD CONSTRAINT FK_lnadmin_TO_noticeBoard_1 FOREIGN KEY (
	writer
)
REFERENCES lnadmin (
	id
);

ALTER TABLE noticeBoard ADD CONSTRAINT PK_NOTICEBOARD PRIMARY KEY (
	num
);



 * @author Administrator
 *
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.six.web.faqBoard.FaqBoardVO;


@Repository
public class NoticeBoardDAO {
	
	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	public void insertBoard(NoticeBoardVO vo) {
		sessionTemplate.update("NoticeBoardDAO.insertBoard", vo);
	}
	
	public List<NoticeBoardVO> getBoardList(int begin,int end) {
		Map<String,Object> mp = new HashMap<>();
		mp.put("begin", begin);
		mp.put("end", end);
		return sessionTemplate.selectList("NoticeBoardDAO.getBoardList",mp);
	}
	
	public int getBoardSize() {
		return sessionTemplate.selectOne("NoticeBoardDAO.getBoardSize");
	}
	
	public NoticeBoardVO getBoard(NoticeBoardVO vo) {
		return sessionTemplate.selectOne("NoticeBoardDAO.getBoard",vo);
		
	}
	
	
	
}
