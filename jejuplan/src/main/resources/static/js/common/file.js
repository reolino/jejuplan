$(document).ready(function() {
	$("[name=menu_id]").val($("#p_menu_id").val());
});

function fileList(){
	var params = $("#ifrm").serialize();
	
	$.ajax({
		type:"post",
		url : "/file/list/proc",
		data:params,
	    dataType : "json",
	    async:false,
	    success : function(data){
			fileUiMake(data.list);
	    },
	    error :function(xhr, status, e){
	    	alert('ajax Failed')
        }
	}); 
}

function fileUiMake(list){
	var str = '';

	if(list.length >0 ){
		for(var i=0;i<list.length;i++){
			var data = list[i];
			str += '<div class="file-upload-field">';
			str += '	<span onclick="fileDown(\''+data.file_no+'\')">'+data.file_origin_nm+'</span>';
			str += '	<span class="file-upload-remove" onclick="fileDel(\''+data.file_no+'\')">';
			str += '		<i class="fa fa-times"></i>';
			str += '	</span>';
			str += '</div>';
		}
	}else{
		str = '<div class="file-upload-not">File not found</div>';
	}
	
	$("#file-upload-div").html(str)
}

function fileDown(file_no){
	window.location.href = "/file/down/proc/"+file_no;
}

function fileDel(file_no){
	var params = {file_no: file_no};
	
	$.ajax({
		type:"post",
		url : "/file/del/proc",
		data:params,
	    dataType : "json",
	    async:true,
	    success : function(data){
			alert(data.message);
			fileList();
	    },
	    error :function(xhr, status, e){
	    	alert('ajax Failed')
        }
	}); 
}