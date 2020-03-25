<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>다배워 ! LearningMan &mdash;</title>
<%@ include file="metaHeader.jsp" %>
  </head>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#foundIdBtn").click(function(){
			var str1 = document.getElementById("name").value;
			var str2 = document.getElementById("email").value;
			var query = {name : str1 , email : str2};
			$.ajax({
				type: "POST",
				url: "foundId.do",
				data: query,
				success: function(data){
					//alert(data);
					$("#result").html(data);
				}
			});
		});
	});
	
	$(document).ready(function(){
		$("#foundPwBtn").click(function(){
			//alert("b");
			var str1 = document.getElementById("id").value;
			var str2 = document.getElementById("pname").value;
			var str3 = document.getElementById("pemail").value;
			var query = {id : str1, name : str2, email : str3};
			if(str1 != "" && str2 != "" && str3 != ""){
				$.ajax({
					type : "POST",
					url : "foundPw.do",
					data : query,
					success: function(data){
						alert(data);
						location.href="loginForm.go";
					}
				});
			}else{
				alert("입력되지 않은 양식이 있습니다. 다시 확인하세요.");
			}
		});
	});
	
	</script>

  <body>
    <%@ include file="header.jsp" %>
  <div class="site-wrap">
<style>
<!--

</style>
      <div class="row my-3" style="justify-content: center;">
	     <ul class="nav nav-pills">
              <li class="nav-item mx-2">
                <a class="nav-link active" data-toggle="tab" href="#foundId">아이디 찾기</a>
              </li>
              <li class="nav-item mx-2">
                <a class="nav-link" data-toggle="tab" href="#foundPw" >비밀번호 찾기</a>
              </li>
            </ul>
		</div>
<div class="container" style="text-align: -webkit-center; padding: 100px 0px 180px 0px;">

   <div class="tab-content my-5">
     <div class="tab-pane fade show active"  id="foundId">
       <div class="fid" style="width: 25%;">
<div class="container" style="margin-bottom: 60px;">

              <div class="row my-3">
  					<span class="icon-id-card">&nbsp;이름</span>
              </div>
             	<div class="row my-3">
                 	 <input type="text" class="form-control" name="name" placeholder="name" id="name">
                 		 <p align="left" id="nameP1" class="text-danger"></p>
              	</div>
            </div>
              <div class="container" style="margin-bottom: 55px;">
           
              		<div class="row my-3">
               			<span class="icon-envelope" >&nbsp;이메일</span>
              		</div>
              			<div class="row my-3">
                  			<input type="text" class="form-control" name="email" placeholder="example@example.com" id="email">
                  				<p align="left" id="emailP1" class="text-danger"></p>
              			</div>
                           			<div class="row my-3">
                  				<input style="width: 100%; margin-bottom: 32px;" type="button" class="btn btn-primary btn-xs" name="foundIdBtn"  id="foundIdBtn" value="아이디 찾기">
              	  			</div>
                </div>
  

							<small id="result" class="text-danger"></small>
        				</div> <!-- fid end -->
        				
              		</div> <!-- tab-pane fade show active end -->
     
              		
            <div class="tab-pane fade" id="foundPw">
            <div class="container">
              <div class="pid" style="width: 25%;">
    	          <div class="row my-3">
        	        <span class="icon-user-o">&nbsp;아이디</span>
            	  </div>
              		<div class="row my-3">
	              		<input type="text" class="form-control" name="id" placeholder="id" id="id">
              				<p align="left" id="idP1" class="text-danger"></p>
              		</div>
        	    	  	<div class="row my-3">
		    	  		  <span class="icon-id-card">&nbsp;이름</span>
              			</div>
              			<div class="row my-3">
		                  <input type="text" class="form-control" name="name" placeholder="name" id="pname">
        			          <p align="left" id="nameP1" class="text-danger"></p>
              			</div>
 			                <div class="row my-3">
            			      <span class="icon-envelope">&nbsp;이메일</span>
                 			</div>
                 				<div class="row my-3">
			                	  <input type="text" class="form-control" name="email" placeholder="example@example.com" id="pemail">
            			      	<p align="left" id="emailP1" class="text-danger"></p>
                 				</div>
                 					 <div class="row my-3">
                  						<input style="width: 100%;" type="button" class="btn btn-primary btn-xs" name="foundPwBtn"  id="foundPwBtn" value="비밀번호 찾기">
                  					</div>
                  </div> <!-- pid end -->
                  </div>
                </div> <!-- "tab-pane fade" end -->
            </div>
		</div> <!-- container end -->
		<br>
    </div> <!-- site wrap end -->
<%@ include file="footer.jsp"%>
    
  </body>
</html>