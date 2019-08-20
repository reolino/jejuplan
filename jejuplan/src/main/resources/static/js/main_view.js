$(document).ready(function(){
	
 	var p_menu_url = "/board/list/view";
  	var p_menu_nm = "Sample > CRUD Sample";
  	
	if($("#p_menu_url").val() != '') {
		p_menu_url = $("#p_menu_url").val();
	}

	if($("#p_menu_nm").val() != '') {
		p_menu_nm =$("#p_menu_nm").val();
	}
	
	$("#p_title").html(p_menu_nm);
	$('#contents_div').load(p_menu_url);
});
	
function moveMenu(url, title){					
	$("#p_title").html(title);
	$('#contents_div').load(url);
}

function movePage(url){					
	$('#contents_div').load(url);
}