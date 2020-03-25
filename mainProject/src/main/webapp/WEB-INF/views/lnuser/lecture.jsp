<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>다배워 ! LearningMan &mdash;</title>
<%@ include file="metaHeader.jsp" %>
  </head>
   <script>
 
 $(document).ready(function () {
    var itemsMainDiv = ('.MultiCarousel');
    var itemsDiv = ('.MultiCarousel-inner');
    var itemWidth = "";

    $('.leftLst, .rightLst').click(function () {
        var condition = $(this).hasClass("leftLst");
        if (condition)
            click(0, this);
        else
            click(1, this)
    });

    ResCarouselSize();




    $(window).resize(function () {
        ResCarouselSize();
    });

    //this function define the size of the items
    function ResCarouselSize() {
        var incno = 0;
        var dataItems = ("data-items");
        var itemClass = ('.item');
        var id = 0;
        var btnParentSb = '';
        var itemsSplit = '';
        var sampwidth = $(itemsMainDiv).width();
        var bodyWidth = $('body').width();
        $(itemsDiv).each(function () {
            id = id + 1;
            var itemNumbers = $(this).find(itemClass).length;
            btnParentSb = $(this).parent().attr(dataItems);
            itemsSplit = btnParentSb.split(',');
            $(this).parent().attr("id", "MultiCarousel" + id);


            if (bodyWidth >= 1200) {
                incno = itemsSplit[3];
                itemWidth = sampwidth / incno;
            }
            else if (bodyWidth >= 992) {
                incno = itemsSplit[2];
                itemWidth = sampwidth / incno;
            }
            else if (bodyWidth >= 768) {
                incno = itemsSplit[1];
                itemWidth = sampwidth / incno;
            }
            else {
                incno = itemsSplit[0];
                itemWidth = sampwidth / incno;
            }
            $(this).css({ 'transform': 'translateX(0px)', 'width': itemWidth * itemNumbers });
            $(this).find(itemClass).each(function () {
                $(this).outerWidth(itemWidth);
            });

            $(".leftLst").addClass("over");
            $(".rightLst").removeClass("over");

        });
    }


    //this function used to move the items
    function ResCarousel(e, el, s) {
        var leftBtn = ('.leftLst');
        var rightBtn = ('.rightLst');
        var translateXval = '';
        var divStyle = $(el + ' ' + itemsDiv).css('transform');
        var values = divStyle.match(/-?[\d\.]+/g);
        var xds = Math.abs(values[4]);
        if (e == 0) {
            translateXval = parseInt(xds) - parseInt(itemWidth * s);
            $(el + ' ' + rightBtn).removeClass("over");

            if (translateXval <= itemWidth / 2) {
                translateXval = 0;
                $(el + ' ' + leftBtn).addClass("over");
            }
        }
        else if (e == 1) {
            var itemsCondition = $(el).find(itemsDiv).width() - $(el).width();
            translateXval = parseInt(xds) + parseInt(itemWidth * s);
            $(el + ' ' + leftBtn).removeClass("over");

            if (translateXval >= itemsCondition - itemWidth / 2) {
                translateXval = itemsCondition;
                $(el + ' ' + rightBtn).addClass("over");
            }
        }
        $(el + ' ' + itemsDiv).css('transform', 'translateX(' + -translateXval + 'px)');
    }

    //It is used to get some elements from btn
    function click(ell, ee) {
        var Parent = "#" + $(ee).parent().attr("id");
        var slide = $(Parent).attr("data-slide");
        ResCarousel(ell, Parent, slide);
    }

});
 </script>
	 <script>
   $(document).ready(function(){
	  $("#pick1").hide();
	  $("#nopick1").hide();
	  $("#like1").hide();
	  $("#nolike1").hide();
	   
   });
   function submitReply(lectureNum){
	   var id1 = document.getElementById("id1").value;
	   var content1 = document.getElementById("replyArea").value;
	   var lectureNum1 = document.getElementById("lectureNum1").value;
	   var query = {content:content1, id:id1 , lectureNum : lectureNum1};
  	 $.ajax({
           type: "POST",
           url: "insertLectureReply.do",
           data: query,
           success: function(data){
        	   document.getElementById("replyArea").value='';
        	   location.reload();
           }
        });
  	 
   }
   
   function submitReply2(replyNum){
	   var name = "rereple"+replyNum;
	   var id1 = document.getElementById("id1").value;
	   var content1 = document.getElementById(name).value;
	   var lectureNum1 = document.getElementById("lectureNum1").value;
	   var ref1 = replyNum;
	   var query = {content:content1, id:id1 , lectureNum : lectureNum1, ref: ref1};
  	 $.ajax({
           type: "POST",
           url: "insertLectureReReply.do",
           data: query,
           success: function(data){
        	   document.getElementById(name).value='';
        	   location.reload();
           }
        });
  	 
   }
   
   function pickCancle(lecNum){
	   var query = {num : lecNum};
	   $.ajax({
           type: "POST",
           url: "deletePick.do",
           data: query,
           success: function(data){
        	   $("#pick").hide();
        	   $("#pick1").hide();
        	   $("#nopick1").show();
           }
        });
   }
   
   function pickExe(lecNum){
	   var query = {num : lecNum};
	   $.ajax({
           type: "POST",
           url: "insertPick.do",
           data: query,
           success: function(data){
        	   $("#pick1").show();
        	   $("#nopick").hide();
        	   $("#nopick1").hide();
           }
        });
   }
   
   function likeCancle(lecNum){
	   var query = {num : lecNum};
	   $.ajax({
           type: "POST",
           url: "deleteLike.do",
           data: query,
           success: function(data){
        	   $("#like").hide();
        	   $("#like1").hide();
        	   $("#nolike1").show();
           }
        });
   }
   
   function likeExe(lecNum){
	   var query = {num : lecNum};
	   $.ajax({
           type: "POST",
           url: "insertLike.do",
           data: query,
           success: function(data){
        	   $("#like1").show();
        	   $("#nolike").hide();
        	   $("#nolike1").hide();
           }
        });
   }
	
   function buyLecture(){
	   var id_s = "${vo.id}";
	   var price_s = "${lectureVO.price}";
	   var id_p = "${vo.point}";
	   var lectureNum = "${lectureVO.num}";
	   //alert("보유 포인트 :" +id_p);
	   //alert("강의 가격 :" + price_s);
	   if(Number(id_p) < Number(price_s)){
		   
		   var confirmVal = confirm((Number(price_s)-Number(id_p))+ " 포인트가 부족합니다. 충전하시겠습니까?");
		   if(confirmVal){
			   //alert("구매한다고? ㅇㅋ");
			   var hr = "point.go";
			   //alert(hr);
			   location.href=hr;
		   }else{
			   //alert("구매안한다고? ㅇㅋ");
		   }
	   }else{
		   var confirmVal = confirm(price_s +"P 가 필요합니다. 강의를 구매하시겠습니까?");
		   if(confirmVal){
			   //alert("구매한다고? ㅇㅋ");
			   var hr = "buyThisLecture.do?price="+price_s+"&id="+id_s+"&lectureNum="+lectureNum;
			   //alert(hr);
			   location.href=hr;
		   }else{
			   //alert("구매안한다고? ㅇㅋ");
		   }
	   }
	   
	   
   }
   </script>
   <!-- ------------------------------------------------------------------------------------------------------------------------------- -->
 <body>

  <%@ include file="header.jsp" %>
  
  <div class="site-wrap">
  <div class="container">
		<div class="row">
			<div class="col">
				<img align="left" src="resources/uploadedVideos/${lectureVO.thumnailPath }" style=" width:900px; height: 500px;" > <!-- 강좌 소개 이미지 첨부  -->
			</div>
			
		<div class="col">
 			<div class="card" style="width: 20%; padding:24px; height: auto; position: fixed; border-style: solid; box-shadow: rgba(41, 42, 43, 0.16) 0px 2px 6px -2px;">
       			 <div class="card-body">
       			 <div class="row">
      				  <p style="font-size: 13px; color:rgb(168, 174, 179); font-weight: bold;">강사&nbsp;${lectureVO.id }</p>
       			 </div>
       			 <div class="row">
      				  <p style="font-size: 20px; font-weight: bold;">${lectureVO.name }</p>
       			 </div>
						<div class="row">
							<p style="font-size: 20px; font-weight: bold;">${lectureVO.price }원</p>
						</div>
				<div class="row" >
       				<p href="#" style="font-size: 11px; padding-top:2px; color:#f8f9fa; border-radius:3px; background-color: rgba(40, 167, 69, 0.5);">바로 수강가능</p>
      				 &nbsp;
					<p href="#" style="font-size: 11px; padding-top:2px; color:#f8f9fa; border-radius:3px; background-color: rgba(40, 167, 69, 0.5);">${lectureVO.category }</p>

       			 </div>
       			 <hr/>
        		<div class="row">
					<small><a href="#">${lectureVO.likeCnt }명이 좋아합니다.</a></small>
				</div>
        		<div class="row">
					<small><a href="#">${lectureVO.cnt }명이  이 강의를 봤습니다.</a></small>
				</div>
				 <hr/>
    			</div>
        <center>
