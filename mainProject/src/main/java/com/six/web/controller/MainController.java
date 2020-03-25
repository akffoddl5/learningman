package com.six.web.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.six.web.admin.AdminService;
import com.six.web.admin.ImgVO;
import com.six.web.admin.TermsVO;
import com.six.web.lesson.CategoryVO;
import com.six.web.lesson.LectureVO;
import com.six.web.lesson.LessonService;
import com.six.web.lesson.LessonVO;
import com.six.web.lesson.MyLectureListVO;
import com.six.web.lesson.SearchListVO;
import com.six.web.notification.NotificationService;
import com.six.web.notification.NotificationVO;
import com.six.web.pay.TradeListService;
import com.six.web.pay.TradeListVO;
import com.six.web.reply.LectureReplyVO;
import com.six.web.reply.LessonReplyVO;
import com.six.web.reply.ReplyService;
import com.six.web.user.UserService;
import com.six.web.user.UserVO;

@Controller
public class MainController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private LessonService lessonService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private NotificationService notificationService;
	@Autowired
	private TradeListService tradeListService;
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/index.do")
	public ModelAndView index(HttpServletRequest request, ModelAndView mav) {
		System.out.println("index exe");
		HttpSession session = request.getSession(false);
		UserVO userVO = null ;
		if(session ==null) {
			System.out.println("session 없음");
		}else {
			System.out.println("session 있음");
			String id = (String)session.getAttribute("id");
			userVO = ((UserVO)session.getAttribute("vo"));
		}
		int expressLecture = 4; // 메인에 몇개씩 표시할건지
		//인기
		List<CategoryVO> categoryList = lessonService.getCategoryList();
		List<LectureVO> categoryLectureList = lessonService.getCategoryLectureList(categoryList);
		if(categoryLectureList.size()<4) expressLecture = categoryLectureList.size();
		List<LectureVO> bestCategoryLectureList = new ArrayList<>();
		for(int i=0;i<expressLecture;i++) {
			bestCategoryLectureList.add(categoryLectureList.get(i));
		}
		
		mav.addObject("bestCategoryLectureList",bestCategoryLectureList);
		
		//신규
		
		System.out.println(categoryList.size());
		
		Collections.sort(categoryLectureList, new Comparator<LectureVO>() {
			@Override
			public int compare(LectureVO o1, LectureVO o2) {
				int recent = o1.getRegDate().compareTo(o2.getRegDate());
				if(recent <0) return 1;
				else if(recent >0) return -1;
				return 0;
			}
		});
		
		List<LectureVO> newCategoryLectureList = new ArrayList<>();
		for(int i=0;i<expressLecture;i++) {
			newCategoryLectureList.add(categoryLectureList.get(i));
		}
		mav.addObject("newCategoryLectureList",newCategoryLectureList);
		//알림
		if(userVO != null) {
			List<NotificationVO> notificationList = notificationService.getNotificationList(userVO);
			System.out.println(notificationList);
			System.out.println(">>"+notificationList.size());
			mav.addObject("notificationList", notificationList);
		}
		//추천 강의
	      Collections.sort(categoryLectureList, new Comparator<LectureVO>() {
	         @Override
	         public int compare(LectureVO o1, LectureVO o2) {
	            if(o1.getLikeCnt()<o2.getLikeCnt()) return 1;
	            else if(o1.getLikeCnt()>o2.getLikeCnt()) return -1;
	            else return 0;
	         }
	      });
	      
	      List<LectureVO> recommendCategoryLectureList = new ArrayList<>();
	      for(int i=0;i<expressLecture;i++) {
	         recommendCategoryLectureList.add(categoryLectureList.get(i));
	      }
	      mav.addObject("recommendCategoryLectureList",recommendCategoryLectureList);
		
	      
	    //admin 대문사진
	    ImgVO imgVO = adminService.getImgVO();
	    mav.addObject("imgVO" ,imgVO);
	    
		mav.addObject("categoryList",categoryList);
		mav.setViewName("/lnuser/index");
		return mav;
	}
	
	@RequestMapping(value = "/myPage.do")
	public ModelAndView getMyPage(ModelAndView mav,HttpSession session) {
		System.out.println("get myPage exe");
		System.out.println(((UserVO)(session.getAttribute("vo"))).toString());
		List<LectureVO> myLectureList = lessonService.getMyLectureList((UserVO)(session.getAttribute("vo")));
		List<LectureVO> myPickList = lessonService.getMyPickList((UserVO)(session.getAttribute("vo")));
		mav.addObject("myLectureList" , myLectureList);
		mav.addObject("myPickList",myPickList);
		System.out.println("myLectureList size : " + myLectureList.size());
		
		mav.setViewName("/lnuser/myPage");
		
		//내가 본 다른 강의
		List<MyLectureListVO> myHistoryLectureList = lessonService.getMyHistoryLectureList((UserVO)session.getAttribute("vo"));
		List<LectureVO> myHistoryLectureList2 = new ArrayList<>();
		for(MyLectureListVO mVO : myHistoryLectureList) {
			LectureVO lectureVO = lessonService.getLecture(mVO.getLectureNum());
			if(lectureVO != null)
			myHistoryLectureList2.add(lectureVO);
		}
		mav.addObject("myHistoryLecutreList",myHistoryLectureList2);
		
		
		//알람 받기
		UserVO userVO = (UserVO)session.getAttribute("vo");
		if(userVO != null) {
			List<NotificationVO> notificationList = notificationService.getNotificationList(userVO);
			System.out.println(notificationList);
			System.out.println(">>"+notificationList.size());
			mav.addObject("notificationList", notificationList);
		}

		return mav;
	}
	
	
	@RequestMapping(value="/loginForm.go")
	public ModelAndView  goLoginForm(ModelAndView mav) {
		System.out.println("go loginForm");
		mav.setViewName("/lnuser/loginForm");
		return mav;
	}
	
	@RequestMapping(value="/writeForm.go") //0307 writeForm 카테고리 불러오는 코드 추가
	public ModelAndView  goWriteForm(ModelAndView mav, HttpServletRequest request) {
		System.out.println("go writeForm");
		List<CategoryVO> categoryList = lessonService.getCategoryList();
		mav.addObject("categoryList",categoryList);
		mav.setViewName("/lnuser/writeForm");
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
	
	@RequestMapping(value="/joinForm.go")
	public ModelAndView  goJoinForm(ModelAndView mav) {
		System.out.println("go joinForm");
		mav.setViewName("/lnuser/joinForm");
		return mav;
	}
	
	@RequestMapping(value="/uploadForm.go")
	public ModelAndView goUploadForm(ModelAndView mav,HttpServletRequest request) {
		System.out.println("go uploadForm");
		String lectureNum = request.getParameter("lectureNum");
		String category = request.getParameter("category");
		mav.addObject("lectureNum",lectureNum);
		mav.addObject("category",category);
		mav.setViewName("/lnuser/uploadForm");
		
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
	@Transactional
	@RequestMapping(value="/watchForm.go")
	public ModelAndView goWatchForm(ModelAndView mav,HttpServletRequest request) {
		System.out.println("go watchForm");
		String lectureNum = request.getParameter("lectureNum");
		
		//강의 정보 가져오기
		LectureVO lectureVO = lessonService.getLecture(Integer.parseInt(lectureNum));
		mav.addObject("lectureVO",lectureVO);
		
		//조회수 증가   근데 lecture 조회수를 이떄 올리는게 맞을랑가 ( lecture.go 에서 올릴지 둘다 올릴지) lesson 조회수 할건지 말건지
		lessonService.lectureUpCount(lectureVO);
		
		
		//lesson reply 가져오기
		List<LessonVO> lessonList = lessonService.getLessonList(lectureVO);
		List<LessonReplyVO> replyList = null;
		List<List<LessonReplyVO>> realReplyList =new ArrayList<>();
		if(lessonList.size()!=0) {
			System.out.println("lesson 번호 :" + lessonList.get(0).getNum());
			replyList=replyService.getLessonReplyList(lessonList.get(0).getNum());
			
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
		}
		
		mav.addObject("lessonList",lessonList);
		mav.addObject("replyList",realReplyList);
		mav.setViewName("/lnuser/watchForm");
		
		//알람 받기
		UserVO userVO = (UserVO)request.getSession().getAttribute("vo");
		if(userVO != null) {
			List<NotificationVO> notificationList = notificationService.getNotificationList(userVO);
			System.out.println(notificationList);
			System.out.println(">>"+notificationList.size());
			mav.addObject("notificationList", notificationList);
		}
		
		//내 강의 리스트에 추가
				int lectureNum_n = Integer.parseInt(lectureNum);
				List<MyLectureListVO> myLectureListVOList = lessonService.getMyHistoryLectureList(userVO);
				boolean AlreadyContainMyList = false;
				for(MyLectureListVO mVO : myLectureListVOList) {
					if(mVO.getLectureNum() == lectureNum_n) AlreadyContainMyList= true;
				}
				if(!AlreadyContainMyList) {
					String myId = userVO.getId();
					lessonService.insertMyLectureList(myId, lectureNum_n);
				}
		
		
		
		return mav;
	}
	
	@RequestMapping(value="lecture.go")
	public ModelAndView goLecture(ModelAndView mav,HttpServletRequest request) {
		System.out.println("go lecture");
		
		//get lectureVO
		String lectureNum = request.getParameter("lectureNum");
		LectureVO lectureVO = lessonService.getLecture(Integer.parseInt(lectureNum));
		mav.addObject("lectureVO",lectureVO);
		
		//get lessonList
		List<LessonVO> lessonList = lessonService.getLessonList(lectureVO);
		mav.addObject("lessonList",lessonList);
		
		//get replyList
		List<LectureReplyVO> replyList = null;
		List<List<LectureReplyVO>> realReplyList =new ArrayList<>();
		
			replyList=replyService.getLectureReplyList(lectureVO.getNum());
			
			System.out.println("총댓글  :" +replyList.size());
			List<LectureReplyVO> list = new ArrayList<>();
			for(LectureReplyVO rVO : replyList) {
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
		
		//get pick and like T/F
		boolean pick = false;
		boolean like = false;
		UserVO userVO = (UserVO)request.getSession(false).getAttribute("vo");
		List<LectureVO> pickList = lessonService.getMyPickList(userVO);
		System.out.println("픽 몇개? :" +pickList.size());
		for(LectureVO lecVO : pickList) {
			if (lecVO.getNum() == lectureVO.getNum()) pick = true; 
		}
		
		//if(pickList.contains(lectureVO)) {
		if(pick) {
			mav.addObject("hePick","Y");
			System.out.println("이미 픽함");
		}else {
			System.out.println("픽안함");
			mav.addObject("hePick","N");
		}
		
		List<LectureVO> likeList = lessonService.getMyLikeList(userVO);
		System.out.println("좋아요 몇개? :" + likeList.size());
		for(LectureVO lecVO : likeList) {
			if (lecVO.getNum() == lectureVO.getNum()) like = true; 
		}
		//if(likeList.contains(lectureVO)) {
		if(like) {
			System.out.println("이미 좋아함");
			mav.addObject("heLike","Y");
		}else {
			System.out.println("안 좋아함");
			mav.addObject("heLike","N");
		}
		
		// is he teacher
		String teacher = request.getParameter("imTeacher");
		if(teacher == null) teacher = "N";
		mav.addObject("teacher",teacher);
		if(lectureVO.getId().equals(userVO.getId())) {
			mav.addObject("teacher","Y");
		}
		
		//강의 구매 확인
		
		TradeListVO tradeListVO = tradeListService.lectureBuyConfirm(userVO.getId(), Integer.parseInt(lectureNum));
		if(tradeListVO == null) {
			System.out.println("강의 결제 해야됨");
			
			mav.addObject("heBuy", "N");
		}else {
			System.out.println("이미 결제 함");
			mav.addObject("heBuy", "Y");

		}
		List<CategoryVO> categoryList = lessonService.getCategoryList();
		mav.addObject("categoryList",categoryList);
		
		mav.addObject("replyList",realReplyList);
		mav.setViewName("/lnuser/lecture");
		
		//알람 받기
		if(userVO != null) {
			List<NotificationVO> notificationList = notificationService.getNotificationList(userVO);
			System.out.println(notificationList);
			System.out.println(">>"+notificationList.size());
			mav.addObject("notificationList", notificationList);
		}
		
		//이 강사의 다른 강의
		UserVO teacherVO = new UserVO();
		teacherVO.setId(lectureVO.getId());
		List<LectureVO> difLectureList = lessonService.getMyLectureList(teacherVO);
		mav.addObject("difLectureList", difLectureList);
		
		System.out.println(difLectureList.size());
	
		//비슷한 강의 리스트
		CategoryVO categoryVO = new CategoryVO();
		categoryVO.setName(lectureVO.getCategory());
		List<LectureVO> similarLectureList = lessonService.getSimilarLectureList(categoryVO);
		mav.addObject("similarLectureList", similarLectureList);
		
		System.out.println(similarLectureList.size());
		return mav;
		
	}
	
	@RequestMapping(value="updateForm.go")
	public ModelAndView goUpdateForm(ModelAndView mav) {
		System.out.println("go updateForm");
		mav.setViewName("/lnuser/updateForm");
		return mav;
		
	}
	
	@RequestMapping(value="teacherLicense.go")
	public ModelAndView goTeacherLicense(ModelAndView mav,HttpServletRequest request) {
		System.out.println("go teacherLicense");
		mav.setViewName("/lnuser/teacherLicense");
		
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
	
	@RequestMapping(value="/bestForm.go")
	public ModelAndView goBestForm(ModelAndView mav, HttpServletRequest request) {
		System.out.println("go bestForm");
		List<CategoryVO> categoryList = lessonService.getCategoryList();
		System.out.println(categoryList.size());
		List<LectureVO> categoryLectureList = lessonService.getCategoryLectureList(categoryList);
		mav.addObject("categoryList",categoryList);
		mav.addObject("categoryLectureList",categoryLectureList);
		mav.setViewName("/lnuser/bestForm");
		
		//알림
		UserVO userVO = (UserVO)request.getSession().getAttribute("vo");
		if(userVO != null) {
			List<NotificationVO> notificationList = notificationService.getNotificationList(userVO);
			System.out.println(notificationList);
			System.out.println(">>"+notificationList.size());
			mav.addObject("notificationList", notificationList);
		}
		
		return mav;
		
		
	}
	
	@RequestMapping(value="/bestFormAjax.do")
	public ModelAndView getAjaxBestForm(ModelAndView mav,@RequestParam(value="categoryList[]") List<String> getList, 
			HttpServletRequest request) {
		
		System.out.println("get Ajax bestForm");
		System.out.println(getList);
		List<CategoryVO> categoryList = new ArrayList<>();
		for(String s : getList) {
			CategoryVO cVO = new CategoryVO();
			cVO.setName(s);
			categoryList.add(cVO);
		}
		System.out.println("선택한 카레고리 사이즈 : "+categoryList.size());
		List<LectureVO> categoryLectureList = lessonService.getCategoryLectureList(categoryList);
		System.out.println(categoryLectureList.size());

//		mav.addObject("categoryList",categoryList);
		mav.addObject("categoryLectureList",categoryLectureList);
		System.out.println("flag1");
		mav.setViewName("/ajax/bestFormAjax");
		System.out.println("flag2");
		
		return mav;
		
	}
	
	@RequestMapping(value="newForm.go")
	public ModelAndView goNewForm(ModelAndView mav, HttpServletRequest request) {
		System.out.println("go newForm");
		List<CategoryVO> categoryList = lessonService.getCategoryList();
		System.out.println(categoryList.size());
		List<LectureVO> categoryLectureList = lessonService.getCategoryLectureList(categoryList);
		Collections.sort(categoryLectureList, new Comparator<LectureVO>() {
			@Override
			public int compare(LectureVO o1, LectureVO o2) {
				int recent = o1.getRegDate().compareTo(o2.getRegDate());
				if(recent <0) return 1;
				else if(recent >0) return -1;
				return 0;
			}
		});
		//알림
		UserVO userVO = (UserVO)request.getSession().getAttribute("vo");
		if(userVO != null) {
			List<NotificationVO> notificationList = notificationService.getNotificationList(userVO);
			System.out.println(notificationList);
			System.out.println(">>"+notificationList.size());
			mav.addObject("notificationList", notificationList);
		}
		mav.addObject("categoryList",categoryList);
		mav.addObject("categoryLectureList",categoryLectureList);
		mav.setViewName("/lnuser/newForm");
		return mav;
		
	}
	
	@RequestMapping(value="/newFormAjax.do")
	public ModelAndView getAjaxNewForm(ModelAndView mav,@RequestParam(value="categoryList[]") List<String> getList, 
			HttpServletRequest request) {
		
		System.out.println("get Ajax newForm");
		System.out.println(getList);
		List<CategoryVO> categoryList = new ArrayList<>();
		for(String s : getList) {
			CategoryVO cVO = new CategoryVO();
			cVO.setName(s);
			categoryList.add(cVO);
		}
		System.out.println("선택한 카레고리 사이즈 : "+categoryList.size());
		List<LectureVO> categoryLectureList = lessonService.getCategoryLectureList(categoryList);
		Collections.sort(categoryLectureList, new Comparator<LectureVO>() {
			@Override
			public int compare(LectureVO o1, LectureVO o2) {
				int recent = o1.getRegDate().compareTo(o2.getRegDate());
				if(recent <0) return 1;
				else if(recent >0) return -1;
				return 0;
			}
		});
		System.out.println(categoryLectureList.size());
		
//		mav.addObject("categoryList",categoryList);
		mav.addObject("categoryLectureList",categoryLectureList);
		mav.setViewName("/ajax/bestFormAjax");  // best로 줘도대니까 ㅇㅇ
		
		return mav;
		
	}
	
	//0304 약관 동의 페이지 이동 추가
		@RequestMapping(value="/terms.do")
		public ModelAndView  goTerms(ModelAndView mav) {
			System.out.println("go Terms");
			
			List<TermsVO> termsList = adminService.getTerms();
			mav.addObject("termsList",termsList);
			
			mav.setViewName("/lnuser/terms");
			return mav;
		}
		

		   @RequestMapping(value ="searchKey.do")
		   public ModelAndView searchKey(ModelAndView mav , HttpServletRequest request){
		      System.out.println("searching..");
		      String keyWord = request.getParameter("keyWord");
		      List<LectureVO> searchedList = lessonService.searchKey(keyWord);
		      System.out.println(searchedList.size() + " 개 찾음");
		      mav.addObject("keyword",keyWord);
		      mav.addObject("searchedList",searchedList);
		      mav.setViewName("/ajax/searchAjax");
		      return mav;
		      
		   }
		   
		   @RequestMapping(value ="getSearchRank.do")
		   public ModelAndView getSearchRank(ModelAndView mav , HttpServletRequest request){
		      System.out.println("get Search Rank");
		      
		      List<SearchListVO> rankList = lessonService.getSearchRank();
		      mav.addObject("rankList",rankList);
		      mav.setViewName("/ajax/searchRankAjax");
		      return mav;
		      
		   }
		   
		   @RequestMapping(value ="getSearchHistory.do")
		   public ModelAndView getSearchHistory(ModelAndView mav , HttpServletRequest request, UserVO userVO){
		      System.out.println("get Search History");
		      List<SearchListVO> historyList = lessonService.getSearchHistory(userVO);
		      mav.addObject("historyList" , historyList);
		      mav.setViewName("/ajax/searchHistoryAjax");
		      return mav;
		      
		   }
		   
		   @RequestMapping(value ="deleteHistory.do")
		   public ModelAndView deleteHistory(ModelAndView mav, HttpServletRequest request) {
		      System.out.println("delete History");
		      try {
		         Thread.sleep(1000);
		      } catch (InterruptedException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }
		      UserVO userVO = (UserVO)request.getSession().getAttribute("vo");
		      if(userVO != null) {
		         lessonService.deleteHistory(userVO);
		      }
		      
		      mav.setViewName("/lnuser/index");
		      return mav;
		   }
		   @Transactional
		   @RequestMapping(value="searchClick.go")
		   public ModelAndView searchClick(ModelAndView mav,HttpServletRequest request) {
		      System.out.println("go searchClick");
		      String lectureNum = request.getParameter("lectureNum");
		      UserVO userVO = (UserVO)request.getSession().getAttribute("vo");
		      // by Search?
		            String keyword = request.getParameter("bySearch");
		            if((keyword != null) && (userVO !=null) ) {
		               System.out.println(">> 검색해서 들어옴");
		               SearchListVO inputSearchListVO = new SearchListVO();
		               inputSearchListVO.setId(userVO.getId());
		               inputSearchListVO.setKeyword(keyword);
		               inputSearchListVO.setLectureNum(Integer.parseInt(lectureNum));
		               lessonService.insertSearchHistory(inputSearchListVO);
		               
		               SearchListVO searchListVO = lessonService.getSearchRankOne(keyword);
		               if(searchListVO != null) {
		                  lessonService.searchUpCount(keyword);
		               }else {
		                  lessonService.insertSearchRank(keyword);
		               }
		               
		               
		            }
		      
		      
		      mav.setViewName("redirect:lecture.go?lectureNum="+lectureNum);
		      return mav;
		   }
		   
	
	
	
	
	
}
