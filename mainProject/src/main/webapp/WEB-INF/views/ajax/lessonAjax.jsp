<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">
<head>
  <title>다배워 ! LearningMan &mdash;</title>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<%@ include file="metaHeader.jsp" %>
  </head>
<body>

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
		 <video src="resources/uploadedVideos/${lessonVO.videoPath }" autoplay="autoplay" controls="controls" 
		 style="width: 1055px; height: 600px;"></video>

    <!--  댓글 달기 시작 -->
<div class="card">
<div class="card-body" style="padding: 24px;">
        <div class="row my-2">
        <h2 style="font-size: 18px;">${lessonVO.title } </h2>
        </div>
        <div class="row my-2">
         <h3 style="font-size: 14px;">${lessonVO.regDate }</h3>
        </div>
        <hr/>
        <div class="row my-2">
    <input type="hidden" name="id" id="id1" value="${vo.id }">
    </div>
    <div class="row my-2"> 
    <input type="hidden" name="lessonNum" id="lessonNum1" value="${lessonVO.num}">
    <img src="resources/uploadedVideos/${vo.thumbnail}" width="40" height="40" class="rounded-circle">&nbsp;&nbsp;${vo.id }
    </div>
    <div class="row my-2">
	<textarea name="replyArea" id="replyArea" class="form-control" placeholder="댓글 달기"></textarea>
	</div>
	<div class="row my-2" style="float: right;"> 
	<button id="replyBtn" class="btn btn-sm btn-info text-right" onclick="submitReply('${lessonVO.num}')">작성완료</button>
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
     			  <tr>
     				  <p style="font-size: 13px;"> ${sList[0].regDate }</p>
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