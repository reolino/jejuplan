<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>니뮤 블로그</title>
</head>

<body>
	<table border="1">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
		<tr>
			<td>${id}</td>
			<td>${subject}</td>
			<td>${content}</td>
			<td>${regDate}</td>
		</tr>
	</table>
</body>

</html>