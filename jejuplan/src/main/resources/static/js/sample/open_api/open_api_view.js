$(document).ready(function(){
	$("#sendBtn").click(function(){
		var urlTxt = $("#urlTxt").val();
		var keyTxt = $("#keyTxt").val();
				
		if(urlTxt == ''){
			alert('input URL');
			return;
		}
		
		if(keyTxt == ''){
			alert('input Key');
			return;
		}
		
		var params = $("#ifrm").serialize();
		
	   	$.ajax({
			type:"post",
			url : "/sample/open_api/proc",
			data:params,
	        dataType : "json",
		    async:false,
	        success : function(data){
	        	$("#resultArea").val(data.str);
	        },
           	error :function(){
           		alert('Ajax Failed')
           	}
	   	}); 
	});
});