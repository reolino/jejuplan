<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>     
<!DOCTYPE html>
<html>
<head>
<tag:header/>
<tag:boot_css/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert View</title>
<script>

$(document).ready(function() {
	$('#uploadBtn').click(function (e) {
		e.preventDefault();
		$('#files').click();
	});
});

function changeValue(obj){
	$('#fileNm').val(obj.value);
}

</script>
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
	                  	<h4 class="page-title">Insert View</h4>
	                	</div>
	              	</div>
	            </div>
	            <div class="row">
	            	<div class="col-md-12 grid-margin">
	               	<div class="card">
	                 		<div class="card-body">
	                    		<form class="forms-sample" action="/board/insert/proc" method="post" enctype="multipart/form-data">
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
			                        <input type="file" id="files" name="files" class="file-upload-default" onchange="changeValue(this)">
			                        <div class="input-group col-xs-12">
			                          <input id="fileNm" type="text" class="form-control file-upload-info" disabled placeholder="Upload File">
			                          <span class="input-group-append">
			                            <button id="uploadBtn" class="file-upload-browse btn btn-info" type="button" >Upload</button>
			                          </span>
			                        </div>
			                      </div>
			                      
			                   	<div class="template-demo">
											<button type="submit" class="btn btn-success mr-2">Submit</button>
			                    		<button class="btn btn-danger">Back</button>
			                    	</div>
			                 	</form>
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