package com.six.web.answerBoard;
/**
 * 
 * 
 * CREATE TABLE answerBoard (
   num   number(8)   NOT NULL,
   title   varchar2(120)   NULL,
   content   varchar2(1000)   NULL,
   id   varchar2(90)   NOT NULL,
   regdate   date      DEFAULT sysdate,
   ref   number(8)   NULL
);

ALTER TABLE answerBoard ADD CONSTRAINT PK_ANSWERBOARD PRIMARY KEY (
    num
);

ALTER TABLE answerBoard ADD CONSTRAINT FK_lnadmin_TO_answerBoard_1 FOREIGN KEY (
   id
)
REFERENCES lnadmin (
   id
);
 * @author user
 *
 */

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class AnswerBoardDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public void insertAnswerQna(AnswerBoardVO vo) {
		sessionTemplate.update("AnswerBoardDAO.insertAnswerQna", vo);
	}
	
	public AnswerBoardVO getBoard(AnswerBoardVO vo) {
		return sessionTemplate.selectOne("AnswerBoardDAO.getBoard",vo);
		
	}
	
	public AnswerBoardVO getBoard2(AnswerBoardVO vo) {
		return sessionTemplate.selectOne("AnswerBoardDAO.getBoard2",vo);
		
	}
}
