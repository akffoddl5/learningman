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
                                <h2 class="pageheader-title">회원 항목 </h2>
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
                                <h5 class="mb-0">등록회원 정보수정</h5>
                           	</div>
                            <div class="card-body">
                                <div class="table-responsive">
                               		<table id="example" class="table table-striped table-bordered second" style="width:100%">
										<thead>
                                            <tr>
                                            	<th>아이디</th>
                                                <th>이름</th>
                                                <th>연락처</th>
                                                <th>이메일</th>
                                                <th>강의여부</th>
                                                <th>인증여부</th>
										 	</tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${userMemberList}" var="UserVO">
                             					<tr>
                             						<td><input type="checkbox" class="mr-2" name="checkRow" value="${UserVO.id}">${UserVO.id}</td>
                                                	<td>${UserVO.name}</td>
                                                	<td>${UserVO.phone}</td>
                                                	<td>${UserVO.email}</td>
                                                	<td>${UserVO.teacher}</td>
                                                	<td>${UserVO.authorized}</td>
                                            	</tr>
                                         	</c:forEach>
                                		</tbody>
                                	</table>
                            	</div>
                            </div>
                            <div class="card-footer" align="right">
								<input type="checkbox" style="float: left;" name="checkAll" id="th_checkAll" onclick="checkAll();"/><font style="float: left">&nbsp;모두선택</font>
        						<input type="button" style=" font-size: 12px; width: 5%; padding-left: 0px; padding-right: 0px; margin-top: 0px;" class="btn btn-primary btn-lg btn-block" value="삭제" onclick="delete2();">
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
 
 