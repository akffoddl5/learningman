<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>
  <title>다배워 ! LearningMan &mdash;</title>
<%@ include file="metaHeader.jsp" %>
 </head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
$(document).ready(function(){
   
   
   var wsUri = "ws://ec2-15-165-204-212.ap-northeast-2.compute.amazonaws.com/learningman/echo.do";

    websocket = new WebSocket(wsUri);
//딱봐도 알거라고 믿겟음 함수명이 모든걸 말아주고있져?
    websocket.onopen = function(evt) {
        onOpen(evt)
    };
//것도 메시지보내는
    websocket.onmessage = function(evt) {
      //alert(evt + "받는?");
      //printMessage(evt);
        onMessage(evt);
    };
    
    function printMessage(evt){
       $("#chatList").append(evt);
    }
    
//에러
    websocket.onerror = function(evt) {
        onError(evt)
    };
   
    $("#chatSendBtn").click(function(){
       var content = document.getElementById("chatSend").value;
       var myId = document.getElementById("idText").value;
       var finalValue = myId+"!learnChatKey!"+content;
       doSend(finalValue);
       $('#chatSend').val('');
       
       var query = {userId : myId ,content : content};
       $.ajax({
            type: "POST",
            url: "insertChat.do",
            data: query,
            success: function(data){
                  alert("디비 넣었음");
            }
         });
       
       
    });
    
    function onOpen(evt) {
       $("#chatList").prepend("관리자와의 채팅이 시작되었습니다.");
    }

    function onMessage(evt) {

        var recv = JSON.parse(evt.data);
        if(recv.type=='time')
            $('#time').text(recv.time);
        else if(recv.type=='chat'){
           //alert("chat 들어옴");
            var str = '<li style="">';
            str += '<table cellpadding="0" cellspacing="0">';
            str += '<tr>';
            
            str += '<td class="chat_td">';
            str += '<div style="font-size:14px;" class="email">'
            str += "아이디 :"+recv.name;
            str += '</div>';
            str += '<div class="chat_preview">';
            str += recv.chat;
            str += '</div></td>';
            str += '</tr></table></li>';
            $("#chatList").append(str);
        }
        
        el = document.getElementById('chatList');

        if (el.scrollHeight > 0) el.scrollTop = el.scrollHeight;
        
    }

    function onError(evt) {
    }

    function doSend(message) {
       
        websocket.send(message);
    }
    // 주기적으로 시간표시
    function getCurrentTime(){
        
        var Now = new Date();
        var NowTime = Now.getFullYear();

        NowTime += '-' + Now.getMonth() + 1 ;
        NowTime += '-' + Now.getDate();
        NowTime += ' ' + Now.getHours();
        NowTime += ':' + Now.getMinutes();
        NowTime += ':' + Now.getSeconds();

        return NowTime;
    }
    
   
    // 보내는곳에서 키포커스를 벗어날경우 
    /*
     $('#chatSend').keypress(function(data){
                if(data.which == 13){
                   alert("13");
                    senddate = {
                        type:"chat",
                        name:$('#idText').val(),
                        chat:$('#chatSend').val(),
                        date:getCurrentTime()
                    };
                    doSend(JSON.stringify(senddate));
                    $('#chatSend').val('');
                }
     });
    */
   
});


</script>
<script type="text/javascript">
function clickLecture(lectureNum){
	
	var myId ='${vo.id}';
	//alert(myId);
	var uri = "lecture.go?lectureNum=" + lectureNum ;
	if(myId ==""){
		alert("로그인이 필요한 서비스입니다.");
	}else{
		location.href=uri;
	}
	
}

</script>
  <body>

  
<%@ include file="header.jsp" %>

    <div class="site-blocks-cover" style="background-image: url(resources/uploadedVideos/${imgVO.imgmain});" data-aos="fade">

        <div class="row align-items-start align-items-md-center justify-content-end">

          </div>
    
      </div>
    
    <div class="m-5"></div>

    <div class="site-section site-section-sm site-blocks-1" style="padding: 0; background-color: #e9ecef;" align="center" >
            <div class="text-center"><br>
              <p class="mb-4"><font size="4">"As a culture, we are moving from a group of people who know it all to a group of people who want to learn it all."</font><br><font size="3" color="gray">-Satya Nadella</font></p>
              <p>
              	<c:if test="${vo.id == null }">
                <a href="loginForm.go" class="btn btn-sm btn-primary">시작하기</a>
              	</c:if>
              </p>
            </div>  


    </div>
  <div class="site-wrap">
