<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="metaHeader.jsp" %>
<html lang="en">
<body>

                      <div id="faqBoardAjax">
                                <table class="table text-center table-hover table-borderless table-sm" cellspacing="0">
                                    <thead style="font-size: 16px; border-bottom: 2px solid #dee2e6;">
                                        <tr>
                                            <th style=" width: 10px;" scope="col">No.</th>
                                            <th scope="col">내용</th>


                                        </tr>
                                    </thead>
                                    <tbody style="font-size: 14px;">
                                            <div id="faqBoardAjax"> 
        									  <c:forEach items="${faqBoardList}" var="faqBoard">
   												<tr style="cursor: hand;" onclick="location.href='getFaqBoard.do?num=${faqBoard.num}'">
          											  <td scope="row">${faqBoard.rNum }</td>
    											        <td>${faqBoard.title }</td>
     													    </tr>
       											  </c:forEach>
      										   </div>
                                    </tbody>
                                </table>
                                <hr/>
                <div class="row">
              <div class="col-md-12 text-center">
                <div class="site-block-27" >
					<ul style="cursor: hand;">
					<c:if test="${fcurrentBlock !=1 }">
					<li><a onclick="faqAjax('${fstartBlock-1 }')"> 이전 </a></li>
					</c:if>
					<c:forEach var="i" step="1" begin="${fstartBlock}" end="${fendBlock}">
					<c:if test="${i<= fblockTotal}">
					<li><a onclick="faqAjax('${i }')">${i }</a></li>
					</c:if>
					<!-- 
					<c:if test="${i== fcurrentBlock }">
					</c:if>
					 -->
					</c:forEach>
					
					<c:if test="${fcurrentBlock != fblockNum }">
					<li><a onclick="faqAjax('${fendBlock+1 }')" > 다음 </a></li>
					</c:if>
					</ul>
					
				</div>
				</div>
				</div>
				</div>

</body>
</html>
                              