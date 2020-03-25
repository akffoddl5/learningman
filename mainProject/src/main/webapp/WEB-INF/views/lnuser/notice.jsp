<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
  <head>
    <title>다배워 ! LearningMan &mdash;</title>
<%@ include file="metaHeader.jsp" %>

	<script type="text/javascript">
	
	
	 
	 function noticeAjax(current){
		 var query = {currentPage:current };
    	 $.ajax({
             type: "POST",
             url: "notice.do",
             data: query,
             success: function(data){
            	 
                 $("#noticeBoardAjax").html(data);
             }
          });
	 }
	
	 
      
   </script>
  </head>
  <body>
  <%@ include file="header.jsp" %>
  <div class="site-wrap">
   	 <div class="card" style="margin-top: 10%;">
  		<div class="card-body">
  			 <section id="tabs" class="project-tab">
  		 		 <div class="container">
              		  <div class="row">
              			  <div class="col-md-12">
             				   <nav>
                        		    <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">공지사항</a>
								</div>
                     		   </nav>
                      	   <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
      						  <div id="noticeBoardAjax">
 								<table class="table table-hover table-borderless table-sm text-center" style="width: 100%;" cellspacing="0">
                                    <thead style="font-size: 16px; border-bottom: 2px solid #dee2e6;">
                                        <tr>
   											<th scope="col" style=" width: 10px;">No.</th>
                                            <th scope="col">제목</th>
											<th scope="col" style=" width: 80px;" >작성자</th>
                                        </tr>
                                    </thead>
                                <tbody style="font-size: 14px;">
									<c:forEach items="${noticeBoardList}" var="noticeBoard">
     							     <tr style="cursor: hand;" onclick="location.href='getNoticeBoard.do?num=${noticeBoard.num}'">
        							    <th scope="row">${noticeBoard.rNum }</th>
         								   <td>${noticeBoard.title }</td>
         								   <td>${noticeBoard.writer} </td>
   									</c:forEach>
     						     </tr>
								</tbody>
                               </table>
                               <hr/>
          <div class="row" data-aos="fade-up" >
              <div class="col-md-12 text-center" >
                <div class="site-block-27">
					<ul style="cursor: hand;">
						<c:if test="${currentBlock !=1 }">
							<li><a onclick="noticeAjax('${startBlock-1 }')"> 이전 </a></li>
						</c:if>
							<c:forEach var="i" step="1" begin="${startBlock}" end="${endBlock}">
								<c:if test="${i<= blockTotal }">
							<li><a onclick="noticeAjax('${i }')">${i }</a></li>
						</c:if>
					<!-- 
					<c:if test="${i== currentBlock }">
					</c:if>
					 -->
					</c:forEach>
						<c:if test="${currentBlock != blockNum }">
							<li><a onclick="noticeAjax('${endBlock+1 }')" > 다음 </a></li>
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
         	 </div>
          </div>
	</div>
 <%@ include file="footer.jsp"%>
    
  </body>
</html>