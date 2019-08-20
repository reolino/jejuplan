$(document).ready(function() {
	$('#uploadBtn').click(function (e) {
		e.preventDefault();
		$('#files').click();
	});
	
	$('#backBtn').click(function (e) {
		moveBack();
	});
	
	
	
	$('#submitBtn').click(function (e) {
		var params = $("#ifrm").serialize();
		
		$.ajax({
			type:"post",
			url : "/board/insert/proc",
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
	movePage('/board/list/view');
}

function changeValue(obj){
	$('#fileNm').val(obj.value);
}