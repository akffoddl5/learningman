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
                                <h5 class="card-header">Q&A답글 등록</h5>
                                <div class="card-body">
                                    <table class="table text-center">
                                 
                                        <tbody>
											<tr>
                                                <th scope="row">글번호</th>
                                                <td><input type="text" id="num" name="num" readonly="readonly" value="${AskBoardVO.num }" style="width: 100%;"></td>
											</tr>
                                            <tr>
                                                <th scope="row">제목</th>
                                                <td><input type="text" id="title" name="title" readonly="readonly" value="${AskBoardVO.title }" style="width: 100%;"></td>
											</tr>
											<tr>
                                                <th scope="row">분류</th>
                                                <td><input type="text" id="type" name="type" readonly="readonly" value="${AskBoardVO.type }" style="width: 100%;"></td>
											</tr>
											<tr>
                                                <th scope="row">아이디</th>
                                                <td><input type="text" id="writer" name="writer" readonly="readonly" value="${AskBoardVO.writer }" style="width: 100%;"></td>
											</tr>
											<tr>
                                                <th scope="row">작성일</th>
                                                <td><input type="text" id="regDate" name="regDate" readonly="readonly" value="${AskBoardVO.regDate }" style="width: 100%;"></td>
											</tr>
											<tr>
                                                <th scope="row">내용</th>
                                                <td style="text-align: center;"><textarea id="content" name="content" readonly="readonly" style="height: 150px; width: 100%;">${AskBoardVO.content }</textarea></td>
											</tr>
											
                                        </tbody>
                                        <tbody>
                                        	<tr>
                                        		<th scope="row"><font color="red">답글 제목</font></th>
                                        		<td><input id="answerTitle" name="answerTitle" style=" width: 80%;"></td>
                                        	</tr>
                                        	<tr>
                                        		<th scope="row"><font color="red">답글 내용</font></th>
                                        		<td><textarea id="answerContent" name="answerContent" style="height: 150px; width: 80%;"></textarea></td>
                                         </tbody>
                                    </table>
                                    
                                </div>
								<div class="card-footer" align="right">
        								<input type="button" style=" font-size: 12px; width: 5%; padding-left: 0px; padding-right: 0px; margin-top: 0px;" class="btn btn-primary btn-lg btn-block" value="등록" onclick="submitAnswer('${AskBoardVO.writer}');">
        								<input type="button" style=" font-size: 12px; width: 5%; padding-left: 0px; padding-right: 0px; margin-top: 0px;" class="btn btn-primary btn-lg btn-block" value="취소" onclick="location.href='adminQnaBoard.do'">
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
        