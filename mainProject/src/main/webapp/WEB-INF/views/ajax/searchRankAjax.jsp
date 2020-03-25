<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul class="list-group list-group-flush">
         <li class="list-group-item" style="font-weight: bold;">인기 검색어</li>
	<c:forEach items="${rankList}" var="searchListVO" varStatus="status">
		<li class="list-group-item list-group-item-action">${status.count}. ${searchListVO.keyword }</li>
	</c:forEach>
</ul>