<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>NOERROR 책check</title>
<style type="text/css">
body {
	text-align: center;
}
</style>
</head>
<%@include file="header.jsp"%>
<body>

<a id="payInfo2"></a>
<!-- 	<h2><a href="./adminPage.do">관리자페이지</a></h2> -->
<%-- ${sessionScope.loginVo} --%>
<!-- <hr> -->
<%-- ${sessionScope.info } --%>

	<div style="background-color: #D9E5FF">
		<div>
			<a> </a>
		</div>
		<div>

		</div>
		<div>
			<a href="./askBoardList.do">문의게시판</a>
		</div>
		<div>
			<a> </a>
		</div>
		<div>
			<a> </a>
		</div>
		<div>
			<a> </a>
		</div>
		<div>
			<a> </a>
		</div>
		<div>
			<a> </a>
		</div>
		<div>
			<a> </a>
		</div>
		<div>
			<form id="search">
				<select name="selectOpt">
					<option class="searchOption" value="TITLE">제목</option>
					<option class="searchOption" value="AUTHOR">저자</option>
					<option class="searchOption" value="ISBN">ISBN</option>
				</select> 
				<input id="booksearch"   type="text" name="inputVal">
				<button id="srcBtn" type="button">검색</button>
			</form>
		</div>
		<div>
		</div>
		<div>
			<a> </a>
		</div>
		<div>
			<a> </a>
		</div>
		<div>
			<a> </a>
		</div>
		<div>
			<a> </a>
		</div>
		<div>
			<a> </a>
		</div>
		<div>
			<a> </a>
		</div>
		<div>
			<a> </a>
		</div>
		<div>
			<a> </a>
		</div>
		<div>
			<a> </a>
		</div>
	</div>

	<div>
		<ul>
			<li>.</li>
			<li> </li>
			<li> </li>
		</ul>
	</div>
	<input id="enroll" type="text">
	<input id="enrollBtn" type="button" value="책등록" >
	<script type="text/javascript" src="./js/search.js"></script>
	
</body>

<%@include file="footer.jsp" %>
<script type="text/javascript">
console.log(localStorage.getItem('payInfo'));
</script>

</html>