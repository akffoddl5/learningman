<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file ="../commonPage/adminHeader.jsp" %>
<%@include file ="../commonPage/adminSideMenu.jsp" %>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<script>
$(function(){
	var option = {

			// datepicker 애니메이션 타입
			// option 종류 : "show" , "slideDown", "fadeIn", "blind", "bounce", "clip", "drop", "fold", "slide"
			showAnim : "slideDown",
			// 해당 월의 다른 월의 날짜가 보이는 여부, 예를 들면 10월이면 전후에 9월 마지막과 11월의 시작 일이 보이는 여부입니다. 즉, 달력이 꽉 차 보이게 하는 것
			showOtherMonths : true,
			// 선택 여부 (showOtherMonths 옵션과 같이 일치시키지 않으면 에러가 발생합니다.)
			selectOtherMonths : true,
			// 달력 밑에 오늘과 닫기 버튼이 보인다.
			showButtonPanel : true,
			// 년 월이 셀렉트 박스로 표현 되어서 선택할 수 있다.
			changeMonth : true,
			changeYear : true,
			// 한번에 보이는 개월 수
			numberOfMonths : 1,
			// 데이터 포멧
			dateFormat : "yymmdd",
			// 텍스트 박스 옆의 달력 포시
			showOn : "button",
			//이미지 타입인지 버튼 타입인지 설정
			buttonImageOnly : true,
			// 이미지 경로
			buttonImage : "https://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
			// 버튼 타입이면 버튼 값
			buttonText : "Select date",
			// alt 데이터 포멧
			altFormat : "DD, d MM, yy",
			// 선택 가능한 날짜(수 형식) - 현재 기준 -20일
			minDate : -30,
			// 선택 가능한 최대 날짜(문자 형식) - 현재 기준 +1월 +20일
			maxDate : "+20Y +1M +20D",
			// 주 표시
			showWeek : true
			};
		
	var optionFrom = option;
		optionFrom.altField = "#alternateFrom";
	var dateFormat = "mm/dd/yy";
		
	// 시작일이 선택이 되면 종료일은 시작일 보다 앞을 선택할 수 없다.
	var from = $("#from").datepicker(optionFrom).on("change", function() {
			to.datepicker("option", "minDate", getDate(this));
		});
		
	var optionTo = option;
		optionTo.altField = "#alternateTo";
		
	// 종료일이 선택이 되면 시작일은 시작일 보다 앞을 선택할 수 없다.
	var to = $("#to").datepicker(optionTo).on("change", function() {
			from.datepicker("option", "maxDate", getDate(this));
		});
		function getDate(element) {
			return moment(element.value).toDate();
		}
		
});
</script>
<script>
$(function(){
	Morris.Donut({
	        element: 'gender_donut',
	        data: [
	        	<c:forEach items="${voList}" var="vo">
	            { value: (${vo.lectureRate}).toFixed(2), label: '${vo.categoryName}' },
				
				</c:forEach>

	        ],

	        labelColor: 'black',
	        colors: [
	            '#5969ff',
	            '#ff407b',
	            'green',
	            'pink',
	            'yellow',
	            'orange',
	            'red',
	            'blue',
	            'purple'

	        ],
			 formatter: function(x) { return x + "%" }
	    });


	});
