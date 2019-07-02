<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Main View</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="/lib/bootstrap/js/jquery.min.js"></script>
<script src="/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="/lib/bootstrap/js/popper.min.js"></script>

    <script type="text/javascript">
    
    $(function(){

    	jQuery("#popbutton").click(function(){

            jQuery('div.modal').modal();

        }) 

    })


    
    </script>



    
  </head>
  
  <body >
<button class="btn btn-default" id="popbutton">모달출력버튼</button><br/>

<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h4 class="modal-title">엑셀 다운로드 사유를 입력해주세요</h4>
      </div>

      <div class="modal-body">
      	<div class="form-group">
		    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
		  </div>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>

    </div>

  </div>

</div>


</body>
</html>
