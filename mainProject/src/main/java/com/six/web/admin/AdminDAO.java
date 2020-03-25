package com.six.web.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.six.web.askBoard.AskBoardVO;
import com.six.web.faqBoard.FaqBoardVO;
import com.six.web.lesson.CategoryVO;
import com.six.web.lesson.LectureVO;
import com.six.web.lesson.LessonVO;
import com.six.web.noticeBoard.NoticeBoardVO;
import com.six.web.notification.NotificationVO;
import com.six.web.pay.PayListVO;
import com.six.web.user.UserVO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public AdminVO getAdmin(AdminVO adminVO) {
		System.out.println("입력한 값으로 DB로! getAdmin: " + adminVO.toString());
		return sessionTemplate.selectOne("AdminDAO.getAdmin", adminVO);
	}

	public void insertAdmin(AdminVO adminVO) {
		System.out.println("insertAdmin " + adminVO.toString());
		sessionTemplate.update("AdminDAO.insertAdmin", adminVO);
	}

	public List<AdminVO> getAdminMemberList(AdminVO vo) {
		Map<String, Object> adMemberList = new HashMap<>();
		adMemberList.put("vo", vo);
		return sessionTemplate.selectList("AdminDAO.getAdminMemberList", vo);
	}

	public void insertTerms(TermsVO termsVO) {
		sessionTemplate.update("AdminDAO.insertTerms", termsVO);
	}

	public void modifyTerms(TermsVO termsVO) {
		sessionTemplate.update("AdminDAO.modifyTerms", termsVO);
	}

	public void termsDelete(List<String> deleteTermsList) {
		Map<String, Object> deleteTerms = new HashMap<>();
		deleteTerms.put("deleteTermsList", deleteTermsList);
		sessionTemplate.update("AdminDAO.termsDelete", deleteTerms);
	}

	public TermsVO getTermsContent(TermsVO termsVO) {
		return sessionTemplate.selectOne("AdminDAO.getTermsContent", termsVO);
	}

	public List<TermsVO> getTermsList(TermsVO termsVO) {
		Map<String, Object> termsList = new HashMap<>();
		termsList.put("termVO", termsVO);
		return sessionTemplate.selectList("AdminDAO.getTermsList", termsVO);
	}

	public List<FaqBoardVO> getAdminFaqBoardList(FaqBoardVO vo) {
		Map<String, Object> adFaqBoardList = new HashMap<>();
		adFaqBoardList.put("vo", vo);
		return sessionTemplate.selectList("AdminDAO.getAdminFaqBoardList", vo);
	}

	public void insertFaqWrite(FaqBoardVO vo) {
		sessionTemplate.update("AdminDAO.insertFaqWrite", vo);
	}

	public List<NoticeBoardVO> getAdminNoticeBoardList(NoticeBoardVO vo) {
		Map<String, Object> adNoticeBoardList = new HashMap<>();
		adNoticeBoardList.put("vo", vo);
		return sessionTemplate.selectList("AdminDAO.getAdminNoticeBoardList", vo);
	}

	public void insertNoticeBoard(NoticeBoardVO vo) {
		sessionTemplate.update("AdminDAO.insertNoticeBoard", vo);
	}

	public void deleteNoticeBoard(List<String> deleteList) {
		Map<String, Object> mp = new HashMap<>();
		mp.put("deleteList", deleteList);
		sessionTemplate.update("AdminDAO.deleteNoticeBoard", mp);
	}

	public void deleteFaqBoard(List<String> deleteFaqList) {
		Map<String, Object> mp = new HashMap<>();
		mp.put("deleteFaqList", deleteFaqList);
		sessionTemplate.update("AdminDAO.deleteFaqBoard", mp);
	}

	public void deleteQnaBoard(List<String> deleteQnaList) {
		Map<String, Object> mp = new HashMap<>();
		mp.put("deleteQnaList", deleteQnaList);
		sessionTemplate.update("AdminDAO.deleteQnaBoard", mp);
	}

	public void deleteQnaAnswerBoard(int num) {
		Map<String, Object> mp = new HashMap<>();
		mp.put("num", num);
		sessionTemplate.update("AdminDAO.deleteQnaAnswerBoard", mp);
	}

	public List<AskBoardVO> getAdminQnaBoardList(AskBoardVO vo) {
		Map<String, Object> adQnaBoardList = new HashMap<>();
		adQnaBoardList.put("vo", vo);
		return sessionTemplate.selectList("AdminDAO.getAdminQnaBoardList", vo);
	}

	public void updateNoticeBoard(NoticeBoardVO vo) {
		sessionTemplate.update("AdminDAO.updateNoticeBoard", vo);
	}

	public void updateFaqBoard(FaqBoardVO vo) {
		sessionTemplate.update("AdminDAO.updateFaqBoard", vo);
	}

	public void updateQnaBoard(AskBoardVO vo) {
		sessionTemplate.update("AdminDAO.updateQnaBoard", vo);
	}

	public List<UserVO> getUserMemberList(UserVO userVO) {
		Map<String, Object> userMemberList = new HashMap<>();
		userMemberList.put("userVO", userVO);
		return sessionTemplate.selectList("AdminDAO.getUserMemberList", userMemberList);
	}

	public void userMemberDelete(List<String> getUserMemberList) {
		Map<String, Object> deleteUser = new HashMap<>();
		deleteUser.put("deleteUserMemberList", getUserMemberList);
		sessionTemplate.update("AdminDAO.userMemberDelete", deleteUser);
	}

	public List<LectureVO> getAdminLectureList(LectureVO vo) {
		Map<String, Object> adLectureList = new HashMap<>();
		adLectureList.put("vo", vo);
		return sessionTemplate.selectList("AdminDAO.getAdminLectureList", vo);
	}

	public List<LessonVO> getAdminLessonList(LessonVO vo) {
		Map<String, Object> adLessonBoardList = new HashMap<>();
		adLessonBoardList.put("vo", vo);
		return sessionTemplate.selectList("AdminDAO.getAdminLessonList", vo);
	}

	public void updateVideoBoard(List<String> updateVideoList) {
		Map<String, Object> mp = new HashMap<>();
		mp.put("updateVideoList", updateVideoList);
		sessionTemplate.update("AdminDAO.updateVideoBoard", mp);
	}

	public void updateClassBoard(List<String> updateLectureList) {
		Map<String, Object> mp = new HashMap<>();
		mp.put("updateLectureList", updateLectureList);
		sessionTemplate.update("AdminDAO.updateLectureList", mp);
	}
	
	//공지사항 알람 뿌리기
	public void noticeAlarm(NotificationVO notificationVO) {
		sessionTemplate.update("AdminDAO.noticeAlarm", notificationVO);
	}
	
	//답변 알람 뿌리기
	public void answerAlarm(NotificationVO notificationVO) {
		sessionTemplate.update("AdminDAO.answerAlarm", notificationVO);
	}
	
	//강의 알람 뿌리기
	public void lessonAlarm(NotificationVO notificationVO) {
		sessionTemplate.update("AdminDAO.lessonAlarm", notificationVO);
	}
	//강의 알람 누가 픽했는지
	public List<UserVO> whoPickThisLecture(int lectureNum) {
		return sessionTemplate.selectList("AdminDAO.whoPickThisLecture",lectureNum);
	}
	
	//형꺼 admin 합친거
	public void insertCategory(CategoryVO categoryVO) {
		sessionTemplate.update("AdminDAO.insertCategory",categoryVO);
	}

	public CategoryVO getCategoryName(CategoryVO categoryVO) {
		return sessionTemplate.selectOne("AdminDAO.getCategoryName", categoryVO);
	}
	

	public void deleteCategory(String name) {
		sessionTemplate.update("AdminDAO.deleteCategory", name);
	}

	public void insertImage(ImgVO imgVO) {
		sessionTemplate.update("AdminDAO.insertImage", imgVO);
	}
	
	public void updateMainImage(ImgVO imgVO) {
		sessionTemplate.update("AdminDAO.updateMainImage", imgVO);
	}
	
	public void updateNewImage(ImgVO imgVO) {
		sessionTemplate.update("AdminDAO.updateNewImage", imgVO);
	}
	
	public void updateTeacherImage(ImgVO imgVO) {
		sessionTemplate.update("AdminDAO.updateTeacherImage", imgVO);
	}
	
	public List<PayListVO> getAllPayList(PayListVO payListVO){
		Map<String, Object> getPayList = new HashMap<>();
		getPayList.put("getAllPayList", payListVO);
		return sessionTemplate.selectList("AdminDAO.getAllPayList",payListVO);
	}
	
	public List<TermsVO> getTerms(){
		return sessionTemplate.selectList("AdminDAO.getTerms");
	}
	
	public ImgVO getImgVO() {
		return sessionTemplate.selectOne("AdminDAO.getImgVO");
	}
	
	//admin merging..
	public String getMemberCount() {
		return sessionTemplate.selectOne("AdminDAO.getMemberCount");
	}
	public String getMemberTeacherCount() {
		return sessionTemplate.selectOne("AdminDAO.getMemberTeacherCount");
	}
	public String getMemberSiteCount() {
		return sessionTemplate.selectOne("AdminDAO.getMemberSiteCount");
	}
	public String getMemberKakaoCount() {
		return sessionTemplate.selectOne("AdminDAO.getMemberKakaoCount");
	}
	public String getMemberNaverCount() {
		return sessionTemplate.selectOne("AdminDAO.getMemberNaverCount");
	}
	
	public String getDateCount(String date){
		return sessionTemplate.selectOne("AdminDAO.getDateCount",date);
	}
	public String getKakaoDateCount(String date){
		return sessionTemplate.selectOne("AdminDAO.getKakaoDateCount",date);
	}
	public String getNaverDateCount(String date){
		return sessionTemplate.selectOne("AdminDAO.getNaverDateCount",date);
	}
	//
	public List<CategoryVO> getAllCategoryName(CategoryVO categoryVO){
		Map<String, Object> getNameList = new HashMap<>();
		getNameList.put("getAllCategoryName", categoryVO);
		return sessionTemplate.selectList("AdminDAO.getAllCategoryName", categoryVO);
	}
	
	public int getTotalPay() {
		return sessionTemplate.selectOne("AdminDAO.getTotalPay");
	}
	public int getTotalUsePoint() {
		return sessionTemplate.selectOne("AdminDAO.getTotalUsePoint");
	}
	
	public String getPayCount(String date) {
		return sessionTemplate.selectOne("AdminDAO.getPayCount",date);
	}
	
	public String getDateSales(String date) {
		return sessionTemplate.selectOne("AdminDAO.getDateSales",date);
	}
	
	public String getPayMemberCount() {
		return sessionTemplate.selectOne("AdminDAO.getPayMemberCount");
	}
	
	public String getAllPayCount() {
		return sessionTemplate.selectOne("AdminDAO.getAllPayCount");
	}
	
	public String getSumCategory(String name) {
		return sessionTemplate.selectOne("AdminDAO.getSumCategory",name);
	}
	
	
	//
	public int getLectureNum() {
		return sessionTemplate.selectOne("AdminDAO.getLectureNum");
	}
	
	public int getFreeLectureNum() {
		return sessionTemplate.selectOne("AdminDAO.getFreeLectureNum");
	}
	
	public List<LessonChartVO> getPriceCountByDate(LessonChartVO lessonChartVO) {
		return sessionTemplate.selectList("AdminDAO.getPriceCountByDate",lessonChartVO);
	}
	public List<LectureVO> getPriceCountByDate2(LessonChartVO lessonChartVO) {
		return sessionTemplate.selectList("AdminDAO.getPriceCountByDate2",lessonChartVO);
	}
	
	public CategoryChartVO getPriceCountByCategory(CategoryChartVO categoryChartVO){
		return sessionTemplate.selectOne("AdminDAO.getPriceCountByCategory",categoryChartVO);
	}
	
	public List<RecoChartVO> getLectureListByCategory(String category){
		return sessionTemplate.selectList("AdminDAO.getLectureListByCategory",category);
	}
	
	public int getLessonReplyCntByLecture(int lectureNum) {
		return sessionTemplate.selectOne("AdminDAO.getLessonReplyCntByLecture",lectureNum);
	}
	public int getLectureReplyCntByLecture(int lectureNum) {
		return sessionTemplate.selectOne("AdminDAO.getLectureReplyCntByLecture",lectureNum);
	}
	
	public int getAskBoardNum() {
	      return sessionTemplate.selectOne("AdminDAO.getAskBoardNum");
	   }
	   public int getAnswerBoardNum() {
	      return sessionTemplate.selectOne("AdminDAO.getAnswerBoardNum");
	   }
	   
	   
	   
	   public List<QnaChartVO> getQueCount() {
	      return sessionTemplate.selectList("AdminDAO.getQueCount");
	   }
	   
	   public List<QnaChartVO> getAnswerCount() {
	      return sessionTemplate.selectList("AdminDAO.getAnswerCount");
	   }
	
	
	
	
	
	
	
}
