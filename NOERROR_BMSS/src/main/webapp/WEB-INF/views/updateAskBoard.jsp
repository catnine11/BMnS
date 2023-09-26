<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판수정</title>
<link rel="stylesheet" href="./css/styles.css"> <!-- CKEditor sample 코드 css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<%@include file="header.jsp"%>
<body data-editor="ClassicEditor" data-collaboration="false" data-revision-history="false">
	<div id="container">
		<h2>게시글 수정</h2>
		<form action="./updateAskBoard.do" method="post" >
			<input type="hidden" id="ask_seq" name="ask_seq" value="${ask_seq}">
			<input type="text" id="ask_title" name="ask_title" value="${ask_title}">
			<textarea id="editor" name="ask_contents"></textarea>
		</form>
		<div class="btn"><input type="button" onclick="updateBoard()" value="수정하기"></div>
	</div>

<script type="text/javascript" src="./lib/ckeditor5-39.0.1/build/ckeditor.js"></script>
<script type="text/javascript" src="./js/script.js"></script>
</body>
<%@include file="footer.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		type:"post",
		url:"./getContent.do",
		data: {
		    ask_seq: $("#ask_seq").val(),
		    ask_title: $('#ask_title').val()
		},
		dataType:"text",
		success:function(data){
			editor.setData(data);
		},
		error:function(){
			alert("getContent.do 잘못된 요청입니다.");
		}
	});
});

function updateBoard(){
	const data = editor.getData();
	$("#editor").text(data);
	$("form").eq(0).submit();
}
</script>
</html>