<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>     
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="/js/admin/data_mng/open_api_view.js"></script>
</head>
<body>
	<form id="ifrm" class="forms-sample" action="#" method="post" enctype="multipart/form-data">
		<input type="hidden" id="api" name="api" value="">
		<input type="hidden" id="url" name="url" value="">
		<input type="hidden" id="key" name="key" value="">
		<input type="hidden" id="param" name="param" value="">
	</form>
	<h4 class="card-title"># Jeju Good Shop</h4>
  	<p class="card-description">Jeju Good Shop Api Call</p>
    <div class="template-demo">
   		<button id="goodShopListBtn" type="button" class="btn btn-primary btn-fw">Send</button>
    </div>
</body>
</html>
