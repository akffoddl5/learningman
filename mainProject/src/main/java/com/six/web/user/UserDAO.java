package com.six.web.user;
import java.util.List;

/**
 * create table pickList (
 num number(8) primary key,
 id varchar2(90) references member(id),
 lectureNum number(8) references lecture(num)
);

create table lecture(
num number(8) primary key,
name varchar2(100) not null,
category varchar2(100) references category(name),
id varchar2(90) references member(id),
likeCnt number(8) default 0,
thumnailPath varchar2(100),
price number(8) default 0,
content1 varchar2(100),
content2 varchar2(100),
content3 varchar2(100),
content4 varchar2(100)

);

commit;

create table category(
name varchar2(100) primary key,
constructor varchar2(90) references member(id),
regdate date default sysdate
);

create table member(
id varchar2(90) primary key,
position varchar2(80) default 'user',
regdate date default sysdate
);

create sequence lecture_sec;
create sequence pickList_sec;
 * 
 * 
 */
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public UserVO getUser(UserVO userVO) {
		System.out.println("getUser :" + userVO.toString());
		return sessionTemplate.selectOne("UserDAO.getUser",userVO);
	}
	
	public void insertUser(UserVO userVO) {
		System.out.println("insertUser " +userVO.toString());
		sessionTemplate.update("UserDAO.insertUser", userVO);
	}
	
	public void updateUserForAutho(UserVO userVO) {
		System.out.println("updateUserForAutho" + userVO.getId() + userVO.getAuthorized());
		sessionTemplate.update("UserDAO.updateUserForAutho",userVO);
	}
	
	public List<UserVO> findUser(UserVO userVO) {
	      System.out.println("findUser :" + userVO.toString());
	      return sessionTemplate.selectList("UserDAO.findUser",userVO);
	}
	
	public void updateUserForImsiPass(UserVO userVO) {
	      System.out.println("updateUserForImsiPass" + userVO.getId() + userVO.getPassword());
	      sessionTemplate.update("UserDAO.updateUserForImsiPass",userVO);
	}

	public void updateUser(UserVO userVO) {
	      System.out.println("updateUser" + userVO.getId());
	      sessionTemplate.update("UserDAO.updateUser",userVO);
	}
	
	public void beTeacher(UserVO userVO) {
		System.out.println("be Teacher" + userVO.getId() + userVO.getTeacher());
		sessionTemplate.update("UserDAO.beTeacher",userVO);
	}
	
	public void updatePoint(UserVO userVO) {
		System.out.println("update Point" + userVO.getId() + userVO.getPoint());
		sessionTemplate.update("UserDAO.updatePoint", userVO);
	}
}
