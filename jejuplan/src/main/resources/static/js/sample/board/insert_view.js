$(document).ready(function() {
	
	$("#menu_id").val($("#p_menu_id").val());
			
	$('#backBtn').click(function (e) {
		moveBack();
	});
	
	$('#submitBtn').click(function (e) {
		var params = $("#ifrm").serialize();
		
		$.ajax({
			type:"post",
			url : "/sample/board/insert/proc",
			data:params,
		    dataType : "json",
		    async:false,
		    success : function(data){
		    	alert(data.message);

				if(data.result =='true'){
					moveBack();
				}
		    },
		    error :function(xhr, status, e){
		    	alert('ajax Failed')
	        }
		}); 
	});
});

function moveBack(){
	movePage('/sample/board/list/view');
}

