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
                                <h2 class="pageheader-title">약관 항목 </h2>
                            </div>
                        </div>
                    </div>
                </div>
 
 			<div class="row">
                        <!-- ============================================================== -->
                        <!-- basic table -->
                        <!-- ============================================================== -->
               			<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                           	<div class="card" style="width: 80%;">	
                                <h5 class="card-header">약관 등록</h5>
                                <div class="card-body" align="right">
                                <form action="insertTerms.do" method="post">
                                    <table class="table">
                                 		<thead>
                                            <tr>
                         						<th style="width: 10%;">약관제목</th>
                                                <th style="text-align: center;">약관내용</th>
                                       		</tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                               	<th scope="row"><input type="text" name="termsname"></th>
                                               	<td style="text-align: center;"><textarea name="termscontent" style="height: 150px; width: 50%;"></textarea></td>
                                         	</tr>
                                        </tbody>
                                    </table>
                                    <input type="submit" style="font-size: 12px; width: 5%; padding-left: 0px; padding-right: 0px; margin-top: 0px;" class="btn btn-primary btn-lg btn-block" value="등록" onclick="">
                                    <input type="button" style="font-size: 12px; width: 5%; padding-left: 0px; padding-right: 0px; margin-top: 0px;" class="btn btn-primary btn-lg btn-block" value="취소" onclick="location.href='adminTermsList.do'">
                                </form>
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