<div class="row" style="width: 100%; justify-content: center;">


        <button id="pick1" class="icon-heart btn btn-sm mx-2" onclick="pickCancle('${lectureVO.num}')" style=" width:40%;  padding: 0px 16px; color: red;"></button> 
      	<button id="nopick1" class="icon-heart-o btn btn-sm mx-2" onclick="pickExe('${lectureVO.num}')" style=" width:40%;  padding: 0px 16px;" ></button>

        <c:if test="${hePick == 'Y' }">
      	<button id="pick" class="icon-heart btn btn-sm mx-2" onclick="pickCancle('${lectureVO.num}')" style="width:40%;  padding: 0px 16px; color: red;" ></button> 
      	</c:if>
        <c:if test="${hePick == 'N' }">
        <button id="nopick" class="icon-heart-o btn btn-sm mx-2" onclick="pickExe('${lectureVO.num}')" style=" width:40%;  padding: 0px 16px;" ></button>
        </c:if>
     	<c:if test="${heLike == 'Y' }">
     	<button id="like" class="icon-thumbs-up btn btn-sm mx-2" onclick="likeCancle('${lectureVO.num}')" style=" width:40%;  padding: 0px 16px;" ></button>
     	</c:if>
     	<c:if test="${heLike == 'N' }">
     	<button id="nolike" class="icon-thumbs-o-up btn btn-sm mx-2" onclick="likeExe('${lectureVO.num}')" style=" width:40%; padding: 0px 16px;" ></button>
     	</c:if>
    	<button id="like1" class="icon-thumbs-up btn btn-sm mx-2" onclick="likeCancle('${lectureVO.num}')" style=" width:40%;  padding: 0px 16px;"  ></button>
     	<button id="nolike1" class="icon-thumbs-o-up btn btn-sm mx-2" onclick="likeExe('${lectureVO.num}')" style=" width:40%;  padding: 0px 16px;" ></button>
