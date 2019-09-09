<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>     
<!DOCTYPE html>
<html>
<body>
<tag:modal/>
<div class="col-md-12 grid-margin">
	<div class="card">
   		<div class="card-body">
      		<form id="ifrm" class="forms-sample" action="#" method="post" enctype="multipart/form-data">
        		<input type="hidden" id="menu_id" name="menu_id" value="">
        		<input type="hidden" id="board_no" name="board_no" value="${board_no}">
          		<div class="form-group">
            		<label for="title">Title</label>
					<input type="text" class="form-control" id="title" name="title" placeholder="input title.">
           		</div>
         		<div class="form-group">
    				<label for="content">Content</label>
    				<tag:editor/>
				</div>
        		<div class="file-upload-form">
        			<label for="title">Attach File</label>
        			<button type="button" class="btn btn-warning" id="fileBtn" data-toggle="modal" data-target="#file-upload-modal">File Upload</button>
        			<div class="file-upload-div" id="file-upload-div">
        				<div class="file-upload-not">File not found</div>
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
<script type="text/javascript" src="/js/board/insert_view.js"></script>
</body>
</html>