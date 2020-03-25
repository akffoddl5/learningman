<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

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
                                <h2 class="pageheader-title">관리자 항목 </h2>
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
                                <h5 class="mb-0">등록관리자 목록</h5>
                         	</div>
                            <div class="card-body">
                                <div class="table-responsive">
                               		<table id="example" class="table table-striped table-bordered second" style="width:100%">
                               			<thead>
                                            <tr>
                                            	<th>번호</th>
                                                <th>아이디</th>
						 						<th>연락처</th>
                                                <th>이메일</th>
                                                <th>가입일시</th>
                                          	</tr>
                                        </thead>
                                        <tbody>

                                        	<form action="adminModify.do" method="post">
                                        		<c:forEach items="${adMemberList}" var="adminVO" varStatus="status" >

                                            		<tr>
                                          				<td>${status.count}</td>
														<td>${adminVO.id}</td>
                                                		<td>${adminVO.phone}</td>
                                                		<td>${adminVO.email}</td>
                                                		<td>${adminVO.regDate}</td>
                                            		</tr>
                                           		</c:forEach>
											</form>

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
            </div>
     	</div>
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            
            
 <%@include file ="../commonPage/adminFooter.jsp" %>
 
 