</div>
<div class="row" style="justify-content: center;">
     <c:if test="${lectureVO.price == 0  || teacher == 'Y'}">
     <input type="button" class="btn btn-sm btn-primary" value="강의 보러가기" style=" width:80%; margin-right: 25px; margin: 10px 0px 0px 16px; cursor: pointer;"  onclick="location.href='watchForm.go?lectureNum=${lectureVO.num}'" >
     </c:if>
     <c:if test="${lectureVO.price !=0 && heBuy == 'N' && teacher != 'Y'}">
     <input type="button" class="btn btn-sm btn-primary" value="결제하기" style=" width:80%; margin-right: 25px; margin: 10px 0px 0px 16px; cursor: pointer;"  onclick="buyLecture();" >
     </c:if>
     <c:if test="${lectureVO.price !=0 && heBuy == 'Y' }">
     <input type="button" class="btn btn-sm btn-primary" value="강의 보러가기(결제완료)" style="width: 80%; margin: 10px 0px 0px 16px; cursor: pointer;"  onclick="location.href='watchForm.go?lectureNum=${lectureVO.num}'" >
     </c:if>
     
     	<c:if test="${teacher == 'Y' }">
     <input type="button" class="btn btn-sm btn-primary" value="영상 올리기" style="width: 80%; margin: 10px 0px 0px 16px; cursor: pointer;"  onclick="location.href='uploadForm.go?lectureNum=${lectureVO.num}&category=${lectureVO.category }'" >
  	   </c:if>
</div>
        </center>
        

     		 </div>
		</div>

	</div>
</div>

<!-- --------------------------------------------------------------------------------------------------------------------------------------- -->
<style>
<!--
.table td, .table th {
    padding: 0.75rem;
    vertical-align: top;
    border-top: 1px solid white;
    }
