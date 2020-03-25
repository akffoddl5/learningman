<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul class="list-group list-group-flush">
	<c:if test="${searchedList.size() ==0 }">
	<li class="list-group-item list-group-item-action">검색 결과가 없습니다.</li>
	</c:if>
	<c:forEach items="${searchedList}" var="lectureVO" >
		<li class="list-group-item list-group-item-action" style="cursor: pointer;" onclick="searchClick('${lectureVO.num}','${keyword}')">${lectureVO.name }</li>
	</c:forEach>
</ul>