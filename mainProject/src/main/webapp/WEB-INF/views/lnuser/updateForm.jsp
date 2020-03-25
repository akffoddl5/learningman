<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
<head>
  <title>다배워 ! LearningMan &mdash;</title>
<%@ include file="metaHeader.jsp" %>
 </head>
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
      $(document).ready(function(){
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
         
         $("#updateBtn").click(function(){
            var p1 = document.getElementById("name").value;
            var p2 = document.getElementById("email").value;
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
            	//alert("일단 넘겨");
               	$("#update_form").submit();
          	}
         });
   });
   </script>
   <!-- 이미지 미리보기 -->
<script type="text/javascript">
function previewImage(targetObj, View_area) {
	var preview = document.getElementById(View_area); //div id
	var ua = window.navigator.userAgent;	

  //ie일때(IE8 이하에서만 작동)
	if (ua.indexOf("MSIE") > -1) {
		targetObj.select();
		try {
			var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
			var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


			if (ie_preview_error) {
				preview.removeChild(ie_preview_error); //error가 있으면 delete
			}

			var img = document.getElementById(View_area); //이미지가 뿌려질 곳

			//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
			img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
		} catch (e) {
			if (!document.getElementById("ie_preview_error_" + View_area)) {
				var info = document.createElement("<p>");
				info.id = "ie_preview_error_" + View_area;
				info.innerHTML = e.name;
				preview.insertBefore(info, null);
			}
		}
  //ie가 아닐때(크롬, 사파리, FF)
	} else {
		var files = targetObj.files;
		for ( var i = 0; i < files.length; i++) {
			var file = files[i];
			var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
			if (!file.type.match(imageType))
				continue;
			var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
			if (prevImg) {
				preview.removeChild(prevImg);
			}
			var img = document.createElement("img"); 
			img.id = "prev_" + View_area;
			img.classList.add("obj");
			img.file = file;
			img.style.width = '100px'; 
			img.style.height = '100px';
		
			preview.appendChild(img);
			if (window.FileReader) { // FireFox, Chrome, Opera 확인.
				var reader = new FileReader();
				reader.onloadend = (function(aImg) {
					return function(e) {
						aImg.src = e.target.result;
					};
				})(img);
				reader.readAsDataURL(file);
			} else { // safari is not supported FileReader
				//alert('not supported FileReader');
				if (!document.getElementById("sfr_preview_error_"
						+ View_area)) {
					var info = document.createElement("p");
					info.id = "sfr_preview_error_" + View_area;
					info.innerHTML = "not supported FileReader";
					preview.insertBefore(info, null);
				}
			}
		}
	}
}
</script>
  </head>
  <body>
  <c:if test="${vo.id == null }">
  <script type="text/javascript">
  alert("로그인부터 하세요.");
  location.href="loginForm.go";
  </script>
  </c:if>

<%@ include file="header2.jsp" %>


  <div class="site-wrap">
      <div class="text-center">
      <h1 class="text-center" style="font-size: 28px; color: black;">프로필 수정</h1><br>
      </div>
 
      <center>
<form id="update_form" action="updateUser.do" method="post" enctype="multipart/form-data">
               <label style="width: 30%;">
              <span class="icon-user-o" style="float: left;" >&nbsp;프로필 사진</span><br>
              
       <div class="container">
         <div class="row">
            <div class="col-12">
              <div id='View_area' align="left"></div>
              	</div>
						<hr/>
						<div class="row" align="center">
					<div class="col-12">
              			<input type="file"  name="profile_pt" id="profile_pt" onchange="previewImage(this,'View_area')">
						</div>
					</div>
          	     </div>
              </div>
             
              <p align="left" id="" style="color:red"></p>  
               
             <span class="icon-user-o" style="float: left;" >&nbsp;아이디</span><br>
              <input type="text" class="form-control" name="id" id="id" readonly="readonly" value="${vo.id }">
              <p align="left" id="idP1" style="color:red"></p>

                <span class="icon-lock2" style="float: left;">&nbsp;비밀번호</span><br>
                 <input type="password" class="form-control" name="password" id="password" readonly="readonly" value="${vo.password }">
                 <p align="left" id="pwP1" style="color:red"></p>

               <span class="icon-id-card" style="float: left;">&nbsp;이름</span><br>
                  <input type="text" class="form-control" name="name" id="name" value="${vo.name }">
                  <p align="left" id="nameP1" style="color:red"></p>
             
               <span class="icon-envelope" style="float: left;">&nbsp;이메일</span><br>
                  <input type="text" class="form-control" name="email" id="email" placeholder="example@example.com" value="${vo.email }">
                  <p align="left" id="emailP1" style="color:red"></p>

               <span class="icon-phone" style="float: left;">&nbsp;전화 번호</span><br>
                  <input type="text" class="form-control" name="phone" id="phone" placeholder="-제외한 번호를  입력해주세요" value="${vo.phone }">
                  <p align="left" id="phoneP1" style="color:red"></p>
				
				<div class="container">
					<div class="row" align="center">
						<div class="col-6 text-right">
							<input type="button" class="btn btn-sm btn-primary" style="font-weight: bold;" name="updateBtn"  id="updateBtn" value="수정 하기">
						</div>
							<div class="col-6 text-left">
								<input type="button" class="btn btn-sm btn-primary" style="font-weight: bold;" onClick="window.location='myPage.do'" value="취소">
							</div>
						</div>
				</div>

              </label>

</form>

      </center>
</div>
<%@ include file="footer.jsp"%>
  </body>
</html>