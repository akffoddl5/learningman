<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../commonPage/adminHeader.jsp" %>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
	<%@include file ="../commonPage/adminSideMenu.jsp" %>
<script>

function deleteCategory(){
	var content = document.getElementById("name").value;
	var query = {name : content};
	alert(query);
	$.ajax({
		type : "POST",
		url : "deleteCategory.do",
		data : query,
		success : function(data){
			alert("삭제되었습니다.");
			location.href="categoryList.do";
		}
	});
}

</script>
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
                    	<h5 class="card-header">카테고리명 수정</h5>
								<input type="hidden" name="categoryname" value="${categoryVO.name}">
                                <div class="card-body" align="right">
                                    <table class="table text-center">
                                 		<tbody>
											<tr>
                                                <th scope="row" style="width: 30%">카테고리 명</th>
                                                <td><input type="text" id="name" name="name"  readOnly="readOnly" style="width: 50%;" value="${categoryVO.name}"></td>
											</tr>
                                            <tr>
                                                <th scope="row" style="width: 30%">제작자</th>
                                                <td><input type="text" id="constructor" name="constructor" readOnly="readOnly" style="width: 50%;" value="${categoryVO.constructor}"></td>
											</tr>
										</tbody>
                                    </table>
                                </div>
                                <div class="card-footer" align="right">
                                	<input type="submit" style=" font-size: 12px; width: 5%; padding-left: 0px; padding-right: 0px; margin-top: 0px;" class="btn btn-primary btn-lg btn-block" value="삭제" onclick="deleteCategory()">
        							<input type="button" style=" font-size: 12px; width: 5%; padding-left: 0px; padding-right: 0px; margin-top: 0px;" class="btn btn-primary btn-lg btn-block" value="취소" onclick="location.href='categoryList.do'">
                  				</div>
                  			</div>
						</div>
              		</div>

              	
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
 <%@include file ="../commonPage/adminFooter.jsp" %>