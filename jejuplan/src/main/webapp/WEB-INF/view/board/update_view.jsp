<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>     
<!DOCTYPE html>
<html>
<head>
<tag:header/>
<tag:boot_css/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update View</title>
<script>

$(document).ready(function() {
	$('#backBtn').click(function (e) {
		location.href = "board/detail/view/"+${bno};
	});
});

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
	                  	<h4 class="page-title">Update View</h4>
	                	</div>
	              	</div>
	            </div>
	            <div class="row">
	            	<div class="col-md-12 grid-margin">
	               	<div class="card">
	                 		<div class="card-body">
	                    		<form action="/board/update/proc" method="post">
			           				<input type="hidden" name="bno" value="${bno}"/>
							      	<div class="form-group">
							        		<label for="subject">subject</label>
							        		<input type="text" class="form-control" id="subject" name="subject" value="${detail.subject}">
							      	</div>
							      	<div class="form-group">
							        		<label for="content">content</label>
							        		<textarea class="form-control" id="content" name="content" rows="3">${detail.content}</textarea>
							      	</div>
							      	<div class="template-demo">
							      		<button type="submit" class="btn btn-primary">Save</button>
							      		<button id="backBtn" class="btn btn-danger">Back</button>
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