<style>
<!--

.card{
border-color: white;
}

-->
</style>

  		<div class="container">
		<div class="site-section site-blocks-2" style=" width: 100%; padding: 0; ">
  		<div class="my-3">
           <span style="font-weight: bold; font-size: 24px;">인기 강의</span>
  		</div>
        
<div class="row">
        <c:forEach items="${bestCategoryLectureList}" var="lectureVO">
        <div class="row">
     <div class="card" style="margin-right: 10px;">
          <div class="card-body">
          <div class="col" data-aos="fade" data-aos-delay="100" >
            <a class="block-2-item" onclick="clickLecture('${lectureVO.num}');" style="cursor: pointer;">
              <figure class="image">
                <img src="resources/uploadedVideos/${lectureVO.thumnailPath }" class="img-fluid img-rounded" width="213" height="280">
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
        </div>
        </c:forEach>
        </div>
  
 
    </div>

   

		<div class="site-section site-blocks-2" style=" width: 100%; padding: 0; ">
  		<div class="my-3">
           <span style="font-weight: bold; font-size: 24px;">신규 강의</span>
  		</div>
        
<div class="row">
        <c:forEach items="${newCategoryLectureList}" var="lectureVO">
        <div class="row">
     <div class="card" style="margin-right: 10px;">
          <div class="card-body">
          <div class="col" data-aos="fade" data-aos-delay="100" >
            <a class="block-2-item" onclick="clickLecture('${lectureVO.num}');" style="cursor: pointer;">
              <figure class="image">
                <img src="resources/uploadedVideos/${lectureVO.thumnailPath }" class="img-fluid img-rounded" width="213" height="280">
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
        </div>
        </c:forEach>
        </div>
  
 
    </div>




<div class="site-section site-blocks-2" style=" width: 100%; padding: 0; ">
  		<div class="my-3">
           <span style="font-weight: bold; font-size: 24px;">추천 강의</span>
  		</div>
        
<div class="row">
        <c:forEach items="${recommendCategoryLectureList}" var="lectureVO">
        <div class="row">
     <div class="card" style="margin-right: 10px;">
          <div class="card-body">
          <div class="col" data-aos="fade" data-aos-delay="100" >
            <a class="block-2-item" onclick="clickLecture('${lectureVO.num}');" style="cursor: pointer;">
              <figure class="image">
                <img src="resources/uploadedVideos/${lectureVO.thumnailPath }" class="img-fluid img-rounded" width="213" height="280">
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
        </div>
        </c:forEach>
        </div>
  
 
    </div>
 
    
    </div>

 <!-- 채팅 아이콘 start -->

 <!-- Button trigger modal -->
 <c:if test="${vo.id != null}">
 <div class="float2">
<a href="#" class="icon-comment" title="상담하기" style="font-size: 50px;" data-toggle="modal" data-target="#fullHeightModalRight"></a>
</div>
</c:if>
<!-- Full Height Modal Right -->
<div class="modal fade right" id="fullHeightModalRight" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
  aria-hidden="true" >

  <!-- Add class .modal-full-height and then add class .modal-right (or other classes from list above) to set a position to the modal -->
  <div class="modal-dialog modal-full-height modal-right" role="document" >


    <div class="modal-content" style="left: 90%; top: 150px;"  >
      <div class="modal-header" style="background-color: #7971ea;">
   
        <h4 class="modal-title w-100" id="myModalLabel" ><font color="white">LEANNINGMAN CONSULTING</font><div class="text" style="font-size: 13px;"><font color="white">응답에 시간이 걸릴수 있습니다.</font></div></h4>

        

        <a  class="close" style="color: white;" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </a>
      </div>
       <input type="hidden" value = "${vo.id }" id = "idText" >
      <div class="modal-body" id="chatList" style="height: 300px; overflow-y:scroll; overflow: auto;">
      
      </div>
      <textarea id="chatSend" rows="3" cols="5" placeholder="내용을 입력해주세요..."></textarea>
      <div class="modal-footer justify-content-center">
        <button id="chatSendBtn" type="button" class="btn btn-primary" style="float:right; font-weight: bold; font-size: 14px; margin-left: 80%;">보내기</button>
      </div>
    </div>
  </div>
</div>
<!-- Full Height Modal Right -->

 </div><!-- site wrap end -->
   <%@ include file="footer.jsp"%>
       </body>
</html>
