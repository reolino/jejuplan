<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>     
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="/js/sample/rest_api/rest_api_view.js"></script>
</head>
<body>
	<div class="col-md-12 grid-margin">
		<div class="card">
		   	<div class="card-body">
		   		<form class="forms-sample" action="#" method="post" enctype="multipart/form-data">
					<div class="form-group">
		        		<label>URL</label>
	           			<div class="input-group col-xs-12">
	            			<input type="text" id="urlTxt" class="form-control file-upload-info" value="/sample/rest_api/list/proc" placeholder="send URL">
	            			<span class="input-group-append">
	              				<button class="file-upload-browse btn btn-info" type="button" id="sendBtn" >SEND URL</button>
	            			</span>
	        			</div>
		        	</div>
		        	<div class="form-group">
		         		<label for="exampleTextarea1">Result</label>
		         		<textarea class="form-control" id="resultArea" rows="20"></textarea>
		       		</div>
				</form>
		   	</div>
		</div>
	</div>
</body>
</html>
