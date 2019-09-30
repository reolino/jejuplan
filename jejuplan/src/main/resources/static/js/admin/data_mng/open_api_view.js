$(document).ready(function(){
	
	var api = '';
	var url = '';
	var key = '';
	var param = '';
	
	$("#goodShopListBtn").click(function(){
		api = 'getGoodShopList'
		url = 'http://data.jeju.go.kr/rest/goodshop/getGoodShopList';
		key = '6lX%2BrpRObauKte3cHRSgCj5zwRyuW%2BeYvbwhsQdvxVc4Bp1ieDXN2XG7YPhs50cZ9bzvvyEWQW8lIY4tQezI1A%3D%3D';
		param = 'pageSize=1000';
		
		$("#api").val(api);
		$("#url").val(url);
		$("#key").val(key);
		$("#param").val(param);
		
		callApi();
	});
	
	function callApi(){
		
		var params = $("#ifrm").serialize();

		$.ajax({
			type:"post",
			url : "/data_mng/open_api/proc",
			data:params,
	        dataType : "json",
		    async:false,
	        success : function(data){
	        	//$("#resultArea").val(data.str);
	        },
           	error :function(){
           		alert('Ajax Failed')
           	}
	   	}); 
	}
});