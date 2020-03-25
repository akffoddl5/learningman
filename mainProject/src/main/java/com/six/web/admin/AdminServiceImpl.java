package com.six.web.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.six.web.askBoard.AskBoardVO;
import com.six.web.faqBoard.FaqBoardVO;
import com.six.web.lesson.CategoryVO;
import com.six.web.lesson.LectureVO;
import com.six.web.lesson.LessonVO;
import com.six.web.noticeBoard.NoticeBoardVO;
import com.six.web.notification.NotificationVO;
import com.six.web.pay.PayListVO;
import com.six.web.user.UserVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;

	public void insertAdmin(AdminVO adminVO) {
		adminDAO.insertAdmin(adminVO);

	}

	@Override
	public AdminVO getAdmin(AdminVO adminVO) {
		// TODO Auto-generated method stub
		return adminDAO.getAdmin(adminVO);
	}

	@Override
	public int loginAdmin(AdminVO adminVO) {
		String id = adminVO.getId();
		String pw = adminVO.getPassword();
		System.out.println("입력한 id값: " + id);
		System.out.println("입력한 password값: " + pw);
		AdminVO admin = adminDAO.getAdmin(adminVO);
		System.out.println("입력한 id로 받아온 db값: " + admin);

		if (admin == null) {
			System.out.println("DB에 정보 없음 리턴 값은 0");
			return 0;
		} else if (!admin.getPassword().equals(pw)) {
			System.out.println("DB에 정보는 있음 패스워드 불일치 리턴값은 -1");
			return -1;
		} else {
			System.out.println("모두일치 리턴값은 1");
			return 1;
		}
	}

	@Override
	public List<AdminVO> getAdminMemberList(AdminVO vo) {

		return adminDAO.getAdminMemberList(vo);
	}

	@Override
	public boolean insertAdminCheck(AdminVO adminVO) {
		String id = adminVO.getId();
		System.out.println(id);
		AdminVO admin = adminDAO.getAdmin(adminVO);
		System.out.println(admin);

		if (admin == null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public void logoutAdmin(AdminVO adminVO) {

	}

	@Override
	public List<FaqBoardVO> getAdminFaqBoardList(FaqBoardVO vo) {

		return adminDAO.getAdminFaqBoardList(vo);
	}

	@Override
	public void insertfaqWrite(FaqBoardVO vo) {
		adminDAO.insertFaqWrite(vo);

	}

	@Override
	public void insertTerms(TermsVO termsVO) {
		adminDAO.insertTerms(termsVO);

	}

	@Override
	public TermsVO getTermsContent(TermsVO termsVO) {
		return adminDAO.getTermsContent(termsVO);

	}

	@Override
	public void modifyTerms(TermsVO termsVO) {
		adminDAO.modifyTerms(termsVO);

	}

	@Override
	public void termsDelete(List<String> deleteTermsList) {
		adminDAO.termsDelete(deleteTermsList);

	}

	@Override
	public List<TermsVO> getTermsList(TermsVO termsVO) {
		return adminDAO.getTermsList(termsVO);
	}

	@Override
	public List<NoticeBoardVO> getAdminNoticeBoardList(NoticeBoardVO vo) {
		return adminDAO.getAdminNoticeBoardList(vo);
	}

	@Override
	public void insertNoticeBoard(NoticeBoardVO vo) {
		adminDAO.insertNoticeBoard(vo);

	}

	@Override
	public void deleteNoticeBoard(List<String> getList) {
		adminDAO.deleteNoticeBoard(getList);
	}

	@Override
	public void deleteFaqBoard(List<String> getFaqList) {
		adminDAO.deleteFaqBoard(getFaqList);
	}

	@Override
	public void deleteQnaBoard(List<String> getQnaList) {
		adminDAO.deleteQnaBoard(getQnaList);
	}

	@Override
	public void deleteQnaAnswerBoard(int num) {
		adminDAO.deleteQnaAnswerBoard(num);
	}

	@Override
	public List<AskBoardVO> getAdminQnaBoardList(AskBoardVO vo) {
		return adminDAO.getAdminQnaBoardList(vo);
	}

	@Override
	public void updateNoticeBoard(NoticeBoardVO vo) {
		adminDAO.updateNoticeBoard(vo);
	}

	@Override
	public void updateFaqBoard(FaqBoardVO vo) {
		adminDAO.updateFaqBoard(vo);
	}

	@Override
	public void updateQnaBoard(AskBoardVO vo) {
		adminDAO.updateQnaBoard(vo);
	}

	@Override
	public List<UserVO> getUserMemberList(UserVO userVO) {
		return adminDAO.getUserMemberList(userVO);
	}

	@Override
	public void userMemberDelete(List<String> getUserMemberList) {
		adminDAO.userMemberDelete(getUserMemberList);

	}

	@Override
	public List<LessonVO> getAdminLessonList(LessonVO vo) {

		return adminDAO.getAdminLessonList(vo);
	}

	@Override
	public void updateVideoBoard(List<String> getVideoList) {
		adminDAO.updateVideoBoard(getVideoList);

	}

	@Override
	public List<LectureVO> getAdminLectureList(LectureVO vo) {

		return adminDAO.getAdminLectureList(vo);
	}

	@Override
	public void updateClassBoard(List<String> getLectureList) {
		adminDAO.updateClassBoard(getLectureList);
	}
	
	//공지사항 알람 뿌리기
	@Override
	public void noticeAlarm(NotificationVO notificationVO) {
		adminDAO.noticeAlarm(notificationVO);
	}
	//답변 알람 뿌리기
	@Override
	public void answerAlarm(NotificationVO notificationVO) {
		adminDAO.answerAlarm(notificationVO);
	}
	//강의 알람 뿌리기
	@Override
	public void lessonAlarm(NotificationVO notificationVO) {
		adminDAO.lessonAlarm(notificationVO);
	}

	@Override
	public List<UserVO> whoPickThisLecture(int lectureNum) {
		return adminDAO.whoPickThisLecture(lectureNum);
	}
	
	//형꺼 admin 합친거
	@Override
	public void insertCategory(CategoryVO categoryVO) {
		adminDAO.insertCategory(categoryVO);
		
	}

	@Override
	public CategoryVO getCategoryName(CategoryVO categoryVO) {
		return adminDAO.getCategoryName(categoryVO);

	}

	@Override
	public void deleteCategory(String name) {
		adminDAO.deleteCategory(name);
	}

	@Override
	public void insertImage(ImgVO imgVO) {
		adminDAO.insertImage(imgVO);
		
	}

	@Override
	public void updateMainImage(ImgVO imgVO) {
		adminDAO.updateMainImage(imgVO);
		
	}

	@Override
	public void updateNewImage(ImgVO imgVO) {
		adminDAO.updateNewImage(imgVO);
		
	}
	
	@Override
	public void updateTeacherImage(ImgVO imgVO) {
		adminDAO.updateTeacherImage(imgVO);
		
	}

	@Override
	public List<PayListVO> getAllPayList(PayListVO payListVO) {
		return adminDAO.getAllPayList(payListVO);
	}

	@Override
	public List<TermsVO> getTerms() {
		return adminDAO.getTerms();
	}

	@Override
	public ImgVO getImgVO() {
		return adminDAO.getImgVO();
	}
	
	//admin merging...
	
	@Override
	public String getMemberCount() {
		return adminDAO.getMemberCount();
	}

	@Override
	public String getMemberTeacherCount() {
		return adminDAO.getMemberTeacherCount();
	}

	@Override
	public String getMemberSiteCount() {
		return adminDAO.getMemberSiteCount();
	}

	@Override
	public String getMemberKakaoCount() {
		return adminDAO.getMemberKakaoCount();
	}

	@Override
	public String getMemberNaverCount() {
		return adminDAO.getMemberNaverCount();
	}


	@Override
	public String getDateCount(String date) {
		
		return adminDAO.getDateCount(date);
	}
	
	@Override
	public String getKakaoDateCount(String date) {
		
		return adminDAO.getKakaoDateCount(date);
	}
	
	@Override
	public String getNaverDateCount(String date) {
		
		return adminDAO.getNaverDateCount(date);
	}
	//
	@Override
	public List<CategoryVO> getAllCategoryName(CategoryVO categoryVO) {
		
		return adminDAO.getAllCategoryName(categoryVO);
	}

	@Override
	public int getTotalPay() {
		
		return adminDAO.getTotalPay();
	}

	@Override
	public int getTotalUsePoint() {
		
		return adminDAO.getTotalUsePoint();
	}

	@Override
	public String getPayCount(String date) {
		if(adminDAO.getPayCount(date)==null) {
			return "0";
		}else {
		return adminDAO.getPayCount(date);
		}
	}

	@Override
	public String getDateSales(String date) {
		if(adminDAO.getDateSales(date)==null) {
			return "0";
		}else {
		return adminDAO.getDateSales(date);
		}
	}

	@Override
	public String getPayMemberCount() {
		
		return adminDAO.getPayMemberCount();
	}

	@Override
	public String getAllPayCount() {
		
		return adminDAO.getAllPayCount();
	}

	@Override
	public String getSumCategory(String name) {
		if(adminDAO.getSumCategory(name)==null) {
			return "0";
		}
		return adminDAO.getSumCategory(name);
	}
	
	//
	@Override
	public int getLectureNum() {
		return adminDAO.getLectureNum();
	}

	@Override
	public int getFreeLectureNum() {
		return adminDAO.getFreeLectureNum();
	}

	@Override
	public List<LessonChartVO> getPriceCountByDate(LessonChartVO lessonChartVO) {
		return adminDAO.getPriceCountByDate(lessonChartVO);
	}

	@Override
	public List<LectureVO> getPriceCountByDate2(LessonChartVO lessonChartVO) {
		return adminDAO.getPriceCountByDate2(lessonChartVO);
	}

	@Override
	public CategoryChartVO getPriceCountByCategory(CategoryChartVO categoryChartVO) {
		return adminDAO.getPriceCountByCategory(categoryChartVO);
	}

	@Override
	public List<RecoChartVO> getLectureListByCategory(String category) {
		return adminDAO.getLectureListByCategory(category);
	}

	@Override
	public int getLessonReplyCntByLecture(int lectureNum) {
		return adminDAO.getLessonReplyCntByLecture(lectureNum);
	}
	@Override
	public int getLectureReplyCntByLecture(int lectureNum) {
		return adminDAO.getLectureReplyCntByLecture(lectureNum);
	}
	
	@Override
	   public int getAskBoardNum() {
	      return adminDAO.getAskBoardNum();
	   }
	   @Override
	   public int getAnswerBoardNum() {
	      return adminDAO.getAnswerBoardNum();
	   }


	   @Override
	   public List<QnaChartVO> getQueCount() {
	      return adminDAO.getQueCount();
	   }

	   @Override
	   public List<QnaChartVO> getAnswerCount() {
	      return adminDAO.getAnswerCount();
	   }
	
	
	
}
