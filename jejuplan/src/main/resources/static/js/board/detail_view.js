
$(document).ready(function() {
	var bno = $("#bno").val();
	
	$('#attachDownBtn').click(function(){ 
		window.location.href = "/board/fileDown/proc/"+bno;
	});
	
	$('[name=commentInsertBtn]').click(function(){ 
    	var params = $('#comment_frm').serialize(); 
    	commentInsert(params); 
	});
	
   commentList();
});
 
function commentList(){
	var bno = $("#bno").val();

    $.ajax({
        url : '/comment/list/proc',
        type : 'get',
        data : {'bno':bno},
        success : function(data){
            var str =''; 
            $.each(data, function(key, value){ 
            	str += '<div class="d-flex py-2 border-bottom">';
            	str += '	<img class="img-sm rounded-circle" src="/lib/boot/assets/images/faces/face3.jpg" alt="profile image">';
            	str += '	<div class="wrapper ml-2">';
            	str += '		<p class="mb-n1 font-weight-semibold">'+value.writer+'</p>';
            	str += '		<small id="commentContent_'+value.cno+'">'+value.content+'</small>';
            	str += '	</div>';
            	str += '	<small class="text-muted ml-auto" style="padding-right: 10px">'+value.reg_date+'</small>';
            	str += '	<div id="commentDiv_'+value.cno+'" class="template-demo">';
            	str += '		<button type="button" class="btn btn-icons btn-rounded btn-warning" onclick="commentUpdate('+value.cno+',\''+value.content+'\');">E</button>';
            	str += '		<button type="button" class="btn btn-icons btn-rounded btn-danger" onclick="commentDelete('+value.cno+');">D</button>';
            	str += '	</div>';
            	str += '</div>';
            });
            
            $(".commentList").html(str);
        }
    });
}

function commentInsert(params){
	$.ajax({
   	url : '/comment/insert/proc',
      type : 'post',
      data : params,
      success : function(data){
      	if(data == 1) {
         	commentList(); 
         	$('[name=content]').val('');
      	}
      }
   });
}

function commentUpdate(cno, content){
	var str ='';
	str = '<input type="text" class="form-control" name="content_'+cno+'" style="min-width:300px" value="'+content+'"/>';
    $('#commentContent_'+cno).html(str);
    
	str = '<button type="button" class="btn btn-icons btn-rounded btn-success" onclick="commentUpdateProc('+cno+');">S</button>';
    $('#commentDiv_'+cno).html(str);
}

function commentUpdateProc(cno){
    var content = $('[name=content_'+cno+']').val();
    
    $.ajax({
        url : '/comment/update/proc',
        type : 'post',
        data : {'content' : content, 'cno' : cno},
        success : function(data){
            if(data == 1) commentList(bno); 
        }
    });
}
 
function commentDelete(cno){
    $.ajax({
        url : '/comment/delete/proc/'+cno,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(bno); 
        }
    });
}
