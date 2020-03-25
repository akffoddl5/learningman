<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
 <meta charset="utf-8">
</head>
<body>
                            <div id="askBoardAjax">
<table class="table text-center table-hover table-borderless table-sm" style="font-size: 16px; width: 100%;" cellspacing="0">
                                    <thead style="border-bottom: 2px solid #dee2e6;">
										<tr>
											<th scope="col">No.</th>
											<th >제목</th>
											<th >분류</th>
											<th >아이디</th>
											<th >작성일</th>
										</tr>
                                    </thead>
                                    <tbody style="font-size: 14px;">
      								    <c:forEach items="${askBoardList}" var="askBoard" varStatus="status">
      								    <c:if test="${askBoard.type != null }">
     								    <tr style="cursor: hand;" onclick="location.href='getAskBoard.do?num=${askBoard.num}'">
      								      <th class="text-left" scope="row">${askBoard.rNum }</th>
        								             <td>${askBoard.title }</td>
        								             <td>${askBoard.type }</td>
          								           <td>${askBoard.writer }</td>
         								            <td>${askBoard.regDate }</td>
         								         </tr>
          								        </c:if>
          								        <c:if test="${askBoard.type == null }">
        								          <tr style="cursor: hand; color:#7971ea;" onclick="location.href='getAnswerBoard.do?num=${askBoard.num}'">
          								            <th scope="row"><span class="icon-subdirectory_arrow_right"></span></th>
            								         <td colspan="2" class="text-left">${askBoard.title }</td>
            								         <td>${askBoard.writer }</td>
          								           <td>${askBoard.regDate }</td>
         								         </tr>
        								          </c:if>
         
        								          </c:forEach>
                                    </tbody>
                                </table>
                                   <hr/>
            <div class="row">
              <div class="col-md-12 text-center">
                                <div class="site-block-27" >
					<ul style="cursor: hand;">
					<c:if test="${currentBlock !=1 }">
					<li><a onclick="askAjax('${startBlock-1 }')"> 이전 </a></li>
					</c:if>
					<c:forEach var="i" step="1" begin="${startBlock}" end="${endBlock}">
					<c:if test="${i<= blockTotal }">
					<li><a onclick="askAjax('${i }')">${i }</a></li>
					</c:if>
					</c:forEach>
					<c:if test="${currentBlock != blockNum }">
					<li><a onclick="askAjax('${endBlock+1 }')" > 다음 </a></li>
					</c:if>
					</ul>
					</div>
                        </div>
                        </div>       
                                
                            </div>
  
</body>
</html>