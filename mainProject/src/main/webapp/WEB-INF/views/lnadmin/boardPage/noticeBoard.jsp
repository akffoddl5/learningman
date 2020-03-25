<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<%@include file="../commonPage/adminHeader.jsp"%>
	<!-- ============================================================== -->
	<!-- main wrapper -->
	<!-- ============================================================== -->
	<%@include file="../commonPage/adminSideMenu.jsp"%>
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
						<div class="card-header" id="noticeList">
							<h5 class="mb-0">공지게시판 관리</h5>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="example" class="table table-striped table-bordered second" style="width: 100%">
									<thead>
										<tr>
											<th style="width: 15%;">글번호</th>
											<th>제목</th>
											<th style="width: 15%;">작성자</th>
											<th style="width: 15%;">작성시간</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${adNoticeBoardList }" var="noticeBoardVO" varStatus="status">
											<tr>
												<th scope="row"><input type="checkbox" class="mr-2" id="checkRow" value="${noticeBoardVO.num}" name="checkRow">${status.count}</th>
												<td onclick="location.href='noticeUpdateForm.go?num=${noticeBoardVO.num}'" style="cursor: pointer;">${noticeBoardVO.title }</td>
												<td>${noticeBoardVO.writer }</td>
												<td>${noticeBoardVO.regDate }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="card-footer" align="right">
							<input type="checkbox" style="float: left;" name="checkAll" id="th_checkAll" onclick="checkAll();"/><font style="float: left">&nbsp;모두선택</font> 
							<input type="button" style="font-size: 12px; width: 5%; padding-left: 0%; padding-right: 0%;" class="btn btn-primary btn-lg btn-block" value="새글" onclick="location.href='noticeWriteForm.go'"> 
							<input type="button" style="font-size: 12px; width: 5%; padding-left: 0px; padding-right: 0px; margin-top: 0px;" class="btn btn-primary btn-lg btn-block" value="삭제" onclick="deleteNotice();">
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
		<%@include file="../commonPage/adminFooter.jsp"%>