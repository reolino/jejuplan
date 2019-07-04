<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>     
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>rest_View</title>
<script type="text/javascript">
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
           	
				/* $.each(data,function(index, item){
					alert(item.bno);
            }); */
           	},
           	error :function(){
           		alert('Ajax Failed')
           	}
   	}); 
	});
});

</script>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="grid-margin stretch-card">
         	<div class="card">
            	<div class="card-body">
               	<h4 class="card-title">Rest View</h4>
	              	<div class="card mb-3">
							<div class="card-body">
						   	<div class="form-group">
	                     	<label>URL</label>
	                        <div class="input-group col-xs-12">
	                          <input type="text" id="urlTxt" class="form-control file-upload-info" value="/board/rest/list" placeholder="send URL">
	                          <span class="input-group-append">
	                            <button class="file-upload-browse btn btn-info" type="button" id="sendBtn" >SEND URL</button>
	                          </span>
	                     	</div>
	                     </div>
	                     <div class="form-group">
                        	<label for="exampleTextarea1">Result</label>
                        	<textarea class="form-control" id="resultArea" rows="20"></textarea>
                      	</div>
					   	</div>
		      		</div>
					</div>
         	</div>
      	</div>
   	</div>
	</div>
</body>
</html>
</layoutTag:layout>  