<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <header class="site-navbar"  role="banner">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script>
    
    $(document).ready(function(){
       $("#searchLabel").keyup(function(){
          //alert("test");
          var searchKeyword = document.getElementById("searchLabel").value;
          //alert(searchKeyword);
          var query = {keyWord : searchKeyword};
          //alert(searchKeyword);
          if(searchKeyword.length >= 1){
             $.ajax({
                    type: "POST",
                    url: "searchKey.do",
                    data: query,
                    success: function(data){
                       //alert(data);
                        $("#searchAjax").html(data);
                    }
                 });   
          }
          
          if(searchKeyword.length == 0){
             $("#searchAjax").html('');
          }
           
          /*
          $.ajax({
             type : "POST",
             url : "searchKey.do",
             data : query,
             success:function(data){
                alert(data);
             }
             
          });
          */
       });
       
    });
    </script>
    <script>
    function getSearchRank(){
    	
       var myId = '${vo.id}';
       var query = {id : myId};
       $.ajax({
            type: "POST",
            url: "getSearchRank.do",
            data: query,
            success: function(data){
               //alert(data);
                $("#searchRankAjax").html(data);
            }
         });
       
       if(myId !=""){
          $.ajax({
               type: "POST",
               url: "getSearchHistory.do",
               data: query,
               success: function(data){
                  //alert(data);
                   $("#searchHistoryAjax").html(data);
               }
            });
       }
    }
    
    function historyClick(keyword){
       
       document.getElementById("searchLabel").value=keyword;
          

       var query = {keyWord : keyword};
      //alert(searchKeyword);
      if(keyword.length >= 1){
         $.ajax({
                type: "POST",
                url: "searchKey.do",
                data: query,
                success: function(data){
                   //alert(data);
                    $("#searchAjax").html(data);
                }
             });   
      }
    }
    
    function deleteHistory(){
       var myId = '${vo.id}';
      
       var query = {id : myId};
       if(myId !=""){
          $("#searchHistoryAjax").html("삭제되었습니다.");
          $.ajax({
                type: "POST",
                url: "deleteHistory.do",
                data: query,
                success: function(data){
                   $("#searchHistoryAjax").html("");
                }
             });   
       }
       
       
       
    }
    
    function searchClick(lectureNum , keyword){
    	
       var myId = '${vo.id}';
       var des = "searchClick.go?lectureNum="+lectureNum+"&bySearch="+keyword;
       if(myId !=""){
          

          location.href=des;
       }else{
          alert("로그인이 필요한 서비스입니다.");
       }
    }
    </script>
    
    <script type="text/javascript">
    function delNotification(num){
		
		var num1 = num;
		var pp = "#"+num1+"pp";
		var size = document.getElementById("cnt").value;
		var real = $("#cnt").text();
		//alert(real);
		
		var query = {num : num1};
		$.ajax({
			type : "POST",
			url : "updateNotificationConfirm.do",
			data : query,
			success : function(data){
				//alert("성공");
				$(pp).hide();
				$("#cnt").html(real-1); 
			}
		});
	
	}
    function delAllNoti(){
    	var id1 = '${vo.id}';
    	//alert(id1);
    	var query = {id : id1};
		$.ajax({
			type : "POST",
			url : "delAllNoti.do",
			data : query,
			success : function(data){
				//alert("성공");
				$("#ddId").hide();
				$("#cnt").html(0);
			}
		});

    }
    </script>
    <c:if test="${notificationList.size() == 0 }">
    <script>
    $(document).ready(function(){
    	$("#ddId").hide();
    })
    </script>
    </c:if>
    
    
    
      <div class="site-navbar-top" >
        <div class="container">
        
          <div class="row align-items-center"  style="max-height:30px;">

            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
              <form action="" class="site-block-top-search">
                <span class="icon icon-search2"></span>
            <input type="text" class="form-control border-0" id="searchWant" data-toggle="modal" data-target="#myPopUp" placeholder="원하는 강의를 찾아보세요" onclick="getSearchRank();"> 
                   <!-- modal start -->
                <div class="modal fade" id="myPopUp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	  
	    <div class="modal-content">
	    
	      <div class="modal-header" style="width: 100%;">
		<input type="text" class="form-control border-0" style="width: 100%;" id="searchLabel" placeholder="검색어 입력" autofocus="autofocus">
		<a class="close" data-dismiss="modal"><span aria-hidden="true">×</span></a>
	      </div>
	      <div class="modal-body" style="height: 800px;">

  			<div id="searchAjax"></div>
         
           <div id="searchHistoryAjax"></div>
           <div id="searchRankAjax"></div>
        
         

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
                  <a onclick="searchClick();" style="font-size: 14px; cursor: pointer; color: #868995;"><span>강사 지원하기</span></a>&nbsp;
                  <a href="loginForm.go" style="font-size: 14px;"><span>로그인</span></a>
                </c:if>
                
                  <c:if test="${vo.id != null}">
 					<li class="has-children active">
       				 <a style="font-size: 14px;"><img src="resources/uploadedVideos/${vo.thumbnail }" width="40" height="40" class="rounded-circle">&nbsp;${vo.id}</a>
       				 <ul class="dropdown">
       				 
      				    <li><a href="myPage.do" style="font-size: 14px;" >마이페이지</a></li>
      	  				  <li><a href="logout.do" style="font-size: 14px;" >로그아웃</a></li>
       				 
     				   </ul>
    				  </li>  
    				     <li style="padding: 0;"><a href="pick.go" style="padding: 10px 5px 10px 10px; margin: 0;" class="site-cart"><span class="icon-heart-o"></span></a></li>
       				    <li style="padding: 0;"><a href="point.go" style="padding: 10px 5px 10px 10px; margin: 0;" class="site-cart"><span class="icon-krw"></span> </a></li>
 						
 							<li class="has-children active" style="padding: 0; margin: 0;">
       				     <c:if test="${notificationList.size() == 0 }">
       				     <a href="#" style="margin: 0;" class="site-cart" id="notiConfirm"><span  class="icon-bell-o"></span></a>
       				     </c:if>
       				       <c:if test="${notificationList.size() != 0 }">
       				    <a href="#" style="margin: 0;" class="site-cart" id="notiConfirm"><span  class="icon-bell-o"></span><span style="margin: 1px;" id="cnt" name="cnt" class="count">${notificationList.size()}</span></a>
       				     
       				     </c:if>
 								<ul id="ddId" class="dropdown" >
 								<c:forEach items="${notificationList}" var="notification">
								       <li style="min-width: 200px;" class="alarmSpecial"  id="${notification.num}pp">
								       <a id="notiContent"   href="${notification.url }" style=" font-weight:bold; padding: 0; font-size: 12px;">${notification.content }</a>
								      
								       </li> 
              					</c:forEach>
              					
              					<li><button style="width: 100%;" onclick="delAllNoti();" class="btn btn-sm btn-info" id="delAllNoti">지우기</button></li>
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
    width: 100%;
    margin-left: auto;
    margin-right: auto;
        
    
     min-height:100vh !important;
}

-->
</style>