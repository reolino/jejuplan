<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>   
<!DOCTYPE html>
<html>
<head>
  	<link rel="stylesheet" type="text/css" href="/lib/toast_ui/grid/tui-grid.min.css" />
  	<link rel="stylesheet" type="text/css" href="/lib/toast_ui/grid/tui-pagination.css" />
  	<style></style>
</head>
<body>
	<div id="grid"></div>
	
    <div class="template-demo">
		<button class="btn btn-primary" onclick="movePage('/board/insert/view')">write</button>
	</div>
</body>
  	<script type="text/javascript" src="/lib/toast_ui/grid/tui-code-snippet.js"></script>
	<script type="text/javascript" src="/lib/toast_ui/grid/tui-pagination.js"></script>
	<script type="text/javascript" src="/lib/toast_ui/grid/tui-grid.min.js"></script>
	<script type="text/javascript" src="/js/common/grid.js"></script>
  	<script type="text/javascript" src="/js/board/list_view.js"></script>
</html>

