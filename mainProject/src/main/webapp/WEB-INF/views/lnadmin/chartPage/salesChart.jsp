<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file ="../commonPage/adminHeader.jsp" %>
<%@include file ="../commonPage/adminSideMenu.jsp" %>


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
		
		
	var from = $("#from2").datepicker(optionFrom).on("change", function() {
			to.datepicker("option", "minDate", getDate(this));
		});
		
	var optionTo = option;
		optionTo.altField = "#alternateTo";
		
	// 종료일이 선택이 되면 시작일은 시작일 보다 앞을 선택할 수 없다.
	var to = $("#to2").datepicker(optionTo).on("change", function() {
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
	        	
	            { value: ${B}.toFixed(2) , label: '무결제회원' },
	            { value: ${A}.toFixed(2) , label: '유결제회원' },

	        ],

	        labelColor: 'black',
	        colors: [
	            '#5969ff',
	            '#ff407b',

	        ],
			 formatter: function(x) { return x + "%" }
	    });
});
</script>
<script>
	$(function(){	
	Morris.Donut({
        element: 'gend_donut1',
        data: [
        	<c:forEach items="${categorySales}" var="list">
            { value:${(list.sales/totalUsePoint)*100}.toFixed(2), label:'${list.name}'},
           
       
            </c:forEach>

        ],

        labelColor: 'black',
        colors: [
            '#5969ff','yellow','red','pink','green','orange','purple','blue','white','black'

        ],
		 formatter: function(x) { return x + "%" }
    });

});
</script>

