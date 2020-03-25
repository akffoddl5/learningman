package com.six.web.user;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	@Override
	public void insertUser(UserVO userVO) {
		userDAO.insertUser(userVO);
	}

	@Override
	public int loginUser(UserVO userVO) {
		String id = userVO.getId();
		//입력한 pw 암호화 후 가입한 pw와 비교 후 로그인 =============================================== 
		//  암호화 start
		String inputPw = userVO.getPassword();
			try {
		    	MessageDigest md5 = MessageDigest.getInstance("MD5");
		    	md5.update(inputPw.getBytes());
		    	byte byteData[] = md5.digest();
		    	StringBuffer sb = new StringBuffer();
		    	for(int i = 0; i < byteData.length; i++) {
		    		sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
		    	}
		    	inputPw = sb.toString();
		    }catch(NoSuchAlgorithmException e) {
		    	e.printStackTrace();
		    	inputPw = null;
		    }
			userVO.setPassword(inputPw);
		System.out.println(">> "+id + " : "+ inputPw);
		UserVO user = userDAO.getUser(userVO);
		String pw = "";
		if(user!=null) {
			
			pw = user.getPassword();
		}
		System.out.println("pw : " + pw);
		//  암호화 end ========================================================================
		if(user==null) {
			return 0;
		}else if(!pw.equals(inputPw)) {
			return -1;
		}else {
			
			if(user.getAuthorized().equals("Y")) {
				return 1;
			}else {
				return -2;
			}
			
			
		}
		
	}

	@Override
	public void logoutUser(UserVO userVO) {
		
	}

	@Override
	public UserVO getUser(UserVO userVO) {
		
		return userDAO.getUser(userVO); 
	}

	@Override
	public void updateUserForAutho(UserVO userVO) {
		userDAO.updateUserForAutho(userVO);
		
	}

	@Override
	public List<UserVO> findUser(UserVO userVO) {
		return userDAO.findUser(userVO);
	}

	@Override
	public void updateUserForImsiPass(UserVO userVO) {
		userDAO.updateUserForImsiPass(userVO);
	}

	@Override
	public void updateUser(UserVO userVO) {
		userDAO.updateUser(userVO);
	}

	@Override
	public void beTeacher(UserVO userVO) {
		userDAO.beTeacher(userVO);
	}
	@Override
	public void updatePoint(UserVO userVO) {
		userDAO.updatePoint(userVO);	
	}

}
