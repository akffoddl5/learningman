package com.six.web.askBoard;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * create table askboard(
    num number(8) primary key,
    type varchar2(100),
    title varchar2(100),
    writer varchar2(100),
    content varchar2(100),
    regdate date default sysdate,
    cnt number(8) default 0,
    secret varchar2(5),
    ref number(8) not null
    );

create sequence askboard_seq;
 * 
 * 
 */
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
/**
 * 
 * <![CDATA[
	
	select * from (
SELECT rowNum as rNum, num, type, title, writer, content , regDate, cnt, secret, ref from (
SELECT * FROM askboard order by ref desc ,num asc
)
) where rNum >= ${begin} and rNum <= ${end}
	]]>
 * 
 * 
 * 
 * 
 * @author KGITBank
 *
 */
@Repository
public class AskBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	
	public void insertBoard(AskBoardVO vo) {
		sessionTemplate.update("AskBoardDAO.insertBoard", vo);
	}
	
	public List<AskBoardVO> getBoardList(AskBoardVO vo,int begin, int end) {
		Map<String,Object> mp = new HashMap<>();
		mp.put("vo",vo);
		mp.put("begin", begin);
		mp.put("end", end);
		return sessionTemplate.selectList("AskBoardDAO.getBoardList",mp);
	}
	
	public int getBoardSize() {
		return sessionTemplate.selectOne("AskBoardDAO.getBoardSize");
	}
	
	public AskBoardVO getBoard(AskBoardVO vo) {
		return sessionTemplate.selectOne("AskBoardDAO.getBoard",vo);
		
	}
	public AskBoardVO getAnswerBoard(AskBoardVO vo) {
		return sessionTemplate.selectOne("AskBoardDAO.getAnswerBoard",vo);
		
	}
	
}
