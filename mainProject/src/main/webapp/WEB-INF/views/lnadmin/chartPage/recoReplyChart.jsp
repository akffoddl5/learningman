<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file ="../commonPage/adminHeader.jsp" %>
<%@include file ="../commonPage/adminSideMenu.jsp" %>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>


<script>
var barChartData = {                
		labels: [
			
			<c:forEach items="${voList}" var="vo">
           '${vo.lectureName}',
			
			</c:forEach>
			
		],         
		datasets: [{             
			label: '총 추천수',  

			backgroundColor: "#1E90FF",             
			data: [       
				<c:forEach items="${voList}" var="vo">
		           '${vo.likeCnt}',
					
					</c:forEach>
				          
				]         
		}, 
		{            
			label: '총 댓글수',      
	
			backgroundColor: "#F7464A",            
			data: [                 
				<c:forEach items="${voList}" var="vo">
		           '${vo.lessonReplyCnt + vo.lectureReplyCnt}',
					
					</c:forEach>          
				]         
		}]     
		};  
		window.onload = function() {     
			var ctx = $('#chart').get(0).getContext("2d");     
			window.theChart = new Chart(ctx, {          
				type: 'bar',          
				data: barChartData,          
				options: {    scales: {
					xAxes: [{
						ticks:{
							
							
						},

					}],
			      	yAxes: [{
			        	
			        	type: 'linear',
			        	position: 'left',
			        	ticks:{
			        	 beginAtZero: true,
			        	 stepSize: 1,
			        	}
			      	}],
			    }                  
					
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
                                <h2 class="pageheader-title">강의별 추천/댓글 통계</h2>
                            </div>
                        </div>
                    </div>
                </div>
                 <!-- ============================================================== -->

                 
                  
					<div class="row">
                    <!-- ============================================================== -->
                    <!-- basic table -->
                    <!-- ============================================================== -->
 						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        	<div class="card">
                            	<h5 class="card-header">강의별 추천/댓글 수 조회</h5>
                            	<div class="card-body">
                                	<div class="table-responsive">
                                	
                                    	<form method="post" action="recoReplyChart.do">
                                    		<table class="table table-striped table-bordered first">
                                    			
                                    			<select name="categoryName" id="cname" style="height: 30%; width: 15%;" >
                                    				<c:forEach items="${categoryVO}" var="categoryname">
                                    				<option value="${categoryname.name}">${categoryname.name}</option>
                                    				</c:forEach>
                                    			<input type="submit" style="font-size: 12px; height: 8%; width: 5%; padding-left: 0px; padding-right: 0px; margin-top: 0px; margin-left: 3%;" class="btn btn-primary btn-lg btn-block" value="검색">
                                    			
                                        		<thead>
                                            		<tr>
                                                		<th style="width: 15%; text-align: center;">강의명</th>
														<th style="width: 15%; text-align: center;">총 추천수</th>
                                                		<th style="width: 15%; text-align: center;">총 댓글수</th>
                                                		
                                            		</tr>
                                         		</thead>
                                         		<tbody>
                                	
												<c:forEach items="${voList}" var="vo">
                                       				
                                         			<tr>
                                                		<td>${vo.lectureName }</td>
                                                		<td>${vo.likeCnt }</td>
                                                		<td>${vo.lessonReplyCnt + vo.lectureReplyCnt }</td>
                                            		</tr>
                                       				
                                       			</c:forEach>
                                         			
                                         			
                                       
                                           
                             					</tbody>

                                         		
                                         		<div class="card">
                                         			<div class="card-body">
                                         				<div class="table-responsive">
                                         					<table class="table table-striped table-bordered first">
                                								<canvas id="chart"></canvas>
                                							</table>
                            							</div>
                            						</div>
                            					</div>
                            					
                            				</table>
                                 		</form>
                                	</div>
                            	</div>
                        	</div>
                   		</div>
					</div>
				
					<!-- ============================================================== -->		


                    



	<!-- ============================================================== -->
   	<!-- footer -->
   	<!-- ============================================================== -->
 <%@include file ="../commonPage/adminFooter.jsp" %>