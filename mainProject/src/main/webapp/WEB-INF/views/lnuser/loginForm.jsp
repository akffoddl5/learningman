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
 	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	
	<script>
	$(document).ready(function(){
		 
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var key = getCookie("key");
	    $("#id").val(key); 
	     
	    if($("#id").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idSave").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#idSave").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idSave").is(":checked")){ // ID 저장하기 체크했을 때,
	            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("key");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSave").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	</script>
	
	<script>
	$(document).ready(function(){
		$("#loginBtn").click(function(){
			var id1 = document.getElementById("id").value;
			var pw1 = document.getElementById("password").value;
			var idSave1 = document.getElementById("idSave").value;
			var query = {id : id1 , password:pw1};
			$.ajax({
				type: "POST",
				url : "login.do",
				data : query,
				success : function(data){
					if(data == 1){
						location.href="index.do";
						// 아이디저장 처리 여기서
					}else if(data == -1){
						alert("잘못된 비밀번호입니다.");
					}else if(data == 0){
						alert("등록되지 않은 아이디입니다.");
					}else if(data == -2){
						alert("본인인증이 필요한 필요한 아이디입니다.");
					}else{
						alert("??? 머징");
					}
					
				}
				
			});
			
			
		});
		
		
		
	});
	</script>
	<script>
	function enterkey(){
		 if (window.event.keyCode == 13) {
			 var id1 = document.getElementById("id").value;
				var pw1 = document.getElementById("password").value;
				var idSave1 = document.getElementById("idSave").value;
				var query = {id : id1 , password:pw1};
				$.ajax({
					type: "POST",
					url : "login.do",
					data : query,
					success : function(data){
						if(data == 1){
							location.href="index.do";
							// 아이디저장 처리 여기서
						}else if(data == -1){
							alert("잘못된 비밀번호입니다.");
						}else if(data == 0){
							alert("등록되지 않은 아이디입니다.");
						}else if(data == -2){
							alert("본인인증이 필요한 필요한 아이디입니다.");
						}else{
							alert("??? 머징");
						}
						
					}
					
				});
		 }

		
	}
	</script>
	
	<style>
<!--
#kakao-login-btn{
width: 125.95px;
height: 48px;

}
#kakaoCol{
padding-right: 400px;
}
#naverCol{
padding-left: 420px;
}
--!>
</style>

	
  <div class="site-wrap">
<div class="container my-3" style=" margin-top: 5% ! important;  margin-bottom: 5% ! important;">

<div class="row my-3" style=" place-content: center;">
    <h1 style="font-size: 28px; color: black;">로그인</h1>
    </div>

      <center>
            <form action="login.do" method="post">
               <label style="width: 295px;">
               <span class="icon-user-o" style="float: left;">&nbsp;아이디</span><br>
                  <input type="text" style="width: 295px;" class="form-control py-4" name="id" placeholder="id" id="id">
              <br>
              <span class="icon-lock2" style="float: left;">&nbsp;비밀번호</span><br>
                  <input type="password" style="width: 295px;" class="form-control py-4" name="password" id="password" placeholder="password" onkeyup="enterkey();">
           
                  <input style="float: left; margin-top: 14px;" type="checkbox" name="idsave" id="idSave" ><span style="float: left; font-size: 12px; margin-top: 10px;">아이디 저장</span>
           <a href="foundInfo.go" style="float: right; font-size: 13px; margin-top: 8px;" class="js-logo-clone">ID/PW 찾기</a>
            <br>
  <br>
             <input style="width: 295px; font-weight: bold;" type="button" id="loginBtn" name="loginbtn" class="btn btn-sm btn-primary" value="로그인" >
               <br><br>
				 <input style="width: 295px; font-weight: bold;" type="button" name="joinbtn" class="btn btn-sm btn-primary" value="회원가입" onclick="javascript:window.location='joinForm.go'">
             <br></br>
             </label>
            </form>

            </center>

  				<div class="row">
  					<div class="col" id="naverCol">
    					 <!-- naver -->
    					 <div  id="naver_id_login"></div>
  
  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
  <script type="text/javascript" >
     var naver_id_login = new naver_id_login("PR_ChEILleJV5pEXfozT", "http://ec2-15-165-204-212.ap-northeast-2.compute.amazonaws.com/learningman/naverCallback.go");
     var state = naver_id_login.getUniqState();
    
     naver_id_login.setButton("green", 2,48);
     naver_id_login.setDomain("http://ec2-15-165-204-212.ap-northeast-2.compute.amazonaws.com/learningman/loginForm.go");
     naver_id_login.setState(state);
     //naver_id_login.setPopup();
     naver_id_login.init_naver_id_login();

  </script>
    				</div>
  				  <div class="col" id="kakaoCol">
     			 <!-- kakao -->
     			 <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
  <a id="kakao-login-btn">
  </a>
<a href="http://developers.kakao.com/logout"></a>


<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init("ae56c4642576006867a815a79a0793d6");
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
    	
      container: '#kakao-login-btn',
      size:'small',
      success: function(authObj) {
         
        //alert(JSON.stringify(authObj));
        //alert("success ㅎㅎ");
       
        
        Kakao.API.request({
            url: '/v2/user/me',
            success: function(res) {
                  //alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
                  //alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
				
				//alert(res.properties.email);
                //alert(res.kakao_account.email);
                  //console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
                  //console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
                  //console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
              // res.properties.nickname으로도 접근 가능 )
                  console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
                  
                  $.post("snsLogin.do",
                	{
                	  type : "kakao",
                	  tokenVal : authObj.access_token,
                	  email : res.kakao_account.email,
                	  nickname : res.properties.nickname,
                	  resid : res.id
                	},
                	function(data,status){
                		if(status = "success"){
                			window.location = "http://ec2-15-165-204-212.ap-northeast-2.compute.amazonaws.com/learningman/index.do";
                		}
                	}
                  );
                  
                  //window.location = "http://localhost:8081/mainPrjTmp/mainView/index.html";
                }
              })
        
        
      },
      fail: function(err) {
         //alert(JSON.stringify(err));
      }
    });
  //]]>
</script>
    			</div>
 			 </div>
</div>

                </div>
<%@ include file="footer.jsp"%>
       </body>
</html>