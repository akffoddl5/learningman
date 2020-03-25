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
                                <h2 class="pageheader-title">회원 충전 내역 </h2>
                                
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
                                <h5 class="mb-0">충전 내역</h5>
                           	</div>
                            <div class="card-body">
                                <div class="table-responsive">
                               		<table id="example" class="table table-striped table-bordered second" style="width:100%">

                                        <thead>
                                            <tr>
                                            	
                                                <th>번호</th>
                                                <th>아이디</th>
                                                <th>충전 금액</th>
                                                <th>충전방법</th>
                                     			<th>충전 날짜</th>
										 	</tr>
                                        </thead>
                                        <tbody>
                             				<c:forEach items="${memberAllPayList}" var="payListVO" varStatus="status">

                                            <tr>
                                                <th scope="row">${status.count}</th>
													<td>${payListVO.id}</td>
													<td>${payListVO.price}</td>
                                                	<td>${payListVO.type}</td>
                                          			<td>${payListVO.regDate}</td>
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
 