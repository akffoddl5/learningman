<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <header class="site-navbar"  role="banner">
      <div class="site-navbar-top" >
        <div class="container">
        
          <div class="row align-items-center"  style="max-height:30px;">

            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
              <form action="" class="site-block-top-search">
                <span class="icon icon-search2"></span>
            <input type="text" class="form-control border-0" data-toggle="modal" data-target="#myPopUp" placeholder="원하는 강의를 찾아보세요"> 
                   <!-- modal start -->
                <div class="modal fade" id="myPopUp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	  
	    <div class="modal-content">
	    
	      <div class="modal-header" style="width: 100%;">
		<input type="text" class="form-control border-0" style="width: 100%;" id="myModalLabel" placeholder="검색어 입력" autofocus="autofocus">
		<a class="close" data-dismiss="modal"><span aria-hidden="true">×</span></a>
	      </div>
	      <div class="modal-body" style="height: 800px;">

  
         <ul class="list-group list-group-flush">
         <li class="list-group-item" style="font-weight: bold;">최근 검색 기록<a href="#" style="float: right;">지우기</a></li>
  <li class="list-group-item list-group-item-action">기록1</li>
  <li class="list-group-item list-group-item-action">기록2</li>
  <li class="list-group-item list-group-item-action">기록3</li>
  <li class="list-group-item list-group-item-action">기록4</li>
</ul>
         <ul class="list-group list-group-flush">
         <li class="list-group-item" style="font-weight: bold;">인기 검색어</li>
  <li class="list-group-item list-group-item-action">검색어1</li>
  <li class="list-group-item list-group-item-action">검색어2</li>
  <li class="list-group-item list-group-item-action">검색어3</li>
  <li class="list-group-item list-group-item-action">검색어4</li>
</ul>

	      </div>

	    </div>
	  </div>
	</div>
	<!-- modal end -->
	 
              </form>
            </div>

            <div class="col-12 mb-4 mb-md-0 col-md-4 order-1 order-md-2 text-center">
              <div class="site-logo">
                <a href="index.do" class="js-logo-clone">LearningMan</a>
              </div>
            </div>
  
      
<!-- 오른쪽 상단 아이콘 UI -->


            <div class="col-6 col-md-4 order-3 order-md-3 text-right" style="padding-left: 60px;">
              <div class="site-top-icons">
              <nav class="site-navigation text-right text-md-center" role="navigation" >
                
                <ul class="site-menu js-clone-nav d-none d-md-block">
                <c:if test="${vo.id == null }">
                  <a href="insertTeacher.go" style="font-size: 14px;"><span>강사 지원하기</span></a>&nbsp;
                  <a href="loginForm.go" style="font-size: 14px;"><span>로그인</span></a>
                </c:if>
                
                  <c:if test="${vo.id != null}">
 					<li class="has-children active">
       				 <a style="font-size: 14px;"><img src="resources/images/men.jpg" width="40" height="40" class="rounded-circle">&nbsp;${vo.id}</a>
       				 <ul class="dropdown">
       				 
      				    <li><a href="myPage.do" style="font-size: 14px;" >마이페이지</a></li>
      	  				  <li><a href="logout.do" style="font-size: 14px;" >로그아웃</a></li>
       				 
     				   </ul>
    				  </li>  
    				     <li style="padding: 0;"><a href="pick.do" style="padding: 0;" class="icon icon-heart-o" title="찜 목록 가기"></a></li>
       				    <li style="padding: 0;"><a href="cart.html" style="padding: 0;" class="site-cart"><span class="icon icon-shopping_cart"></span><span class="count">1</span> </a></li>
 						
 							<li class="has-children active">
       				    <a href="#" style="padding: 0; color: black;" class="site-cart"><span  class="icon-bell"></span><span class="count">1</span></a>
 								<ul class="dropdown">
 			
       <li><a href="#" style="font-size: 14px; padding-right: 1px;">알림 내용 표시하는곳<input style="padding: 0px 3px 0px 3px; float: right;" type="button" class="btn btn-danger" value="x"></a></li> 
              
 								</ul>
 							</li>
				 </c:if>              
              </nav>
                   

			</div><!-- site top icons end -->
        </div> <!-- 오른쪽 상단 아이콘 UI end -->
            

          </div><!-- class="row align-items-center" -->
        </div><!-- class="container" -->
      </div> <!-- class="site-navbar-top" -->

       
           
      
      <nav class="site-navigation text-right text-md-center" role="navigation" >
        <div class="container">
          <ul class="site-menu js-clone-nav d-none d-md-block">
                   <li class="has-children active">
             <a href="#">전체 카테고리</a>
           <ul class="dropdown">
                <c:forEach items="${categoryList}" var="category">
                <li><a href="categoryPick.go?name=${category.name }">${category.name }</a></li>
                
  				</c:forEach>
              </ul>
            </li>
            <li><a href="newForm.go">신규</a></li>
            <li><a href="bestForm.go">베스트</a></li>
                <li><a href="notice.do">공지사항</a></li>
                  
            <li><a href="serviceCenter.do">고객센터</a></li>
    </ul>
        </div>
      </nav>

    </header>
              
    
<style>
<!--
.site-wrap{
max-width: 1176px;
    width: 60%;
    margin-left: auto;
    margin-right: auto;
}
-->
</style>