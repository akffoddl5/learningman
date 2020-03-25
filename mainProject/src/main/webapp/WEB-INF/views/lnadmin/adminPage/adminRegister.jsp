<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>관리자 Register</title>
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
<!-- ============================================================== -->
<!-- signup form  -->
<!-- ============================================================== -->

<body>
    <!-- ============================================================== -->
    <!-- signup form  -->
    <!-- ============================================================== -->
    <form class="splash-container" action="insertAdmin.do" method="post">
        <div class="card">
            <div class="card-header">
                <h3 class="mb-1">관리자 등록화면</h3>
                <p>관리자 정보를 등록하세요.</p>
            </div>
			<div class="card-body">
          		<div class="form-group">
                    <input class="form-control form-control-lg" type="text" name="id" required="" placeholder="아이디" autocomplete="off">
                	<p>${checkResult }</p>
                </div>
                <div class="form-group">
                    <input class="form-control form-control-lg" type="email" name="email" required="" placeholder="email" autocomplete="off">
                </div>
                <div class="form-group">
                    <input class="form-control form-control-lg" type="text" name="phone" required="" placeholder="연락처" autocomplete="off">
                </div>
                <div class="form-group">
                    <input class="form-control form-control-lg" type="password" name="password" required="" placeholder="비밀번호">
                </div>

                <div class="form-group pt-2">
                    <button class="btn btn-block btn-primary" type="submit" >관리자 등록</button>
                </div>
      		</div>
           	<div class="card-footer bg-white">
            	<p><a href="adminIndex.do" class="text-secondary">홈으로 이동</a></p>
            </div>
        </div>
    </form>
</body>

 
</html>