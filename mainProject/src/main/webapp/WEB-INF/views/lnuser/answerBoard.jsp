<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">
  <head>
    <title>다배워 ! LearningMan &mdash;</title>
<%@ include file="metaHeader.jsp" %>
  </head>
  <body>
  <%@ include file="header.jsp" %>
  <div class="site-wrap">

      <section class="reviews py-5" id="reviews">
    <div class="container">
    <form action="insertAskBoard.do" style="line-height: 1;">
               <input type="hidden" name="writer" value="tmpId">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body" style="height: 480px;">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="one-reivew">
                                <form action="insertAskBoard.do" style="line-height: 1;">
              						 <input type="hidden" name="writer" value="tmpId">
                                <div class="row">
                                    <div class="col-md-6">
                                        <small>${askBoardVO.regDate}</small>
                                    </div>
                                    <div class="col-md-3 text-right">
                                        <small><a href="#">${askBoardVO.type}</a></small>
                                    </div>
                                    <div class="col-md-3 text-right">
                                        <span>관리자 아이디</span>
                                    </div>

                                </div>
                                <div class="row text-success">
                                    <div class="col-md-12">
                                        <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                    </div>
                                </div>
                                <div class="row pt-2">
                               
                                    <div class="col-md-12">
                                     <hr/>
                                        <h6 style="font-weight: bold;">${askBoardVO.title }</h6>
                                        <hr/>
                                        <p>${askBoardVO.content  }</p>
                                    </div>
                                </div>
                                </form>
                                </div>
                            </div>
                        </div>          
                    </div>
                </div>
            </div>
        </div>
	<div class="row align-items-end">
   			 <div class="col">
 			   </div>
  				  <div class="col">
 				   </div>
  					  <div class="col">
   						 <button type="button" class="btn btn-primary" style="font-weight: bold; margin: 30px 0px 0px 150px;" onClick="window.location='serviceCenter.do'"><i class="fa fa-share-alt"></i>돌아가기</button>
    
 					   </div>
 					 </div>
 					 </form>
  				  </div>
</section>
</div>
    <%@ include file="footer.jsp"%>
  </body>
</html>