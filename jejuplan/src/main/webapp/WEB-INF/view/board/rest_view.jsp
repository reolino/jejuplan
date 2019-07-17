<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>rest_View</title>
<tag:header/>
<tag:boot_css/>
<script type="text/javascript" src="/js/board/rest_view.js"></script>
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
	                  	<h4 class="page-title">Rest View</h4>
	                	</div>
	              	</div>
	            </div>
	            <div class="row">
	            	<div class="col-md-12 grid-margin">
	               	<div class="card">
	                 		<div class="card-body">
	                 			<form class="forms-sample" action="#" method="post" enctype="multipart/form-data">
	            					<div class="form-group">
	                     			<label>URL</label>
	                        		<div class="input-group col-xs-12">
	                          			<input type="text" id="urlTxt" class="form-control file-upload-info" value="/board/rest/list/proc" placeholder="send URL">
	                          			<span class="input-group-append">
	                            			<button class="file-upload-browse btn btn-info" type="button" id="sendBtn" >SEND URL</button>
	                          			</span>
	                     			</div>
	                     		</div>
	                     		<div class="form-group">
                        			<label for="exampleTextarea1">Result</label>
                        			<textarea class="form-control" id="resultArea" rows="20"></textarea>
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
