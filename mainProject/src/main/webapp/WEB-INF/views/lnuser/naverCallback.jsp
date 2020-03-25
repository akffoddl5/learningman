<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("PR_ChEILleJV5pEXfozT", "http://ec2-15-165-204-212.ap-northeast-2.compute.amazonaws.com/learningman/naverCallback.jsp");
  // 접근 토큰 값 출력
  //alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    //alert(naver_id_login.getProfileData('nickname'));
    //alert(naver_id_login.getProfileData('email'));
    //alert(naver_id_login.getProfileData('name'));
    //alert(naver_id_login.getProfileData('age'));
    //alert(naver_id_login.getProfileData('id'));
    
    $.post("snsLogin.do",
        	{
        	  type : "naver",
        	  resid : naver_id_login.getProfileData('id'),
        	  email : naver_id_login.getProfileData('email'),
        	  nickname : naver_id_login.getProfileData('nickname')
        	  
        	},
        	function(data,status){
        		if(status = "success"){
        			window.location = "http://ec2-15-165-204-212.ap-northeast-2.compute.amazonaws.com/learningman/index.do";
        		}
        	}
          );
  }
</script>
</body>
</html>