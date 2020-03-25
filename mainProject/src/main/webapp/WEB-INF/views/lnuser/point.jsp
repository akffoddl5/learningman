<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">
<head>
  <title>다배워 ! LearningMan &mdash;</title>
<%@ include file="metaHeader.jsp" %>
  </head>
   
   <script type="text/javascript">
   function pointPay(){
	   var payPoint = document.getElementById("point").value;
	   var query = {date : payPoint};
	   alert(payPoint);
	   var url = "/learningman/kakaoPay.do?payPoint=" + payPoint;
	   alert(url);
	   location.href=url;
   }
   </script>

  <body>
  <%@ include file="header.jsp" %>
  <div class="site-wrap">
    <!-- pick UI start -->
   	 <div class="card" style="min-height: 500px; margin-top: 10%;">
  		<div class="card-body"  >
  			 <section id="tabs" class="project-tab">
  		 		 <div class="container">
              		  <div class="row">
              			  <div class="col-md-12">
             				   <nav>
                        		    <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">포인트 충전내역</a>
                          
								</div>
                     		   </nav>
                      	   <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
 								<table class="table table-hover table-borderless table-sm text-center" style="width: 100%; " cellspacing="0">
                                    <thead style="font-size: 16px; border-bottom: 2px solid #dee2e6;">
        							<tr>
										<th>no</th>
										<th>충전 금액</th>
										<th>결제 방법</th>
										<th>충전 날짜</th>
										<th>처리 상태</th>
									</tr>
                	                    </thead>
                          				      <tbody>
											<c:forEach items="${payList}" var="payListVO" varStatus="status">
    								      	<tr>
	     								   <th scope="row">${status.count }</th>
	         								 <td>${payListVO.price }</td>
									         <td>${payListVO.type }</td>
									         <td>${payListVO.regDate} </td>
									         <td>완료 </td>
									        </tr>
									   		</c:forEach>
         
   
        </tbody>
                               </table>
	

      </div>
     </div>
    </div>
   </div>
  </div>

</section>
         	 </div>
          </div>

          <div class="col">
                            <div class="row my-3" style="float: right;">
                <small><span>보유 포인트</span> &nbsp;${vo.point }&nbsp;<a class="icon-krw"></a></small>
          </div>
            <div class="row my-3" >
                <form method="post" action="/learningman/kakaoPay.do">
                	<select id="point" class="form-control"  name="payPoint">
                		<option value="1000">1000P 충전</option>
						<option value="5000">	5000P 충전</option>
						<option value="10000">	10000P 충전</option>
						<option value="50000">	50000P 충전</option>
						<option value="100000">	100000P 충전</option>
						<option value="1000000">1000000P 충전</option>
                	</select>
            </div> 
            <div class="row my-3" >
            <input type="submit" style="font-size: 12px;" class="btn byn-sm btn-primary" value="카카오 페이로 결제하기" >          
            </div>
				</form>
          </div>

    </div>
<%@ include file="footer.jsp"%>
    
  </body>
</html>