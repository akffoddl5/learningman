package com.six.web.user;

import java.util.List;

public interface UserService {
	
	public UserVO getUser(UserVO userVO);
	public void insertUser(UserVO userVO);
	public int loginUser(UserVO userVO);
	public void logoutUser(UserVO userVO);
	public void updateUserForAutho(UserVO userVO);
	public List<UserVO> findUser(UserVO userVO);
	public void updateUserForImsiPass(UserVO userVO);
	public void updateUser(UserVO userVO);
	public void beTeacher(UserVO userVO);
	public void updatePoint(UserVO userVO);
}
