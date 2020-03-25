<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">
<head>
  <title>다배워 ! LearningMan &mdash;</title>
<%@ include file="metaHeader.jsp" %>
  </head>
	
      
   <script>
   
   function submitReply(lessonNum){
	   var id1 = document.getElementById("id1").value;
	   var content1 = document.getElementById("replyArea").value;
	   var lessonNum1 = document.getElementById("lessonNum1").value;
	   var query = {content:content1, id:id1 , lessonNum : lessonNum1};
  	 $.ajax({
           type: "POST",
           url: "insertLessonReply.do",
           data: query,
           success: function(data){
        	   document.getElementById("replyArea").value='';
        	   //location.reload();
        	   lessonAjax(lessonNum1);
           }
        });
  	 
   }
   
   function submitReply2(replyNum){
	   var name = "rereple"+replyNum;
	   var id1 = document.getElementById("id1").value;
	   var content1 = document.getElementById(name).value;
	   var lessonNum1 = document.getElementById("lessonNum1").value;
	   var ref1 = replyNum;
	   var query = {content:content1, id:id1 , lessonNum : lessonNum1, ref: ref1};
  	 $.ajax({
           type: "POST",
           url: "insertLessonReReply.do",
           data: query,
           success: function(data){
        	   document.getElementById(name).value='';
        	   //location.reload();
        	   lessonAjax(lessonNum1);
           }
        });
  	 
   }
   
   
   function lessonAjax(lessonNum1){
	   var query = {lessonNum : lessonNum1};
	   $.ajax({
           type: "POST",
           url: "lessonAjax.do",
           data: query,
           success: function(data){
        	   $("#lessonAjaxDiv").html(data);
           }
        });
   }
   </script>
  <body>
  
  <c:if test="${lessonList.size() <1 }">
  <script>
  alert("강의 준비중입니다..");
  location.href="index.do";
  </script>
  </c:if>
  <%@ include file="header2.jsp" %>
  
  <style>
<!--
.site-wrap{
max-width: 1176px;
    width: 100%;
}
-->
</style>
<div class="site-wrap">
<div id="lessonAjaxDiv">    
    <!-- 영상 들어가는 곳 -->
    <div class="flex-container" style="width: 90%; float: left;">
		 <video src="resources/uploadedVideos/${lessonList[0].videoPath }" autoplay="autoplay" controls="controls"
		  style="width: 1055px; height: 600px;"></video>

    <!--  댓글 달기 시작 -->
<div class="card">
<div class="card-body" style="padding: 24px;">
        <div class="row my-2">
        <h2 style="font-size: 18px;">${lessonList[0].title } </h2>
        </div>
        <div class="row my-2">
        <h3 style="font-size: 14px;">${lessonList[0].regDate }</h3>
        </div>
        <hr/>
        <div class="row my-2">
    <input type="hidden" name="id" id="id1" value="${vo.id }">
    </div>
    <div class="row my-2"> 
    <input type="hidden" name="lessonNum" id="lessonNum1" value="${lessonList[0].num}">
    <img src="resources/uploadedVideos/${vo.thumbnail}" width="40" height="40" class="rounded-circle">&nbsp;&nbsp;${vo.id }
    </div>
    <div class="row my-2">
	<textarea name="replyArea" id="replyArea" class="form-control" placeholder="댓글 달기"></textarea>
	</div>
	<div class="row my-2" style="float: right;"> 
	<button id="replyBtn" class="btn btn-sm btn-info text-right" onclick="submitReply('${lessonList[0].num}')">작성완료</button>
	</div>
	</div>
</div>
        <c:forEach items= "${replyList}" var="sList">
					<table class="table table-borderless" style="width: 100%;" >
					
				<tbody  >
         			 <tr>
           				 <p style="font-size: 13px;"> ${sList[0].regDate }</p>
          				  <span><img src="resources/uploadedVideos/${sList[0].thumbnail}" width="40" height="40" class="rounded-circle">&nbsp;&nbsp;${vo.id }</span>
        			  </tr>
         			   <tr>
          				  <p>${sList[0].content }</p> 
           				 </tr>
			 <c:forEach items= "${sList}" var="rvo" begin="1">
     			  <div> &nbsp;</div><tr>
     				  <p> ${sList[0].regDate }</p>
     				  <span><img src="resources/uploadedVideos/${rvo.thumbnail}" width="40" height="40" class="rounded-circle">&nbsp;&nbsp;${rvo.id }</span>
       				</tr>
     					  <tr>
    					    <p>${rvo.content }</p>
      					 </tr>
     	  </c:forEach>
     				  <tr>
   					    <td><input id="rereple${sList[0].num }" type="text"  class="form-control" placeholder="댓글을 입력해주세요."></td>
   					    <td style="width: 1px;"><button class="btn btn-info" id="replyBtn2" type="button"  onclick="submitReply2('${sList[0].num}')">+</button></td>
   					    
    					   </tr>
     			   </tbody>
				</table>
		</c:forEach>
		<!--  최소 여기까진 Ajax 해야댐 -->
					        </div>
           </div>
	

 <!-- 오른쪽 메뉴 -->
      <div class="container"  style=" max-width: 300px; margin-right:0; margin-left: 1070px; font-size: 15px;"  >
        <div class="row">
		 <small>다음 강의 영상</small>
 		</div>
 		<hr/>
  <c:forEach items="${lessonList}" var="lessonVO">
        <div class="row my-2">
        <div class="col">
        <span style="cursor:pointer; " onclick="lessonAjax('${lessonVO.num}')"></span>
		<img src="resources/uploadedVideos/${lessonVO.thumbnailPath }" style="width: 100px; height: 100px; cursor:pointer;" onclick="lessonAjax('${lessonVO.num}')" align="left">
        </div>
        		   <div class="col-sm">
		<div class="row">
		<h6 style="cursor:pointer; " onclick="lessonAjax('${lessonVO.num}')">${lessonVO.title }</h6>
		</div>
		<div class="row">
		<small style=" background-color: #edf0f5; font-weight: bold; color: #7971ea; border-radius: 5px;">${lessonVO.category }</small>
		</div>
		<div class="row">
		<small>${lessonVO.regDate }</small>
		</div>

		   </div>
        
		   </div>

     
		<hr/>

  </c:forEach>

        </div>
</div>



  <script src="resources/js/jquery-3.3.1.min.js"></script>
  <script src="resources/js/jquery-ui.js"></script>
  <script src="resources/js/popper.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="resources/js/owl.carousel.min.js"></script>
  <script src="resources/js/jquery.magnific-popup.min.js"></script>
  <script src="resources/js/aos.js"></script>

  <script src="resources/js/main.js"></script>
  </body>
</html>