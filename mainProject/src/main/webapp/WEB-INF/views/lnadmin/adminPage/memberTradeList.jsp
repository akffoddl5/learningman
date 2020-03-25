<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../commonPage/adminHeader.jsp" %>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
<%@include file ="../commonPage/adminSideMenu.jsp" %>
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    <!-- ============================================================== -->
                    <!-- pageheader  -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="">
                            <div class="page-header">
                                <h2 class="pageheader-title">회원 거래 내역 </h2>
                                
                             </div>
                        </div>
                    </div>
                </div>
 
 			<div class="row">
                    <!-- ============================================================== -->
                    <!-- data table  -->
                    <!-- ============================================================== -->
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0">거래 내역</h5>
                           	</div>
                            <div class="card-body">
                                <div class="table-responsive">
                               		<table id="example" class="table table-striped table-bordered second" style="width:100%">

                                        <thead>
                                            <tr>
                                            	
                                                <th>번호</th>
                                                <th>구매자</th>
                                                <th>거래 금액</th>
                                                <th>판매자</th>
                                                <th>강의 이름</th>
                                                <th>거래 날짜</th>
										 	</tr>
                                        </thead>
                                        <tbody>
                             				<c:forEach items="${MemberTradeList}" var="tradeListVO" varStatus="status">

                                            <tr>
                                                <th scope="row">${status.count}</th>
													<td>${tradeListVO.buyer}</td>
													<td>${tradeListVO.price}</td>
                                                	<td>${tradeListVO.seller}</td>
                                                	<td>${tradeListVO.lectureNum}</td>
                                                	<td>${tradeListVO.regDate}</td>
                                            </tr>
                                           </c:forEach>

                                    	</tbody>
                                	</table>
                                  
                      			
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end data table  -->
                    <!-- ============================================================== -->
                </div>
              
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
 <%@include file ="../commonPage/adminFooter.jsp" %>
 
 