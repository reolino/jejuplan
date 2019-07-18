<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>404 Error</title>
<tag:header/>
<tag:boot_css/>
</head>
<body>
	<div class="container-scroller">
   	<div class="container-fluid page-body-wrapper full-page-wrapper">
      	<div class="content-wrapper d-flex align-items-center text-center error-page bg-primary">
         	<div class="row flex-grow">
            	<div class="col-lg-7 mx-auto text-white">
              		<div class="row align-items-center d-flex flex-row">
                		<div class="col-lg-6 text-lg-right pr-lg-4">
                  		<h1 class="display-1 mb-0">${code}</h1>
                		</div>
	                	<div class="col-lg-6 error-page-divider text-lg-left pl-lg-4">
	                  	<h2>SORRY!</h2>
	                  	<h3 class="font-weight-light">${msg}</h3>
	                  	<h3 class="font-weight-light">${timestamp}</h3>
	                	</div>
              		</div>
              		<div class="row mt-5">
               		<div class="col-12 text-center mt-xl-2">
                  		<a class="text-white font-weight-medium" href="/">Back to home</a>
                		</div>
              		</div>
              		<div class="row mt-5">
               		<div class="col-12 mt-xl-2">
                  		<p class="text-white font-weight-medium text-center">Copyright reolino &copy; 2019 All rights reserved.</p>
                		</div>
              		</div>
            	</div>
          	</div>
        	</div>
		</div>
	</div>
   <tag:boot_js/>
</body>
</html>