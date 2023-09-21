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
	<h2>
		<a href="./adminPage.do">관리자페이지</a>
	</h2>
	<%-- ${sessionScope.loginVo} --%>
	<!-- <hr> -->
	<%-- ${sessionScope.info } --%>
	<div style="background-color: #D9E5FF">
		<div>
			<a>아 귀찮다</a>
		</div>
		<div>
			<a href="./bookListUser.do">신착도서 안내</a> <a href="./bookListAdmin.do">관리자의
				도서관리</a>
		</div>
		<div>
			<a>아 귀찮다</a>
		</div>
		<div>
			<a>아 귀찮다</a>
		</div>
		<div>
			<a>아 귀찮다</a>
		</div>
		<div>
			<a>아 귀찮다</a>
		</div>
		<div>
			<a>아 귀찮다</a>
		</div>
		<div>
			<a>아 귀찮다</a>
		</div>
		<div>
			<a>아 귀찮다</a>
		</div>
		<div>
			<form>
				<select name="selectOpt">
					<option class="searchOption" value="TITLE">제목</option>
					<option class="searchOption" value="AUTHOR">저자</option>
					<option class="searchOption" value="ISBN">ISBN</option>
				</select> <input type="text" name="inputVal">
				<button type="button">검색</button>
			</form>
		</div>
		<div>
		<!-- 여기 user2 부분을로그인 했을때 로 바꿔줘야함  -->
			<a href="./oderListUser.do?user=2">유저주문 조회</a>
		</div>
		<div>
			<a>아 귀찮다</a>
		</div>
		<div>
			<a>아 귀찮다</a>
		</div>
		<div>
			<a>아 귀찮다</a>
		</div>
		<div>
			<a>아 귀찮다</a>
		</div>
		<div>
			<a>아 귀찮다</a>
		</div>
		<div>
			<a>아 귀찮다</a>
		</div>
		<div>
			<a>아 귀찮다</a>
		</div>
		<div>
			<a>아 귀찮다</a>
		</div>
		<div>
			<a>아 귀찮다</a>
		</div>
	</div>

	<div>
		<ul>
			<li>바로가기이미지랑 뭐넣을지 정해야함</li>
			<li>고민중</li>
			<li>고민중</li>
		</ul>
	</div>

	<script type="text/javascript" src="./js/search.js"></script>

</body>
<%@include file="footer.jsp"%>
</html>