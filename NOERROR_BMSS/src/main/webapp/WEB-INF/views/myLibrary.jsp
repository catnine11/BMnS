<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOERROR 책check 마이페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<%@include file="header.jsp" %>
<body>
${sessionScope.loginVo}
<br>
${sessionScope.loginVo.user_id}
<div class="container">
	<div>
		<div>
		<h2>현황</h2>
			<div>
				<p><a href="./myBorrowNow.do?user_id=${sessionScope.loginVo.user_id}">대출현황</a></p>
			</div>
			<div>
				<p><a href="./myReserve.do">예약현황</a></p>
			</div>
		</div>
		<div>
		<h2>내역</h2>
			<div>
				<p><a href="./myBorrowHistory.do">대출내역</a></p>
			</div>
			<div>
				<p><a href="">희망도서신청</a></p>
			</div>
		</div>
	</div>
</div>
</body>
<%@include file="footer.jsp" %>
</html>