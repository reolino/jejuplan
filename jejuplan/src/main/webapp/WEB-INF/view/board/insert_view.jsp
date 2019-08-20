<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>     
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/board/insert_view.js"></script>
</head>
<body>
<div class="col-md-12 grid-margin">
	<div class="card">
   	<div class="card-body">
      	<form id="ifrm" class="forms-sample" action="#" method="post" enctype="multipart/form-data">
        		<input type="hidden" id="menu_id" name="menu_id" value="000000006">
          	<div class="form-group">
            	<label for="title">Title</label>
					<input type="text" class="form-control" id="title" name="title" placeholder="input title.">
           	</div>
         	<div class="form-group">
    				<label for="content">content</label>
    				<textarea class="form-control" id="content" name="content" rows="3"></textarea>
				</div>
        		<div class="form-group">
            	<label>File upload</label>
             	<input type="file" id="files" name="files" class="file-upload-default" onchange="changeValue(this)">
             	<div class="input-group col-xs-12">
               		<input id="fileNm" type="text" class="form-control file-upload-info" disabled placeholder="Upload File">
               		<span class="input-group-append">
                 		<button id="uploadBtn" class="file-upload-browse btn btn-info" type="button" >Upload</button>
               		</span>
             	</div>
           	</div>
        		<div class="template-demo">
					<button type="button" class="btn btn-success mr-2" id="submitBtn">Submit</button>
         		<button type="button" class="btn btn-danger" id="backBtn">Back</button>
         	</div>
      	</form>
   	</div>
	</div>
</div>
</body>
</html>