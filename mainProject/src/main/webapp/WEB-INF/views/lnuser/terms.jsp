<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">
                <div class="container-fluid dashboard-content ">
                    <!-- ============================================================== -->
                    <!-- pageheader  -->
                    <!-- ============================================================== -->
                    <div class="row">
                    </div>
                </div>
 
 <style>
<!--
textarea {
	width: 100%;
	height: 350px;
	font-size: 12px;
}
th {
	font-size: 20px;
}
-->
</style>
 			<div class="row">
   
                            <div class="card">
                               
                                <div class="card-body">
                                    <table class="table text-center"  style="width: 100%;">
                                        <tbody>
                                        <c:forEach items="${termsList }" var="termsVO">
                                        <tr>
                                        <th scope="row">${termsVO.termsname }</th>
                                        </tr>
                                        <tr>
                                        <td style="text-align: center;"><textarea class="text-center">${termsVO.termscontent}</textarea></td>
                                        </tr>
                                        </c:forEach>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>

              	</div>