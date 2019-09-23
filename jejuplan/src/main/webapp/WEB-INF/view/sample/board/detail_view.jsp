<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>     
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="/js/common/file.js" ></script>
	<script type="text/javascript" src="/js/sample/board/detail_view.js"></script>
</head>
<body>
	<tag:modal/>
	
	<div class="col-md-12 grid-margin">
		<div class="card">
			<div class="card-body">
		  		<form id="ifrm" class="forms-sample" action="#" method="post" enctype="multipart/form-data">	  		
					<input type="hidden" id="board_no" name="board_no" value="${detail.board_no}"/>
					<div class="form-group">
		     			<label for="subject">Title</label>
		     			<input type="text" class="form-control" id="subject" name="subject" value="${detail.title}" placeholder="input subjsect." disabled>
					</div>
					<div class="form-group">
		       		<label for="writer">Writer</label>
						<input type="text" class="form-control" id="writer" name="writer" value="${detail.reg_user_nm}" placeholder="input writer." disabled>
		     		</div>
		      		<div class="form-group">
		 				<label for="content">Content</label>
		 				<input type="hidden" id="content" name="content" value="${detail.content}"> 
		 				<tag:viewer/>
					</div>
					<div class="file-upload-form">
	        			<label for="title">Attach File</label>
	        			<button type="button" class="btn btn-warning" id="fileBtn" data-toggle="modal" data-target="#file-upload-modal">File Upload</button>
	        			<div class="file-upload-div" id="file-upload-div">
	        				<div class="file-upload-not">File not found</div>
	        			</div>
	           		</div>
					<div class="form-group">
						<label for="reg_date">Reg_date</label>
						<input type="text" class="form-control" id="reg_date" name="reg_date" value="${detail.reg_date}" placeholder="input writer." disabled="disabled">
					</div>
		         
		      		<div class="template-demo">
						<button type="button" class="btn btn-danger" id="boardDelBtn">Delete</button>
						<button type="button" class="btn btn-warning" onclick="movePage('/sample/board/update/view/${detail.board_no}')">Update</button>
						<button type="button" class="btn btn-success" onclick="movePage('/sample/board/list/view')">Back</button>
		      		</div>
		   	</form>
		  	</div>
		</div>
	</div>
	   	
	<div class="card-body">
		<div style="padding:10px">
			<label for="content">comment</label>
			<form id="comment_frm" method="post">
				<div class="input-group">
	      		<input type="hidden" name="board_no" value="${detail.board_no}"/>
	      		<input type="hidden" name="menu_id" value="${detail.menu_id}"/>
	           	<input type="text" class="form-control" id="cm_content" name="content" placeholder="Input Comment">
	           	<span class="input-group-btn">
	             	<button class="btn btn-info" type="button" id="commentInsBtn">Write</button>
	           	</span>
	        	</div>
	    	</form>	
		</div>
	
		<div style="padding:10px">
			<div class="commentList"></div>
		</div>
	</div>
</body>
</html>
