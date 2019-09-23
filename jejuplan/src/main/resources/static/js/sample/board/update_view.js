$(document).ready(function() {
	
	$('#saveBtn').click(function (e) {

		var params = $("#ifrm").serialize();
		
		$.ajax({
			type:"post",
			url : "/sample/board/update/proc",
			data:params,
		    dataType : "json",
		    async:false,
		    success : function(data){
		    	alert(data.message);

				if(data.result =='true'){
					movePage('/sample/board/detail/view/'+$('#board_no1').val());
				}
		    },
		    error :function(xhr, status, e){
		    	alert('ajax Failed')
	        }
		}); 
	});
	
	editor.setHtml($("#content").val());
	
	fileList();
});

