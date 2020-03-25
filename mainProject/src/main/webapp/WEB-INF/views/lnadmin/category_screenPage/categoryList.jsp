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
                                <h2 class="pageheader-title">화면관련항목</h2>
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
                                <h5 class="mb-0"><수정하려는 카테고리명을 선택하세요></h5>
            
							</div>
                            <div class="card-body">
                                <div class="table-responsive">
                               		<table id="example" class="table table-striped table-bordered second" style="width:100%">
										<thead>
                                            <tr>
                                            	<th style="width: 10%; text-align: center;">카테고리 번호</th>
                                                <th style="width: 30%; text-align: center;">카테고리명</th>
                                                <th style="width: 10%; text-align: center;">제작자</th>
                                       			<th style="width: 20%; text-align: center; ">작성일자</th>
                                       		
                                        	</tr>
                                         </thead>
                                         <tbody>
                                         	<c:forEach items="${categoryList}" var="categoryVO" varStatus="status">
                                        		<tr>
                             						<th scope="row" style="">${status.count}</th>
                                                	<td onclick="location.href='getCategoryName.do?name=${categoryVO.name}'" style="cursor:pointer; text-align: center;">${categoryVO.name}</td>
                                                	<td>${categoryVO.constructor}</td>
   													<td>${categoryVO.regDate}</td>
   													
                                            	</tr>
                                        	</c:forEach>
                                        </tbody>
                					</table>
                             	</div>
							</div>
                       		<div class="card-footer" align="right">
								
        						<input type="button" style=" font-size: 12px; width: 5%; padding-left: 0%; padding-right: 0%;" class="btn btn-primary btn-lg btn-block" value="추가" onclick="location.href='categoryWriteForm.go'">
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
 