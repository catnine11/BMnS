<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
<link rel="stylesheet" href="./css/styles.css"> <!-- CKEditor sample 코드 css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<%@include file="header.jsp"%>
<body data-editor="ClassicEditor" data-collaboration="false" data-revision-history="false">
	<div id="container">
		<h2>문의하기 글작성</h2>
		<form action="./write.do" method="post">
			<input  type="text" name="title" placeholder="제목">
			<textarea id="editor" name="content"></textarea> <!-- CKEditor가 생성되면서 hidden 처리됨, DB에 CKEditor data를 전송하기 위해 담는 그릇, id 및 name 필수 -->
		</form>
		<div class="btn"><input type="button" onclick="writeBoard()" value="글쓰기"></div>
		<div class="btn"><input type="button" onclick="location.href='./canclePay.do'" value="목록보기"></div>
	</div>
<script type="text/javascript" src="./lib/ckeditor5-39.0.1/build/ckeditor.js"></script> <!-- CKEditor 기본 js -->
<script type="text/javascript" src="./js/script.js"></script> <!-- CKEditor sample 코드, editor 생성 -->
</body>
<%@include file="footer.jsp"%>
<script type="text/javascript">
function writeBoard(){
	const data = editor.getData(); /* CKEditor data를 가져오는 함수 */
	$("#editor").text(data); /* textarea(hidden)에 data를 담아줌 */
	$("form").eq(0).submit(); /* form server에 전송 */
}
</script>
</html>