.MultiCarousel { float: left; overflow: hidden; padding: 15px; width: 900px; position: relative; }
    .MultiCarousel .MultiCarousel-inner { transition: 1s ease all; float: left; }
        .MultiCarousel .MultiCarousel-inner .item { float: left;}
        .MultiCarousel .MultiCarousel-inner .item > div { text-align: center; padding:10px; margin:10px; color:#666; }
        .MultiCarousel .MultiCarousel-inner .item > div > img { height: 150px; }
    .MultiCarousel .leftLst, .MultiCarousel .rightLst { position:absolute; border-radius:50%;top:calc(50% - 20px); }
    .MultiCarousel .leftLst { left:0; }
    .MultiCarousel .rightLst { right:0; }
    
        .MultiCarousel .leftLst.over, .MultiCarousel .rightLst.over { pointer-events: none; background:#ccc; }
.h6{
font-weight: bold;
}

-->
</style>

<!-- --------------------------------------------------------------------------------------------------------------------------------------- -->

<div class="container" >

      <div class="row" >
        <div class="col-xs-12 col-md-12">
<br>
		   <ul class="nav nav-pills" style="font-size: 14px;">
              <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#introLecture">강의 소개</a></li>
              <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#curriculum" >커리큘럼</a></li>
              <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#introTeacher" >강사 소개</a></li>
              <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#community" >커뮤니티</a></li>
              <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#recommendation" >추천</a></li>
              <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#lectureList" >강의 리스트</a></li>
            </ul>
<br>
 
       <div class="tab-content" style="width: 100%;" >
       
              		<div class="tab-pane fade show active"  id="introLecture">
              			<br>
             			 <div class="introLecture" style="width: 80%;">

       								 <h6 >강의를 소개합니다.</h6>
<hr/>
        								<p>${lectureVO.content1 }</p>
<br>

                	  </div>
             	  </div>
              			<div class="tab-pane fade" id="curriculum"  >
<br>
              				<div class="curriculum" style="width: 80%;">

        								<h6>커리큘럼</h6>
        								<hr/>
       									${lectureVO.content2 }

              				</div>
              			</div>
                     			<div class="tab-pane fade" id="introTeacher">
<br>
              						<div class="introTeacher" style="width: 80%;">
											<h6>강사 ${vo.id}입니다.</h6>
											<hr/>
 													<p> ${lectureVO.content3 }</p>
       
        <br>

        <br>

                  </div>

                  <br>
              </div>
              <!--  cummunity -->
              
               						<div class="tab-pane fade" id="community">
              								<br>
             							<div class="introTeacher" style="width: 80%;">
               								<div class="card">
        										<div class="card-body">

        										<h6>커뮤니티</h6>
        										<div class="my-2">
        											<small>궁금한걸 자유롭게 질문해보세요.</small>
        										</div>
        										<hr/>

        									
        						
        								<input type="hidden" name="id" id="id1" value="${vo.id }">
    										<input type="hidden" name="lessonNum" id="lectureNum1" value="${lectureVO.num}">
												<img src="resources/uploadedVideos/${vo.thumbnail}" width="40" height="40" class="rounded-circle">&nbsp;&nbsp;${vo.id }
												<hr/>
												<textarea class="form-control" id="replyArea" placeholder="글을 작성해보세요."></textarea>
												<br>
													<button  class="btn btn-sm btn-info pull-right" style="float: right;" id="replyBtn" onclick="submitReply('${lectureVO.num}')">글작성</button>
												<br><br>
        							<c:forEach items= "${replyList}" var="sList">
											<table class="table" >
													<tbody>
												<tr>
            										<td>
            										<small> ${sList[0].regDate }</small><br>
            									
            										<span><img src="resources/uploadedVideos/${sList[0].thumbnail}" width="40" height="40" class="rounded-circle">&nbsp;&nbsp;${sList[0].id }</span><br><br>
            										<p>${sList[0].content }</p> 
            										</td>
											</tr>
									<c:forEach items= "${sList}" var="rvo" begin="1">
       											<tr>
          				
       												<td>
       												<img src="resources/uploadedVideos/${rvo.thumbnail}" width="40" height="40" class="rounded-circle">&nbsp;&nbsp;${rvo.id }<br>
       												${rvo.content }
       												</td>
       										
       										</tr>
       								</c:forEach>
       									
      												<td colspan = "2">
      												<div class="container">
														<div class="row">
														<div class="col-sm-12">
														    <div class="input-group">
														      <input type="text" id="rereple${sList[0].num }" class="form-control" placeholder="댓글을 입력해주세요.">&nbsp;&nbsp;
														      <span class="input-group-btn">
														       <button class="btn btn-info" id="replyBtn2" type="button" onclick="submitReply2('${sList[0].num}')">+</button>
															  </span>
														    </div><!-- /input-group -->
														  </div><!-- /.col-sm-6 -->
														</div><!-- /.row -->
													</div>
      											</td>
       										<hr/>

        											</tbody>
	
											</table>
									</c:forEach>



       								 </div>
        						</div>
                  			</div>

                  		<br>
             		</div>
<!--  cummunity end -->

<!-- 추천 start -->
               <div class="tab-pane fade" id="recommendation">
              <br>
              <div class="recommendation"  style=" width:80%;">
			<div class="container">
 				<div class="my-3">
           <h6 style="font-weight: bold;">이 강의와 비슷한 강의</h6>
  		</div>
	<div class="row" style="font-weight: bold;">
		<div class="MultiCarousel" data-items="1,3,5,6" data-slide="1" id="MultiCarousel"  data-interval="1000">
            <div class="MultiCarousel-inner">
            	<c:forEach items="${similarLectureList}" var="lectureVO">
	                <div class="item">
	                    <div class="pad15">
	                        <img src="resources/uploadedVideos/${lectureVO.thumnailPath }" style="width: 100px; height: 100px; cursor:pointer;" onclick="location.href='lecture.go?lectureNum=${lectureVO.num }'" class="lead img-fluid img-rounded">
	                   <a href="lecture.go?lectureNum=${lectureVO.num }" >${lectureVO.name }</a>
	                    </div>
	                </div>
	            </c:forEach>
            </div>
            <button class="btn btn-primary leftLst"><</button>
            <button class="btn btn-primary rightLst">></button>
        </div>
	</div>

	        <hr/>

</div>
  
  
			<div class="container">
 				<div class="my-3">
           <h6 style="font-weight: bold;">이 강사의 다른 강의</h6>
  		</div>
	<div class="row" style="font-weight: bold;">
		<div class="MultiCarousel" data-items="1,3,5,6" data-slide="1" id="MultiCarousel"  data-interval="1000">
            <div class="MultiCarousel-inner">
            	<c:forEach items="${difLectureList }" var="lectureVO">
	                <div class="item">
	                    <div class="pad15">
		                       <img src="resources/uploadedVideos/${lectureVO.thumnailPath }" onclick="location.href='lecture.go?lectureNum=${lectureVO.num }'" style="width: 100px; height: 100px; cursor:pointer;" class="lead img-fluid img-rounded">
	                   <a href="lecture.go?lectureNum=${lectureVO.num }">${lectureVO.name }</a>
	                    </div>
	                </div>
            	</c:forEach>
            </div>
            <button class="btn btn-primary leftLst"><</button>
            <button class="btn btn-primary rightLst">></button>
        </div>
	</div>

	        <hr/>

						</div>

					</div> <!-- 추천 div end -->
              </div>  
              
              <!-- 추천 end -->
               <!-- 강의 리스트 start -->  
					                 <div class="tab-pane fade"  id="lectureList">
					              				<br>
					             				 <div class="lectureList" style=" width:80%;">
   	 <div class="card" style="width: 100%;">
  		<div class="card-body"  style="height: 480px;">
  		<div id="myLectureList">
  			 <section id="tabs" class="project-tab">
  		 		 <div class="container">
              		  <div class="row">
              			  <div class="col-md-12">
             				   <nav>
                        		    <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">동영상 목록</a>
								</div>
                     		   </nav>
                      	   <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
      						  <div id="">
 								<table class="table table-hover table-borderless table-sm text-center" style="width: 100%;" cellspacing="0">
                                    <thead style="font-size: 16px; border-bottom: 2px solid #dee2e6;">
                                        <tr>
   											<th scope="col" style=" width: 10px;">No.</th>
                                            <th scope="col">제목</th>
                                        </tr>
                                    </thead>
                                <tbody style="font-size: 12px;">
								<!--  여기요 -->
								<c:forEach items="${lessonList }" var="lessonVO" varStatus="status">
								<tr style="cursor: hand;" >
        							    <th scope="row">${status.count }</th>
         								   <td>${lessonVO.title }</td>
   								
     						     </tr>
								</c:forEach>
     							     
								</tbody>
                               </table>
                           
         


       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
</section>
</div>
         	 </div>
          </div>
					                  			</div>
 											</div>
 											<br>        
 					<!-- 강의 리스트 end -->     
            </div> <!--  class="tab-content" end -->

        </div> <!-- class="col-xs-12 col-md-12" end -->
      </div> <!-- <div class="row" > end -->
	</div> <!-- <div container end -->
	
</div>
<%@ include file="footer.jsp"%>
  </body>
</html>