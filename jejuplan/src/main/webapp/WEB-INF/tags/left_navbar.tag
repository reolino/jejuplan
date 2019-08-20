<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
$(document).ready(function() {

	var main_menu_list = ${main_menu_list};
	var menu_str = "";

	for(var i=0; i< main_menu_list.length;i++){
		menu_str += makeMainMenu(main_menu_list[i]);
	} 

	$("#left_navbar").html(menu_str);

	var sub_menu_list = ${sub_menu_list};
	for(var i=0; i< sub_menu_list.length;i++){
		makeSubMenu(sub_menu_list[i]);
	} 
});

function makeMainMenu(obj){
	var objStr = "";
	var p_menu_url = obj.menu_url;
	var p_parent_menu_id = obj.parent_menu_id;
	var p_menu_nm = obj.menu_nm;
	var p_tree_menu = obj.tree_menu;
	var p_lv_cnt = obj.lv_cnt;
	
	objStr +='<li class="nav-item">';
	
	if(p_lv_cnt == '1'){
		objStr +='<a class="nav-link" onclick="moveMenu(\''+p_menu_url+'\', \''+p_tree_menu+'\')">';
		objStr +='	<i class="menu-icon typcn typcn-document-text"></i>';
		objStr +='	<span class="menu-title">'+p_menu_nm+'</span>';
		objStr +='</a>';
	}else{
		objStr += '<a class="nav-link" data-toggle="collapse" href="#ul_'+p_parent_menu_id+'" aria-expanded="false" aria-controls="ul_'+p_parent_menu_id+'">';
		objStr += '	<i class="menu-icon typcn typcn-coffee"></i>';
		objStr += '	<span class="menu-title">'+ p_menu_nm+'</span>';
		objStr += '	<i class="menu-arrow"></i>';
		objStr += '</a>';
		objStr += '<div class="collapse" id="ul_'+p_parent_menu_id+'">';
		objStr += '	<ul class="nav flex-column sub-menu" id="ul_'+p_parent_menu_id+'">';
		objStr += '	</ul>';
		objStr += '</div>';
	}

	objStr +='</li>';

	return objStr;
}

function  makeSubMenu(obj){
	var objStr = "";
	var p_menu_lv = obj.menu_lv;
	var p_menu_url = obj.menu_url;
	var p_parent_menu_id = obj.parent_menu_id;
	var p_menu_nm = obj.menu_nm;
	var p_tree_menu = obj.tree_menu;
	
	objStr += ' 	<li class="nav-item">';
	objStr += '			<a class="nav-link"  onclick="moveMenu(\''+p_menu_url+'\', \''+p_tree_menu+'\')">'+p_menu_nm+'</a>';
	objStr += '  	</li>';
	
	$("#ul_"+p_parent_menu_id).append(objStr);
}
</script>
<li class="nav-item nav-category">Main Menu</li>
<div id="left_navbar"></div>
