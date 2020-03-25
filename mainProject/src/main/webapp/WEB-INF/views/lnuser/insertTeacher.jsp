<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>다배워 ! LearningMan &mdash;</title>
<%@ include file="metaHeader.jsp" %>
  </head>
 
  <body>
  <%@ include file="header.jsp" %>

       <!-- insertTeacher UI start -->
 
 
          <div class="site-blocks-cover" style="background-image: url(resources/uploadedVideos/${imgVO.imgteacher}); min-height: 400px; height: 0;" data-aos="fade">
      <div class="container">
        <div class="row align-items-start align-items-md-center justify-content-end" style="height: 0;">
          <div class="col-5 text-center text-md-left" style="padding-top: 0;">
            <h2 class="mb-2"><font color="white">LearningMan</font></h2>
            <div class="intro-text text-center text-md-left">
              <p class="mb-4"><font size="3" color="white">런닝맨은 각 분야의 전문강사를 모십니다. </font></p>
              <p>
              <c:if test="${vo.id ==null }">
                <a href="loginForm.go" class="btn btn-sm btn-primary" style="font-weight: bold;">무료로 강사 지원 하기</a>
              </c:if>
              <c:if test="${vo.id !=null }">
                <a href="teacherLicense.go" class="btn btn-sm btn-primary" style="font-weight: bold;">무료로 강사 지원 하기</a>
              </c:if>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <br>
      <div class="site-wrap">
    <div class="site-section block-3 site-blocks-2 bg-light">
    <div class="container">
        <div class="row justify-content-center">
     <div class="col text-center pt-4">
            <h2>어떤 카테고리를 생각하고 계신가요?</h2>
            <div class="site-section site-section-sm site-blocks-1">
                <div class="row my-3">
          <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-futbol-o "></span>
            </div>
          </div>
          <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-desktop"></span>
            </div>
          </div>
          <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-gavel"></span>
            </div>
          </div>
          <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-gamepad"></span>
            </div>
          </div>
          <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-music"></span>
            </div>
          </div>
       </div>
        
        
        
           <div class="row my-3">
          <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-glass"></span>
            </div>
          </div>
             
                     <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-envelope-o"></span>
            </div>
          </div>
          
                  <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-star"></span>
            </div>
          </div>
          
                  <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-heart"></span>
            </div>
          </div>
          
                  <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-film"></span>
            </div>
          </div>
         
          </div>
          
                     <div class="row my-3">
          <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-home"></span>
            </div>
          </div>
             
                     <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-clock-o"></span>
            </div>
          </div>
          
                  <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-road"></span>
            </div>
          </div>
          
                  <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-flag"></span>
            </div>
          </div>
          
                  <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-book"></span>
            </div>
          </div>
         
          </div>
          
                     <div class="row my-3">
          <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-camera"></span>
            </div>
          </div>
             
                     <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-font"></span>
            </div>
          </div>
          
                  <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-camera-retro"></span>
            </div>
          </div>
          
                  <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-image"></span>
            </div>
          </div>
          
                  <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-pencil"></span>
            </div>
          </div>
         
          </div>
                     <div class="row my-3">
          <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-map-marker"></span>
            </div>
          </div>
             
                     <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-leaf"></span>
            </div>
          </div>
          
                  <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-gift"></span>
            </div>
          </div>
          
                  <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-plane"></span>
            </div>
          </div>
          
                  <div class="col" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-shopping-cart"></span>
            </div>
          </div>
         
          </div>
          
          </div>
    
          </div>
         
          </div>
                      <a href="teacherLicense.go" class="btn btn-sm btn-primary" style="font-weight: bold; float: right;">무료로 강사 지원 하기</a>
      
          </div>
       
</div>
 <!-- insertTeacher UI end -->
     </div>    
<%@ include file="footer.jsp"%>
  </body>
</html>