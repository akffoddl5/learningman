<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file ="../commonPage/adminHeader.jsp" %>


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
	        
	            { value: (((${memberCount}-${teacherMemberCount})/${memberCount})*100).toFixed(2), label: '일반회원'},
	            { value: ((${teacherMemberCount}/${memberCount})*100).toFixed(2), label: '강사회원'},
				
	        ],
	  
	        labelColor: 'black',
	        colors: [
	            '#5969ff',
	            '#ff407b',

	        ],
			 formatter: function(x) { return x + "%" }
	    });
	
	Morris.Donut({
        element: 'gend_donut',
        data: [
            { value: ((${siteMemberCount}/${memberCount})*100).toFixed(2), label: '일반회원' },
            { value: ((${kakaoMemberCount}/${memberCount})*100).toFixed(2), label: '카카오회원' },
            { value: ((${naverMemberCount}/${memberCount})*100).toFixed(2), label: '네이버회원' }

        ],

        labelColor: 'black',
        colors: [
            '#5969ff',
            'orange',
            'green'

        ],
		 formatter: function(x) { return x + "%" }
    });

	var normal = (((${memberCount}-${teacherMemberCount})/${memberCount})*100).toFixed(2);
	var teacher = ((${teacherMemberCount}/${memberCount})*100).toFixed(2);
	var elemTarget = document.getElementsByName('normal')[0];
	      elemTarget.innerText = normal +'%';
	var elemTarget = document.getElementsByName('teacher')[0];
	      elemTarget.innerText = teacher+ '%';
	      
	var site = ((${siteMemberCount}/${memberCount})*100).toFixed(2);
	var kakao =((${kakaoMemberCount}/${memberCount})*100).toFixed(2);
	var naver = ((${naverMemberCount}/${memberCount})*100).toFixed(2);
	var elemTarget = document.getElementsByName('site')[0];
	  	      elemTarget.innerText = site +'%';
	var elemTarget = document.getElementsByName('kakao')[0];
	  	      elemTarget.innerText = kakao+ '%';
	var elemTarget = document.getElementsByName('naver')[0];
	  	      elemTarget.innerText = naver+ '%';
	  	      

	});
</script>

