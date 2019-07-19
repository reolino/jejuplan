<%@ tag language="java" pageEncoding="UTF-8"%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<ul class="nav">
   	<li class="nav-item nav-profile">
      	<a href="#" class="nav-link">
	         <div class="profile-image">
	         	<img class="img-xs rounded-circle" src="/lib/boot/assets/images/faces/face8.jpg" alt="profile image">
	           	<div class="dot-indicator bg-success"></div>
	         </div>
	         <div class="text-wrapper">
	           	<p class="profile-name">kychoi83</p>
	           	<p class="designation">Administrator</p>
	         </div>
       	</a>
     	</li>
     	<li class="nav-item nav-category">Main Menu</li>
     	<li class="nav-item">
       	<a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
         	<i class="menu-icon typcn typcn-coffee"></i>
         	<span class="menu-title">CRUD Sample</span>
         	<i class="menu-arrow"></i>
       	</a>
       	<div class="collapse" id="ui-basic">
         	<ul class="nav flex-column sub-menu">
           		<li class="nav-item">
             		<a class="nav-link" href="/board/list/view">Jsp CRUD</a>
           		</li>
           		<li class="nav-item">
             		<a class="nav-link" href="/board/rest/view">Rest API</a>
           		</li>
         	</ul>
       	</div>
     	</li>
     	<li class="nav-item">
	  		<a class="nav-link" href="/sample/crypt/view">
         	<i class="menu-icon typcn typcn-shopping-bag"></i>
         	<span class="menu-title">Crypt Sample</span>
       	</a>
     	</li>
     	<li class="nav-item">
	  		<a class="nav-link" href="/sample/admin_template/demo/index.html">
         	<i class="menu-icon typcn typcn-shopping-bag"></i>
         	<span class="menu-title">Boot Sample</span>
       	</a>
     	</li>
	</ul>
</nav>