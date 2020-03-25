<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>관리자 Login</title>
    <!-- Bootstrap CSS -->
    
    <link rel="stylesheet" type="text/css" href="resources/admin/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="resources/admin/assets/fonts/circular-std/style.css" >
    <link rel="stylesheet" type="text/css" href="resources/admin/assets/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="stylesheet" type="text/css" href="resources/admin/css/style.css">
    
    <style>
    html,
    body {
        height: 100%;
    }

    body {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
    }
    </style>

</head>

<body>
<center>
    <!-- ============================================================== -->
    <!-- login page  -->
    <!-- ============================================================== -->
	<form class="splash-container" style="margin-left: 800px; " action="adminLogin.do" method="post">
  		<div class="card ">
            <div class="card-header">
            	<h3 class="mb-1">관리자 Login</h3>
            	<p> 아이디 패스워드를 입력하세요.</p>
            </div>
            <div class="card-body">
     			<div class="form-group">
                	<input class="form-control form-control-lg" id="username" name="id" type="text" placeholder="아이디" autocomplete="off">
               	</div>
                <div class="form-group">
                    <input class="form-control form-control-lg" id="password" name="password" type="password" placeholder="비밀번호">
                </div>
       			<div class="form-group">  
                 	<p id="idid"  style="color: red">${loginResult }</p>
                </div>
                <button id="b1" type="submit" class="btn btn-primary btn-lg btn-block" >로그인</button>
         	</div>
     	</div>
  	</form>
  
    <!-- ============================================================== -->
    <!-- end login page  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="resources/admin/assets/jquery/jquery-3.3.1.min.js"></script>
    <script src="resources/admin/assets/bootstrap/js/bootstrap.bundle.js"></script>
    </center>
</body>
 
</html>