</script>
<script>
var barChartData = {                
		labels: [
			<c:forEach items="${voList}" var="vo">
			"${vo.categoryName}",
			
			</c:forEach>
			
			
		],  
		
		datasets: [{             
			label: '결제 건수',         
			yAxisID: 'A',
			backgroundColor: "#1E90FF",             
			data: [                
				<c:forEach items="${ccVO}" var="vo">
				${vo.count},
				
				</c:forEach>   
				]         
		}, 
		{            
			label: '합산 금액 (만원)',   
			yAxisID: 'B',
			backgroundColor: "#F7464A",            
			data: [                 
				<c:forEach items="${ccVO}" var="vo">
				${vo.sum/10000},
				
				</c:forEach>               
				]         
		}]     
		};  
		window.onload = function() {     
			var ctx = $('#chart').get(0).getContext("2d");     
			window.theChart = new Chart(ctx, {          
				type: 'bar',          
				data: barChartData,          
				options: {    
					scales: {
						yAxes: [{
				        	id: 'A',
				        	type: 'linear',
				        	position: 'left',
				        	scaleLabel:{
				        		display: true,
				        		labelString: '결제건수',
				        	},
				        	ticks:{
				        	 beginAtZero: true,
				        	 stepSize: 1,
				        	}
				      	}, 
				      	{
				      		display: true,
				        	id: 'B',
				        	type: 'linear',
				        	position: 'right',
				        	scaleLabel:{
				        		display: true,
				        		labelString: '합산금액(만)',
				        	},
				        	ticks:{
					        	 beginAtZero: true,
					        	 stepSize: 5,
					        	}

				      }]          
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
                                <h2 class="pageheader-title">카테고리별 통계</h2>
                            </div>
                        </div>
                    </div>
                </div>
                 <!-- ============================================================== -->

                 
                  <!-- ============================================================== -->
                  <!-- box  -->
                  <!-- ============================================================== -->
                  <div class="row">

	                        <div class="col" >
	                            <div class="card" style="width:30%;">
	                                <div class="card-body">
	                                    <div class="d-inline-block">
	                                        <h5 class="text-muted">총 카테고리 수</h5>
	                                        <h2 class="mb-0">${categoryNum }</h2>
	                                    </div>
	                                    <div class="float-right icon-circle-medium  icon-box-lg  bg-info-light mt-1">
	                                        <i class="fa fa-user fa-fw fa-sm text-primary"></i>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>

	                       
	                        
	             	</div>
	                <!-- ============================================================== -->
                  							
                  	<div class="row" style="justify-content: center;">
	                        <!-- ============================================================== -->
	                        <!-- donut    -->
	                        <!-- ============================================================== -->
	                        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12" style="margin-left: -75%;">
	                            <div class="card" style="width: 120%;">
	                                <h5 class="card-header">카테고리별 강의 수 비율</h5>
	                                <div class="card-body">
	                                    <div id="gender_donut" style="height: 230px;"></div>
	                                </div>
	                                <div class="card-footer p-0 bg-white d-flex">
	                                    <div class="card-footer-item card-footer-item-bordered w-50">
	                                        <h2 name="normal" class="mb-0" ></h2>
	                                        
	                                    </div>
	                                    <div class="card-footer-item card-footer-item-bordered">
	                                        <h2 name="teacher" class="mb-0"></h2>
	                                        
	                                    </div>
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
                            	<h5 class="card-header">카테고리별 별 매출</h5>
                            	<div class="card-body">
                                	<div class="table-responsive">
                                    	<form method="post" action="categoryChart.do">
                                    		<table class="table table-striped table-bordered">
                                    			<input type="text" readonly="readonly" name="startDate" id="from" value="${stDate }"> ~ <input type="text" name="endDate" id="to" value="${edDate }">
                                    			<input type="submit" readonly="readonly" style="font-size: 12px; height: 8%; width: 5%; padding-left: 0px; padding-right: 0px; margin-top: 0px; margin-left: 3%;" class="btn btn-primary btn-lg btn-block" value="검색"	>
                                    			
                                        		<thead>
                                            		<tr>
                                                		<th style="width: 15%; text-align: center;">카테고리 명</th>
														<th style="width: 15%; text-align: center;">총 결제 건수</th>
                                                		<th style="width: 15%; text-align: center;">총 결제 금액</th>
                                            		</tr>
                                         		</thead>
                                         		<tbody>
                                	

                                         			
                                         			<c:forEach items="${ccVO}" var="smallVO">
                                       				
                                         			<tr>
                                                		<td>${smallVO.categoryName }</td>
                                                		<td>${smallVO.count }</td>
                                                		<td>${smallVO.sum }</td>
                                            		</tr>
                                       				
                                       			</c:forEach>
                                           
                             					</tbody>
                                         		<tfoot>
                                         		
                                         	
                                         			<tr>
                                                		<th style="width: 40%; text-align: center;">합계</th>
														<th style="width: 15%; text-align: center;">${totalCount }회</th>
                                                		<th style="width: 15%; text-align: center;">${totalSum }원</th>
                                            		</tr>
                                            	
                                         		</tfoot>
                                         		
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