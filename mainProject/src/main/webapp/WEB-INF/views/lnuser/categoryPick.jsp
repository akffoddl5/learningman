<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <html lang="en">
  


<head>
  <title>다배워 ! LearningMan &mdash;</title>
<%@ include file="metaHeader.jsp" %>
<c:if test="${categoryLectureList.size() == 0 }">
  <script>
  alert("아직 등록된 강의가 없습니다.");
  location.href="index.do";
  </script>
  </c:if>
 </head>
 <body>
<style>
<!--

.card{
border-color: white;
}

-->
</style>
  
<%@ include file="header.jsp" %>
  <div class="site-wrap">
<div class="site-section site-blocks-2">
  		<div class="container">
        

        <div class="row">
        <c:forEach items="${categoryLectureList}" var="lectureVO">
          <div class="col-md-6 col-lg-3 mb-5 mb-lg-0" style="padding: 10px;" data-aos="fade" data-aos-delay="100" >
     <div class="card">
          <div class="card-body">
            <a class="block-2-item" href="lecture.go?lectureNum=${lectureVO.num} ">
              <figure class="image">
                <img src="resources/uploadedVideos/${lectureVO.thumnailPath }" class="img-fluid img-rounded" >
              </figure>
               <div class="text" style="padding: 0;">
                <span class="icon-heart-o">&nbsp;${lectureVO.pickCnt}</span>&nbsp;&nbsp;<span class="icon-thumbs-o-up">&nbsp;${lectureVO.likeCnt}</span>
              </div>
             </a>
             <br>
             <a href="#" class="text" style="font-size: 12px;  background-color: #edf0f5; font-weight: bold; ">${lectureVO.category }</a>
             <a href="#" class="text" style="font-size: 12px;  background-color: #edf0f5; font-weight: bold; ">${lectureVO.id }</a>
            <br><br>
    			<p class="card-text" style="font-size: 14px;">${lectureVO.name }</p> <!--입력폼에서 글자수  15으로 제한-->
    			<hr color="#edf0f5">
    			<c:if test="${lectureVO.price !=0 }">
    			<a href="#" class="text" style="font-size: 12px;  background-color: #edf0f5; font-weight: bold; ">${lectureVO.price }원</a> <!-- 유료인경우 표시 -->
    			</c:if>
    			<c:if test="${lectureVO.price ==0 }">
    			<a href="#" class="text" style="font-size: 12px; background-color: #edf0f5; font-weight: bold; " >무료 강의</a>  <!-- 무료인경우 표시 -->
             </c:if>
           </div>
           </div>
          </div>
        </c:forEach>
  
        </div>
 
    </div>
 
    
        
    
  </div>
       </div>        
 <%@ include file="footer.jsp"%>
       </body>
</html>