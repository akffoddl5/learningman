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
                                <h2 class="pageheader-title">약관 목록 </h2>
                                
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
                                <h5 class="card-header"><수정 할 약관제목을 선택하세요.></h5>
                                <div class="card-body" align="right">
                            
                                    <table class="table">
                                 
                                        <thead>
                                            <tr>
                                                <th style="width: 30%;">번호</th>

                                                <th style="text-align: center;">약관제목</th>
                                       		</tr>
                                         </thead>
                                        <tbody>
                                        <c:forEach items="${getTermsList}" var="termsVO">
                                            <tr>
                                                <th scope="row"><input type="checkbox" class="mr-2" name="checkRow" value="${termsVO.termsnum}">${termsVO.termsnum}</th>
                                                <td onclick="location.href='getTermsContent.do?num=${termsVO.termsnum}'" style="cursor:pointer; text-align: center;">${termsVO.termsname}</td>
                                                
                                         
											</tr>
										</c:forEach>
                                        </tbody>
                     
                                    </table>
                                                       			
								<input type="checkbox" style="float: left;" name="checkAll" id="th_checkAll" onclick="checkAll();"/><font style="float: left">&nbsp;모두선택</font>
        							<input type="button" style=" font-size: 12px; width: 5%; padding-left: 0px; padding-right: 0px; margin-top: 0px; " class="btn btn-primary btn-lg btn-block" value="삭제" onclick="delete1();">
							
                                   
							
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