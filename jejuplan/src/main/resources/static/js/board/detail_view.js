
$(document).ready(function() {	
/*	$('#attachDownBtn').click(function(){ 
		window.location.href = "/board/fileDown/proc/"+bno;
	});*/
	
	
	$('#boardDelBtn').click(function(){ 
		boardDelete(); 
	});
	
	$('#commentInsBtn').click(function(){ 
    	commentInsert(); 
	});
	
	commentList();
});

function boardDelete(){
	var params = $("#board_frm").serialize();
	
	$.ajax({
		type:"post",
		url : "/board/delete/proc",
		data:params,
	    dataType : "json",
	    async:false,
	    success : function(data){
	    	alert(data.message);

			if(data.result =='true'){
				movePage('/board/list/view');
			}
	    },
	    error :function(xhr, status, e){
	    	alert('ajax Failed')
        }
	}); 
}


function commentList(){
	var params = $("#comment_frm").serialize();
	
    $.ajax({
		type:"post",
        url : '/comment/list/proc',
        data : params,
        success : function(data){
            var str =''; 
            
            $.each(data, function(key, value){ 
            	str += '<div class="d-flex py-2 border-bottom">';
            	str += '	<img class="img-sm rounded-circle" src="/lib/boot/assets/images/faces/face3.jpg" alt="profile image">';
            	str += '	<div class="wrapper ml-2">';
            	str += '		<p class="mb-n1 font-weight-semibold">'+value.reg_user_nm+'</p>';
            	str += '		<small id="commentContent_'+value.comment_no+'">'+value.content+'</small>';
            	str += '	</div>';
            	str += '	<small class="text-muted ml-auto" style="padding-right: 10px">'+value.reg_date+'</small>';
            	str += '	<div id="commentDiv_'+value.comment_no+'" class="template-demo">';
            	str += '		<button type="button" class="btn btn-icons btn-rounded btn-warning" onclick="commentUpdate('+value.comment_no+',\''+value.content+'\');">E</button>';
            	str += '		<button type="button" class="btn btn-icons btn-rounded btn-danger" onclick="commentDelete('+value.comment_no+');">D</button>';
            	str += '	</div>';
            	str += '</div>';
            });
            
            
            $(".commentList").html(str);
        }
    });
}

function commentInsert(){
	var params = $('#comment_frm').serialize(); 
	$.ajax({
   	url : '/comment/insert/proc',
      type : 'post',
      data : params,
      success : function(data){
      	if(data == 1) {
         	commentList(); 
         	$('#cm_content').val('');
      	}
      }
   });
}

function commentUpdate(comment_no, content){
	var str ='';
	str = '<input type="text" class="form-control" name="content_'+comment_no+'" style="min-width:300px" value="'+content+'"/>';
    $('#commentContent_'+comment_no).html(str);
    
	str = '<button type="button" class="btn btn-icons btn-rounded btn-success" onclick="commentUpdateProc('+comment_no+');">S</button>';
    $('#commentDiv_'+comment_no).html(str);
}

function commentUpdateProc(comment_no){
    var content = $('[name=content_'+comment_no+']').val();
    
    $.ajax({
        url : '/comment/update/proc',
        type : 'post',
        data : {'content' : content, 'comment_no' : comment_no},
        success : function(data){
            if(data == 1) commentList(); 
        }
    });
}
 
function commentDelete(comment_no){
    $.ajax({
        url : '/comment/delete/proc/'+comment_no,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(); 
        }
    });
}
