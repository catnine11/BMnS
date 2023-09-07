<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>${name}</h3>
	
	<div>
		<form action="./main.do" method="post">
			이름 : <input type="text" name="name"><br>
			<input type="submit" value="값 전송">
		</form>
	</div>

</body>
</html>