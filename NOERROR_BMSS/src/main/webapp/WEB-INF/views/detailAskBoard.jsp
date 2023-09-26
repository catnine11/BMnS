<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판 상세보기</title>
<link rel="stylesheet" href="./css/ck-content.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<%@include file="header.jsp"%>
<body>
	<div id="container">
		<h1>글 상세보기</h1>
		<div id="content" class="ck-content">
			${boardVo}
			<input type="hidden" id="ask_seq" name="ask_seq" value="${ask_seq}">
			<input type="text" id="ask_title" name="ask_title" value="${ask_title}">
		<div class="btn"><input type="button" onclick="location.href='./updateForm.do?ask_seq=${ask_seq}&ask_title=${ask_title}'" value="수정하기"></div>			
		</div>
	</div>
</body>
<%@include file="footer.jsp"%>
</html>