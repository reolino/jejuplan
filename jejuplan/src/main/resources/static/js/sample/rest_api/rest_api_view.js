$(document).ready(function(){
	$("#sendBtn").click(function(){
		var urlTxt = $("#urlTxt").val();
		
		if(urlTxt == ''){
			alert('input URL');
			return;
		}
		
	   	$.ajax({
	       	url : urlTxt,
	        dataType : "json",
	        success : function(data){
	        	var result = JSON.stringify(data);
	         	$("#resultArea").val(result);
	        },
           	error :function(){
           		alert('Ajax Failed')
           	}
	   	}); 
	});
});