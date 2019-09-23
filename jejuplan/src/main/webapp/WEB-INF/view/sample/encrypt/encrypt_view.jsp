<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>     
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="/js/sample/encrypt/encrypt_view.js"></script>
</head>
<body>
	<div class="col-md-12 grid-margin">
	  	<div class="card">
	   		<div class="card-body">
	   			<form class="forms-sample" action="#" method="post" enctype="multipart/form-data">
					<div class="form-group">
	        			<label>Crypt</label>
	           			<div class="input-group col-xs-12">
	            			<input type="text" id="encryptTxt" class="form-control file-upload-info" value="" placeholder="input text">
	            			<span class="input-group-append">
	              				<button class="file-upload-browse btn btn-info" type="button" id="encryptBtn" >SEND</button>
	            			</span>
	        			</div>
	        		</div>
	        		<div class="form-group">
	            		<input type="text" id="encryptResult" class="form-control file-upload-info" value="" disabled="disabled">
	       			</div>
	       			<div class="form-group">
	        			<label>Decrypt</label>
	           			<div class="input-group col-xs-12">
	            			<input type="text" id="decryptTxt" class="form-control file-upload-info" value="" placeholder="input text">
	            			<span class="input-group-append">
	              				<button class="file-upload-browse btn btn-danger" type="button" id="decryptBtn" >SEND</button>
	            			</span>
	        			</div>
	        		</div>
	        		<div class="form-group">
	            		<input type="text" id="decryptResult" class="form-control file-upload-info" value="" disabled="disabled">
	       			</div>
				</form>
	   		</div>
		</div>
	</div>
</body>
</html>
