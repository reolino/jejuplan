<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>     
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/common/file.js" ></script>
<script type="text/javascript" src="/js/board/update_view.js"></script>
</head>
<body>
<tag:modal/>
<div class="col-md-12 grid-margin">
  	<div class="card">
     	<div class="card-body">
        	<form id="ifrm" action="#" method="post">
  				<input type="hidden" id="board_no" name="board_no" value="${detail.board_no}"/>
			  	<div class="form-group">
			   		<label for="subject">title</label>
			    	<input type="text" class="form-control" id="title" name="title" value="${detail.title}">
			  	</div>
			  	<div class="form-group">
			   		<label for="content">content</label>
			   		<input type="hidden" id="content" name="content" value="${detail.content}"/>
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
			  		<button type="button" class="btn btn-primary" id="saveBtn">Save</button>
			  		<button type="button" class="btn btn-danger" onclick="movePage('/board/detail/view/${detail.board_no}')">Back</button>
			  	</div>
			</form>
       	</div>
     </div>
</div>
</body>
</html>
