<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>     
<layoutTag:layout>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert View</title>
</head>
<body>
 
<h2>Insert View</h2>
<div class="container">
    <form action="/board/insert" method="post" enctype="multipart/form-data">
   	  <input type="hidden" id="menuid" name="menuid" value="M0001">
      <div class="form-group">
        <label for="subject">subject</label>
        <input type="text" class="form-control" id="subject" name="subject" placeholder="input subjsect.">
      </div>
      <div class="form-group">
        <label for="writer">writer</label>
        <input type="text" class="form-control" id="writer" name="writer" placeholder="input writer.">
      </div>
      <div class="form-group">
        <label for=content">content</label>
        <textarea class="form-control" id="content" name="content" rows="3"></textarea>
      </div>
      
      <input type="file" name="files"> 
      
      <button type="submit" class="btn btn-primary">submit</button>
    </form>
</div>
</body>
</layoutTag:layout>  