<script>
$(function() {
	 var D = new Array();
	
     <c:forEach items="${salesList}" var="list">
         var s = "${list.date}";
      
         D.push(s);
     </c:forEach>
     
      $("").autocomplete({
        source: D
      });
      
      var C = new Array();
      C.push('결제횟수')
      <c:forEach items="${salesList}" var="list">
          var s = "${list.paycount}";
       
          C.push(s);
      </c:forEach>
      
       $("").autocomplete({
         source: C
       });
       var B = new Array();
       B.push('결제금액')
       <c:forEach items="${salesList}" var="list">
           var s = "${list.totalpay}";
        
           B.push(s);
       </c:forEach>
       
        $("").autocomplete({
          source: B
        });
	
		
		
 	var chart = c3.generate({
 		bindto: "#c3chart_area",
 		
 		data: {
 			
 		        columns: [
 		        	B,
 		        	C
 		  
 		        ],
 		        types: {
 		            '결제금액': 'bar',
 		            '결제횟수': 'line'
 		        },
 		        axes: {
 		          '결제금액': 'y',
 		          '결제횟수': 'y2'
 		        }
 		    },
 		    axis: {
 		        y:{
 		            label:'원'
 		            
 		        },
 		        y2: {
 		            show: true,
 		            label:'회'
 		         
 		           
 		        },
				
 		        x : {
 		            type : 'category',
 		           	categories: D
 		        },
 		        
 		    },

 		 
 		    color:{
 		        pattern: ['#10273c','#fec627']
 		    },
 		
 		});
   
});
</script>	
<script>
$(function() {
	var D = new Array();
	
    <c:forEach items="${sumSalesList}" var="list">
        var s = "${list.date}";
     
        D.push(s);
    </c:forEach>
    
     $("").autocomplete({
       source: D
     });
     
     var C = new Array();
     C.push('누적가입회원')
     <c:forEach items="${sumSalesList}" var="list">
         var s = "${list.sumMembers}";
      
         C.push(s);
     </c:forEach>
     
      $("").autocomplete({
        source: C
      });
      var B = new Array();
      B.push('누적결제금액')
      <c:forEach items="${sumSalesList}" var="list">
          var s = "${list.sumSales}";
       
          B.push(s);
      </c:forEach>
      
       $("").autocomplete({
         source: B
       });
	
		
		
	var chart = c3.generate({
		bindto: "#c3chart_mix",
		
		data: {
			
		        columns: [
		        	B,
		        	C
		  
		        ],
		        types: {
		            '누적결제금액': 'bar',
		            '누적가입회원': 'line'
		        },
		        axes: {
		          '누적가입회원': 'y',
		          '누적결제금액': 'y2'
		        }
		    },
		    axis: {
		        y:{
		            label:'명'
		            
		        },
		        y2: {
		            show: true,
		            label:'원'
		           
		        },
				
		        x : {
		            type : 'category',
		           	categories: D
		        },
		        
		    },

		 
		    color:{
		        pattern: ['#10273c','#fec627']
		    },
		
		});
  
});
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
                                <h2 class="pageheader-title">매출 통계</h2>
                               
                            </div>
                        </div>
                    </div>
                </div>
                 <!-- ============================================================== -->

                 
                  <!-- ============================================================== -->
                  <!-- box  -->
                  <!-- ============================================================== -->
 					<div class="row">

	                        <div class="col">
	                            <div class="card">
	                                <div class="card-body">
	                                    <div class="d-inline-block">
	                                        <h5 class="text-muted">총 매출(포인트구매)</h5>
	                                        <h2 class="mb-0">${totalPay }원</h2>
	                                    </div>
	                                    <div class="float-right icon-circle-medium  icon-box-lg  bg-info-light mt-1">
	                                        <i class="fa fa-user fa-fw fa-sm text-primary"></i>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col">
	                            <div class="card">
	                                <div class="card-body">
	                                    <div class="d-inline-block">
	                                        <h5 class="text-muted">총 포인트사용액</h5>
	                                        <h2 class="mb-0">${totalUsePoint }점</h2>
	                                    </div>
	                                    <div class="float-right icon-circle-medium  icon-box-lg  bg-info-light mt-1">
	                                        <i class="fa fa-user fa-fw fa-sm text-primary"></i>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
							<div class="col">
	                            <div class="card">
	                                <div class="card-body">
	                                    <div class="d-inline-block">
	                                        <h5 class="text-muted">총 잔여포인트액</h5>
	                                        <h2 class="mb-0">${restPoint}점</h2>
	                                    </div>
	                                    <div class="float-right icon-circle-medium  icon-box-lg  bg-info-light mt-1">
	                                        <i class="fa fa-user fa-fw fa-sm text-primary"></i>
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
                            	<h5 class="card-header">날짜별 매출금액/ 누적금액 및 누적회원가입수</h5>
                            	<div class="card-body">
                                	<div class="table-responsive">
                                    	<form method="post" action="salesDateChart.do">
                                    		<table class="table table-striped table-bordered first">
                                    			<input type="text" readonly="readonly" name="startDate" id="from"> ~ <input type="text" name="endDate" id="to">
                                    			<input type="submit" readonly="readonly" style="font-size: 12px; height: 8%; width: 5%; padding-left: 0px; padding-right: 0px; margin-top: 0px; margin-left: 3%;" class="btn btn-primary btn-lg btn-block" value="검색"	>
                                    			
                                        		<thead>
                                            		<tr>
                                                		<th style="width: 30%; text-align: center;">날짜</th>
                                                		<th style="width: 20%; text-align: center;">결제횟수</th>
														<th style="width: 30%; text-align: center;">결제총금액</th>

                                            		</tr>
                                         		</thead>
                                         		<tbody>
                                         		<c:set var="total" value=""/>
                                         		<c:set var="total2" value=""/>

                                				<c:forEach items="${salesList}" var="List">
												
													<tr>
														<th scope="row" style="text-align: center;">${List.date}</th>
                                                		<td style="text-align: right;">${List.paycount}회</td>
  														<c:set var="total2" value="${total2+List.paycount}"/>
                                                		<td style="text-align: right;">${List.totalpay}원</td>
                                                		<c:set var="total" value="${total+List.totalpay}"/>

                                            		</tr>
                                            		</c:forEach>
                                            	<c:out value=""/>
												<c:out value=""/>
                             					</tbody>
                                         		<tfoot>
                                         	
                                         	
                                         			<tr>
                                                		<th style="width: 30%; text-align: center;">합계</th>
                                                		<th style="width: 20%; text-align: right;">${total2}회</th>
                                                		<th style="width: 30%; text-align: right;">${total}원</th>

                                                		
                                            		</tr>
                                            	
                                         		</tfoot>
                                         		
                                         		<div class="card">
                                         			<div class="card-body">
                                         				<div class="table-responsive">
                                         					<table class="table table-striped table-bordered first">
                                								<div id="c3chart_area"></div>
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
				
				<div class="row" style="margin-left: 261px;">
                    <!-- ============================================================== -->
                    <!-- basic table -->
                    <!-- ============================================================== -->
 						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        	<div class="card">
                            	<h5 class="card-header">날짜별 누적매출금액/누적회원 수</h5>
                            	<div class="card-body">
                                	<div class="table-responsive">
                                    	<form method="post" action="salesSumChart.do">
                                    		<table class="table table-striped table-bordered">
    
                                         		
                                         		<div class="card">
                                         		
                                         				<div class="table-responsive">
                                         					<table class="table table-striped table-bordered">	
                                								<div id="c3chart_mix"></div>
                                							</table>
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


                    <div class="row" style="justify-content: center;">
	                        <!-- ============================================================== -->
	                        <!-- donut    -->
	                        <!-- ============================================================== -->
	                        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12" style="margin-left: 5%;">
	                            <div class="card" style="width: 120%;">
	                                <h5 class="card-header">결제한 회원 비율</h5>
	                                <div class="card-body">
	                                    <div id="gender_donut" style="height: 230px;"></div>
	                                </div>
	                                
	                            </div>
	                        </div>
	                        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12" style=" margin-left: 10%;">
	                        	<div class="card" style="width: 120%; ">
	                                <h5 class="card-header">카테고리별 결제금액비율</h5>
	                                <div class="card-body">
	                                    <div id="gend_donut1" style="height: 230px;"></div>
	                                </div>

	                            </div>
	                        </div>
	                       
						</div>
						</div>
						<!-- ============================================================== -->
						
						<div class="row" style="margin-left: 23%;">

	                        <div class="col">
	                            <div class="card" style=" width:80%;">
	                                <div class="card-body" >
	                                    <div class="d-inline-block">
	                                        <h5 class="text-muted">결제유저 중 1인 평균결제금액</h5>
	                                        <h2 class="mb-0">${C}원</h2>
	                                    </div>
	                                    <div class="float-right icon-circle-medium  icon-box-lg  bg-info-light mt-1">
	                                        <i class="fa fa-user fa-fw fa-sm text-primary"></i>
	                                    </div>
	                             	</div>
	                            </div>
	                        </div>
	                        <div class="col" style="margin-right: 10%;">
	                            <div class="card" style=" width:80%;">
	                                <div class="card-body">
	                                    <div class="d-inline-block">
	                                        <h5 class="text-muted">1회당 평균결제금액</h5>
	                                        <h2 class="mb-0">${D}</h2>
	                                    </div>
	                                    <div class="float-right icon-circle-medium  icon-box-lg  bg-info-light mt-1">
	                                        <i class="fa fa-user fa-fw fa-sm text-primary"></i>
	                                    </div>
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