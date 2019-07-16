<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags"%>     
<!DOCTYPE html>
<html>
<head>
<tag:header/>
<tag:boot_css/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detail View</title>
<script>
var bno = '${detail.bno}'; //게시글 번호

$(document).ready(function() {
	$('#attachDownBtn').click(function(){ 
		window.location.href = "/board/fileDown/proc/"+${files.bno};
	});
	
	$('[name=commentInsertBtn]').click(function(){ 
    	var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    	commentInsert(insertData); //Insert 함수호출(아래)
	});
	
   commentList(); //페이지 로딩시 댓글 목록 출력 
});

function commentInsertEvent(){
	var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
	commentInsert(insertData); //Insert 함수호출(아래)
}
 
//댓글 목록 
function commentList(){
    $.ajax({
        url : '/comment/list',
        type : 'get',
        data : {'bno':bno},
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.cno+'">'+'댓글번호 : '+value.cno+' / 작성자 : '+value.writer;
                a += '<a onclick="commentUpdate('+value.cno+',\''+value.content+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '+value.content +'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
	$.ajax({
   	url : '/comment/insert',
      type : 'post',
      data : insertData,
      success : function(data){
      	if(data == 1) {
         	commentList(); //댓글 작성 후 댓글 목록 reload
          	$('[name=content]').val('');
      	}
      }
   });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(cno, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+cno).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(cno){
    var updateContent = $('[name=content_'+cno+']').val();
    
    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'content' : updateContent, 'cno' : cno},
        success : function(data){
            if(data == 1) commentList(bno); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(cno){
    $.ajax({
        url : '/comment/delete/'+cno,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(bno); //댓글 삭제후 목록 출력 
        }
    });
}
 
</script>
</head>
<body>
	<div class="container-scroller">
   	<tag:head_navbar/>
      <div class="container-fluid page-body-wrapper">
      	<tag:left_navbar/>
        	<div class="main-panel">
         	<div class="content-wrapper">
	            <div class="row page-title-header">
	            	<div class="col-12">
	               	<div class="page-header">
	                  	<h4 class="page-title">Detail View</h4>
	                	</div>
	              	</div>
	            </div>
	            <div class="row">
	            	<div class="col-md-12 grid-margin">
	               	<div class="card">
	                 		<div class="card-body">
	                    		<form class="forms-sample" action="#" method="post" enctype="multipart/form-data">
			           				<div class="form-group">
			                    		<label for="subject">Subject</label>
			                    		<input type="text" class="form-control" id="subject" name="subject" value="${detail.subject}" placeholder="input subjsect." disabled>
					      			</div>
					      			<div class="form-group">
			                    		<label for="writer">Writer</label>
			    							<input type="text" class="form-control" id="writer" name="writer" value="${detail.writer}" placeholder="input writer." disabled>
				                  </div>
			                   	<div class="form-group">
							        		<label for=content">Content</label>
							        		<textarea class="form-control" id="content" name="content" rows="3" disabled="disabled">${detail.content}</textarea>
							    		</div>
									   <div class="form-group">
											<label for=attach_file">Attach File</label>
								        	<div class="input-group col-xs-12">
				                       	<input type="text" id="attach_file" name="attach_file" value="${files.fileOriName}" class="form-control file-upload-info" disabled placeholder="Upload Image">
				                        	<span class="input-group-append">
				                          		<button id="attachDownBtn" class="file-upload-browse btn btn-info" type="button">DownLoad</button>
				                        	</span>
				                   	</div>
									  	</div>
									   <div class="form-group">
									   	<label for=reg_date">Reg_date</label>
					      				<input type="text" class="form-control" id="reg_date" name="reg_date" value="${detail.reg_date}" placeholder="input writer." disabled="disabled">
									   </div>
			                      
			                   	<div class="template-demo">
											<button type="button" class="btn btn-danger" onclick="location.href='/board/delete/proc/${detail.bno}'">Delete</button>
	      								<button type="button" class="btn btn-normal" onclick="location.href='/board/update/view/${detail.bno}'">Update</button>
	      								<button type="button" class="btn btn-info" onclick="location.href='/board/list/view'">List</button>
			                    	</div>
			                 	</form>
	                  	</div>
	                	</div>
	              	</div>
	              	
	              	<div class="card-body">
		              	<div style="padding:10px">
			        			<label for="content">comment</label>
					        	<form name="commentInsertForm">
					         	<div class="input-group">
					               <input type="hidden" name="bno" value="${detail.bno}"/>
					               <input type="text" class="form-control" id="content" name="content" placeholder="Input Comment">
					               <span class="input-group-btn">
					                    <button class="btn btn-info" type="button" name="commentInsertBtn">Write</button>
					               </span>
					            </div>
					        </form>
			    			</div>
				    
							<div style="padding:10px">
								<div class="commentList"></div>
							</div>
						</div>
	            </div>
	         </div>
	         <tag:footer/>
    		</div>
		</div>
	</div>
	<tag:boot_js/>
</body>
</html>
