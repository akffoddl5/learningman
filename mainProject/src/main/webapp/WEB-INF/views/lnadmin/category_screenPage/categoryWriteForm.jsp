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
                                <h2 class="pageheader-title">화면관련항목 </h2>
                            </div>
                        </div>
                    </div>
                </div>
 
 			<div class="row">
            	<!-- ============================================================== -->
                <!-- basic table -->
                <!-- ============================================================== -->
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                	<div class="card" style="width: 50%;">
                    	<h5 class="card-header">카테고리등록</h5>
                    	<form action="insertCategory.do" method="post">
                                <div class="card-body" align="right">
                                    <table class="table text-center">
                                 		<tbody>
											<tr>
                                                <th scope="row" style="width: 30%">카테고리 명</th>
                                                <td><input type="text" id="name" name="name" style="width: 50%;"></td>
											</tr>
                                            <tr>
                                                <th scope="row" style="width: 30%">제작자</th>
                                                <td><input type="text" id="constructor" name="constructor" readOnly="readOnly" style="width: 50%;" value="${vo.id}"></td>
											</tr>
										</tbody>
                                    </table>
                                
                                <input type="submit" style=" font-size: 12px; width: 5%; padding-left: 0px; padding-right: 0px; margin-top: 0px;" class="btn btn-primary btn-lg btn-block" value="등록">
        						<input type="button" style=" font-size: 12px; width: 5%; padding-left: 0px; padding-right: 0px; margin-top: 0px;" class="btn btn-primary btn-lg btn-block" value="취소" onclick="location.href='categoryList.do'">
                      		</div>
                      	</form>
					</div>
				</div>
              	</div>

              	
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
 <%@include file ="../commonPage/adminFooter.jsp" %>