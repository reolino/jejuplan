<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>   
<!DOCTYPE html>
<tag:header/>
<tag:boot_css/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List_View</title>
</head>
<body>
	<div class="container-scroller">
   	<tag:head_navbar/>
      <div class="container-fluid page-body-wrapper">
      	<tag:left_navbar/>
        	<div class="main-panel">
         	<div class="content-wrapper">
	            <div class="row page-title-header">
	            	<div class="col-12">
	               	<div class="page-header">
	                  	<h4 class="page-title">List View</h4>
	                	</div>
	              	</div>
	            </div>
	            <div class="row">
	            	<div class="col-md-12 grid-margin">
	               	<div class="card">
	                 		<div class="card-body">
	                    		<div class="row">
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
	                  	</div>
	                	</div>
	              	</div>
	            </div>
	         </div>
	         <tag:footer/>
    		</div>
		</div>
	</div>
	<tag:boot_js/>
</body>
</html>

