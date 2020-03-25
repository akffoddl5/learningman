<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file ="../commonPage/adminHeader.jsp" %>
    <!-- ============================================================== -->
    <!-- main wrapper-->
    <!-- ============================================================== -->
<%@include file ="../commonPage/adminSideMenu.jsp" %>
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    <!-- ============================================================== -->
                    <!-- pageheader  -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="">
                            <div class="page-header">
                                <h2 class="pageheader-title">채팅 현황</h2>
                            </div>
                        </div>
                    </div>
                </div>
                
                <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
$(document).ready(function(){
   
   $(".classArea").hide();
   
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
       var target = document.getElementById("chattingUser").value;
       var myId = document.getElementById("idText").value;
       var keyValue = "!learnChatKey!";
       var finalValue = myId + keyValue + content+keyValue + target;
       //alert(finalValue);
       doSend(finalValue);
       $('#chatSend').val('');
       //alert("flag2");
       var query = {adminId : myId ,content : content};
       $.ajax({
            type: "POST",
            url: "insertChat.do",
            data: query,
            success: function(data){
                  //alert("디비 넣었음");
            }
         });
       
       
       
    });
    
    function onOpen(evt) {
       $("#chatList").prepend("상담서비스를 시작합니다.");
       el = document.getElementById('chatList');

       if (el.scrollHeight > 0) el.scrollTop = el.scrollHeight;
    }

    function onMessage(evt) {

        var recv = JSON.parse(evt.data);
        if(recv.type=='time')
            $('#time').text(recv.time);
        else if(recv.type=='chat'){
           //alert("chat 들어옴");
            var str = '<li>';
            str += '<table cellpadding="0" cellspacing="0">';
            str += '<tr>';
           
            str += '<td class="chat_td">';
            str += '<div class="email" style="font-size:14px;" id="email" style="color:red; cursor:pointer;" onclick="nameClick()">'
            str += "아이디 :"+recv.name;
            str += '</div>';
            str += '<div class="chat_preview">';
            str += recv.chat;
            str += '</div></td>';
            str += '<td class="time_td">';
            str += '<div class="time">';
            str += recv.date;
            str += '</div><div class="check"><p></p></div></td></tr></table></li>';
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
     $('#chatSend').keypress(function(data){
                if(data.which == 13){
                   //alert("13");
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
   
   
   
   
});




</script>

<script>
//이름 클릭하면 설정되게
 function nameClick(){
       var id = $("#email").value;
       alert(id);
       
    }

    function showMe(id){
       var d1 = "#"+id;
       var d2 = "#"+id+"2";
       alert("show me" + id);
       
       $(d1).toggle();
       $(d2).toggle();
    }

    function SendBtnClick(id){
       var contentId = id+"chatSend";
       var content = document.getElementById(contentId).value;
       var keyValue = "!learnChatKey!";
       var finalValue = id + keyValue + content;
       alert(finalValue);
       doSend(finalValue);
       $('#chatSend').val('');
       alert("flag2");
       
    }

</script>
              
                
    <center>            
             <div id="chatDiv">
    
    
    
    
    <table style="height: 500px; width: 500px">
    <input type="hidden" value = "${vo.id }" id = "idText" />
     <tr>
    <td><div style="border: 1px solid red; height:700px; width:600px; overflow-y:scroll; background-color: white; " id="chatList"></div></td>
    </tr>
    <tr>
    <td><input type="text" id="chatSend" placeholder="내용 입력" /> <button id="chatSendBtn" >전송2</button>&nbsp;&nbsp;&nbsp;
    <select style="font-size: 20px;" name="chattingUser" id = "chattingUser">
    <c:forEach items="${chattingUserList}" var="person">
       <option style="font-size: 20px;" value="${person }"><h2>${person }</h2></option>
    </c:forEach>
    </select>
    
    
    </td>
    </tr>
    </table>
    
   </div>
         </div>
      </div>
      </center>
      
      
      <c:forEach items="${chatList}" var="chatDTO">
    <c:if test="${chatDTO.userId != 'dont_delete_this_account_never' }">
    <c:set var="chatId" value="${chatDTO.userId }"></c:set>
    </c:if>
    <c:if test="${chatDTO.adminId != 'dont_delete_this_account_never'}">
    <c:set var="chatId" value="${chatDTO.adminId }"></c:set>
    </c:if>
    
    <script>
    var str = '<li>';
    var s1 = "${chatId}";
    var s2 = "${chatDTO.content}";
    var s3 = "${chatDTO.regDate}";
    //alert(s1+s2+s3);
    str += '<table cellpadding="0" cellspacing="0">';
    str += '<tr>';
    str += '<td class="profile_td">';
    str += '<img src="resources/img/bitcoin-logo.png" />';
    str += '</td>';
    str += '<td class="chat_td">';
    str += '<div class="email" id="email" style="color:red; cursor:pointer;" onclick="nameClick()">'
    
    str += s1;
    str += '</div>';
    str += '<div class="chat_preview">';
    str += s2;
    str += '</div></td>';
    str += '<td class="time_td">';
    str += '<div class="time">';
    str += s3;
    str += '</div><div class="check"><p></p></div></td></tr></table></li>';
    //alert(str);
    $("#chatList").append(str);
   // $("#chatList").prepend(str);
    
    </script>
    </c:forEach>  
   <!-- ============================================================== -->
      <!-- footer -->
      <!-- ============================================================== -->
 <%@include file ="../commonPage/adminFooter.jsp" %>
 
 
 