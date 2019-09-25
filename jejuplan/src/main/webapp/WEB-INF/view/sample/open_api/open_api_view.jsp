<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>     
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="/js/sample/open_api/open_api_view.js"></script>
</head>
<body>
	<div class="col-md-12 grid-margin">
		<div class="card">
		   	<div class="card-body">
		   		<form id="ifrm" class="forms-sample" action="#" method="post" enctype="multipart/form-data">
					<div class="form-group">
		        		<label>URL / key </label>
	           			<div class="input-group col-xs-12">
	            			<input type="text" id="urlTxt" name="url" class="form-control file-upload-info" value="http://data.jeju.go.kr/rest/goodshop/getGoodShopList" placeholder="URL">
	            			<input type="text" id="keyTxt" name="key" class="form-control file-upload-info" value="6lX%2BrpRObauKte3cHRSgCj5zwRyuW%2BeYvbwhsQdvxVc4Bp1ieDXN2XG7YPhs50cZ9bzvvyEWQW8lIY4tQezI1A%3D%3D" placeholder="key">
	            			
	            			<span class="input-group-append">
	              				<button class="file-upload-browse btn btn-info" type="button" id="sendBtn" >SEND</button>
	            			</span>
	        			</div>
		        	</div>
		        	<div class="form-group">
		         		<label for="resultArea">Result</label>
		         		<textarea class="form-control" id="resultArea" rows="20"></textarea>
		       		</div>
				</form>
		   	</div>
		</div>
	</div>
</body>
</html>
