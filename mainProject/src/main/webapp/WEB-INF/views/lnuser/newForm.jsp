<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">

<head>
  <title>다배워 ! LearningMan &mdash;</title>
<%@ include file="metaHeader.jsp" %>
 </head>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<style>

.image {
  display: block;
  width: 100%;
  height: 450px;

}

.overlay {
  position: absolute;
  bottom: 100%;
  left: 0;
  right: 0;
  background-color: rgba(108, 117, 125, 0.5);
  overflow: hidden;
  width: 100%;
  height:0;
  transition: .5s ease;
}

.container:hover .overlay {
  bottom: 0;
  height: 100%;
}

</style>
<script>
$(document).ready(function(){
	 $(".mr-3").change(function(){
		  var categoryArray = [];
		  $('input:checkbox[name="categoryCheckBox2"]').each(function() {
		      if(this.checked){
		            categoryArray.push($(this).val());
		      }
		 });
		  //alert(categoryArray);
		  var query = {categoryList: categoryArray};
		  $.ajax({
	             type: "POST",
	             url: "newFormAjax.do",
	             data: query,
	             success: function(data){
	                 $("#categoryLectureAjax").html(data);
	             },
	             error:function(request,status,error){
	                },
	              complete : function(data) {
	                          //  실패했어도 완료가 되었을 때 처리
	              }


	      });

	 });
	
});

</script>
 <body>

 <%@ include file="header.jsp" %>
 <div class="container">
 <div class="row">
	<div class="col">
<c:forEach items="${categoryList}" var="categoryVO">
        <label style="margin: 0 1 1 1;" for="${categoryVO.name }" class="btn btn-sm btn-secondary">${categoryVO.name }<input type="checkbox" checked="checked" name="categoryCheckBox2" id="${categoryVO.name }" value=${categoryVO.name } class="badgebox mr-3">
        <span class="badge">&check;</span></label>
</c:forEach>
	</div>

	</div>
</div>
<hr/>
      <div class="site-wrap">
<div id="categoryLectureAjax">


 <c:forEach items="${categoryLectureList}" var="lectureVO">
<div class="container" style="margin-bottom: 10px; cursor: pointer;" onclick="location.href='lecture.go?lectureNum=${lectureVO.num}'">
<div class="row">
  <div class="col-md" style="padding: 50px;">
  <img src="resources/uploadedVideos/${lectureVO.thumnailPath} " class="image" data-aos="fade">
  <div class="overlay">
  <div class="col" style="margin-top: 180px;" >
 
    <div class="row my-3 text-center" style="font-weight: bold; justify-content: center;">
    <h3><a style="color: white;" href="#">${lectureVO.name }</a></h3>
    </div>
    <div class="row my-3 text-center" style="font-weight: bold; justify-content: center;">
    <a  style="color: white;" class="text-center" href="#">${lectureVO.id }</a>
 	 </div>
 	 <c:if test="${lectureVO.price != 0 }">
 	 <div class="row my-3 text-center" style="font-weight: bold; justify-content: center; ">
  		  <a  style="color: white;" class="text-center" href="#">${lectureVO.price}원</a>
		  </div>
 	 </c:if>
      <c:if test="${lectureVO.price == 0 }">
      	<div class="row my-3 text-center" style="font-weight: bold; justify-content: center;">
  			  <a  style="color: white;" class="text-center" href="#">무료강의</a>
 		</div>
      </c:if>  
            
                <div class="row my-3 text-center" style="font-weight: bold; justify-content: center;">
 				    <a  style="color: white;" class="text-center" href="#">${lectureVO.likeCnt }명이 좋아합니다.</a>
 			 </div>
 </div>
    </div>
  </div>
  </div>
</div>
</c:forEach>
</div>
           
             
        
       
       </div>  
       <%@ include file="footer.jsp"%>
       

 </body>
 </html>


