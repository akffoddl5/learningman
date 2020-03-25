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
   Morris.Donut({
           element: 'gender_donut',
           data: [
              
              <c:forEach items="${qList}" var="vo">
               { value: (${vo.quecount*100/TQN}).toFixed(2), label: '${vo.type}' },
            
            </c:forEach>
              
              

           ],

           labelColor: 'black',
           colors: [
               '#5969ff',
               '#ff407b',
               'green',
               'orange',
               'red',
               'blue',

           ],
          formatter: function(x) { return x + "%" }
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
                                <h2 class="pageheader-title">Q&A 통계</h2>
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
                               <div class="card" style="width: 35%;">
                                   <div class="card-body">
                                       <div class="d-inline-block">
                                           <h5 class="text-muted">총 질문 수</h5>
                                           <h2 class="mb-0">${AskBoardNum }</h2>
                                       </div>
                                       <div class="float-right icon-circle-medium  icon-box-lg  bg-info-light mt-1">
                                           <i class="fa fa-user fa-fw fa-sm text-primary"></i>
                                       </div>
                                   </div>
                               </div>
                           </div>

                           <div class="col" style="margin-left: -20%;">
                               <div class="card" style="width: 35%;">
                                   <div class="card-body" >
                                       <div class="d-inline-block">
                                           <h5 class="text-muted">총 답변 수</h5>
                                           <h2 class="mb-0">${AnswerBoardNum }</h2>
                                       </div>
                                       <div class="float-right icon-circle-medium  icon-box-lg  bg-primary-light mt-1">
                                           <i class="fa fa-user fa-fw fa-sm text-primary"></i>
                                       </div>
                                   </div>
                               </div>
                           </div>
                           <div class="col" style="margin-left: -20%;">
                               <div class="card" style="width: 35%;">
                                   <div class="card-body" >
                                       <div class="d-inline-block">
                                           <h5 class="text-muted">답변율</h5>
                                           <h2 class="mb-0">${answerRate}%</h2>
                                       </div>
                                       <div class="float-right icon-circle-medium  icon-box-lg  bg-primary-light mt-1">
                                           <i class="fa fa-user fa-fw fa-sm text-primary"></i>
                                       </div>
                                   </div>
                               </div>
                           </div>

                         

                           
                   </div>
                   <!-- ============================================================== -->

               <div class="row" >
                    <!-- ============================================================== -->
                    <!-- basic table -->
                    <!-- ============================================================== -->
                   <div class="col" style="width: 50%;">
                           <div class="card">
                               <h5 class="card-header">카테고리별 질문/답변</h5>
                               <div class="card-body">
                                   <div class="table-responsive">
                                       <form method="post" action="memberDateChart.do">
                                          <table class="table table-striped table-bordered">
 
                                              <thead>
                                                  <tr>
                                                      <th style="width: 40%; text-align: center;">카테고리명</th>
                                                      <th style="width: 15%; text-align: center;">질문수</th>
                                          <th style="width: 15%; text-align: center;">답변수</th>

                                                  </tr>
                                               </thead>
                                               <tbody>
                                               <c:forEach items="${qList }" var="vo">
                                               <tr>
                                          <th scope="row">${vo.type }</th>
                                                      <td>${vo.quecount }</td>
                                                      <td>${vo.answercount }</td>
                                                  </tr>
                                               </c:forEach>
                                           
                                            </tbody>
                                               <tfoot>
                                               
                                            
                                                  <tr>
                                                      <th style="width: 40%; text-align: center;">합계</th>
                                                      <th style="width: 15%; text-align: center;">${TQN }회</th>
                                          <th style="width: 15%; text-align: center;">${TAN }회</th>

                                                  </tr>
                                               
                                               </tfoot>
                                               
                                               
                                           
                                        </table>
                                       </form>
                                   </div>
                               </div>
                           </div>
                         </div>
          
            			 <div class="col">
                               <div class="card" style="width: 50%; margin-left: -5%" >
                                   <h5 class="card-header">카테고리별 질문비율</h5>
                                   <div class="card-body">
                                       <div id="gender_donut" style="height: 230px;"></div>
                                   </div>
                               </div>
                           </div>
                          
                  </div>
                  <!-- ============================================================== -->
                    



   <!-- ============================================================== -->
      <!-- footer -->
      <!-- ============================================================== -->
 <%@include file ="../commonPage/adminFooter.jsp" %>