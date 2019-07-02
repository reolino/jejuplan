<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>     
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update View</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="grid-margin stretch-card">
	      	<div class="card">
	         	<div class="card-body">
	           		<h4 class="card-title">Update View</h4>
           			<form action="/board/update" method="post">
           				<input type="hidden" name="bno" value="${bno}"/>
				      	<div class="form-group">
				        		<label for="subject">subject</label>
				        		<input type="text" class="form-control" id="subject" name="subject" value="${detail.subject}">
				      	</div>
				      	<div class="form-group">
				        		<label for="content">content</label>
				        		<textarea class="form-control" id="content" name="content" rows="3">${detail.content}</textarea>
				      	</div>
				      	<button type="submit" class="btn btn-primary">save</button>
				    	</form>
	           	</div>
	      	</div>
	   	</div>
		</div>
	</div>
</body>
</html>
</layoutTag:layout>  