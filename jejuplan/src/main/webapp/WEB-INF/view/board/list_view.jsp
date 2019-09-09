<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>   

<!DOCTYPE html>
<html>
<head>
	<tag:grid_css/>
</head>
<body>
	<!-- search bar --> 
	<tag:searchbar/>
	
	<!-- grid area -->
	<div id="grid"></div>
	
	<!-- page area -->
	<div id="pagination" class="tui-pagination"></div>
	
	<!-- button area -->
    <div class="template-demo">
		<button class="btn btn-primary" onclick="movePage('/board/insert/view')">write</button>
	</div>
	
	<tag:grid_js/>
  	<script type="text/javascript" src="/js/board/list_view.js"></script>
</body>
  
</html>

