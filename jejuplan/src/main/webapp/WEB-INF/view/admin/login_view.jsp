<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>login</title>
<tag:header/>
<tag:boot_css/>
<script type="text/javascript" src="/js/admin/login_view.js"></script>
</head>
<body>
<div class="container-scroller">
	<div class="container-fluid page-body-wrapper full-page-wrapper">
    	<div class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
         	<div class="row w-100">
            	<div class="col-lg-4 mx-auto">
              		<div class="auto-form-wrapper">
                		<form id="ifrm" action="#">
	                  		<div class="form-group">
	                    			<label class="label">ID</label>
		                    		<div class="input-group">
			                     	<input id="member_id" name="member_id" type="text" class="form-control" placeholder="Username">
			                      		<div class="input-group-append">
			                        		<span class="input-group-text">
			                          			<i class="mdi mdi-check-circle-outline"></i>
			                        		</span>
			                      		</div>
	                    			</div>
	                  		</div>
		                  	<div class="form-group">
			               		<label class="label">Password</label>
			                		<div class="input-group">
			                    		<input id="member_pw" name="member_pw" type="password" class="form-control" placeholder="*********">
		                      		<div class="input-group-append">
		                        		<span class="input-group-text">
		                          			<i class="mdi mdi-check-circle-outline"></i>
		                        		</span>
		                      		</div>
			                    </div>
		                  	</div>
		                  	<div class="form-group">
		                  		<button class="btn btn-primary submit-btn btn-block" id="loginBtn">Login</button>
		                  	</div>
			               	<div class="form-group d-flex justify-content-between">
			                  	<div class="form-check form-check-flat mt-0">
			                    	<label class="form-check-label">
			                        <input type="checkbox" class="form-check-input" checked> Keep me signed in </label>
			                   	</div>
			                    <a href="#" class="text-small forgot-password text-black">Forgot Password</a>
			               	</div>
		                  	<div class="text-block text-center my-3">
		                  		<span class="text-small font-weight-semibold">Not a member ?</span>
		                    	<a href="/member/register/view" class="text-black text-small">Create new account</a>
		               		</div>
                		</form>
              		</div>
	              	<ul class="auth-footer"></ul>
              		<p class="footer-text text-center">copyright © 2019 reolino. All rights reserved.</p>
            	</div>
          	</div>
        </div>
	</div>
</div>
<tag:boot_js/>
</body>
</html>