<script>
$(function() {
	
	 var D = new Array();
	 D.push('x');
     <c:forEach items="${allCount}" var="d_list">
         var s = "${d_list.date}";
      
         D.push(s);
     </c:forEach>
     
      $("").autocomplete({
        source: D
      });
	
	var C = new Array();
	C.push('일반회원')
	<c:forEach items="${allCount}" var="d_list">
    	var s = "${d_list.normalCount}";

    	C.push(s);
	</c:forEach>

 	$("").autocomplete({
  	 source: C
 	});
 	
 	var B = new Array();
	B.push('카카오회원')
	<c:forEach items="${allCount}" var="d_list">
    	var s = "${d_list.kakaoCount}";
  
    	B.push(s);
	</c:forEach>

 	$("").autocomplete({
  	 source: B
 	});
 	
 	var A = new Array();
	A.push('네이버회원')
	<c:forEach items="${allCount}" var="d_list">
    	var s = "${d_list.kakaoCount}";
       
    	A.push(s);
	</c:forEach>

 	$("").autocomplete({
  	 source: A
 	});
		
		
        var chart = c3.generate({
            bindto: "#c3chart_area",
            data: {
            	x: 'x',
       
                columns: [
                	D,
                    C,
                    B,
                    A
                ]
                /*types: {
                    data1: 'area-spline',
                    data2: 'area',
                    date3: 'area'
                },
                colors: {
                    data1: '#5969ff',
                    data2: 'yellow',
					date3: 'green'
                }*/

            },
            axis: {

                y: {
                    show: true
				},
                x: {
                    
                    type : 'category'
             		
                }
            }

        });
   
});
</script>	

    <!-- ============================================================== -->
    <!-- main wrapper-->
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
                                <h2 class="pageheader-title">회원 통계</h2>
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
	                                        <h5 class="text-muted">총 가입회원수</h5>
	                                        <h2 class="mb-0">${memberCount}</h2>
	                                    </div>
	                                    <div class="float-right icon-circle-medium  icon-box-lg  bg-info-light mt-1">
	                                        <i class="fa fa-user fa-fw fa-sm text-primary"></i>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>

	                        <div class="col"style="padding: 0;">
	                            <div class="card">
	                                <div class="card-body" >
	                                    <div class="d-inline-block">
	                                        <h5 class="text-muted">총 강사회원수</h5>
	                                        <h2 class="mb-0">${teacherMemberCount}</h2>
	                                    </div>
	                                    <div class="float-right icon-circle-medium  icon-box-lg  bg-primary-light mt-1">
	                                        <i class="fa fa-user fa-fw fa-sm text-primary"></i>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>

	                        <div class="col" style="padding: 0;">
	                            <div class="card">
	                                <div class="card-body">
	                                    <div class="d-inline-block">
	                                        <h5 class="text-muted">일반가입회원수</h5>
	                                        <h2 class="mb-0">${siteMemberCount}</h2>
	                                    </div>
	                                    <div class="float-right icon-circle-medium  icon-box-lg  bg-secondary-light mt-1">
	                                        <i class="fa fa-user fa-fw fa-sm text-primary"></i>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>

	                        <div class="col" style="padding: 0;">
	                            <div class="card">
	                                <div class="card-body">
	                                    <div class="d-inline-block">
	                                        <h5 class="text-muted">카카오가입회원수</h5>
	                                        <h2 class="mb-0">${kakaoMemberCount}</h2>
	                                    </div>
	                                    <div class="float-right icon-circle-medium  icon-box-lg  bg-brand-light mt-1">
	                                        <i class="fa fa-user fa-fw fa-sm text-primary"></i>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col" style="padding: 0;">
	                            <div class="card">
	                                <div class="card-body">
	                                    <div class="d-inline-block">
	                                        <h5 class="text-muted">네이버가입회원수</h5>
	                                        <h2 class="mb-0">${naverMemberCount}</h2>
	                                    </div>
	                                    <div class="float-right icon-circle-medium  icon-box-lg  bg-brand-light mt-1">
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
	                        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12" style="margin-left: -15%;">
	                            <div class="card" style="width: 120%;">
	                                <h5 class="card-header">일반회원 강사회원 비율</h5>
	                                <div class="card-body">
	                                    <div id="gender_donut" style="height: 230px;"></div>
	                                </div>
	                                <div class="card-footer p-0 bg-white d-flex">
	                                    <div class="card-footer-item card-footer-item-bordered w-50">
	                                        <h2 name="normal" class="mb-0" ></h2>
	                                        <p>일반회원 </p>
	                                    </div>
	                                    <div class="card-footer-item card-footer-item-bordered">
	                                        <h2 name="teacher" class="mb-0"></h2>
	                                        <p>강사회원 </p>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12" style=" margin-left: 10%;">
	                        	<div class="card" style="width: 120%; ">
	                                <h5 class="card-header">회원가입경로비율</h5>
	                                <div class="card-body">
	                                    <div id="gend_donut" style="height: 230px;"></div>
	                                </div>
	                                <div class="card-footer p-0 bg-white d-flex">
	                                    <div class="card-footer-item card-footer-item-bordered w-50">
	                                        <h2 name="site" class="mb-0"></h2>
	                                        <p>일반 </p>
	                                    </div>
	                                    <div class="card-footer-item card-footer-item-bordered">
	                                        <h2 name="kakao" class="mb-0"></h2>
	                                        <p>카카오 </p>
	                                    </div>
	                                    <div class="card-footer-item card-footer-item-bordered">
	                                        <h2 name="naver" class="mb-0"></h2>
	                                        <p>네이버 </p>
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
                            	<h5 class="card-header">날짜별 가입회원 수</h5>
                            	<div class="card-body">
                                	<div class="table-responsive">
                                    	<form method="post" action="memberDateChart.do">
                                    		<table class="table table-striped table-bordered first">
                                    			<input type="text" readonly="readonly" name="startDate" id="from"> ~ <input type="text" name="endDate" id="to">
                                    			<input type="submit" readonly="readonly" style="font-size: 12px; height: 8%; width: 5%; padding-left: 0px; padding-right: 0px; margin-top: 0px; margin-left: 3%;" class="btn btn-primary btn-lg btn-block" value="검색">
                                    			
                                        		<thead>
                                            		<tr>
                                                		<th style="width: 40%; text-align: center;">날짜</th>
                                                		<th style="width: 15%; text-align: center;">일반회원</th>
														<th style="width: 15%; text-align: center;">카카오회원</th>
                                                		<th style="width: 15%; text-align: center;">네이버회원</th>
                                                		<th style="width: 15%; text-align: center;">날짜별소계</th>
                                            		</tr>
                                         		</thead>
                                         		<tbody>
                                         		<c:set var="total"/>
                                         		<c:set var="total1"/>
                                         		<c:set var="total2"/>
                                				<c:forEach items="${allCount}" var="allCount1">
												
													<tr>
														<th scope="row" style="text-align: center;">${allCount1.date}</th>
                                                		<td style="text-align: right;">${allCount1.normalCount}명</td>
                                                		<c:set var="total" value="${total+allCount1.normalCount}"/>
                                                		<td style="text-align: right;">${allCount1.kakaoCount}명</td>
                                                		<c:set var="total1" value="${total1+allCount1.kakaoCount}"/>
                                                		<td style="text-align: right;">${allCount1.naverCount}명</td>
                                                		<c:set var="total2" value="${total2+allCount1.naverCount}"/>
                                                		<td style="text-align: right;">${allCount1.normalCount+allCount1.kakaoCount+allCount1.naverCount}명</td>
                                            		</tr>
                                            		</c:forEach>
                                            	<c:out value=""/>
                                          		<c:out value=""/>
                                          		<c:out value=""/>
                             					</tbody>
                                         		<tfoot>
                                         	
                                         	
                                         			<tr>
                                                		<th style="width: 40%; text-align: center;">합계</th>
                                                		<th style="width: 15%; text-align: right;">${total}명</th>
														<th style="width: 15%; text-align: right;">${total1}명</th>
                                                		<th style="width: 15%; text-align: right;">${total2}명</th>
                                                		<th style="width: 15%; text-align: right;">${total+total1+total2}명</th>
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


                    



	<!-- ============================================================== -->
   	<!-- footer -->
   	<!-- ============================================================== -->
 <%@include file ="../commonPage/adminFooter.jsp" %>
 
