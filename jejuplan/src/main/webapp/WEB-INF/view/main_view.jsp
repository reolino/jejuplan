<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>   
<!DOCTYPE html>
<html>
	<head>
	  	<meta charset="utf-8">
	   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	   <title>Jeju Plan</title>
	   <tag:header/>
	  	<tag:boot_css/>
	  	<script type="text/javascript" src="/js/main_view.js"></script>
  	</head>
	<body>
		<input type="hidden" id="p_menu_url" value="${first_menu.menu_url}"/>
		<input type="hidden" id="p_menu_nm" value="${first_menu.tree_menu}"/>
   	<div class="container-scroller">
      <tag:head_navbar/>
      <div class="container-fluid page-body-wrapper">
      	<nav class="sidebar sidebar-offcanvas" id="sidebar">
         	<ul class="nav">
            	<li class="nav-item nav-profile">
              		<a href="#" class="nav-link">
	                	<div class="profile-image">
	                  	<img class="img-xs rounded-circle" src="/sample/admin_template/assets/images/faces/face8.jpg" alt="profile image">
	                  	<div class="dot-indicator bg-success"></div>
	                	</div>
	                	<div class="text-wrapper">
	                  	<p class="profile-name">${member_id}</p>
	                  	<p class="designation">${member_auth_nm}</p>
	                	</div>
              		</a>
            	</li>
  					<tag:left_navbar/>
          	</ul>
        	</nav>
        
        	<div class="main-panel">
         	<div class="content-wrapper">
	         	<div class="row page-title-header">
	            	<div class="col-12">
	               	<div class="page-header">
	                  	<h4 class="page-title" id="p_title"></h4>
	                	</div>
	              	</div>
	            </div>
	            <div class="row">
	            	<div class="col-md-12 grid-margin">
	               	<div class="card">
	                 		<div class="card-body">
	                    		<div class="row" id="contents_div">	     
	                    		</div>
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

