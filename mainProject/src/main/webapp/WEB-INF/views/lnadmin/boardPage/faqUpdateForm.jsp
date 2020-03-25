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
                                <h2 class="pageheader-title">게시판 항목 </h2>
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
                            	 <h5 class="card-header">FAQ 수정</h5>
                            	<form id="updateFaqBoard" action="updateFaqBoard.do" method="post">
                               		<div class="card-body" align="right">
                                    	<table class="table text-center">
                                 			<tbody>
                                        		<input type="hidden" id="num" name="num" value="${faqBoardVO.num }">
												<tr>
                                                	<th scope="row">제목</th>
                                                	<td><input type="text" style="width:100%;" id="title" name="title" value="${faqBoardVO.title }"></td>
												</tr>
												<tr>
                                                	<th scope="row">내용</th>
                                                	<td style="text-align: center;"><textarea style="height: 150px; width: 100%;" id="content" name="content" >${faqBoardVO.content }</textarea></td>
												</tr>
                                        	</tbody>
                                    	</table>
                                    	<input type="button" style=" font-size: 12px; width: 5%; padding-left: 0px; padding-right: 0px; margin-top: 0px;" class="btn btn-primary btn-lg btn-block" value="완료" onclick="document.getElementById('updateFaqBoard').submit()">
        								<input type="button" style=" font-size: 12px; width: 5%; padding-left: 0px; padding-right: 0px; margin-top: 0px;" class="btn btn-primary btn-lg btn-block" value="취소" onclick="location.href='adminFaqBoard.do'">
                                	</div>
                               </form>
                            </div>
						</div>
              </div>
              </div>
      	</div>
              
         	<!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
 <%@include file ="../commonPage/adminFooter.jsp" %>