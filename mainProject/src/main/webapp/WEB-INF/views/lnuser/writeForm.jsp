<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">
  <head>
    <title>다배워 ! LearningMan &mdash;</title>
    <%@ include file="metaHeader.jsp" %>
  </head>
  <body>
  <%@ include file="header.jsp" %>
  <div class="site-wrap">
         <!-- 질문 작성 BOARD START -->
   <div class="col-md-12 text-center">
            <h5>질문 글 작성</h5>
          </div>
               <form action="insertAskBoard.do" style="line-height: 1;">
               <input type="hidden" name="writer" value="${vo.id }">
<section class="reviews py-3" id="reviews">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="one-reivew">
                                <div class="row">
                                    <div class="col-md-3">
                                    <small>카테고리를 선택해주세요</small>
                                    <hr/>
          								  <select class="form-control" name="type">
          								    
             								          <option>회원정보 및 로그인</option>
             								          <option>사이트 기능 및 접속오류</option>
             								          <option>강좌 제공일정 및 커리큘럼</option>
             								          <option>학습 동영상 플레이어</option>
             								          <option>강좌 검색 및 이용문의</option>
             								          <option>건의사항</option>
        								    </select>
                                    </div>
                                    <div class="col-md-6">

                                    </div>
                                </div>
                                <hr/>
                                <div class="row text-success">
                                    <div class="col-md-12">
                                        <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                    </div>
                                </div>
                                <div class="row pt-2">
                                    <div class="col-md-12">
                                        <h6><input type="text" name="title" class="form-control" placeholder="제목을 입력하세요"></h6>
                                        <hr/>
                                        <p><textarea name="content" class="form-control" rows="10" cols="114" placeholder="내용을 입력하세요"></textarea> </p>
                                    </div>
                                </div>
                                <div class="row pt-2">
                                    <div class="col-md-4">

                                    </div>
                                    <div class="col-md-12 text-center">
                                        <ul class="list-inline list-unstyled">
                                            <li class="list-inline-item"><button type="submit" class="btn btn-outline-success" onclick="alert('작성이 완료되었습니다.');">작성완료</button> </li>
                                            <li class="list-inline-item"><button type="button" class="btn btn-outline-danger" onClick="window.location='serviceCenter.do'">돌아가기</button> </li>
                                        </ul>
                                        
                                        
                                        


                                    </div>
                                </div>
                                </div>

                            </div>
                            
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</section>
               </form>

<!-- 질문 작성 BOARD END -->


</div>
<%@ include file="footer.jsp"%>
  </body>
</html>