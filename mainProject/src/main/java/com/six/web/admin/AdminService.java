package com.six.web.admin;

import java.util.List;

import com.six.web.askBoard.AskBoardVO;
import com.six.web.faqBoard.FaqBoardVO;
import com.six.web.lesson.CategoryVO;
import com.six.web.lesson.LectureVO;
import com.six.web.lesson.LessonVO;
import com.six.web.noticeBoard.NoticeBoardVO;
import com.six.web.notification.NotificationVO;
import com.six.web.pay.PayListVO;
import com.six.web.user.UserVO;

public interface AdminService {

	public AdminVO getAdmin(AdminVO adminVO);
	public void insertAdmin(AdminVO adminVO);
	public boolean insertAdminCheck(AdminVO adminVO);
	public int loginAdmin(AdminVO adminVO);
	public void logoutAdmin(AdminVO adminVO);
	public List<AdminVO> getAdminMemberList(AdminVO vo);
	public List<UserVO> getUserMemberList(UserVO userVO);
	public void userMemberDelete(List<String>getUserMemberList);
	public void insertTerms(TermsVO termsVO);
	public List<TermsVO> getTermsList(TermsVO termsVO);
	public TermsVO getTermsContent(TermsVO termsVO);
	public void modifyTerms(TermsVO termsVO);
	public void termsDelete(List<String> deleteTermsList);
	public List<FaqBoardVO> getAdminFaqBoardList(FaqBoardVO vo);
	public void insertfaqWrite(FaqBoardVO vo);
	public List<NoticeBoardVO> getAdminNoticeBoardList(NoticeBoardVO vo);
	public List<AskBoardVO> getAdminQnaBoardList(AskBoardVO vo);
	public void deleteNoticeBoard(List<String> getList);
	public void deleteFaqBoard(List<String> getFaqList);
	public void deleteQnaBoard(List<String> getQnaList);
	public void deleteQnaAnswerBoard(int num);
	public void insertNoticeBoard(NoticeBoardVO vo);
	public void updateNoticeBoard(NoticeBoardVO vo);
	public void updateFaqBoard(FaqBoardVO vo);
	public void updateQnaBoard(AskBoardVO vo);
	public List<LessonVO> getAdminLessonList(LessonVO vo);
	public List<LectureVO> getAdminLectureList(LectureVO vo);
	public void updateClassBoard(List<String> getLectureList);
	public void updateVideoBoard(List<String> getVideoList);
	//알림
	public void noticeAlarm(NotificationVO notificationVO);
	public void answerAlarm(NotificationVO notificationVO);
	public void lessonAlarm(NotificationVO notificationVO);
	public List<UserVO> whoPickThisLecture(int lectureNum);
	//형꺼 admin 합친거
	public void insertCategory(CategoryVO categoryVO);
	public CategoryVO getCategoryName(CategoryVO categoryVO);
	public void deleteCategory(String name);
	public void insertImage(ImgVO imgVO);
	public void updateMainImage(ImgVO imgVO);
	public void updateNewImage(ImgVO imgVO);
	public void updateTeacherImage(ImgVO imgVO);
	public List<PayListVO> getAllPayList(PayListVO payListVO);
	public List<TermsVO> getTerms();
	public ImgVO getImgVO();
	
	//admin merging...
	public String getMemberCount();
	public String getMemberTeacherCount();
	public String getMemberSiteCount();
	public String getMemberKakaoCount();
	public String getMemberNaverCount();

	public String getDateCount(String date);
	public String getKakaoDateCount(String date);
	public String getNaverDateCount(String date);
	//
	public List<CategoryVO> getAllCategoryName(CategoryVO categoryVO);

	public int getTotalPay();
	public int getTotalUsePoint();
	
	public String getPayCount(String date);
	public String getDateSales(String date);
	public String getPayMemberCount();
	public String getAllPayCount();
	
	public String getSumCategory(String name);
	//
	public int getLectureNum() ;
	public int getFreeLectureNum();
	public List<LessonChartVO> getPriceCountByDate(LessonChartVO lessonChartVO) ;
	public List<LectureVO> getPriceCountByDate2(LessonChartVO lessonChartVO) ;
	public CategoryChartVO getPriceCountByCategory(CategoryChartVO categoryChartVO);
	public List<RecoChartVO> getLectureListByCategory(String category);
	public int getLessonReplyCntByLecture(int lectureNum);
	public int getLectureReplyCntByLecture(int lectureNum);
	
	public int getAskBoardNum();
	   public int getAnswerBoardNum();
	   public List<QnaChartVO> getQueCount();
	   public List<QnaChartVO> getAnswerCount();
	
	
}
