<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detail</title>
</head>
<body>
<h2>Detail View</h2>
 
<button class="btn btn-primary" onclick="location.href='/board/update/${detail.bno}'">update</button> 
<button class="btn btn-danger" onclick="location.href='/board/delete/${detail.bno}'">delete</button>  

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
        <p>${detail.reg_date}</p>
      </div>
      <div class="form-group">
        <label>content</label>
        <p>${detail.content}</p>
      </div>
    </form>
</div>

<%@ include file="../common/bootstrap.jsp" %>

</body>
</html>

