<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
  <head>
    <title>다배워 ! LearningMan &mdash;</title>
<%@ include file="metaHeader.jsp" %>

	<script type="text/javascript">
	
	 $(document).ready(function(){
		 
		 /*
         $("#askAjaxBtn").click(function(){
        	 alert('red');
        	 
        	 var current = document.getElementById("askAjaxBtn").value;
        	 alert(current);
        	 var query = {currentPage:current };
        	 $.ajax({
                 type: "POST",
                 url: "getAskBoardList.do",
                 data: query,
                 success: function(data){
                	 $("#askBoardAjax").remove();
                     $("#askBoardAjax").append(data);
                 }
              });
        	 
         });
         */
	 });
	 
	 function askAjax(current){
		 var query = {currentPage:current };
    	 $.ajax({
             type: "POST",
             url: "getAskBoardList.do",
             data: query,
             success: function(data){
            	 
                 $("#askBoardAjax").html(data);
             }
          });
	 }
	 
	 function faqAjax(current){
		 var query = {fcurrentPage:current };
    	 $.ajax({
             type: "POST",
             url: "getFaqBoardList.do",
             data: query,
             success: function(data){
            	 
                 $("#faqBoardAjax").html(data);
             }
          });
	 }
	 
      
   </script>
  </head>
  <body>
  <%@ include file="header.jsp" %>

  <div class="site-wrap">
 	 <div class="card" style="margin-top: 10%;">
  		<div class="card-body" >
  		 <section id="tabs" class="project-tab">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <nav>
                            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                <a  class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">FAQ</a>
                                <a  class="nav-item nav-link " id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">질문 게시판</a>
                                
                            </div>
                        </nav>
                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                        <div id="faqBoardAjax">
                                <table class="table table-hover table-borderless table-sm text-center" style="width: 100%;" cellspacing="0">
                                    <thead style="font-size: 16px; border-bottom: 2px solid #dee2e6;">
                                        <tr>
                                            <th scope="col" style=" width: 10px;">No.</th>
                                            <th scope="col">내용</th>
             				           </tr>
                                    </thead>
                                    <tbody style="font-size: 14px;">
                                            <div id="faqBoardAjax"> 
        									  <c:forEach items="${faqBoardList}" var="faqBoard">
   												<tr style="cursor: hand;" onclick="location.href='getFaqBoard.do?num=${faqBoard.num}'">
          											  <td scope="row">${faqBoard.rNum }</td>
    											        <td>${faqBoard.title }</td>
     													    </tr>
       											  </c:forEach>
      										   </div>
                                    </tbody>
                                </table>
                              <hr/>
            <div class="row" data-aos="fade-up" >
              <div class="col-md-12 text-center" >
                <div class="site-block-27">
					<ul style="cursor: hand;">
					<c:if test="${fcurrentBlock !=1 }">
					<li><a onclick="faqAjax('${fstartBlock-1 }')"> 이전 </a></li>
					</c:if>
					<c:forEach var="i" step="1" begin="${fstartBlock}" end="${fendBlock}">
					<c:if test="${i<= fblockTotal}">
					<li><a onclick="faqAjax('${i }')">${i }</a></li>
					</c:if>
					<!-- 
					<c:if test="${i== fcurrentBlock }">
					</c:if>
					 -->
					</c:forEach>
					
					<c:if test="${fcurrentBlock != fblockNum }">
					<li><a onclick="faqAjax('${fendBlock+1 }')" > 다음 </a></li>
					</c:if>
					</ul>
					
				</div>
				</div>
				</div>
				</div>
                            </div>
                            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                            <div id="askBoardAjax">
                                <table class="table text-center table-hover table-borderless table-sm" style="font-size: 16px; width: 100%;" cellspacing="0">
                                    <thead style="border-bottom: 2px solid #dee2e6;">
										<tr>
											<th scope="col">No.</th>
											<th >제목</th>
											<th >분류</th>
											<th >아이디</th>
											<th >작성일</th>
										</tr>
                                    </thead>
                                    <tbody style="font-size: 14px; ">
      								    <c:forEach items="${askBoardList}" var="askBoard" varStatus="status">
      								    <c:if test="${askBoard.type != null }">
     								    <tr style="cursor: hand;" onclick="location.href='getAskBoard.do?num=${askBoard.num}'">
      								      <th scope="row">${askBoard.rNum }</th>
        								             <td>${askBoard.title }</td>
        								             <td>${askBoard.type }</td>
          								           <td>${askBoard.writer }</td>
         								            <td>${askBoard.regDate }</td>
         								         </tr>
          								        </c:if>
          								        <c:if test="${askBoard.type == null }">
        								          <tr style="cursor: hand; color:#7971ea;" onclick="location.href='getAnswerBoard.do?num=${askBoard.num}'">
          								           <th scope="row"><span class="icon-subdirectory_arrow_right"></span></th>
            								         <td colspan="2" class="text-left">${askBoard.title }</td>
            								         <td></td>
          								           <td>${askBoard.regDate }</td>
         								         </tr>
        								          </c:if>
         
        								          </c:forEach>
                                    </tbody>
                                </table>
                                
         <hr/>
         
            <div class="row" data-aos="fade-up">
              <div class="col-md-12 text-center">
                                <div class="site-block-27" >
					<ul style="cursor: hand;">
					<c:if test="${currentBlock !=1 }">
					<li><a onclick="askAjax('${startBlock-1 }')"> 이전 </a></li>
					</c:if>
					<c:forEach var="i" step="1" begin="${startBlock}" end="${endBlock}">
					<c:if test="${i<= blockTotal }">
					<li><a onclick="askAjax('${i }')">${i }</a></li>
					</c:if>
					</c:forEach>
					<c:if test="${currentBlock != blockNum }">
					<li><a onclick="askAjax('${endBlock+1 }')" > 다음 </a></li>
					</c:if>
					</ul>
					</div>
                        </div>
                        </div>        
                            </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
                <div class="text-right">
  <small><a href="writeForm.go">질문 하러 가기&nbsp;</a></small>
        </div>
        </div>
  </div>

  </div>
<%@ include file="footer.jsp"%>
  </body>
</html>