<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul class="list-group list-group-flush">
         <li class="list-group-item" style="font-weight: bold;">최근 검색 기록<a style="float: right; cursor: pointer;" onclick="deleteHistory()">지우기</a></li>
	<c:forEach items="${historyList}" var="searchListVO" >
		<li class="list-group-item list-group-item-action" style="cursor: pointer;" onclick="historyClick('${searchListVO.keyword}');">${searchListVO.keyword }</li>
	</c:forEach>
</ul>