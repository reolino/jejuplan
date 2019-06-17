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
<title>Detail View</title>
<script src="/lib/jquery/jquery-3.4.1.min.js"></script>

<script>
var bno = '${detail.bno}'; //게시글 번호

/* $('[name=commentInsertBtn]').click(function(){ 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
}); */

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
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
</script>

</head>
<body>
<h2>Detail View</h2>
 
<div class="container">
    <form action="#" method="post">
      <div class="form-group">
        <label>subject</label>
        <p>${detail.subject}</p>
      </div>
      <div class="form-group">
        <label>writer</label>
        <p>${detail.writer}</p>
      </div>
      <div class="form-group">
        <label>reg_date</label>
        <p>
        	<fmt:formatDate value="${detail.reg_date}" pattern="yyyy.MM.dd HH:mm:ss"/>
        </p>
      </div>
      <div class="form-group"> <!-- 첨부파일 다운로드 -->
        <label>attach_file</label>
        <p><a href="/board/fileDown/${files.bno}">${files.fileOriName}</a></p>
      </div>    
      
      <div class="form-group">
        <label>content</label>
        <p>${detail.content}</p>
      </div>
      <div class="btn-group btn-group-sm" role="group" style="float:right;">
      	<button type="button" class="btn btn-default" onclick="location.href='/board/delete/${detail.bno}'">delete</button>
      	<button type="button" class="btn btn-default" onclick="location.href='/board/update/${detail.bno}'">update</button>
      	<button type="button" class="btn btn-default" onclick="location.href='/board/list'">list</button>
      </div>
    </form>
    
    <div class="container">
        <label for="content">comment</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="bno" value="${detail.bno}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn" onclick="commentInsertEvent()">등록</button>
               </span>
              </div>
        </form>
    </div>
    
    <div class="container">
        <div class="commentList"></div>
    </div>

</div>
</body>
</html>
</layoutTag:layout>  
