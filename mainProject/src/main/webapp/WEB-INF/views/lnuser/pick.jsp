<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">
<head>
  <title>다배워 ! LearningMan &mdash;</title>
<%@ include file="metaHeader.jsp" %>
  </head>
	<script type="text/javascript">
	function deletePick(pickNum){
		 var query = {num:pickNum };
   	 $.post({
            type: "POST",
            url: "deletePick.do",
            data: query,
            success: function(data){
           	 alert("삭제되었습니다.");
           	 location.href="pick.go";
            }
         });
	 }
     
   </script>


  <body>
   <%@ include file="header.jsp" %>
   <style>
<!--
.site-blocks-table thead th {
    padding: 10px;
    text-align: center;
    border-width: 1px !important;
    vertical-align: middle;
    color: #212529;
    font-size: 16px;
}
-->
</style>
  <div class="site-wrap">
    <!-- pick UI start -->
      <div class="container" style="margin-top: 10%;">
        <div class="row">
  
            <div class="site-blocks-table" style="width: 100%;">
              <table class="table table-bordered">
                <thead>
                  <tr>
                  <th>No.</th>
                    <th>찜한 강의</th>
                    <th>제목</th>
                    <th style="width: 10%;">판매가</th>
                    <th style="width: 10%;">삭제</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${myPickList}" var="lecture" varStatus="status">
                
                  <tr>
                  <td scope="row" style="font-weight: bold;">${status.count}</td>
                    <td class="product-thumbnail">
                      <img src="resources/uploadedVideos/${lecture.thumnailPath} " alt="Image" class="img-fluid" width="159.2" height="119.49">
                    </td>
                    <td>
                      <h6>${lecture.name }</h6>
                    </td>
                    <td>
                      <h6>${lecture.price }</h6>
                    </td>
                    <td><a href="#" style="padding: 6px !important;" onclick="deletePick('${lecture.num}')" class="btn btn-primary btn-sm">x</a></td>
                  </tr>
                 </c:forEach>
                 
                  
                </tbody>
              </table>
            </div>

        </div>

      </div>
 
    </div>
<%@ include file="footer.jsp"%>
  </body>
</html>