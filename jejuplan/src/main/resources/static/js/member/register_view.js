$(document).ready(function(){
		
	$("#regBtn").click(function(){
		var member_id = $("#member_id").val();
		var member_pw = $("#member_pw").val();
		var confirm_pw = $("#confirm_pw").val();
		
		if(member_id == ''){
			alert('Input ID');
			return;
		}else if(member_pw == ''){
			alert('Input Password');
			return;
		}else if(confirm_pw == ''){
			alert('Input Confirm Password');
			return;
		}
		else if(member_pw != confirm_pw){
			alert('Password do not match');
			return;
		}
		
		var params = $("#ifrm").serialize()+"&member_auth=admin";

		 $.ajax({
			type:"post",
			url : "/member/register/proc",
			data:params,
			dataType : "json",
			async:false,
			success : function(data){
				alert(data.message);
				
				if(data.result =='true'){
					goLoginView();
				} 
			},
			error :function(xhr, status, e){
				alert('ajax Failed')
			}
	  	}); 
	}); 
});
	
function goLoginView(){
	$("#ifrm").attr("action", "/login/view");
	$("#ifrm").submit();
}