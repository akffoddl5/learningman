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
         $("#id").blur(function(){
            var id = document.getElementById("id");
            var result = id.value;
            if(result.length < 1){
               $("#idP1").text("아이디를 입력해주세요.");
            }else{
               $("#idP1").text("");
            }
         });
         
         $("#password").blur(function(){
             var pw = document.getElementById("password");
             var result = pw.value;
             if(result.length < 1){
                $("#pwP1").text("패스워드를 입력해주세요.");
             }else{
                $("#pwP1").text("");
             }
          });
         
        
         $("#phone").blur(function(){
            var phone = document.getElementById("phone");
            var result = phone.value;
            if(result.length < 1){
               $("#phoneP1").text("전화번호를 입력해주세요.");
            }else{
               $("#phoneP1").text("");
            }
         });
         
         $("#insertTeacherBtn").click(function(){
            var p1 = document.getElementById("id").value;
            var p2 = document.getElementById("password").value;
            var p3 = document.getElementById("phone").value;
            //alert(p1 + p2 + p3);
            if(p1 == ""){
               alert("이름을 다시 입력하세요.");
               document.getElementById("name").focus();
            }else if(p2 == ""){
               alert("이메일을 다시 입력하세요.");
               document.getElementById("email").focus();
            }else if(p3 == ""){
               alert("전화번호를 다시 입력하세요.");
               document.getElementById("phone").focus();
            }else{
            	var query = {id:p1 , password:p2 , phone : p3 };
           	 $.ajax({
                    type: "POST",
                    url: "iWantToTeacher.do",
                    data: query,
                    success: function(data){
                   	 alert(data);
                   	 if(data.replace(/^\s*/,"") == "강사 등록이 완료되었습니다."){
                   		 location.href="myPage.do";
                   	 }
                    }
                 });

          	}
         });
   });
	
	
	</script>
  <body>
   <%@ include file="header.jsp" %>
  
<div class="site-wrap">
       <!-- TeacherLicense UI start -->
    <form action="iWantToTeacher.do" method="post" name="iWantToTeacher_Form">

    <div  class="container" style="width: 30%;">
 <div class="col">
 <div class="row my-2 justify-content-left">
 <h5 class="icon-user-plus" data-aos="fade-up" style="color: rgb(62, 64, 66); font-size:24px; font-weight: bold;">
 &nbsp;강사지원</h5>
 </div>
 <div class="row my-3">
 <span class="icon-user-o" >&nbsp;아이디</span><br>
 </div>
 <div class="row my-3">
              <input type="text"  class="form-control" name="id" id="id" />
               </div>
               <div class="row my-3">
              <p align="left" id="idP1" class="text-danger"></p>
 </div>
 <div class="row my-3">
         <span class="icon-lock2" >&nbsp;비밀번호</span><br>
 </div>
 <div class="row my-3">
                 <input type="password"  class="form-control" name="password" id="password" />
 </div>
  <div class="row my-3">
                 <p align="left" id="pwP1" class="text-danger"></p>
        </div>
          <div class="row my-3">
                <span class="icon-phone">&nbsp;전화 번호</span><br>
                      </div>
                               <div class="row my-3">
                  <input type="text"  class="form-control" name="phone" id="phone" / >
                          </div>
                                <div class="row my-3">
                  <p align="left" id="phoneP1" class="text-danger"></p>
                     </div>
      
         <div class="text-center my-3">
         <input type="button" id="insertTeacherBtn" name="insertTeacherBtn" class="btn btn-sm btn-primary" value="강좌 개설하러 가기" >
         </div>
         
         </div>
      </div>

      </form> 

<c:if test="${type != 'normal' }">
<script>
alert("social login한 유저는 자동입력됩니다.");
var type = '${type}';
var id = '${vo.id}';
var phone = '${vo.phone}';
var password = '${vo.password}';

if(type == "naver"){
	password = "naver";	
}else if(type == "kakao"){
	password = "kakao";
}

document.getElementById("id").value = id;
document.getElementById("phone").value = phone;

document.getElementById("password").value = password;

</script>
</c:if>

 <!-- eacherLicense UI end -->
</div>
<%@ include file="footer.jsp"%>
  </body>
</html>