<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
  <title>다배워 ! LearningMan &mdash;</title>
<%@ include file="metaHeader.jsp" %>
  </head>
  <body>
  
 
 <%@ include file="header2.jsp" %>
 
 <style>
<!--
h6{
font-weight: bold;
color: rgb(62, 64, 66);
}
.card{
padding: 24px;
width: 100%;
}

-->
</style>
  <div class="site-wrap">
      <div class="container">
      <div class="card">
		<div class="my-2">
		<h5 class="icon-movie_creation text-center" data-aos="fade-up" style="color: rgb(62, 64, 66); font-size:24px; font-weight: bold;">&nbsp;영상 업로드</h5>
		<small style="float: right; "><span class="text-danger">*필수 입력 사항</span></small>
		</div>

<form action="uploadLesson.do" method="post" enctype="multipart/form-data">  
<div class="card-body">  
			<div class="row my-2">
                <input type="hidden" name ="category" value="${category }">
                <input type="hidden" name ="lectureNum" value="${lectureNum }">
                <input type="hidden" name="id" value="${vo.id }">
			 </div>
              <div class="row my-2">

                  <h6>강의 제목<span class="text-danger">*</span></h6>
                  </div>
                  <div class="row my-2">
                  <input type="text" style="width: 50%;" class="form-control" id="" name="title">
                  </div>

              
              <div class="row my-2">

                  <h6>강의 내용<span class="text-danger"></span> </h6>
                  </div>
                  <div class="row my-2">
                  <textarea class="form-control" style="width: 50%;" id="" name="content"></textarea>
                  </div>

			<div class="row my-2">
				<h6>영상 업로드하기 <span class="text-danger">*</span></h6>
			</div>
            <div class="row my-2">
                 <input type="file" class="btn btn-secondary" id="" name="videoFile" >
            </div>
            <div class="row">
                 <small class="text-danger" style="font-size: 15px;">mp4 파일로 올려주세요.</small>
			</div>
              <div class="row my-2">
				 <h6>썸네일 이미지 업로드하기 <span class="text-danger">*</span></h6>
              </div>
              <div class="row my-2">
                  <input type="file" class="btn btn-secondary" id="" name="thumbnailFile" >
              </div>

				<div class="row my-2">

                  <h6>태그<span class="text-danger">*</span> </h6>
                  </div>
                  <div class="row my-2">
                  <input type="text" class="form-control" style="width: 50%;" id="" name="hashTag">
                  </div>
                  <samll>여러개의 태그는 콤마(#) 로 구분해주세요.</samll>
					<div align="center">
          				    <input type="submit" class="btn btn-sm btn-primary" value="확인" onclick="alert('강의가 등록되었습니다.');">
          				    <input type="button" class="btn btn-sm btn-primary" value="취소" onclick="location.href='lecture.go?lectureNum=${lectureNum}&imTeacher=Y'">
							</div>
						</div>
					</div>
				</form> 
				</div>
				<br>
			</div>			
 <%@ include file="footer.jsp" %>
  </body>
</html>