$(document).ready(function(){
	
	$("#loginBtn").click(function(){
		var member_id = $("#member_id").val();
		var member_pw = $("#member_pw").val();
		
		if(member_id == ''){
			alert('Input ID');
			return;
		}else if(member_pw == ''){
			alert('Input Password');
			return;
		}
		
		var params = $("#ifrm").serialize();
	
		$.ajax({
			type:"post",
			url : "/member/login/proc",
			data:params,
		    dataType : "json",
		    async:false,
		    success : function(data){
				if(data.result =='true'){
					goMainView();
				}else{
					alert(data.message);
				} 
		    },
		    error :function(xhr, status, e){
		    	alert('ajax Failed')
	        }
		}); 
	}); 
});
	
function goMainView(){
	$("#ifrm").attr("action", "/board/list/view");
	$("#ifrm").submit();
}