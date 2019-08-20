<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>   
<!DOCTYPE html>
<html>
<body>
<div class="table-responsive">
	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
   	<thead>
     		<tr>
         	<th>No</th>
           	<th>TITLE</th>
           	<th>Writer</th>
           	<th>Date</th>
         </tr>
      </thead>
      <tbody>
	   <c:forEach var="l" items="${list}">
     		<tr onclick="movePage('/board/detail/view/${l.board_no}')">
   			<td>${l.board_no}</td>
     			<td>${l.title}</td>
      		<td>${l.reg_user_nm}</td>
      		<td><fmt:formatDate value="${l.reg_date}" pattern="yyyy.MM.dd"/></td>
			</tr>
		</c:forEach>
      </tbody>
	</table>
</div>
						          
<div class="template-demo">
	<button class="btn btn-primary" onclick="movePage('/board/insert/view')">write</button>
</div>
</body>
</html>

