<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>     
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List_View</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="grid-margin stretch-card">
         	<div class="card">
            	<div class="card-body">
               	<h4 class="card-title">List View</h4>
	              	<div class="card mb-3">
							<div class="card-body">
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
					                	<tr onclick="location.href='/board/detail/${l.bno}'">
							           		<td>${l.bno}</td>
								           	<td>${l.subject}</td>
								           	<td>${l.writer}</td>
								           	<td><fmt:formatDate value="${l.reg_date}" pattern="yyyy.MM.dd"/></td>
					        				</tr>
					        			</c:forEach>
					              	</tbody>
					            </table>
					          </div>
					   	</div>
		      		</div>
		      			
		      		<button class="btn btn-primary" onclick="location.href='/board/insert_view'">write</button>
					</div>
         	</div>
      	</div>
   	</div>
	</div>
</body>
</html>
</layoutTag:layout>  