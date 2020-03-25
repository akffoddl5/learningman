<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html lang="en">
<head>
  <title>다배워 ! LearningMan &mdash;</title>
<%@ include file="metaHeader.jsp" %>

 </head>
  <body>
<%@ include file="header2.jsp" %>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
  <c:if test="${vo.id ==null }">
  <script>
  alert("로그인이 필요한 서비스입니다.");
  location.href="loginForm.go";
  </script>
  </c:if>
  <script type="text/javascript">
function clickLecture(lectureNum){
	
	var myId ='${vo.id}';
	//alert(myId);
	var uri = "lecture.go?lectureNum=" + lectureNum ;
	if(myId ==""){
		alert("로그인이 필요한 서비스입니다.");
	}else{
		location.href=uri;
	}
	
}
</script>

       <!-- mypage UI start -->
       <style>
<!--
a{
font-size: 15px;
}

.site-wrap{
max-width: 1176px;
    width: 65%;
    margin-left: auto;
    margin-right: auto;
}


-->
</style>
<div class="site-wrap">

        <div class="container" style="width: 80%;">
   <div class="row " style="margin-top: 100px;">
      <div class="col-md-4" style="height:150px">
            <c:if test="${vo.teacher == 'Y' }">
            
      <div class="lectureDropdown">
  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">내 강의실<span class="caret"></span></button>
		<a class="card-text" href="lectureForm.go" style="font-size: 16px; font-weight: bold; ">&nbsp;&nbsp;+ 강의 </a>
		


  <ul class="dropdown-menu">
  <c:forEach items="${myLectureList}" var="LectureVO">
    <li><a class="" href='lecture.go?lectureNum=${LectureVO.num}&imTeacher=Y'>${LectureVO.name }</a></li>
    </c:forEach>
  </ul>
  </li>
  </ul>
</div>

</c:if>
      
  </div>

      <div class="col-md-4 text-center" style="height:200px; ">
		 <c:if test="${vo.teacher == 'N' }">
        <img src="resources/uploadedVideos/${vo.thumbnail }" width="100" height="100" class="rounded-circle">
        </c:if>
        <c:if test="${vo.teacher == 'Y' }">
        <img src="resources/uploadedVideos/${vo.thumbnail }" width="100" height="100" class="rounded-circle">
        </c:if>
           <div><a class="card-text" href="updateForm.go" style="font-size: 20px; font-weight: bold;">${vo.id }</a></div> <br>
<div class="col">
 <div class="row justify-content-md-center" >
 <div class="col"><a style="color: #7971ea;">찜한 강의</a></div>
  <div class="col"><a href="point.go">포인트</a></div>
  <c:if test="${vo.teacher == 'Y' }">
  <div class="col"><a style="color: #7971ea;">강사</a></div>
 </c:if>
 <c:if test="${vo.teacher == 'N' }">
 <div class="col"><a style="color: #7971ea;">학생</a></div>
 </c:if>
</div>
 <div class="row justify-content-md-center">
 <div class="col" style="font-weight: bold; color: #7971ea;"><span>${myPickList.size() }</span></div>
  <div class="col" style="font-weight: bold; color: #7971ea;"><span>${vo.point }원</span></div>
  <div class="col" style="font-weight: bold;color: #7971ea; "><span>CLASS</span></div>
 </div>
</div>

    
      </div>

      <div class="col-md-4" style="height:200px;">
      <div class="row">
  <div class="col-sm">
  <a href="logout.do" style="float: right; font-size: 14px;">로그아웃</a>
  
  </div>
  </div>
      <div class="row">
<div class="col-sm">
<c:if test="${vo.teacher == 'N' }">

          <a class="card-text" href="teacherLicense.go" style="float: right; margin-top: 140px; font-size: 14px; ">강사 지원하기</a>
       
		</c:if>
	
</div>
</div>
      </div>
</div>
 



    <!-- ------------------------------------------------------------------- -->  

  
 <!-- mypage UI end -->
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



	 <div class="my-3">
           <span style="font-weight: bold; font-size: 24px;">수강중인 강의</span>
  		</div>
	<div class="row">
  		
		<div class="MultiCarousel" data-items="1,3,5,6" data-slide="1" id="MultiCarousel"  data-interval="1000">
		
			<c:if test="${myHistoryLecutreList.size() == 0}">
           	<div class=" row" style="place-content: center; font-weight: bold;">
           	<span>수강중인 강의가 없습니다</span>
           	</div>
           	</c:if>
		
            <div class="MultiCarousel-inner">
           
            <c:forEach items="${myHistoryLecutreList}" var="lectureVO">
            	<div class="item" style="cursor: pointer;" onclick="location.href='lecture.go?lectureNum=${lectureVO.num }'">
                    <div class="pad15">
                        <img src="resources/uploadedVideos/${lectureVO.thumnailPath }" class="lead img-fluid img-rounded">
                   <a  style="font-weight: bold; " href="lecture.go?lectureNum=${lectureVO.num }">${lectureVO.name }</a>
                    </div>
                </div>
            	</c:forEach>
            
                
               
                
            </div>
            <button class="btn btn-primary leftLst"><</button>
            <button class="btn btn-primary rightLst">></button>
        </div>
	</div>



<!-- ------------------------------------------------------------------------------------------------------------ -->




 <div class="my-3">
           <span style="font-weight: bold; font-size: 24px;">찜한 강의</span>
  		</div>

	<div class="row">
		<div class="MultiCarousel" data-items="1,3,5,6" data-slide="1" id="MultiCarousel"  data-interval="1000">
					<c:if test="${myPickList.size() == 0}">
           	<div class=" row" style="place-content: center; font-weight: bold;">
           	<span>찜한 강의가 없습니다</span>
           	</div>
           	</c:if>
            <div class="MultiCarousel-inner">
                <c:forEach items="${myPickList}" var="kk">
                <div class="item">
                    <div class="pad15">
                        <img src="resources/uploadedVideos/${kk.thumnailPath} " onclick="clickLecture('${kk.num}');" style="cursor: pointer;" class="lead img-fluid img-rounded">
                      <a href="#" style="font-weight: bold;" onclick="clickLecture('${kk.num}');">${kk.name}</a>
                    </div>
                </div>
                </c:forEach>
                
            </div>
            <button class="btn btn-primary leftLst"><</button>
            <button class="btn btn-primary rightLst">></button>
        </div>
	</div>


</div>
          
</div>
<%@ include file="footer.jsp"%>
  </body>
</html>