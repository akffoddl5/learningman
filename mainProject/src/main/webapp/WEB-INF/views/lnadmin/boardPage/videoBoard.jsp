<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                                <h2 class="pageheader-title">게시판 항목</h2>
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
                                <h5 class="mb-0">동영상게시판 관리</h5>
							</div>
                            <div class="card-body">
                                <div class="table-responsive">
                               		<table id="example" class="table table-striped table-bordered second" style="width:100%">
										<thead>
                                            <tr>
                                                <th style="width: 15%;">글번호</th>
                                                <th style="text-align: center;">제목</th>
                                                <th style="text-align: center;">아이디</th>
                                       			<th style="text-align: center; width: 20%;">작성일자</th>
                                       		</tr>
                                    	</thead>
                                      	<tbody>
                                        	<c:forEach items="${lessonList}" var="lessonVO" varStatus="status" >
                                      			<tr>
                             						<th scope="row"><input type="checkbox" name="checkRow" value="${lessonVO.num }">${status.count}</th>
                                                	<td>${lessonVO.title}</td>
                                                	<td>${lessonVO.id}</td>
   													<td>${lessonVO.regDate}</td>
   												</tr>
                                        	</c:forEach>  
                                        </tbody>
                					</table>
                             	</div>
							</div>
                       		<div class="card-footer" align="right">
								<input type="checkbox" style="float: left;" name="checkAll" id="th_checkAll" onclick="checkAll();"/><font style="float: left">&nbsp;모두선택</font>
        						<input type="button" style=" font-size: 12px; width: 5%; padding-left: 0px; padding-right: 0px; margin-top: 0px;" class="btn btn-primary btn-lg btn-block" value="삭제" onclick="updateVideoBtn();">
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
 