package com.six.web.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.six.web.lesson.CategoryVO;
import com.six.web.lesson.LessonService;
import com.six.web.user.UserService;
import com.six.web.user.UserVO;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private LessonService lessonService;
	
	@RequestMapping(value="/insertUser.do")
	public String insertUser(UserVO userVO) {
		System.out.println("userInsert exe");
		
		try {
		userService.insertUser(userVO);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/lnuser/index";
	}
	
	@RequestMapping(value="/idAutho.do")
	public ModelAndView idAutho(UserVO userVO,ModelAndView mav) {
		UserVO getUserVO = userService.getUser(userVO);
		System.out.println("이게 회원가입 폼 값 "+userVO.getId());
//		System.out.println("이게 디비 검증 값 : " + getUserVO.getId());
		if(getUserVO == null || getUserVO.getId() == null) {
			System.out.println("사용 가능하긴함");
			mav.addObject("result","사용가능한 아이디입니다.");
		}else {
			System.out.println("사용 불가능");
			mav.addObject("result","이미 사용하고 있는 아이디입니다.");
		}
		mav.setViewName("/ajax/idAuthoAjax");
		return mav;
	}
	
	@RequestMapping(value="/login.do")
	public @ResponseBody int login(UserVO userVO, HttpServletRequest request, ModelAndView mav) {
		System.out.println("login �떆�룄");
		UserVO getUserVO = userService.getUser(userVO);
		int loginResult = userService.loginUser(userVO);
		mav.addObject("loginResult", loginResult);
		System.out.println("flag1");
		if(loginResult == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("type", "normal");
			session.setAttribute("vo", getUserVO);
		}

		return loginResult;
		
	}
	
	@RequestMapping(value="logout.do")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:index.do";
	}
	
	@RequestMapping(value="snsLogin.do")
	public ModelAndView snsLogin(HttpServletRequest request, ModelAndView mav) {
		System.out.println("snslogin do ");
		String type = request.getParameter("type");
		String pwTmp = "";
		
		String tokenVal= request.getParameter("tokenVal");
		String resid = request.getParameter("resid");
		String email = request.getParameter("email");
		if(email == null) {
			email = type;
		}
		String nickname = request.getParameter("nickname");
		System.out.println(type);
		System.out.println(tokenVal);
		System.out.println("식별 : " + resid);
		System.out.println("이멜 : " + email);
		System.out.println("닉 : " + nickname);
		UserVO userVO = new UserVO();
		userVO.setId(resid);
		userVO.setEmail(email);
		
		if(type.equals("naver")) {
			pwTmp= "85c9cb4478748758d9bab7e55583e011";
		}else if(type.equals("kakao")) {
			pwTmp="d42de1f57e8dd01202d9c36d807fb157";
		}
		
		
		userVO.setPassword(pwTmp);
		userVO.setName(type);
		
		UserVO getUserVO = userService.getUser(userVO);
		if(getUserVO == null) {
			System.out.println("flag1");
			userVO.setPhone(type);
			userVO.setAuthorized("Y");
			userVO.setTeacher("N");
			userService.insertUser(userVO);
		}
		UserVO getUserVO2 = userService.getUser(userVO);
		HttpSession session = request.getSession();
		session.setAttribute("type", type);
		session.setAttribute("vo", getUserVO2);
		System.out.println("getuser info : "  + getUserVO2.getPassword() + getUserVO2.getPhone());
		mav.setViewName("redirect:/index.do");
		return mav;
	}
	
	@RequestMapping(value="naverCallback.go")
	public ModelAndView goNaverCallback(HttpServletRequest request, ModelAndView mav) {
		System.out.println("naver Callback go");
		
		mav.setViewName("/lnuser/naverCallback");
		return mav;
	}
	
	@RequestMapping(value="mailAutho.do")
	public ModelAndView mailAutho(UserVO userVO , HttpServletRequest request, HttpServletResponse response,ModelAndView mav) {
		Random r = new Random();
		int random = (int)(Math.random()*1000000+1000000);
		String id = userVO.getId();
		String setfrom = "pseudosnowball2@gamil.com";
        String tomail = userVO.getEmail(); // 받는 사람 이메일
        String title = "회원가입 인증 이메일 입니다."; // 제목
        String url =  id + "&러code닝code=" + random;
        String dataconver = null;
        try {
			dataconver = URLEncoder.encode(url, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        String content = "Learning man 회원가입 인증링크 :  " + "http://ec2-15-165-204-212.ap-northeast-2.compute.amazonaws.com/learningman/mailAuthoring.do?autho=" + dataconver;
        /*
         * 
         * String content = "Learning man 회원가입 인증링크 :  " + 
        "http://localhost:8080/learningman/mailAuthoring.do?id="+id+"&code="+random;
         * */
        
        try {
        	MimeMessage message = mailSender.createMimeMessage();
        	MimeMessageHelper messageHelper = new MimeMessageHelper(message, true , "UTF-8");
        	messageHelper.setFrom(setfrom);
        	messageHelper.setTo(tomail);
        	messageHelper.setSubject(title);
        	messageHelper.setText(content);
        	mailSender.send(message);
        	
        }catch(Exception e) {
        	e.printStackTrace();
        }
        userVO.setAuthorized(Integer.toString(random));
      //비밀번호 암호화(MD5)
        String MD5 = userVO.getPassword();
        try {
        	MessageDigest md5 = MessageDigest.getInstance("MD5");
        	md5.update(MD5.getBytes());
        	byte byteData[] = md5.digest();
        	StringBuffer sb = new StringBuffer();
        	for(int i = 0; i < byteData.length; i++) {
        		sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
        	}
        	MD5 = sb.toString();
        }catch(NoSuchAlgorithmException e) {
        	e.printStackTrace();
        	MD5 = null;
        }
        userVO.setPassword(MD5);
        userService.insertUser(userVO);
        
        mav.setViewName("/lnuser/mailAutho");
        mav.addObject("email", userVO.getEmail());
		
		return mav;
		
	}
	
	@RequestMapping(value="mailAuthoring.do")
	public ModelAndView mailAuthoring(HttpServletRequest request,ModelAndView mav) {
		String dataconver = request.getParameter("autho");
	      try {
			dataconver = URLDecoder.decode(dataconver, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      //String id = request.getParameter("id");
	      //String code = request.getParameter("code");
	      String[] step1 = dataconver.split("&러code닝code=");
	      String[] step2 = dataconver.split("=");
	      String id = step1[0];
	      String code = step2[1];
		
		/*
		String id = request.getParameter("id");
		String code = request.getParameter("code");
		*/
		UserVO userVO = new UserVO();
		userVO.setId(id);
		UserVO getUserVO = userService.getUser(userVO);
		
		if(getUserVO.getAuthorized().equals(code)) {
			//인증 성공 getUserVO 로 update 하믄댐
			getUserVO.setAuthorized("Y");
			userService.updateUserForAutho(getUserVO);
			mav.addObject("result","인증이 완료되었습니다.");
			mav.setViewName("/lnuser/welcome");
			request.getSession();
		}else {
			//인증 실패  잘못된 접근입니다 페이지 띄우기
			mav.addObject("result","잘못된 접근입니다.");
			mav.setViewName("/lnuser/welcome");
		}
		
		return mav;
	}
	
	@RequestMapping(value="foundInfo.go")
	public ModelAndView goFoundInfo(ModelAndView mav) {
		System.out.println("go foundInfo");
		List<CategoryVO> categoryList = lessonService.getCategoryList();
		mav.addObject("categoryList",categoryList);
		mav.setViewName("/lnuser/foundInfo");
		return mav;
		
	}
	
	@RequestMapping(value="/foundId.do")
	   public ModelAndView foundId(UserVO userVO, ModelAndView mav) {
	      System.out.println("foundId exe");
	      List<UserVO> findUserVO = userService.findUser(userVO);
	      List<String> result = new ArrayList<String>();
	      System.out.println(userVO.getName() + userVO.getEmail());
	      for(int i=0; i<findUserVO.size(); i++) {
	         if((findUserVO.get(i) != null || findUserVO.get(i).getName() != null) && (findUserVO.get(i) != null || findUserVO.get(i).getEmail() != null)) {
	            result.add(findUserVO.get(i).getId());
	         }
	      }
	      System.out.println("찾아온 아이디 수 :" + result.size());
	      if(result.size() == 0 ) {
	    	  mav.addObject("result", "등록되어 있지 않은 회원입니다.\n다시 확인해주세요");
	      }else {
	    	  mav.addObject("result", "등록된 아이디는 "+result+"입니다.");
	      }
	      
	      mav.setViewName("/ajax/foundIdAjax");
	      return mav;
	   }
	
	@RequestMapping(value="/foundPw.do")
	   public ModelAndView foundPw(UserVO userVO, ModelAndView mav) {
	      System.out.println("foundPw exe");
	      UserVO getUserVO = userService.getUser(userVO);
	      String dbId = getUserVO.getId();
	      String dbName = getUserVO.getName();
	      String dbEmail = getUserVO.getEmail();
	      System.out.println(dbId);
	      System.out.println(dbName);
	      System.out.println(dbEmail);
	      System.out.println(getUserVO);
	         if((getUserVO != null || getUserVO.getId() != null) && (getUserVO != null || getUserVO.getName() != null) && (getUserVO != null || getUserVO.getEmail() != null)) {
	            String inputId = userVO.getId();
	            String inputName = userVO.getName();
	            String tomail = userVO.getEmail(); // 받는 사람 이메일
	            if(dbId.equals(inputId) && dbName.equals(inputName) && dbEmail.equals(tomail)) {
	            
	            mav.addObject("result", "임시 비밀번호가 발송되었습니다.");
	            String imsiPw = RandomStringUtils.random(20, "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789");
	            String setfrom = "pseudosnowball2@gamil.com";
	            
	            System.out.println(tomail);
	            System.out.println(userVO.getName());
	            String title = "임시 비밀번호 이메일 입니다."; // 제목
	            String content = "Learning man 임시 비밀번호 :  " + imsiPw;
	            
	            
	            
	            try {
	               MimeMessage message = mailSender.createMimeMessage();
	               MimeMessageHelper messageHelper = new MimeMessageHelper(message, true , "UTF-8");
	               messageHelper.setFrom(setfrom);
	               messageHelper.setTo(tomail);
	               messageHelper.setSubject(title);
	               messageHelper.setText(content);
	               mailSender.send(message);
	               
	            }catch(Exception e) {
	               e.printStackTrace();
	            }
	            getUserVO.setPassword(imsiPw);
	            try {
	               String inputImsiPw = getUserVO.getPassword();
		               try {
			   		    	MessageDigest md5 = MessageDigest.getInstance("MD5");
			   		    	md5.update(inputImsiPw.getBytes());
			   		    	byte byteData[] = md5.digest();
			   		    	StringBuffer sb = new StringBuffer();
			   		    	for(int i = 0; i < byteData.length; i++) {
			   		    		sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
		   		    	}
			   		    inputImsiPw = sb.toString();
			   		  	}catch(NoSuchAlgorithmException e) {
			   		    	e.printStackTrace();
			   		    	inputImsiPw = null;
			   		    }
		               getUserVO.setPassword(inputImsiPw);
		               userService.updateUserForImsiPass(getUserVO);
	            }catch(Exception e) {
	               e.printStackTrace();
	            }
	            
	            mav.setViewName("mailPwAutho.jsp");
	            mav.addObject("email", userVO.getEmail());
	            }else {
	               mav.addObject("result", "등록되어 있지 않은 회원입니다. 다시 확인해주세요");
	               
	            }
	               
	         }else {
	         }
	      mav.setViewName("/ajax/foundPwAjax");
	      return mav;
	   }
	
	@RequestMapping(value="/updateUser.do")
	   public ModelAndView updateUser(UserVO userVO, HttpServletRequest request, ModelAndView mav , 
			   @RequestParam("profile_pt") MultipartFile profile) {
	      String name = request.getParameter("name");
	      String email = request.getParameter("email");
	      String phone = request.getParameter("phone");
	      
	     
	      System.out.println("flag1");
	      String fileName = "";
	      if(!profile.getOriginalFilename().equals("")) {
	    	  System.out.println("  업로드함 !!!!!!!!!!!!!!! ========================");
	    	  ServletContext context = request.getServletContext();
	  		String saveDir = context.getRealPath("/resources/uploadedVideos/");
	  		fileName = UUID.randomUUID().toString();
	  		File file1 = new File(saveDir+fileName);
	  		try {
	  			profile.transferTo(file1);
	  		} catch (IllegalStateException e) {
	  			e.printStackTrace();
	  		} catch (IOException e) {
	  			e.printStackTrace();
	  		}
	    	  
	      }
	      
	      
	      System.out.println("userUpdate exe");
	      
	      System.out.println(profile.getOriginalFilename());
	      System.out.println(userVO.getEmail());
	      System.out.println(userVO.getName());
	      System.out.println(userVO.getId());
	      
	      System.out.println(phone);
	      UserVO getUserVO = userService.getUser(userVO);
	      
	      if(getUserVO.getId().equals(userVO.getId())) {
	         System.out.println("일단 조건은 맞음 !!");
	         getUserVO.setName(userVO.getName());
	         getUserVO.setEmail(userVO.getEmail());
	         getUserVO.setPhone(userVO.getPhone());
	         if(!profile.getOriginalFilename().equals("")) 
	         getUserVO.setThumbnail(fileName);
	         userService.updateUser(getUserVO);
	         
	         request.getSession().setAttribute("vo", getUserVO);
	         
	         mav.addObject("userVO",getUserVO);
	         mav.setViewName("redirect:/myPage.do");
	         
	      }else {
	         mav.setViewName("/lnuser/index");
	      }
	      return mav;
	   }
	
	@RequestMapping(value = "/needLogin.go")
	public ModelAndView interceptMethodA(ModelAndView mav) {
		System.out.println("intercept exe");
		mav.setViewName("/lnuser/needLogin");
		return mav;
	}
	
	
}
