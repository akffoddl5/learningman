package com.six.web.lesson;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.six.web.reply.LessonReplyVO;
import com.six.web.user.UserVO;

@Service
public class LessonServiceImpl implements LessonService {
	
	@Autowired
	private LessonDAO lessonDAO ; 
	
	
	@Override
	public List<LectureVO> getMyPickList(UserVO userVO) {
		
		return lessonDAO.getMyPickList(userVO);
	}
	
	@Override
	public List<LectureVO> getMyLikeList(UserVO userVO) {
		
		return lessonDAO.getMyLikeList(userVO);
	}

	@Override
	public List<LectureVO> getMyLectureList(UserVO userVO) {
		return lessonDAO.getMyLectureList(userVO);
	}

	@Override
	public void insertLesson(LessonVO lessonVO) {
		lessonDAO.insertLesson(lessonVO);
		
	}

	@Override
	public List<LectureVO> getCategoryLectureList(List<CategoryVO> categoryList) {
		return lessonDAO.getCategoryLectureList(categoryList);
	}

	@Override
	public void deletePick(String id , int num) {
		lessonDAO.deletePick(id , num);
	}
	
	@Override
	public void insertPick(String id , int num) {
		lessonDAO.insertPick(id , num);
	}
	@Override
	public void insertLike(String id , int num) {
		lessonDAO.insertLike(id , num);
	}
	@Override
	public void deleteLike(String id , int num) {
		lessonDAO.deleteLike(id , num);
	}

	@Override
	public List<CategoryVO> getCategoryList() {
		return lessonDAO.getCategoryList();
	}

	@Override
	public void insertLecture(LectureVO lectureVO) {
		lessonDAO.insertLecture(lectureVO);
		
	}

	@Override
	public LectureVO getLecture(int lectureNum) {
		return lessonDAO.getLecture(lectureNum);
	}
	
	@Override
	public LessonVO getLesson(int lessonNum) {
		return lessonDAO.getLesson(lessonNum);
	}


	@Override
	public List<LessonVO> getLessonList(LectureVO lectureVO) {
		return lessonDAO.getLessonList(lectureVO);
	}

	@Override
	public void lectureUpCount(LectureVO lectureVO) {
		lessonDAO.lectureUpCount(lectureVO);
	}

	@Override
	public List<LectureVO> searchKey(String keyword) {
		return lessonDAO.searchKey(keyword);
	}

	@Override
	public List<SearchListVO> getSearchRank() {
		return lessonDAO.getSearchRank();
	}

	@Override
	public List<SearchListVO> getSearchHistory(UserVO userVO) {
		return lessonDAO.getSearchHistory(userVO);
	}

	@Override
	public void insertSearchHistory(SearchListVO searchListVO) {
		lessonDAO.insertSearchHistory(searchListVO);
	}

	@Override
	public void insertSearchRank(String keyword) {
		lessonDAO.insertSearchRank(keyword);
	}

	@Override
	public SearchListVO getSearchRankOne(String keyword) {
		return lessonDAO.getSearchRankOne(keyword);
	}

	@Override
	public void searchUpCount(String keyword) {
		lessonDAO.searchUpCount(keyword);
	}

	@Override
	public void deleteHistory(UserVO userVO) {
		lessonDAO.deleteHistory(userVO);
	}

	@Override
	public void updateLikeCnt() {
		lessonDAO.updateLikeCnt();
	}

	@Override
	public void updatePickCnt() {
		lessonDAO.updatePickCnt();
	}
	
	@Override
	public List<MyLectureListVO> getMyHistoryLectureList(UserVO userVO) {
		return lessonDAO.getMyHistoryLectureList(userVO);
	}

	@Override
	public void insertMyLectureList(String id, int lectureNum) {
		lessonDAO.insertMyLectureList(id, lectureNum);
	}

	@Override
	public List<LectureVO> getSimilarLectureList(CategoryVO categoryVO) {
		return lessonDAO.getSimilarLectureList(categoryVO);
	}
}
