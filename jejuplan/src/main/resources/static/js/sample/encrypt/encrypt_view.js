$(document).ready(function(){
	$("#encryptBtn").click(function(){
		var encryptTxt = $("#encryptTxt").val();
		
		if(encryptTxt == ''){
			alert('input Text');
			return;
		}
		
	   	$.ajax({
	      	url : '/sample/encrypt/proc',
	      	data : {p_txt : encryptTxt},
        	dataType : "json",
        	success : function(data){
        		if(data.result =="true"){
        			$("#encryptResult").val(data.encrypt_txt);
        		}else{
        			alert(data.message);
        		}
        	},
     		error :function(){
     			alert('Ajax Failed');
     		} 
	   	}); 
	});
	
	$("#decryptBtn").click(function(){
		var decryptTxt = $("#decryptTxt").val();
		
		if(decryptTxt == ''){
			alert('input Text');
			return;
		}
		
	   	$.ajax({
	      	url : '/sample/decrypt/proc',
	      	data : {p_txt : decryptTxt},
        	dataType : "json",
        	success : function(data){
        		if(data.result =="true"){
        			$("#decryptResult").val(data.decrypt_txt);
        			
        		}else{
        			alert(data.message);
        		}
        	},
     		error :function(){
     			alert('Ajax Failed');
     		} 
	   	}); 
	});
});