package com.six.web.lesson;

import java.util.List;

import com.six.web.reply.LessonReplyVO;
import com.six.web.user.UserVO;

public interface LessonService {
	public List<LectureVO> getMyPickList(UserVO userVO);
	public List<LectureVO> getMyLikeList(UserVO userVO);
	public List<LectureVO> getMyLectureList(UserVO userVO);
	public List<LectureVO> getCategoryLectureList(List<CategoryVO> categoryList);
	public List<CategoryVO> getCategoryList();
	public void insertLesson(LessonVO lessonVO);
	public void insertLecture(LectureVO lectureVO);
	public void deletePick(String id , int num);
	public void insertPick(String id , int num);
	public void deleteLike(String id , int num);
	public void insertLike(String id , int num);
	public LectureVO getLecture(int lectureNum);
	public LessonVO getLesson(int lessonNum);
	public List<LessonVO> getLessonList(LectureVO lectureVO);
	public void lectureUpCount(LectureVO lectureVO);
	public List<LectureVO> searchKey(String keyword);
	public List<SearchListVO> getSearchRank();
	public List<SearchListVO> getSearchHistory(UserVO userVO);
	public void insertSearchHistory(SearchListVO searchListVO);
	public void insertSearchRank(String keyword);
	public void searchUpCount(String keyword);
	public SearchListVO getSearchRankOne(String keyword);
	public void deleteHistory(UserVO userVO);
	public void updateLikeCnt();
	public void updatePickCnt();
	public void insertMyLectureList(String id, int lectureNum);
	public List<MyLectureListVO> getMyHistoryLectureList(UserVO userVO);
	public List<LectureVO> getSimilarLectureList(CategoryVO categoryVO);
}
