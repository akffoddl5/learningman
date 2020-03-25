<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="../fonts/icomoon/style.css">

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <link rel="stylesheet" href="../css/jquery-ui.css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
	

    <link rel="stylesheet" href="../css/aos.css">

    <link rel="stylesheet" href="../css/style.css">
     <style>
<!--
h5{
color: white;
}
label {
	padding-left: 100px;
}
-->
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

<div id="categoryLectureAjax">


 <c:forEach items="${categoryLectureList}" var="lectureVO">
<div class="container" style="margin-bottom: 10px;">
<div class="row">
  <div class="col-md">
  <img src="resources/uploadedVideos/${lectureVO.thumnailPath} " class="image" data-aos="fade">
  <div class="overlay">
    <div class="text-center" style="font-weight: bold; margin-top: 60px;">
    <h3><a style="color: white;" href="#">${lectureVO.name }</a></h3>
    </div>
    <div class="text-center" style="font-weight: bold; margin-top: 10px;">
    <a  style="color: white;" class="text-center" href="#">${lectureVO.id }</a>
 	 </div>
 	 <c:if test="${lectureVO.price != 0 }">
 	 <div class="text-center" style="font-weight: bold; margin-top: 10px;">
  		  <a  style="color: white;" class="text-center" href="#">${lectureVO.price}원</a>
		  </div>
 	 </c:if>
      <c:if test="${lectureVO.price == 0 }">
      	<div class="text-center" style="font-weight: bold; margin-top: 10px;">
  			  <a  style="color: white;" class="text-center" href="#">무료강의</a>
 		</div>
      </c:if>  
            
                <div class="text-center" style="font-weight: bold; margin-top: 10px;">
 				    <a  style="color: white;" class="text-center" href="#">${lectureVO.likeCnt }명이 좋아합니다.</a>
 			 </div>
    </div>
  </div>
  </div>
</div>
</c:forEach>
</div>
  
</body>
</html>
