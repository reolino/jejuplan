<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update View</title>
</head>
<body>
<h2>Update View</h2>
 
<div class="container">
    <form action="/board/update" method="post">
      <div class="form-group">
        <label for="subject">subject</label>
        <input type="text" class="form-control" id="subject" name="subject" value="${detail.subject}">
      </div>
      <div class="form-group">
        <label for="content">content</label>
        <textarea class="form-control" id="content" name="content" rows="3">${detail.content}</textarea>
      </div>
      <input type="hidden" name="bno" value="${bno}"/>
      <button type="submit" class="btn btn-primary">수정</button>
    </form>
</div>
 
<%@ include file="../common/bootstrap.jsp" %>

</body>
</html>

