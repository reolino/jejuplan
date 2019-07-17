<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detail View</title>
<tag:header/>
<tag:boot_css/>
<script type="text/javascript" src="/js/board/detail_view.js"></script>
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
	                  	<h4 class="page-title">Detail View</h4>
	                	</div>
	              	</div>
	            </div>
	            <div class="row">
	            	<div class="col-md-12 grid-margin">
	               	<div class="card">
	                 		<div class="card-body">
	                    		<form id="detail_frm" class="forms-sample" action="#" method="post" enctype="multipart/form-data">
	                    			<input type="hidden" id="bno" name="bno" value="${detail.bno}">
	                    		
			           				<div class="form-group">
			                    		<label for="subject">Subject</label>
			                    		<input type="text" class="form-control" id="subject" name="subject" value="${detail.subject}" placeholder="input subjsect." disabled>
					      			</div>
					      			<div class="form-group">
			                    		<label for="writer">Writer</label>
			    							<input type="text" class="form-control" id="writer" name="writer" value="${detail.writer}" placeholder="input writer." disabled>
				                  </div>
			                   	<div class="form-group">
							        		<label for=content">Content</label>
							        		<textarea class="form-control" id="content" name="content" rows="3" disabled="disabled">${detail.content}</textarea>
							    		</div>
									   <div class="form-group">
											<label for=attach_file">Attach File</label>
								        	<div class="input-group col-xs-12">
				                       	<input type="text" id="attach_file" name="attach_file" value="${files.fileOriName}" class="form-control file-upload-info" disabled placeholder="Upload Image">
				                        	<span class="input-group-append">
				                          		<button id="attachDownBtn" class="file-upload-browse btn btn-info" type="button">DownLoad</button>
				                        	</span>
				                   	</div>
									  	</div>
									   <div class="form-group">
									   	<label for=reg_date">Reg_date</label>
					      				<input type="text" class="form-control" id="reg_date" name="reg_date" value="${detail.reg_date}" placeholder="input writer." disabled="disabled">
									   </div>
			                      
			                   	<div class="template-demo">
											<button type="button" class="btn btn-danger" onclick="location.href='/board/delete/proc/${detail.bno}'">Delete</button>
	      								<button type="button" class="btn btn-warning" onclick="location.href='/board/update/view/${detail.bno}'">Update</button>
	      								<button type="button" class="btn btn-success" onclick="location.href='/board/list/view'">List</button>
			                    	</div>
			                 	</form>
	                  	</div>
	                	</div>
	              	</div>
	              	
	              	<div class="card-body">
		              	<div style="padding:10px">
			        			<label for="content">comment</label>
					        	<form id="comment_frm">
					         	<div class="input-group">
					               <input type="hidden" name="bno" value="${detail.bno}"/>
					               <input type="text" class="form-control" id="content" name="content" placeholder="Input Comment">
					               <span class="input-group-btn">
					                    <button class="btn btn-info" type="button" name="commentInsertBtn">Write</button>
					               </span>
					            </div>
					        </form>
			    			</div>
				    
							<div style="padding:10px">
								<div class="commentList"></div>
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
