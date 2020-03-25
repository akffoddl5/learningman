<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file ="../commonPage/adminHeader.jsp" %>
    <!-- ============================================================== -->
    <!-- main wrapper-->
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
                                <h2 class="pageheader-title">관리자 항목</h2>
                            </div>
                        </div>
                    </div>
                </div>
 
 			<div class="row">
                    <!-- ============================================================== -->
                    <!-- basic table -->
                    <!-- ============================================================== -->
 					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <h5 class="card-header">관리자 전체 목록</h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered first">
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
                                         	<c:forEach items="${adMemberList}" var="adminVO" varStatus="status">
                                            	<tr>
	
                                                	<th scope="row">${status.count}</th>
                                                	<td>${adminVO.id}</td>
                                                	<td>${adminVO.phone}</td>
                                                	<td>${adminVO.email}</td>
                                                	<td>${adminVO.regDate}</td>
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
		</div>
	<!-- ============================================================== -->
   	<!-- footer -->
   	<!-- ============================================================== -->
 <%@include file ="../commonPage/adminFooter.jsp" %>
 
 
 