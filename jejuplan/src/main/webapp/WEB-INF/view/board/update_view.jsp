<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>     
<!DOCTYPE html>
<tag:layout/>
<html>
<head>
<script type="text/javascript" src="/js/board/update_view.js"></script>
</head>
<body>
<div id="template" style="display: none">
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
</body>
</html>
