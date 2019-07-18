<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>   
<!DOCTYPE html>
<tag:layout/>
<html>
<body>
<div id="template" style="display:none">
	<div class="table-responsive">
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	   	<thead>
	     		<tr>
	         	<th>No</th>
	           	<th>Subject</th>
	           	<th>Writer</th>
	           	<th>Date</th>
	         </tr>
	      </thead>
	      <tbody>
		   	<c:forEach var="l" items="${list}">
		      <tr onclick="location.href='/board/detail/view/${l.bno}'">
			   	<td>${l.bno}</td>
			     	<td>${l.subject}</td>
			      <td>${l.writer}</td>
			      <td><fmt:formatDate value="${l.reg_date}" pattern="yyyy.MM.dd"/></td>
				</tr>
				</c:forEach>
	      </tbody>
	    </table>
  	</div>
							          
	<div class="template-demo">
 		<button class="btn btn-primary" onclick="location.href='/board/insert/view'">write</button>
  	</div>
</div>
</body>
</html>

