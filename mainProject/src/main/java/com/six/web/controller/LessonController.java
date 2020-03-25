package com.six.web.controller;

import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.six.web.admin.AdminService;
import com.six.web.admin.ImgVO;
import com.six.web.lesson.CategoryVO;
import com.six.web.lesson.LectureVO;
import com.six.web.lesson.LessonService;
import com.six.web.lesson.LessonVO;
import com.six.web.notification.NotificationService;
import com.six.web.notification.NotificationVO;
import com.six.web.pay.TradeListService;
import com.six.web.pay.TradeListVO;
import com.six.web.reply.LessonReplyVO;
import com.six.web.reply.ReplyService;
import com.six.web.user.UserService;
import com.six.web.user.UserVO;

@Controller
public class LessonController {
	
	@Autowired
	private LessonService lessonService;
	@Autowired
	private UserService userService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private TradeListService tradeListService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private NotificationService notificationService;
	
	@Transactional
	@RequestMapping(value="uploadLesson.do")
	public ModelAndView uploadLesson(@RequestParam("id") String id, @RequestParam("hashTag") String hashTag, 
@RequestParam("content") String content, @RequestParam("title") String title, 
@RequestParam("category") String category , @RequestParam("lectureNum") String lectureNum, 
@RequestParam("videoFile") MultipartFile videoFile,
@RequestParam("thumbnailFile") MultipartFile thumbnailFile,LessonVO vo, ModelAndView mav , HttpServletRequest request) {
		System.out.println("uploadLesson exe");
		String videoName =  videoFile.getOriginalFilename();
		String thumbnailName = thumbnailFile.getOriginalFilename();
		
		videoName= UUID.randomUUID().toString();
		thumbnailName = UUID.randomUUID().toString();
		
		ServletContext context = request.getServletContext();
		String saveDir = context.getRealPath("/resources/uploadedVideos/");
		File file1 = new File(saveDir+videoName);
		try {
			videoFile.transferTo(file1);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		File file2 = new File(saveDir+thumbnailName);
		try {
			thumbnailFile.transferTo(file2);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println(saveDir + videoName);
		System.out.println(saveDir + thumbnailName);
		
		
		System.out.println("  = " + category +":"+ title+":"+content+":" + hashTag+":" + id );
		LessonVO lessonVO = new LessonVO();
		lessonVO.setCategory(category);
		lessonVO.setTitle(title);
		lessonVO.setContent(content);
		lessonVO.setHashTag(hashTag);
		lessonVO.setId(id);
		lessonVO.setLectureNum(Integer.parseInt(lectureNum));
		lessonVO.setVideoPath(videoName);
		lessonVO.setThumbnailPath(thumbnailName);
		lessonService.insertLesson(lessonVO);
		mav.addObject("videoName",videoName); // 필 없
		mav.setViewName("redirect:/lecture.go?lectureNum="+lectureNum);
		
		//강의 알림
		LectureVO lectureVO = lessonService.getLecture(Integer.parseInt(lectureNum));
		List<UserVO> userList = adminService.whoPickThisLecture(Integer.parseInt(lectureNum));
		NotificationVO notificationVO = new NotificationVO();
		
		notificationVO.setContent(lectureVO.getName() + " 의 새로운 강의가 있습니다.");
		System.out.println(lectureVO.getName() + " 의 새로운 강의가 있습니다.");
		notificationVO.setUrl("lecture.go?lectureNum="+lectureNum);
		for(UserVO userVO : userList) {
			notificationVO.setId(userVO.getId());
			adminService.lessonAlarm(notificationVO);
		}
		return mav;
	}
	
	@RequestMapping(value="categoryPick.go")
	public ModelAndView goCategoryPick(ModelAndView mav,HttpServletRequest request) {
		System.out.println("go categoryPick");
		String categoryName = request.getParameter("name");
		System.out.println(categoryName);
		CategoryVO cVO = new CategoryVO();
		cVO.setName(categoryName);
		List<CategoryVO> categoryList = new ArrayList<>();
		categoryList.add(cVO);
		List<LectureVO> categoryLectureList = lessonService.getCategoryLectureList(categoryList);
		//System.out.println(">> :" + categoryLectureList.get(0).getrNum());
		
		mav.addObject("categoryList",lessonService.getCategoryList());
		mav.addObject("categoryLectureList",categoryLectureList);
		mav.setViewName("/lnuser/categoryPick");
		
		//알람 받기
				UserVO userVO = (UserVO)request.getSession().getAttribute("vo");
				if(userVO != null) {
					List<NotificationVO> notificationList = notificationService.getNotificationList(userVO);
					System.out.println(notificationList);
					System.out.println(">>"+notificationList.size());
					mav.addObject("notificationList", notificationList);
				}
		return mav;
		
	}
	
	@RequestMapping(value="pick.go")
	public ModelAndView goPick(ModelAndView mav, HttpServletRequest request) {
		System.out.println("go pick");
		HttpSession session = request.getSession(false);
		UserVO userVO = (UserVO)session.getAttribute("vo");
		List<LectureVO> myPickList = lessonService.getMyPickList(userVO);
		List<CategoryVO> categoryList = lessonService.getCategoryList();
		mav.addObject("categoryList",categoryList);
		mav.addObject("myPickList",myPickList);
		mav.setViewName("/lnuser/pick");
		return mav;
	}
	
	@RequestMapping(value="deletePick.do")
	public ModelAndView deletePick(ModelAndView mav,HttpServletRequest request) {
		System.out.println("delete Pick");
		String id = ((UserVO)request.getSession(false).getAttribute("vo")).getId();
		String num_s = request.getParameter("num");
		if(num_s == null) {
			num_s = "1";
		}
		int num = Integer.parseInt(num_s);
		lessonService.deletePick(id,num);
		mav.setViewName("/lnuser/pick");  // 그냥 보내봤음
		return mav;
	}
	
	@RequestMapping(value="insertPick.do")
	public ModelAndView insertPick(ModelAndView mav,HttpServletRequest request) {
		System.out.println("insert Pick");
		String id = ((UserVO)request.getSession(false).getAttribute("vo")).getId();
		String num_s = request.getParameter("num");
		if(num_s == null) {
			num_s = "1";
		}
		int num = Integer.parseInt(num_s);
		lessonService.insertPick(id,num);
		lessonService.updateLikeCnt();
		lessonService.updatePickCnt();
		mav.setViewName("/lnuser/pick");  // 그냥 보내봤음
		return mav;
	}
	
	@RequestMapping(value="insertLike.do")
	public ModelAndView insertLike(ModelAndView mav,HttpServletRequest request) {
		System.out.println("insert Like");
		String id = ((UserVO)request.getSession(false).getAttribute("vo")).getId();
		String num_s = request.getParameter("num");
		if(num_s == null) {
			num_s = "1";
		}
		int num = Integer.parseInt(num_s);
		lessonService.insertLike(id,num);
		lessonService.updateLikeCnt();
		lessonService.updatePickCnt();
		mav.setViewName("/lnuser/pick");  // 그냥 보내봤음
		return mav;
	}
	
	@RequestMapping(value="deleteLike.do")
	public ModelAndView deleteLike(ModelAndView mav,HttpServletRequest request) {
		System.out.println("delete Like");
		String id = ((UserVO)request.getSession(false).getAttribute("vo")).getId();
		String num_s = request.getParameter("num");
		if(num_s == null) {
			num_s = "1";
		}
		int num = Integer.parseInt(num_s);
		lessonService.deleteLike(id,num);
		mav.setViewName("/lnuser/pick");  // 그냥 보내봤음
		return mav;
	}
	
	@RequestMapping(value = "iWantToTeacher.do")
	public ModelAndView iWantToTeacher(ModelAndView mav,UserVO userVO,HttpServletRequest request) {
		String inputId = userVO.getId();
		String MD5 = userVO.getPassword();
		
		 //비밀번호 암호화(MD5)
       
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
		
		
		
		
		String inputPhone = userVO.getPhone();
		UserVO sessionUserVO = ((UserVO)request.getSession().getAttribute("vo"));
		String id = sessionUserVO.getId();
		String pw = sessionUserVO.getPassword();
		String phone = sessionUserVO.getPhone();
		if(inputId.equals(id) && MD5.equals(pw) && inputPhone.equals(phone)) {
			mav.addObject("result","강사 등록이 완료되었습니다.");
			
			userService.beTeacher(sessionUserVO);
			sessionUserVO.setTeacher("Y");
			request.getSession().setAttribute("vo",sessionUserVO);
		}else {
			mav.addObject("result","잘못된 입력입니다");
		}
		mav.setViewName("/ajax/iWantToTeacherAjax");
		return mav;
	}
	
	@RequestMapping(value="insertTeacher.go")
	public ModelAndView goInsertTeacher(ModelAndView mav,HttpServletRequest request) {
		System.out.println("go insertTeacher");
		mav.setViewName("/lnuser/insertTeacher");
		List<CategoryVO> categoryList = lessonService.getCategoryList();
		mav.addObject("categoryList",categoryList);
		 //알람 받기
		UserVO userVO = (UserVO)request.getSession().getAttribute("vo");
		if(userVO != null) {
			List<NotificationVO> notificationList = notificationService.getNotificationList(userVO);
			System.out.println(notificationList);
			System.out.println(">>"+notificationList.size());

			mav.addObject("notificationList", notificationList);
		}
		
		
		//admin 대문사진
	    ImgVO imgVO = adminService.getImgVO();
	    mav.addObject("imgVO" ,imgVO);
	    
		
		return mav;
	}
	
	@RequestMapping(value="lectureForm.go")
	   public ModelAndView goLectureForm(ModelAndView mav,HttpServletRequest request) {
	      System.out.println("go lectureForm");
	      List<CategoryVO> list =lessonService.getCategoryList();
	      mav.addObject("categoryList",list);
	      mav.setViewName("/lnuser/lectureForm");
	      
	    //알람 받기
		UserVO userVO = (UserVO)request.getSession().getAttribute("vo");
		if(userVO != null) {
			List<NotificationVO> notificationList = notificationService.getNotificationList(userVO);
			System.out.println(notificationList);
			System.out.println(">>"+notificationList.size());
			mav.addObject("notificationList", notificationList);
		}
	      
	      return mav;
	      
	 }
	
	@RequestMapping(value="makeLecture.do", method=RequestMethod.POST)
	   public ModelAndView makeLecture(@RequestParam("hidden1") String lecture,@RequestParam("hidden2") String curri,
@RequestParam("hidden3") String teacher,@RequestParam("right_info") String right_info,
@RequestParam("c_country") String c_country ,@RequestParam("profile_pt") MultipartFile profile_pt, ModelAndView mav, HttpServletRequest request ) {
	      
	      System.out.println("make Lecture");
	      // 돈 받기
	      String isFree = request.getParameter("isFree");
	      String price1 = request.getParameter("price1");
	      String price2 = request.getParameter("price2");
	      System.out.println(isFree + price1 + price2);
	      
	      System.out.println("lecture :"+lecture);
	      System.out.println("curri"+curri);
	      System.out.println("teacher : "+teacher);
	      System.out.println("right info : "+right_info);
	      System.out.println("c_country"+c_country);
	      String profile_pt_name= profile_pt.getOriginalFilename();
	      profile_pt_name = UUID.randomUUID().toString();
	      String id = ((UserVO)request.getSession().getAttribute("vo")).getId();
	      ServletContext context = request.getServletContext();
	      String saveDir = context.getRealPath("/resources/uploadedVideos/");
	      File file1 = new File(saveDir+profile_pt_name);
			try {
				profile_pt.transferTo(file1);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			LectureVO lectureVO = new LectureVO();
			lectureVO.setId(id);
			lectureVO.setCategory(c_country);
			lectureVO.setName(right_info);
			lectureVO.setThumnailPath(profile_pt_name);
			lectureVO.setContent1(lecture);
			lectureVO.setContent2(curri);
			lectureVO.setContent3(teacher);
			lectureVO.setContent4("qq");
			if(isFree.equals("Y")) {
				lectureVO.setPrice(0);
			}else {
				lectureVO.setPrice(Integer.parseInt(price1));
			}
			if(profile_pt.getOriginalFilename().equals("")) {
				lectureVO.setThumnailPath("default.jpg");
			}
	      lessonService.insertLecture(lectureVO);
	      System.out.println("saveDir : " + saveDir);
	         System.out.println("eeeeeeeeeeeeeee");
	//       String profile_pt = multi.getFilesystemName("profile_pt");
	       System.out.println("eeeeeeeeeeeeeee");
	       
	      mav.setViewName("redirect:/myPage.do");
	      return mav;
	   }
	
	
	@RequestMapping(value="lessonAjax.do")
	public ModelAndView lessonAjax(ModelAndView mav, HttpServletRequest request) {
		String lessonNum = request.getParameter("lessonNum");
		if(lessonNum == null) lessonNum = "1";
		
		LessonVO lessonVO = lessonService.getLesson(Integer.parseInt(lessonNum));
		List<LessonReplyVO> replyList = replyService.getLessonReplyList(Integer.parseInt(lessonNum));
		
		
		List<List<LessonReplyVO>> realReplyList =new ArrayList<>();
		
			
			System.out.println("총댓글  :" +replyList.size());
			List<LessonReplyVO> list = new ArrayList<>();
			for(LessonReplyVO rVO : replyList) {
				System.out.println("rvo num :" + rVO.getNum());
				if(rVO.getNum() == rVO.getRef()) {
					if(!list.isEmpty()) {
						
						realReplyList.add(list);
					}
					list = new ArrayList<>();
					list.add(rVO);
				}else {
					list.add(rVO);
				}
			}
			if(!list.isEmpty()) {
				realReplyList.add(list);
				list = new ArrayList<>();
			}
		
		
		
		mav.addObject("replyList",realReplyList);
		mav.addObject("lessonVO",lessonVO);
		mav.setViewName("/ajax/lessonAjax");
		return mav;
	}
	
	//강의 구매하기
		@Transactional
		@RequestMapping(value = "buyThisLecture.do")
		public ModelAndView buyThisLecture(ModelAndView mav , HttpServletRequest request) {
			
			System.out.println("buy This Lecture");
			String id = request.getParameter("id");
			String lectureNum_s = request.getParameter("lectureNum");
			String price =  request.getParameter("price");
			System.out.println("flag3");
			LectureVO lectureVO = lessonService.getLecture(Integer.parseInt(lectureNum_s));
			System.out.println("flag2");
			String sellerId  = lectureVO.getId();
			TradeListVO tradeListVO = new TradeListVO();
			tradeListVO.setBuyer(id);
			tradeListVO.setPrice(Integer.parseInt(price));
			tradeListVO.setSeller(sellerId);
			tradeListVO.setLectureNum(Integer.parseInt(lectureNum_s));
			System.out.println(id+lectureNum_s+price+sellerId);  //////
			
			tradeListService.userSellLecture(sellerId, Integer.parseInt(price));
			System.out.println("flag5");
			tradeListService.insertTradeList(tradeListVO);
			System.out.println("flag1");
			tradeListService.userBuyLecture(id, Integer.parseInt(price));
			System.out.println("flag4");
			
			//session 다시 설정
			UserVO userVO = new UserVO();
			userVO.setId(id);
			UserVO getUserVO = userService.getUser(userVO);
			request.getSession().setAttribute("vo", getUserVO);
			
			mav.setViewName("redirect:watchForm.go?lectureNum=" + lectureNum_s);
			return mav;
		}
}
