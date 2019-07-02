<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>     
<layoutTag:layout>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert View</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="grid-margin stretch-card">
         	<div class="card">
            	<div class="card-body">
               	<h4 class="card-title">Board - Insert View</h4>
                 	<form class="forms-sample" action="/board/insert" method="post" enctype="multipart/form-data">
                 		<input type="hidden" id="menuid" name="menuid" value="M0001">
                 	
                   	<div class="form-group">
                      	<label for="subject">Subject</label>
      						<input type="text" class="form-control" id="subject" name="subject" placeholder="input subjsect.">
                    	</div>
                    	<div class="form-group">
                      		<label for="writer">Writer</label>
      						<input type="text" class="form-control" id="writer" name="writer" placeholder="input writer.">
                    	</div>
                    	<div class="form-group">
				        		<label for=content">content</label>
				        		<textarea class="form-control" id="content" name="content" rows="3"></textarea>
				    		</div>
			    			<div class="form-group">
                    		<label>File upload</label>
                    		<input type="file" name="files" class="file-upload-default">
                   	</div>
                   	
                    	<button type="submit" class="btn btn-success mr-2">Submit</button>
                    	<button class="btn btn-danger">Back</button>
                 	</form>
            	</div>
         	</div>
      	</div>
		</div>
	</div>
</body>
</layoutTag:layout>  