package com.six.web.admin;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.WebSocketSession;

import com.six.web.answerBoard.AnswerBoardService;
import com.six.web.answerBoard.AnswerBoardVO;
import com.six.web.askBoard.AskBoardService;
import com.six.web.askBoard.AskBoardVO;
import com.six.web.controller.logExample;
import com.six.web.faqBoard.FaqBoardService;
import com.six.web.faqBoard.FaqBoardVO;
import com.six.web.lesson.CategoryVO;
import com.six.web.lesson.LectureVO;
import com.six.web.lesson.LessonService;
import com.six.web.lesson.LessonVO;
import com.six.web.noticeBoard.NoticeBoardService;
import com.six.web.noticeBoard.NoticeBoardVO;
import com.six.web.notification.NotificationVO;
import com.six.web.pay.PayListService;
import com.six.web.pay.PayListVO;
import com.six.web.pay.TradeListService;
import com.six.web.pay.TradeListVO;
import com.six.web.user.UserVO;
import com.six.web.websocket.ChatDTO;
import com.six.web.websocket.ChatService;
import com.six.web.websocket.WebSocket;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private AskBoardService askBoardService;

	@Autowired
	private NoticeBoardService noticeBoardService;

	@Autowired
	private FaqBoardService faqBoardService;

	@Autowired
	private AnswerBoardService answerBoardService;
	
	@Autowired
	private LessonService lessionService; 
	
	@Autowired
	private TradeListService tradeListService;
	
	@Autowired
	private PayListService payListService;
	
	@Autowired
	private ChatService chatService;
	
	private static final Logger logger = LoggerFactory.getLogger(logExample.class);
	// 관리자로그인화면
	@RequestMapping(value = "/insertAdmin.do")
	public ModelAndView insertAdmin(AdminVO adminVO, ModelAndView mav) {
		System.out.println("회원가입시작");
		boolean check = adminService.insertAdminCheck(adminVO);
		System.out.println(check);

		if (check) {
			mav.addObject("checkResult", "이미 사용 중인 아이디 입니다.");
			mav.setViewName("/lnadmin/adminPage/adminRegister");
			return mav;
		} else {
			try {
				adminService.insertAdmin(adminVO);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mav.setViewName("/lnadmin/loginPage/adminLogin");
			return mav;
		}

	}

	// 관리자로그인화면 이동
	@RequestMapping(value = "/adminLogin.go")
	public ModelAndView goAdminLogin(ModelAndView mav) {
		System.out.println("로그인화면출력");
		mav.setViewName("/lnadmin/loginPage/adminLogin");
		return mav;
	}

	// 관리자로그인처리
	@RequestMapping(value = "/adminLogin.do")
	public ModelAndView loginAdmin(AdminVO adminVO, ModelAndView mav, HttpServletRequest request) {
		System.out.println("아이디 패스워드입력 받은 후 login시작 ");
		int loginResult = adminService.loginAdmin(adminVO);
		System.out.println("adminService로부터 리턴: " + loginResult);

		if (loginResult == 0) {
			System.out.println("아이디 없음");
			mav.addObject("loginResult", "아이디가 없습니다..");
			mav.setViewName("/lnadmin/loginPage/adminLogin");
		} else if (loginResult == -1) {
			System.out.println("패스워드 틀림");
			mav.addObject("loginResult", "패스워드가 틀렸습니다.");
			mav.setViewName("/lnadmin/loginPage/adminLogin");
		} else {
			System.out.println("아이디 패스워드 일치");
			AdminVO getAdmin = adminService.getAdmin(adminVO);
			System.out.println("입력한 아이디 값으로 DB에서 받아온 값: " + getAdmin);
			System.out.println("세션만듬");
			HttpSession session = request.getSession();
			session.setAttribute("type", "admin");
			session.setAttribute("vo", getAdmin);
			System.out.println("메인화면 출력");
			AdminVO admin = new AdminVO();
			List<AdminVO> adMemberList = null;

			try {
				adMemberList = adminService.getAdminMemberList(admin);

			} catch (Exception e) {
				e.printStackTrace();
			}

			mav.addObject("adMemberList", adMemberList);
			mav.setViewName("/lnadmin/adminPage/adminIndex");
		}
		return mav;
	}

	// 메인화면이동
	@RequestMapping(value = "adminIndex.do")
	public ModelAndView goAdminIndex(ModelAndView mav) {
		System.out.println("메인화면 목록출력");
		AdminVO admin = new AdminVO();
		List<AdminVO> adMemberList = null;

		try {
			adMemberList = adminService.getAdminMemberList(admin);

		} catch (Exception e) {
			e.printStackTrace();
		}

		mav.addObject("adMemberList", adMemberList);
		mav.setViewName("/lnadmin/adminPage/adminIndex");
		return mav;

	}

	// 관리자로그아웃처리
	@RequestMapping(value = "adminLogout.do")
	public String logoutAdmin(HttpSession session) {
		System.out.println("로그아웃");
		System.out.println("세션종료");
		session.invalidate();
		return "/lnadmin/loginPage/adminLogin";
	}

	// 관리자등록화면이동
	@RequestMapping(value = "adminRegister.go")
	public ModelAndView goAdminRegister(ModelAndView mav) {
		System.out.println("관리자등록화면");
		mav.setViewName("/lnadmin/adminPage/adminRegister");
		return mav;

	}

	// 관리자목록화면
	@RequestMapping(value = "adminModify.do")
	public ModelAndView goAdminModify(ModelAndView mav) {
		System.out.println("등록관리자 목록");
		AdminVO admin = new AdminVO();
		List<AdminVO> adMemberList = null;

		try {
			adMemberList = adminService.getAdminMemberList(admin);
		} catch (Exception e) {
			e.printStackTrace();
		}

		mav.addObject("adMemberList", adMemberList);
		mav.setViewName("/lnadmin/adminPage/adminModify");
		return mav;

	}

	// 일반회원목록화면
	@RequestMapping(value = "memberModify.do")
	public ModelAndView getUserMemberList(ModelAndView mav) {
		System.out.println("일반회원목록 출력");
		UserVO userMember = new UserVO();
		List<UserVO> userMemberList = null;

		try {
			userMemberList = adminService.getUserMemberList(userMember);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.addObject("userMemberList", userMemberList);
		mav.setViewName("/lnadmin/adminPage/memberModify");
		return mav;
	}

	// 일반회원삭제
	@RequestMapping(value = "userMemberDelete.do")
	public ModelAndView userMemberDelete(ModelAndView mav,
			@RequestParam(value = "deleteUserMemberList[]") List<String> getUserMemberList,
			HttpServletRequest request) {
		System.out.println("일반회원삭제");
		System.out.println(getUserMemberList);
		logger.debug(request.getSession().getAttribute("vo")+" 가 일반회원삭제했음"+getUserMemberList);
		
		try {
			adminService.userMemberDelete(getUserMemberList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect:memberModify.do");
		return mav;
	}

	// 약관등록처리
	@RequestMapping(value = "insertTerms.do")
	public ModelAndView insertTerms(ModelAndView mav, TermsVO termsVO , HttpServletRequest request) {
		System.out.println("약관등록");
		logger.debug(request.getSession().getAttribute("vo")+" 가 terms 등록"+termsVO);
		adminService.insertTerms(termsVO);
		mav.setViewName("redirect:adminTermsList.do");
		return mav;
	}

	// 약관목록화면
	@RequestMapping(value = "adminTermsList.do")
	public ModelAndView getTermsList(ModelAndView mav) {
		System.out.println("Terms목록출력");
		TermsVO terms = new TermsVO();
		List<TermsVO> getTermsList = null;

		try {

			getTermsList = adminService.getTermsList(terms);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.addObject("getTermsList", getTermsList);
		mav.setViewName("/lnadmin/adminPage/adminTermsList");
		return mav;

	}

	// 약관내용출력화면
	@RequestMapping(value = "getTermsContent.do")
	public ModelAndView getTermsContent(ModelAndView mav, HttpServletRequest request) {
		System.out.println("약관내용받아오기");
		TermsVO terms = new TermsVO();
		terms.setTermsnum(Integer.parseInt(request.getParameter("num")));
		TermsVO getTerms = adminService.getTermsContent(terms);
		System.out.println(request.getParameter("num"));

		mav.addObject("termsVO", getTerms);
		mav.setViewName("/lnadmin/adminPage/adminTermsModify");
		return mav;
	}

	// 약관등록화면이동
	@RequestMapping(value = "adminTermsWriteForm.go")
	public ModelAndView goadminTermsWriteForm(ModelAndView mav) {

		System.out.println("약관등록화면이동");
		mav.setViewName("/lnadmin/adminPage/adminTermsWriteForm");

		return mav;

	}

	// 약관수정처리
	@RequestMapping(value = "modifyTerms.do")
	public ModelAndView modifyTerms(ModelAndView mav, TermsVO termsVO, HttpServletRequest request) {
		System.out.println("약관수정");
		System.out.println(request.getParameter("termsnum"));
		TermsVO mTerms = new TermsVO();
		mTerms.setTermsnum(Integer.parseInt(request.getParameter("termsnum")));
		mTerms.setTermsname(request.getParameter("termsname"));
		mTerms.setTermscontent(request.getParameter("termscontent"));
		adminService.modifyTerms(mTerms);
		mav.setViewName("redirect:adminTermsList.do");
		return mav;
	}

	// 약관삭제
	@RequestMapping(value = "termsDelete.do")
	public ModelAndView termsDelete(ModelAndView mav,
			@RequestParam(value = "deleteTermsList[]") List<String> deleteTermsList, HttpServletRequest request) {
		System.out.println("약관삭제");
		logger.debug(request.getSession().getAttribute("vo")+" 가 terms 삭제"+deleteTermsList);
		System.out.println(deleteTermsList);
		adminService.termsDelete(deleteTermsList);
		mav.setViewName("redirect:adminTermsList.do");
		return mav;
	}

	// FAQ목록화면
	@RequestMapping(value = "adminFaqBoard.do")
	public ModelAndView getAdminFaqBoard(ModelAndView mav) {
		System.out.println("FAQ목록출력");
		FaqBoardVO adminFaq = new FaqBoardVO();
		List<FaqBoardVO> adFaqBoardList = null;

		try {
			adFaqBoardList = adminService.getAdminFaqBoardList(adminFaq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(adFaqBoardList.size());
		mav.addObject("adFaqBoardList", adFaqBoardList);
		mav.setViewName("/lnadmin/boardPage/faqBoard");
		return mav;

	}

	// FAQ등록화면이동
	@RequestMapping(value = "faqWriteForm.go")
	public ModelAndView goFaqWriteForm(ModelAndView mav,HttpServletRequest request) {
		System.out.println("Faq새글작성");
		
		mav.setViewName("/lnadmin/boardPage/faqWriteForm");
		return mav;
	}

	// FAQ등록처리
	@RequestMapping(value = "insertFaqWrite.do")
	public ModelAndView insertFaqWriteForm(ModelAndView mav, HttpServletRequest request, FaqBoardVO faqBoardVO,
			HttpSession session) {
		System.out.println("faq등록하기");
		logger.debug(request.getSession().getAttribute("vo")+" 가 Faq 새글 작성" + faqBoardVO);
		System.out.println(faqBoardVO.getTitle());
		System.out.println(faqBoardVO.getContent());
		AdminVO adminVO = (AdminVO) session.getAttribute("vo");
		faqBoardVO.setWriter(adminVO.getId());
		System.out.println(adminVO.getId());
		adminService.insertfaqWrite(faqBoardVO);
		mav.setViewName("redirect:adminFaqBoard.do");

		return mav;

	}

	// FAQ수정화면이동
	@RequestMapping(value = "faqUpdateForm.go")
	public ModelAndView goFaqUpdateForm(ModelAndView mav, HttpServletRequest request, FaqBoardVO vo) {

		System.out.println("Faq 수정작성하기");
		String num_s = request.getParameter("num");
		int num = 0;
		if (num_s != null)
			num = Integer.parseInt(num_s);
		System.out.println("get num33333333 = " + vo.getNum());
		FaqBoardVO faqVO = faqBoardService.getBoard(vo);
		System.out.println(faqVO.getContent());
		mav.addObject("faqBoardVO", faqVO);
		mav.setViewName("/lnadmin/boardPage/faqUpdateForm");

		return mav;

	}

	// FAQ수정처리
	@RequestMapping(value = "updateFaqBoard.do")
	public ModelAndView updateFaqBoard(ModelAndView mav, HttpServletRequest request, FaqBoardVO vo) {
		System.out.println("faq수정처리");
		String num_s = request.getParameter("num");
		int num = 0;
		if (num_s != null)
			num = Integer.parseInt(num_s);
		System.out.println("get num = " + vo.getNum());
		adminService.updateFaqBoard(vo);
		mav.setViewName("redirect:adminFaqBoard.do");
		return mav;
	}

	// QNA목록화면
	@RequestMapping(value = "adminQnaBoard.do")
	public ModelAndView getAdminQnaBoard(ModelAndView mav) {
		System.out.println("Qna목록출력");
		AskBoardVO adminQna = new AskBoardVO();
		List<AskBoardVO> adQnaBoardList = null;
		try {
			adQnaBoardList = adminService.getAdminQnaBoardList(adminQna);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.addObject("adQnaBoardList", adQnaBoardList);
		mav.setViewName("/lnadmin/boardPage/qnaBoard");
		return mav;
	}

	//QNA답글등록
	@RequestMapping(value = "adminQnaContent.do")
	public ModelAndView adminQnaContent(ModelAndView mav, HttpServletRequest request, AskBoardVO vo) {

		System.out.println("Qna답글달기");
		String num_s = request.getParameter("num");
		int num = 0;
		if (num_s != null)
			num = Integer.parseInt(num_s);
		System.out.println("get num = " + vo.getNum());
		AskBoardVO askBoardVO = askBoardService.getBoard(vo);
		System.out.println(askBoardVO.getContent() + ";" + askBoardVO.getTitle());
		mav.addObject("AskBoardVO", askBoardVO);
		mav.setViewName("/lnadmin/boardPage/qnaContent");

		return mav;

	}

	//QNA답글보기
	@RequestMapping(value = "adminQnaAnswerContent.do")
	public ModelAndView adminQnaAnswerContent(ModelAndView mav, HttpServletRequest request, AskBoardVO vo) {

		System.out.println("qna답글보기");
		String num_s = request.getParameter("num");
		int num = 0;
		if (num_s != null)
			num = Integer.parseInt(num_s);
		System.out.println("get num = " + vo.getNum());
		AskBoardVO askBoardVO = askBoardService.getAnswerBoard(vo);
		System.out.println(askBoardVO.getWriter() + askBoardVO.getContent() + ";" + askBoardVO.getTitle());
		mav.addObject("AskBoardVO", askBoardVO);
		mav.setViewName("/lnadmin/boardPage/qnaAnswerContent");

		return mav;

	}

	//공지사항등록화면
	@RequestMapping(value = "noticeWriteForm.go")
	public ModelAndView goNoticeWriteForm(ModelAndView mav) {

		System.out.println("공지사항등록화면이동");
		mav.setViewName("/lnadmin/boardPage/noticeWriteForm");

		return mav;

	}

	//공지사항수정화면
	@RequestMapping(value = "noticeUpdateForm.go")
	public ModelAndView goNoticeUpdateForm(ModelAndView mav, HttpServletRequest request, NoticeBoardVO vo) {

		System.out.println("공지사항 수정화면");
		String num_s = request.getParameter("num");
		int num = 0;
		if (num_s != null)
			num = Integer.parseInt(num_s);
		System.out.println("get num = " + vo.getNum());
		NoticeBoardVO noticeBoardVO = noticeBoardService.getBoard(vo);
		System.out.println(noticeBoardVO.getContent() + ";" + noticeBoardVO.getTitle());
		mav.addObject("noticeBoardVO", noticeBoardVO);
		mav.setViewName("/lnadmin/boardPage/noticeUpdateForm");

		return mav;

	}

	//공지사항 수정처리
	@RequestMapping(value = "updateNoticeBoard.do")
	public ModelAndView updateNoticeBoard(ModelAndView mav, HttpServletRequest request, NoticeBoardVO vo) {

		System.out.println("공지사항수정처리");
		String num_s = request.getParameter("num");
		int num = 0;
		if (num_s != null)
			num = Integer.parseInt(num_s);
		System.out.println("get num = " + vo.getNum());
		adminService.updateNoticeBoard(vo);
		mav.setViewName("redirect:adminNoticeBoard.do");

		return mav;

	}

	//공지사항목록화면
	@RequestMapping(value = "adminNoticeBoard.do")
	public ModelAndView goAdminNoticeBoard(ModelAndView mav) {
		System.out.println("공지사항목록출력");
		NoticeBoardVO adminNotice = new NoticeBoardVO();
		List<NoticeBoardVO> adNoticeBoardList = null;

		try {
			System.out.println(adminNotice);
			adNoticeBoardList = adminService.getAdminNoticeBoardList(adminNotice);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(adNoticeBoardList.size());
		mav.addObject("adNoticeBoardList", adNoticeBoardList);
		mav.setViewName("/lnadmin/boardPage/noticeBoard");
		return mav;

	}

	//공지사항등록처리
	@RequestMapping(value = "insertNoticeBoard.do")
	public ModelAndView insertNoticeBoard(ModelAndView mav, HttpServletRequest request, HttpSession session,
			NoticeBoardVO noticeBoardVO) {
		System.out.println("공지사항등록처리");
		logger.debug(request.getSession().getAttribute("vo")+" 가 공지사항 새글 작성"+noticeBoardVO);
		AdminVO adminVO = (AdminVO) session.getAttribute("vo");
		noticeBoardVO.setWriter(adminVO.getId());
		System.out.println(adminVO.getId());
		System.out.println(noticeBoardVO.getTitle());
		System.out.println(noticeBoardVO.getContent());
		adminService.insertNoticeBoard(noticeBoardVO);
		
		// notice alarm
		NotificationVO notificationVO = new NotificationVO();
		notificationVO.setContent("새로운 공지를 확인하세요.");
		notificationVO.setUrl("notice.do");
		
		List<UserVO> userList = adminService.getUserMemberList(new UserVO());
		for(UserVO userVO : userList) {
			notificationVO.setId(userVO.getId());
			adminService.noticeAlarm(notificationVO);
		}
		mav.setViewName("redirect:adminNoticeBoard.do");
		return mav;
	}

	//공지사항 삭제처리
	@RequestMapping(value = "deleteNoticeBoard.do")
	public ModelAndView deleteNoticeBoard(ModelAndView mav, @RequestParam(value = "deleteList[]") List<String> getList,
			HttpServletRequest request) {
		System.out.println("공지사항 삭제");
		logger.debug(request.getSession().getAttribute("vo")+" 가 공지사항 삭제"+getList);
		System.out.println(getList);
		adminService.deleteNoticeBoard(getList);
		mav.setViewName("redirect:adminNoticeBoard.do");
		return mav;
	}

	//faq삭제처리
	@RequestMapping(value = "deleteFaqBoard.do")
	public ModelAndView deleteFaqBoard(ModelAndView mav,
			@RequestParam(value = "deleteFaqList[]") List<String> getFaqList, HttpServletRequest request) {
		System.out.println("faq삭제처리");
		logger.debug(request.getSession().getAttribute("vo")+" 가 Faq삭제" + getFaqList);
		System.out.println(getFaqList);
		adminService.deleteFaqBoard(getFaqList);
		mav.setViewName("redirect:adminFaqBoard.do");
		return mav;
	}

	//qna 삭제처리
	@RequestMapping(value = "deleteQnaBoard.do")
	public ModelAndView deleteQnaBoard(ModelAndView mav,
			@RequestParam(value = "deleteQnaList[]") List<String> getQnaList, HttpServletRequest request) {
		System.out.println("delete QnaBoard");
		logger.debug(request.getSession().getAttribute("vo")+" 가 qna 삭제" + getQnaList);
		System.out.println(getQnaList);
		adminService.deleteQnaBoard(getQnaList);
		mav.setViewName("redirect:adminQnaBoard.do");
		return mav;
	}

	//qna 답글삭제처리
	@RequestMapping(value = "deleteQnaAnswerBoard.do")
	public ModelAndView deleteQnaAnswerBoard(ModelAndView mav, HttpServletRequest request) {
		System.out.println("delete QnaBoard's Answer");
		String num_s = request.getParameter("num");
		logger.debug(request.getSession().getAttribute("vo")+" 가 answerBoard 삭제" + num_s );
		int num = Integer.parseInt(num_s);
		adminService.deleteQnaAnswerBoard(num);
		mav.setViewName("redirect:adminQnaBoard.do");
		return mav;
	}

	//qna답글등록
	@RequestMapping(value = "qnaAnswerContent.do")
	public ModelAndView adminQnaContent(ModelAndView mav, HttpServletRequest request, AnswerBoardVO vo,
			HttpSession session) {
		System.out.println(" QnaBoard");
		String answerQna = request.getParameter("answer");
		System.out.println(answerQna);
		vo.setContent(answerQna);
		vo.setId(((AdminVO) session.getAttribute("vo")).getId());
		vo.setTitle(request.getParameter("kkk"));
		answerBoardService.insertAnswerQna(vo);
		
		AnswerBoardVO getAnsBoardVO2 = answerBoardService.getBoard2(vo);
		int insertedNumber = getAnsBoardVO2.getNum();
		
		//답변 알람
		NotificationVO notificationVO = new NotificationVO();
		
		int ref = vo.getRef();
		notificationVO.setContent("내 질문에 답글이 달렸습니다.");
		AskBoardVO askBoardVO = new AskBoardVO();
		askBoardVO.setNum(ref);
		String questioner = askBoardService.getBoard(askBoardVO).getWriter();
		notificationVO.setId(questioner);
		notificationVO.setUrl("getAnswerBoard.do?num="+insertedNumber);
		adminService.answerAlarm(notificationVO);
		mav.setViewName("redirect:adminQnaBoard.do");
		return mav;
	}

	// lesson(동영상) 목록화면
	@RequestMapping(value = "videoBoard.do")
	public ModelAndView getVideoBoard(ModelAndView mav, HttpServletRequest request) {
		System.out.println("getVideoBoard");
		LessonVO vo = new LessonVO();
		List<LessonVO> adLessonList = adminService.getAdminLessonList(vo);
		System.out.println(adLessonList.size());
		mav.addObject("lessonList", adLessonList);
		mav.setViewName("/lnadmin/boardPage/videoBoard");
		return mav;
	}

	//동영상 삭제처리
	@RequestMapping(value = "updateVideoBoard.do")
	public ModelAndView updateVideoBoard(ModelAndView mav,
			@RequestParam(value = "updateVideoList[]") List<String> getVideoList, HttpServletRequest request) {
		System.out.println("update VideoBoard");
		System.out.println(getVideoList);
		adminService.updateVideoBoard(getVideoList);
		System.out.println(getVideoList.size());
		mav.setViewName("redirect:/videoBoard.do");
		return mav;
	}

	//강의실 목록화면
	@RequestMapping(value = "classBoard.do")
	public ModelAndView getclassBoard(ModelAndView mav, HttpServletRequest request) {
		System.out.println("get classBoard.do");
		LectureVO vo = new LectureVO();
		List<LectureVO> adLectureList = adminService.getAdminLectureList(vo);
		mav.addObject("adLectureList", adLectureList);
		System.out.println(adLectureList.size());
		mav.setViewName("/lnadmin/boardPage/classBoard");
		return mav;
	}

	// 강의게시글 삭제 처리
	@RequestMapping(value = "updateClassBoard.do")
	public ModelAndView deleteClassBoard(ModelAndView mav, HttpServletRequest request,
			@RequestParam(value = "updateClassList[]") List<String> getLectureList) {
		System.out.println("update updateClassBoard.do");
		
		for(String s: getLectureList) {
			
			System.out.println(">"+s+"<");
		}
		adminService.updateClassBoard(getLectureList);
		System.out.println("---> " + getLectureList.size());

		mav.setViewName("redirect:classBoard.do");
		return mav;
	}
	
//형꺼 admin 합친거
	// 카테고리목록화면
			@RequestMapping(value = "categoryList.do")
			public ModelAndView getCaterogyList(ModelAndView mav) {
				System.out.println("카테고리목록 출력");
				CategoryVO adminCategory = new CategoryVO();
				List<CategoryVO> categoryList = null;

				try {
					categoryList = lessionService.getCategoryList();
				} catch (Exception e) {
					e.printStackTrace();
				}
				mav.addObject("categoryList", categoryList);
				mav.setViewName("/lnadmin/category_screenPage/categoryList");
				return mav;
			}
		
			//카테고리등록화면이동
			@RequestMapping(value = "categoryWriteForm.go")
			public ModelAndView goCategoryWriteForm(ModelAndView mav) {

				System.out.println("카테고리등록화면이동");
				mav.setViewName("/lnadmin/category_screenPage/categoryWriteForm");

				return mav;
			}
			
			//카테고리 등록처리
			@RequestMapping(value="insertCategory.do")
			public ModelAndView insertCategory(ModelAndView mav, CategoryVO categoryVO , HttpServletRequest request) {
				System.out.println("카테고리 등록");
				logger.debug(request.getSession().getAttribute("vo")+" 가 category 작성" + categoryVO);
				adminService.insertCategory(categoryVO);
				mav.setViewName("redirect:categoryList.do");
				return mav;
			}
			
			//카테고리명
			@RequestMapping(value = "getCategoryName.do")
			public ModelAndView getCategoryName(ModelAndView mav, HttpServletRequest request) {
				System.out.println("카테고리명 받아오기");
				CategoryVO categoryName = new CategoryVO();
				categoryName.setName(request.getParameter("name"));
				CategoryVO getName = adminService.getCategoryName(categoryName);
				System.out.println(request.getParameter("name"));

				mav.addObject("categoryVO", getName);
				mav.setViewName("/lnadmin/category_screenPage/categoryModifyForm");
				return mav;
			}
			
			//카테고리 삭제처리
			@RequestMapping(value = "deleteCategory.do")
			public ModelAndView deleteCategory(ModelAndView mav, HttpServletRequest request) {
				System.out.println("delete Category");
				String name = request.getParameter("name");
				logger.debug(request.getSession().getAttribute("vo")+" 가 category 삭제" + name);
				adminService.deleteCategory(name);
				mav.setViewName("redirect:categoryList.do");
				return mav;
			}
			
			
			
			@RequestMapping(value = "mainImgUpload.go")
			public ModelAndView goMainImgUpload(ModelAndView mav) {
				System.out.println("메인사진수정화면이동");
				mav.setViewName("/lnadmin/userImgPage/mainImgUpload");
				return mav;
			}
			
			@RequestMapping(value = "newImgUpload.go")
			public ModelAndView goNewImgUpload(ModelAndView mav) {
				System.out.println("신규사진수정화면이동");
				mav.setViewName("/lnadmin/userImgPage/newImgUpload");
				return mav;
			}
			
			@RequestMapping(value = "teacherImgUpload.go")
			public ModelAndView goTeacherImgUpload(ModelAndView mav) {
				System.out.println("강사지원사진수정화면이동");
				mav.setViewName("/lnadmin/userImgPage/teacherImgUpload");
				return mav;
			}

			// 메인이미지 업로드 처리
			@RequestMapping(value = "updateMainImage.do")
			public ModelAndView updateMainImage(ModelAndView mav, @RequestParam("imageFile1") MultipartFile imageFile1,
					ImgVO imgVO, HttpServletRequest request) {
				System.out.println("update main image");
				String imageName1 = imageFile1.getOriginalFilename();
				logger.debug(request.getSession().getAttribute("vo")+" 가 main 이미지 올림"+imageName1);
				ServletContext context = request.getServletContext();
				String saveDir = context.getRealPath("/resources/uploadedVideos/");
				File file1 = new File(saveDir + imageName1);

				try {
					imageFile1.transferTo(file1);

				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				System.out.println(saveDir + imageName1);

				ImgVO img2VO = new ImgVO();
				img2VO.setImgmain(imageName1);
				adminService.updateMainImage(img2VO);
				mav.setViewName("redirect:/mainImgUpload.go");

				return mav;
			}
					
			// 메인이미지 업로드 처리
			@RequestMapping(value = "updateNewImage.do")
			public ModelAndView updateNewImage(ModelAndView mav, @RequestParam("imageFile2") MultipartFile imageFile2,
					ImgVO imgVO, HttpServletRequest request) {
				System.out.println("update new image");
				String imageName2 = imageFile2.getOriginalFilename();
				
				ServletContext context = request.getServletContext();
				String saveDir = context.getRealPath("/resources/uploadedVideos/");
				File file2 = new File(saveDir + imageName2);
				
				try {
					imageFile2.transferTo(file2);
					
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				System.out.println(saveDir + imageName2);

				ImgVO img2VO = new ImgVO();
				img2VO.setImgnew(imageName2);
				adminService.updateNewImage(img2VO);
				mav.setViewName("redirect:/newImgUpload.go");

				return mav;
			}

			// 메인이미지 업로드 처리
			@RequestMapping(value = "updateTecherImage.do")
			public ModelAndView updateTeacherImage(ModelAndView mav, @RequestParam("imageFile3") MultipartFile imageFile3,
					ImgVO imgVO, HttpServletRequest request) {
				System.out.println("update teacher image");
				String imageName3 = imageFile3.getOriginalFilename();
				
				ServletContext context = request.getServletContext();
				String saveDir = context.getRealPath("/resources/uploadedVideos/");
				File file3 = new File(saveDir + imageName3);

				try {
					imageFile3.transferTo(file3);
					
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				System.out.println(saveDir + imageName3);

				ImgVO img2VO = new ImgVO();
				img2VO.setImgteacher(imageName3);
				adminService.updateTeacherImage(img2VO);
				mav.setViewName("redirect:/newImgUpload.go");
				
				return mav;
			}
	
	@RequestMapping(value = "chatSituation.go")
	   public ModelAndView chatSituation(ModelAndView mav) {
	      System.out.println("go chatsituation");
	      Map<WebSocketSession, Set<WebSocketSession>> roomList = WebSocket.roomList;
	      Map<WebSocketSession , List<String>> sessionInfoList =  WebSocket.sessionInfoList;
	      Set<String> chattingUserList = new HashSet<>();
	      //List<String> chattingUserList = new ArrayList<>();
	      for(WebSocketSession wSession : roomList.keySet()) {
	         chattingUserList.add(sessionInfoList.get(wSession).get(0));
	      }
	      
	      
	      
	      System.out.println("chaatingUser num : " + chattingUserList.size());
	      
	      List<ChatDTO> chatList = chatService.getChatList();
	      System.out.println("---->" +chatList.get(0).getUserId() + "---->" + chatList.get(0).getAdminId());
	      mav.addObject("chatList",chatList);
	      mav.addObject("chattingUserList",chattingUserList);
	      mav.setViewName("/lnadmin/adminPage/chatSituation");
	      return mav;
	      
	   }
	
	@RequestMapping(value="memberTradeList.go")
	public ModelAndView goMemberTradeList(ModelAndView mav) {
		System.out.println("MemberTradeList exe");
		TradeListVO tradeListVO = new TradeListVO();
		List<TradeListVO> memberTradeList = null;
		try {
			memberTradeList = tradeListService.getMemberTradeList(tradeListVO);
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(memberTradeList.size());
		mav.addObject("MemberTradeList", memberTradeList);
		mav.setViewName("/lnadmin/adminPage/memberTradeList");
		return mav;
	}
	
	@RequestMapping(value="memberPayList.go")
	public ModelAndView goMemberAllPayList(ModelAndView mav) {
		System.out.println("MemberPayList");
		PayListVO payListVO = new PayListVO();
		List<PayListVO> memberAllPayList = null;
		try {
			memberAllPayList = adminService.getAllPayList(payListVO);
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.addObject("memberAllPayList", memberAllPayList);
		mav.setViewName("/lnadmin/adminPage/memberPayList");
		
		return mav;
	}
	
	//회원수 뿌려주기
			@RequestMapping(value="memberChart.do")
			public ModelAndView getMemberCount(ModelAndView mav) {
				System.out.println("get MemberChart");
				
				String memberCount = adminService.getMemberCount();
				String teacherMemberCount = adminService.getMemberTeacherCount();
				String siteMemberCount = adminService.getMemberSiteCount();
				String kakaoMemberCount = adminService.getMemberKakaoCount();
				String naverMemberCount = adminService.getMemberNaverCount();
				System.out.println(memberCount+"/"+teacherMemberCount+"/"+siteMemberCount+"/"+kakaoMemberCount+"/"+naverMemberCount);

				
				mav.addObject("memberCount",memberCount);
				mav.addObject("teacherMemberCount",teacherMemberCount);
				mav.addObject("siteMemberCount",siteMemberCount);
				mav.addObject("kakaoMemberCount",kakaoMemberCount);
				mav.addObject("naverMemberCount",naverMemberCount);
				mav.setViewName("/lnadmin/chartPage/memberChart");
				return mav;
			}
			
			@RequestMapping(value="memberDateChart.do", method=RequestMethod.POST)
			public ModelAndView getMemberDateChart(ModelAndView mav, HttpServletRequest request) {
				System.out.println("차트시작");
				String memberCount = adminService.getMemberCount();
				String teacherMemberCount = adminService.getMemberTeacherCount();
				String siteMemberCount = adminService.getMemberSiteCount();
				String kakaoMemberCount = adminService.getMemberKakaoCount();
				String naverMemberCount = adminService.getMemberNaverCount();
				
				
				String stDate = request.getParameter("startDate");
				String edDate = request.getParameter("endDate");
				List<DateCountVO> countList = new ArrayList<DateCountVO>();
				
				try {
					final String DATE_PATTERN = "yyyyMMdd";
					String inputStartDate = stDate;
					String inputEndDate = edDate;
					SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
					Date startDate = sdf.parse(inputStartDate);
					Date endDate = sdf.parse(inputEndDate);
					ArrayList<String> dates = new ArrayList<String>();
					Date currentDate = startDate;
					while (currentDate.compareTo(endDate) <= 0) {
		            dates.add(sdf.format(currentDate));
		            Calendar c = Calendar.getInstance();
		            c.setTime(currentDate);
		            c.add(Calendar.DAY_OF_MONTH, 1);
		            currentDate = c.getTime();
		        }
					for (String date : dates) {
						System.out.println(date);
						DateCountVO datecountVO = new DateCountVO();
						datecountVO.setDate(date);
						
						datecountVO.setNormalCount(adminService.getDateCount(date));
						datecountVO.setKakaoCount(adminService.getKakaoDateCount(date));
						datecountVO.setNaverCount(adminService.getNaverDateCount(date));
						countList.add(datecountVO);
					}

				}catch(Exception e) {
					e.printStackTrace();
				}
				mav.addObject("allCountSize",countList.size());
				mav.addObject("allCount", countList);
				mav.addObject("memberCount",memberCount);
				mav.addObject("teacherMemberCount",teacherMemberCount);
				mav.addObject("siteMemberCount",siteMemberCount);
				mav.addObject("kakaoMemberCount",kakaoMemberCount);
				mav.addObject("naverMemberCount",naverMemberCount);
				
				mav.setViewName("/lnadmin/chartPage/memberChart");
				return mav;
				
			}

			
			@RequestMapping(value="salesChart.go")
			public ModelAndView goSalesChart(ModelAndView mav) {
				System.out.println("go salesChart");
				
				int totalPay = adminService.getTotalPay();
				int totalUsePoint = adminService.getTotalUsePoint();
				int restPoint = totalPay-totalUsePoint;
				
				int allMemberCount = Integer.parseInt(adminService.getMemberCount());
				int payMemberCount = Integer.parseInt(adminService.getPayMemberCount());
				int nonPayMemberCount = allMemberCount-payMemberCount;
				System.out.println(allMemberCount+"/"+payMemberCount+"/"+nonPayMemberCount);
				double A = ((payMemberCount*100.0)/(allMemberCount*100.0))*100;
				double B = ((nonPayMemberCount*100.0)/(allMemberCount*100.0))*100;
				
				int totalAllPay = adminService.getTotalPay();
				double C = (totalAllPay*100.0)/(payMemberCount*100.0);
				
				int allPayCount = Integer.parseInt(adminService.getAllPayCount());
				double D = (totalAllPay/allPayCount);
				System.out.println(A+"/"+B+"/"+C+"/"+D);
				
				CategoryVO categoryVO = new CategoryVO(); 
				List<CategoryVO> categoryName = null;

				categoryName = adminService.getAllCategoryName(categoryVO);

				System.out.println(categoryName);
				ArrayList<String> categoryname = new ArrayList();
				System.out.println(categoryName.size());
				for(int i=0; i<categoryName.size(); i++) {
					categoryname.add(i, categoryName.get(i).getName());
				}
				System.out.println(categoryname);
				
				List<CategorySalesVO> categorySales = new ArrayList<CategorySalesVO>();
				for(String nameList:categoryname) {
					CategorySalesVO categorysalesVO = new CategorySalesVO();
					categorysalesVO.setName(nameList);
					categorysalesVO.setSales(adminService.getSumCategory(nameList));
					categorySales.add(categorysalesVO);
				}
				System.out.println(categorySales);
				
				mav.addObject("categorySales",categorySales);
				mav.addObject("A",A);
				mav.addObject("B",B);
				mav.addObject("C",C);
				mav.addObject("D",D);
				mav.addObject("totalAllPay",totalAllPay);
				mav.addObject("allMemberCount",allMemberCount);
				mav.addObject("payMemberCount",payMemberCount);
				mav.addObject("nonPayMemberCount", nonPayMemberCount);
				mav.addObject("totalPay",totalPay);
				mav.addObject("totalUsePoint",totalUsePoint);
				mav.addObject("restPoint",restPoint);
				mav.setViewName("/lnadmin/chartPage/salesChart");
				
				return mav;
			}
			
			@RequestMapping(value="salesDateChart.do")
			public ModelAndView getSalesDateChart(ModelAndView mav, HttpServletRequest request) {
				System.out.println("date sales");
				
				int totalPay = adminService.getTotalPay();
				int totalUsePoint = adminService.getTotalUsePoint();
				int restPoint = totalPay-totalUsePoint;
				int allMemberCount = Integer.parseInt(adminService.getMemberCount());
				int payMemberCount = Integer.parseInt(adminService.getPayMemberCount());
				int nonPayMemberCount = allMemberCount-payMemberCount;
				int sumSales = 0;
				int sumMembers = 0; 
				double A = ((payMemberCount*100.0)/(allMemberCount*100.0))*100;
				double B = ((nonPayMemberCount*100.0)/(allMemberCount*100.0))*100;
				
				int totalAllPay = adminService.getTotalPay();
				double C =totalAllPay/payMemberCount;
				
				int allPayCount = Integer.parseInt(adminService.getAllPayCount());
				double D = totalAllPay/allPayCount;
				String stDate = request.getParameter("startDate");
				String edDate = request.getParameter("endDate");
				List<DateSalesVO> salesList = new ArrayList<DateSalesVO>();
				List<SumSalesVO> sumSalesList= new ArrayList<SumSalesVO>();
				
				try {
					final String DATE_PATTERN = "yyyyMMdd";
					String inputStartDate = stDate;
					String inputEndDate = edDate;
					SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
					Date startDate = sdf.parse(inputStartDate);
					Date endDate = sdf.parse(inputEndDate);
					ArrayList<String> dates = new ArrayList<String>();
					Date currentDate = startDate;
					while (currentDate.compareTo(endDate) <= 0) {
		            dates.add(sdf.format(currentDate));
		            Calendar c = Calendar.getInstance();
		            c.setTime(currentDate);
		            c.add(Calendar.DAY_OF_MONTH, 1);
		            currentDate = c.getTime();
		        }
					for (String date : dates) {
						System.out.println(date);
						DateSalesVO datesalesVO = new DateSalesVO();
						datesalesVO.setDate(date);
						datesalesVO.setPaycount(adminService.getPayCount(date));
						datesalesVO.setTotalpay(adminService.getDateSales(date));
						salesList.add(datesalesVO);
						
						SumSalesVO sumsalesVO = new SumSalesVO();
						
						sumSales += Integer.parseInt(adminService.getDateSales(date));
						
						sumMembers += Integer.parseInt(adminService.getDateCount(date))+Integer.parseInt(adminService.getKakaoDateCount(date))
									+Integer.parseInt(adminService.getNaverDateCount(date));
						sumsalesVO.setDate(date);
						sumsalesVO.setSumSales(sumSales);
						sumsalesVO.setSumMembers(sumMembers);
						sumSalesList.add(sumsalesVO);
						
					}

				}catch(Exception e) {
					e.printStackTrace();
				}
				CategoryVO categoryVO = new CategoryVO(); 
				List<CategoryVO> categoryName = null;

				categoryName = adminService.getAllCategoryName(categoryVO);

				System.out.println(categoryName);
				ArrayList<String> categoryname = new ArrayList();
				System.out.println(categoryName.size());
				for(int i=0; i<categoryName.size(); i++) {
					categoryname.add(i, categoryName.get(i).getName());
				}
				System.out.println(categoryname);
				
				List<CategorySalesVO> categorySales = new ArrayList<CategorySalesVO>();
				for(String nameList:categoryname) {
					CategorySalesVO categorysalesVO = new CategorySalesVO();
					categorysalesVO.setName(nameList);
					categorysalesVO.setSales(adminService.getSumCategory(nameList));
					categorySales.add(categorysalesVO);
				}
				System.out.println(categorySales);
				
				mav.addObject("categorySales",categorySales);
				
				mav.addObject("A",A);
				mav.addObject("B",B);
				mav.addObject("C",C);
				mav.addObject("D",D);
				mav.addObject("totalAllPay",totalAllPay);
				mav.addObject("allMemberCount",allMemberCount);
				mav.addObject("payMemberCount",payMemberCount);
				mav.addObject("nonPayMemberCount", nonPayMemberCount);
				mav.addObject("totalPay",totalPay);
				mav.addObject("totalUsePoint",totalUsePoint);
				mav.addObject("restPoint",restPoint);
				mav.addObject("salesList",salesList);
				mav.addObject("sumSalesList",sumSalesList);
				mav.setViewName("/lnadmin/chartPage/salesChart");
				
				return mav;
				
			}
			

			//공지사항등록화면
			@RequestMapping(value = "lessonChart.go")
			public ModelAndView goLessonChart(ModelAndView mav) {
				System.out.println("lessonChart.go");
				mav.setViewName("/lnadmin/chartPage/lessonChart");
				
				int lectureNum = adminService.getLectureNum();
				int freeLectureNum = adminService.getFreeLectureNum();
				int notFreeLectureNum = lectureNum - freeLectureNum;
				double freeRate = ((int) (freeLectureNum*100.0/lectureNum*100))/100.0;
				double notFreeRate = ((int) (notFreeLectureNum*100.0/lectureNum*100))/100.0;
				
				System.out.println(((int) (freeLectureNum*100.0/lectureNum*100)));
				
				System.out.println(freeRate + notFreeRate);
				
				
				mav.addObject("lectureNum",lectureNum);
				mav.addObject("freeLectureNum",freeLectureNum);
				mav.addObject("freeRate",freeRate);
				mav.addObject("notFreeRate",notFreeRate);
				mav.addObject("notFreeLectureNum",notFreeLectureNum);
				return mav;

			}
			//공지사항등록화면
			@RequestMapping(value = "lessonChart.do")
			public ModelAndView doLessonChart(ModelAndView mav,HttpServletRequest request) {
				System.out.println("lessonChart.go");
				mav.setViewName("/lnadmin/chartPage/lessonChart");
				
				int lectureNum = adminService.getLectureNum();
				int freeLectureNum = adminService.getFreeLectureNum();
				int notFreeLectureNum = lectureNum - freeLectureNum;
				double freeRate = ((int) (freeLectureNum*100.0/lectureNum*100))/100.0;
				double notFreeRate = ((int) (notFreeLectureNum*100.0/lectureNum*100))/100.0;
				
				String stDate = request.getParameter("startDate");
				String edDate = request.getParameter("endDate");
				mav.addObject("stDate",stDate);
				mav.addObject("edDate",edDate);
				List<DateCountVO> countList = new ArrayList<DateCountVO>();
				
				try {
					final String DATE_PATTERN = "yyyyMMdd";
					String inputStartDate = stDate;
					String inputEndDate = edDate;
					SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
					Date startDate = sdf.parse(inputStartDate);
					Date endDate = sdf.parse(inputEndDate);
					ArrayList<String> dates = new ArrayList<String>();
					Date currentDate = startDate;
					while (currentDate.compareTo(endDate) <= 0) {
		            dates.add(sdf.format(currentDate));
		            Calendar c = Calendar.getInstance();
		            c.setTime(currentDate);
		            c.add(Calendar.DAY_OF_MONTH, 1);
		            currentDate = c.getTime();
		        }
					int totalCount = 0;
					int totalSum  = 0;
					List<LessonChartVO> allList = new ArrayList<>();
					
						LessonChartVO lessonChartVO = new LessonChartVO();
						lessonChartVO.setStart(inputStartDate);
						lessonChartVO.setEnd(inputEndDate);
						System.out.println(inputStartDate);
						System.out.println(inputEndDate);
						allList = adminService.getPriceCountByDate(lessonChartVO);
						for(LessonChartVO v : allList){
							totalCount += v.getCount();
							totalSum += v.getSum();
						}
						
					
					
					// 이름 구해오기
					lessonChartVO.setStart(inputStartDate);
					lessonChartVO.setEnd(inputEndDate);
					List<LectureVO> lList = adminService.getPriceCountByDate2(lessonChartVO);
					for(int i=0;i<lList.size();i++) {
						allList.get(i).setLectureName(lList.get(i).getName());
					}
					
					System.out.println("큰 list size : " + allList.size());
					mav.addObject("allList",allList);
					mav.addObject("totalCount",totalCount);
					mav.addObject("totalSum",totalSum);
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				
				mav.addObject("lectureNum",lectureNum);
				mav.addObject("freeLectureNum",freeLectureNum);
				mav.addObject("freeRate",freeRate);
				mav.addObject("notFreeRate",notFreeRate);
				mav.addObject("notFreeLectureNum",notFreeLectureNum);
				return mav;
				
			}
			//공지사항등록화면
			@RequestMapping(value = "categoryChart.go")
			public ModelAndView goCategoryChart(ModelAndView mav, HttpServletRequest request) {

			System.out.println("categoryChart.go");
			mav.setViewName("/lnadmin/chartPage/categoryChart");
			
			List<CategoryVO> categoryList = lessionService.getCategoryList();
			int categoryNum = categoryList.size();
			List<LectureVO> lectureList = lessionService.getCategoryLectureList(categoryList);
			int totalLecture = lectureList.size();
			List<CategoryChartVO> cVO = new ArrayList<>();
			for(CategoryVO categoryVo : categoryList) {
				CategoryChartVO smallVO = new CategoryChartVO();
				List<LectureVO> hisLectures = new ArrayList<>();
				smallVO.setCategoryName(categoryVo.getName());
				
				for(LectureVO lectureVO  : lectureList) {
					if(lectureVO.getCategory().equals(smallVO.getCategoryName())) {
						hisLectures.add(lectureVO);
					}
				}
				smallVO.setLectureList(hisLectures);
				smallVO.setHaveLecture(hisLectures.size());
				smallVO.setLectureRate(((int) (hisLectures.size()*100.0/totalLecture*100))/100.0);
				cVO.add(smallVO);
			}
			mav.addObject("totalLecture",totalLecture);
			mav.addObject("voList",cVO);
			mav.addObject("categoryNum",categoryNum);
			
			
			
			
			
			return mav;

			}
			@RequestMapping(value = "categoryChart.do")
			public ModelAndView doCategoryChart(ModelAndView mav, HttpServletRequest request) {
				
				System.out.println("categoryChart do");
				mav.setViewName("/lnadmin/chartPage/categoryChart");
				
				List<CategoryVO> categoryList = lessionService.getCategoryList();
				int categoryNum = categoryList.size();
				List<LectureVO> lectureList = lessionService.getCategoryLectureList(categoryList);
				int totalLecture = lectureList.size();
				List<CategoryChartVO> cVO = new ArrayList<>();
				for(CategoryVO categoryVo : categoryList) {
					CategoryChartVO smallVO = new CategoryChartVO();
					List<LectureVO> hisLectures = new ArrayList<>();
					smallVO.setCategoryName(categoryVo.getName());
					
					for(LectureVO lectureVO  : lectureList) {
						if(lectureVO.getCategory().equals(smallVO.getCategoryName())) {
							hisLectures.add(lectureVO);
						}
					}
					smallVO.setLectureList(hisLectures);
					smallVO.setHaveLecture(hisLectures.size());
					smallVO.setLectureRate(((int) (hisLectures.size()*100.0/totalLecture*100))/100.0);
					cVO.add(smallVO);
				}
				mav.addObject("totalLecture",totalLecture);
				mav.addObject("voList",cVO);
				mav.addObject("categoryNum",categoryNum);
				
				
				//
				String stDate = request.getParameter("startDate");
				String edDate = request.getParameter("endDate");
				mav.addObject("stDate",stDate);
				mav.addObject("edDate",edDate);
				List<CategoryChartVO> ccVO = new ArrayList<>();
				System.out.println(stDate);
				System.out.println(edDate);
				System.out.println("flag1" + categoryList.size());
				int totalCount = 0;
				int totalSum = 0 ;
				for(CategoryVO categoryVO : categoryList ) {
					System.out.println(">>"+categoryVO.getName());
					CategoryChartVO categoryChartVO = new CategoryChartVO();
					categoryChartVO.setStart(stDate);
					categoryChartVO.setEnd(edDate);
					categoryChartVO.setCategoryName(categoryVO.getName());
					System.out.println("flag2");
					CategoryChartVO tmpVO = adminService.getPriceCountByCategory(categoryChartVO);
					System.out.println("flag3");
					if(tmpVO == null) {
						tmpVO = new CategoryChartVO();
						tmpVO.setCount(0);
						tmpVO.setSum(0);
						
					}
					totalCount+= tmpVO.getCount();
					totalSum += tmpVO.getSum();
					tmpVO.setCategoryName(categoryVO.getName());
					ccVO.add(tmpVO);
				}
				
				System.out.println("flag4");
				mav.addObject("ccVO",ccVO);
				mav.addObject("totalCount",totalCount);
				mav.addObject("totalSum",totalSum);
				
				return mav;
				
			}
			
			@RequestMapping(value="recoReplyChart.go")
			public ModelAndView goRecoReplyChart(ModelAndView mav) {
				mav.addObject("categoryVO",lessionService.getCategoryList());
				
				mav.setViewName("/lnadmin/chartPage/recoReplyChart");
				return mav;
			}
			@RequestMapping(value="recoReplyChart.do")
			public ModelAndView doRecoReplyChart(ModelAndView mav , HttpServletRequest request) {
				String categoryName= request.getParameter("categoryName");
				System.out.println(categoryName);
				List<RecoChartVO> recoChartVOList = adminService.getLectureListByCategory(categoryName);
				System.out.println(recoChartVOList.size());
				
				int totalRecommand = 0;
				int totalReply = 0;
				
				for(RecoChartVO vo : recoChartVOList) {
					int lessonReplyNum  = adminService.getLessonReplyCntByLecture(vo.getNum());
					int lectureReplyNum = adminService.getLectureReplyCntByLecture(vo.getNum());
					vo.setLessonReplyCnt(lessonReplyNum);
					vo.setLectureReplyCnt(lectureReplyNum);
					totalRecommand+=vo.getLikeCnt();
					totalReply+= lessonReplyNum+lectureReplyNum;
				}
				mav.addObject("categoryName",categoryName);
				mav.addObject("categoryVO",lessionService.getCategoryList());
				mav.addObject("TR",totalRecommand);
				mav.addObject("TR2",totalReply);
				mav.addObject("voList",recoChartVOList);
				
				
				mav.setViewName("/lnadmin/chartPage/recoReplyChart");
				return mav;
			}
			
			@RequestMapping(value="qnaChart.go")
		      public ModelAndView goQnaChart(ModelAndView mav) {
		         System.out.println("Q&A관련이동");
		         
		         int AskBoardNum = adminService.getAskBoardNum();
		         int AnswerBoardNum = adminService.getAnswerBoardNum();
		         
		         double answerRate = ((int)(AnswerBoardNum*100.0/AskBoardNum*100))/100.0;
		         System.out.println("답변율 계산 :" + answerRate);
		         
		         List<QnaChartVO> QnaCount = adminService.getQueCount();
		         List<QnaChartVO> AnswerCount = adminService.getAnswerCount();
		         System.out.println(QnaCount);
		         System.out.println(AnswerCount);
		         
		         for(QnaChartVO vo : QnaCount) {
		            for(QnaChartVO vo2 : AnswerCount) {
		               if(vo2.getType().equals(vo.getType())) {
		                  vo.setAnswercount(vo2.getQuecount());
		               }
		            }
		         }
		         
		         int totalQnaNum = 0;
		         int totalAnswerNum = 0 ;
		         
		         for(QnaChartVO vo : QnaCount) {
		            totalQnaNum += vo.getQuecount();
		            totalAnswerNum += vo.getAnswercount();
		         }
		         mav.addObject("answerRate",answerRate);
		         mav.addObject("TQN",totalQnaNum);
		         mav.addObject("TAN",totalAnswerNum);
		         mav.addObject("AskBoardNum", AskBoardNum);
		         mav.addObject("AnswerBoardNum", AnswerBoardNum);
		         mav.addObject("qList",QnaCount);
		         
		         mav.setViewName("/lnadmin/chartPage/qnaChart");
		         
		         
		         
		         
		         return mav;
		      }
	
	
	
	
	
}
