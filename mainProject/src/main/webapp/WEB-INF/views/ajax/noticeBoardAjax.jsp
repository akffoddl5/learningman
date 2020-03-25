<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="../fonts/icomoon/style.css">

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <link rel="stylesheet" href="../css/jquery-ui.css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
	

    <link rel="stylesheet" href="../css/aos.css">

    <link rel="stylesheet" href="../css/style.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
        <div id="noticeBoardAjax">
 <table class="table table-hover table-borderless table-sm text-center" style="width: 100%;" cellspacing="0">
                                    <thead style="font-size: 16px; border-bottom: 2px solid #dee2e6;">
                                        <tr>
   											<th scope="col" style=" width: 10px;">No.</th>
                                            <th scope="col">제목</th>
											<th scope="col" style=" width: 80px;">작성자</th>

                                        </tr>
                                    </thead>
                                   <tbody style="font-size: 14px;">
		<c:forEach items="${noticeBoardList}" var="noticeBoard">
          <tr style="cursor: hand;" onclick="location.href='getNoticeBoard.do?num=${noticeBoard.num}'">
            <th scope="row">${noticeBoard.rNum }</th>
            <td>${noticeBoard.title }</td>
            <td>${noticeBoard.writer} </td>
   		</c:forEach>
          </tr>
         
   
        </tbody>
                                </table>
                                   <hr/>
          <div class="row" data-aos="fade-up" >
              <div class="col-md-12 text-center" >
                <div class="site-block-27">
					<ul style="cursor: hand;">
					<c:if test="${currentBlock !=1 }">
					<li><a onclick="noticeAjax('${startBlock-1 }')"> 이전 </a></li>
					</c:if>
					<c:forEach var="i" step="1" begin="${startBlock}" end="${endBlock}">
					<c:if test="${i<= blockTotal }">
					<li><a onclick="noticeAjax('${i }')">${i }</a></li>
					</c:if>
					<!-- 
					<c:if test="${i== currentBlock }">
					</c:if>
					 -->
					</c:forEach>
					<c:if test="${currentBlock != blockNum }">
					<li><a onclick="noticeAjax('${endBlock+1 }')" > 다음 </a></li>
					</c:if>
					</ul>
					
				</div>
				</div>
				</div>
					

          </div>
  
</body>
</html>
