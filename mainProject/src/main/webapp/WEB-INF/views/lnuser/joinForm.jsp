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
<br>

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
 
	<script type="text/javascript">
      $(document).ready(function(){
         $("#id").blur(function(){
            var id_check = document.getElementById("id");
            var eng_check = false;
            var num_check = false;
            var emo_check = false;
            var result = id_check.value;
            if(result.length < 1){
               $("#idP1").text("아이디를 입력해주세요.");
            }else{
               
               if(result.length < 5){
                  $("#idP1").text("5글자 이상입력하세요.");
               }else{
                  for(var i=0; i<result.length; i++){
                     if((result.charAt(i) >= 'a' && result.charAt(i) <= 'z') || (result.charAt(i) >= 'A' && result.charAt(i) <= 'Z')){
                        eng_check = true;
                     }else if(result.charAt(i) >='0' && result.charAt(i) <= '9'){
                        num_check = true;
                     }else{
                        emo_check = true;
                     }
                  }
                  if(eng_check && num_check && !emo_check){
                     var query = {id : result};
                     $.ajax({
                        type: "POST",
                        url: "idAutho.do",
                        data: query,
                        success: function(data){
                           $("#idP1").html(data);
                        }
                     });
                  }else{
                     $("#idP1").text("영문 + 숫자 로 입력하세요");
                  }
               }
               
            }
         });
      
         $("#password").blur(function(){
            var pw_check = document.getElementById("password");
            var eng_check = false;
            var num_check = false;
            var result = pw_check.value;
            if(result.length < 1){
               $("#pwP1").text("비밀번호를 입력해주세요.");
            }else{
               
               if(result.length < 8){
                  $("#pwP1").text("8글자 이상 입력하세요.");
               }else{
                  for(var i=0; i<result.length; i++){
                     if((result.charAt(i) >= 'a' && result.charAt(i) <= 'z') || (result.charAt(i) >= 'A' && result.charAt(i) <= 'Z')){
                        eng_check = true;
                     }else if(result.charAt(i) >='0' && result.charAt(i) <= '9'){
                        num_check = true;
                     }
                  }
                  if(eng_check && num_check){
                     $("#pwP1").text("");
                  }else{
                     $("#pwP1").text("영문 + 숫자 로 입력하세요");
                  }
               }
            }
         });
         
         $("#repassword").blur(function(){
            var pw_check = document.getElementById("password");
            var pw_result = pw_check.value;
            var repw_check = document.getElementById("repassword");
            var repw_result = repw_check.value;
            if(repw_result.length < 1){
               $("#repwP1").text("비밀번호 확인을 입력해주세요.");
            }else{
               
               if(pw_result != repw_result){
                  $("#repwP1").text("비밀번호가 일치하지 않습니다.");
               }else{
                  $("#repwP1").text("");
               }
            }
         });
         
         $("#name").blur(function(){
            var name = document.getElementById("name");
            var result = name.value;
            if(result.length < 1){
               $("#nameP1").text("이름을 입력해주세요.");
            }else{
               $("#nameP1").text("");
            }
         });
         
         $("#email").blur(function(){
            var email = document.getElementById("email");
            var result = email.value;
            var email_check = false;
            var email2_check = false;
            if(result.length < 1){
               $("#emailP1").text("이메일을 입력해주세요.");
            }else{
               for(var i=0; i<result.length; i++){
                  if(result.charAt(i) == '@'){
                     email_check = true;
                  }
                  if(result.charAt(i) == '.'){
                     email2_check = true;
                  }
               }
               if(email_check && email2_check){
                  $("#emailP1").text("");
               }else{
                  $("#emailP1").text("이메일 형식이 맞지 않습니다.");
               }
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
         
         $("#joinbtn").click(function(){
            var p1 = document.getElementById("idP1").textContent.replace(/^\s*/,"");
            var p2 = document.getElementById("pwP1").textContent;
            var p3 = document.getElementById("repwP1").textContent;
            var p4 = document.getElementById("nameP1").textContent;
            var p5 = document.getElementById("emailP1").textContent;
            var p6 = document.getElementById("phoneP1").textContent;
            if(p1 != "사용가능한 아이디입니다." ){
               alert("아이디를 다시 입력하세요.");
               document.getElementById("id").focus();
            }else if(p2 != "" || document.getElementById("password").value == ""){
               alert("비밀번호를 다시 입력하세요.");
               document.getElementById("password").focus();
            }else if(p3 != "" || document.getElementById("repassword").value == ""){
               alert("비밀번호 확인을 다시 입력하세요.");
               document.getElementById("repassword").focus();
            }else if(p4 != ""){
               alert("이름을 다시 입력하세요.");
               document.getElementById("name").focus();
            }else if(p5 != ""){
               alert("이메일을 다시 입력하세요.");
               document.getElementById("email").focus();
            }else if(p6 != ""){
               alert("전화번호를 다시 입력하세요.");
               document.getElementById("phone").focus();
            }else if($("#ckbox").is(":checked") == false){
               $("#ckboxP1").text("동의하셔야지만 다음으로 진행할 수 있습니다.");
          }else{
               $("#ckboxP1").text("");
               $("#join_form").submit();
          }
            
            
         });
         
        
         
   });
   </script>
  

  
  <div class="site-wrap">
<div class="container" style="width: 80%; margin-top: 5% ! important;  margin-bottom: 5% ! important;">

      <h1 class="text-center" style="font-size: 28px; color: black;">회원가입</h1><br>
     
      <center>
<form id="join_form" action="mailAutho.do" method="post" >
               <label style="width: 40%;">
             <span class="icon-user-o" style="float: left;">&nbsp;아이디</span><br>
              <input type="text" maxlength="15" class="form-control py-4" name="id" placeholder="id" id="id">
              <p id="idP1" style="color:red;"></p>

                <span class="icon-lock2" style="float: left;">&nbsp;비밀번호 (8자 이상)</span><br>
                 <input type="password" class="form-control py-4" name="password" placeholder="password" id="password">
                 <p id="pwP1" style="color:red;"></p>
              
              <span class="icon-lock2" style="float: left;">&nbsp;비밀번호 확인</span><br>
                  <input type="password" class="form-control py-4" name="repassword" placeholder="repassword" id="repassword">
                  <p id="repwP1" style="color:red;"></p>
             
               <span class="icon-id-card" style="float: left;">&nbsp;이름</span><br>
                  <input type="text" class="form-control py-4" name="name" placeholder="name" id="name">
                  <p id="nameP1" style="color:red;"></p>
             
               <span class="icon-envelope" style="float: left;">&nbsp;이메일</span><br>
                  <input type="text" class="form-control py-4" name="email" placeholder="example@example.com" id="email">
                  <p id="emailP1" style="color:red;"></p>

               <span class="icon-phone" style="float: left;">&nbsp;전화 번호</span><br>
                  <input type="text" class="form-control py-4" name="phone" placeholder="-를 제외한 휴대폰 번호를 입력해주세요" id="phone">
                  <p id="phoneP1" style="color:red;"></p>
                  
                   <!-- 0304 약관 동의 보기 추가 -->
                  <script type="text/javascript">
                  function openTerms(){
                     window.open("http://ec2-15-165-204-212.ap-northeast-2.compute.amazonaws.com/learningman/terms.do","이용약관 및 개인정보 처리 방침",
                           "left=400pixels, width=800, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
                  }
                  </script>
<a onclick="javascript:openTerms();" style="float: left; cursor:pointer;"  >이용약관 및 개인정보 처리 방침 보기</a>


<div style="float: left;"><input id="ckbox" type="checkbox" name="service" >&nbsp;이용약관 및 개인정보처리 방침 동의</div>
<br>
<p id="ckboxP1" style="color:red"></p>

<br>
<input type="button" class="btn btn-sm btn-primary" name="joinbtn"  id="joinbtn" style="font-weight: bold; width: 100%;" value="회원 가입 하기">
              </label>

</form>
<br>
      </center>
      </div>
</div>
<%@ include file="footer.jsp"%>
  </body>
</html>