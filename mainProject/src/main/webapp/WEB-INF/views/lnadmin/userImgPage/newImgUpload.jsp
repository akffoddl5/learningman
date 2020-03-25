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
                                <h2 class="pageheader-title">User 화면 항목 </h2>
                            </div>
                        </div>
                    </div>
                </div>
 <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
 <script type="text/javascript">
    
 		$(function() {
            $("#imgInp2").on('change', function(){
                readURL1(this);
            });
           
        });

        function readURL2(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $("#blah2").attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }
       
</script>

			<div class="row">
                        <!-- ============================================================== -->
                        <!-- basic table -->
                        <!-- ============================================================== -->
               			<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                           	<div class="card" style="width: 80%; height: 100%;">	
                                <h5 class="card-header">신규강의화면 이미지 등록</h5>
                                <div class="card-body" align="right">
                                <form action="updateNewImage.do" method="post" id="form1" runat="server" enctype="multipart/form-data">
                                    <table class="table">
                                 		<thead>
                                            <tr>
                         						<th style="width: 10%;">이미지위치</th>
                                                <th style="text-align: center;">이미지파일</th>
                                                <th style="text-align: center;">미리보기</th>
                                       		</tr>
                                        </thead>
                                        <tbody>
	
                                           
                                         	<tr>
                                               	<th scope="row" style="height:20%;">신규페이지</th>
                                               	<td style="text-align: center;"><input type="file" id="imgInp2" name="imageFile2" style="height: 50%; width: 50%;"></td>
                                               	<td style="text-align: right;"><img style="height:50%; width:50%;"id="blah2" src="#" alt="your image" /></td>
                                         	</tr>

                                    </table>
        							<input type="submit" style="font-size: 12px; width: 5%; padding-left: 0px; padding-right: 0px; margin-top: 0px;" class="btn btn-primary btn-lg btn-block" value="수정" onclick="">
                                    <input type="reset" style="font-size: 12px; width: 5%; padding-left: 0px; padding-right: 0px; margin-top: 0px;" class="btn btn-primary btn-lg btn-block" value="취소" onclick="location.href='newImgUpload.go'">
                                </form>
                                </div>
                            </div>
						</div>
        	</div>

 
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
 <%@include file ="../commonPage/adminFooter.jsp" %>