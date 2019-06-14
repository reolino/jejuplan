<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List_View</title>
</head>
<body>
<h2>List_View</h2>
<button class="btn btn-primary" onclick="location.href='/board/insert_view'">write</button>
 
<div class="container">
	<table class="table table-hover">
	    <tr>
	        <th>No</th>
	        <th>Subject</th>
	        <th>Writer</th>
	        <th>Date</th>
	    </tr>
      	<c:forEach var="l" items="${list}">
        <tr onclick="location.href='/board/detail/${l.bno}'">
            <td>${l.bno}</td>
            <td>${l.subject}</td>
            <td>${l.writer}</td>
            <td>${l.reg_date}</td>
        </tr>
    	</c:forEach>
	</table>
</div>
 
<%@ include file="../common/bootstrap.jsp" %>
</body>
</html>