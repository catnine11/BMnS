<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOERROR 책check 마이페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	table, tr, th, td{
		text-align: center;
	}
</style>
</head>
<%@include file="header.jsp" %>
<body>
${sessionScope.loginVo}
<br>
${sessionScope.loginVo.user_id}
<input type="hidden" name="${sessionScope.loginVo.user_id}">
<div class="container">
	<div>
		<div>
		<h2>현황</h2>
			<div>
				<h3>대출현황</h3>
				<p><a href="./myBorrowNow.do?user_id=${sessionScope.loginVo.user_id}">대출현황</a></p>
				<div id="myBorrowNow">${lists}
					<table>
						<tbody>
							<tr>
								<th>제목</th>
								<th>저자</th>
								<th>출판사</th>
								<th>장르</th>
								<th>대출일</th>
								<th>반납일</th>
								<th>연장</th>
							</tr>
							<c:forEach var="b" items="${lists}">
							<tr>
								<td>${b.author}</td>
<%-- 								<td>${b.}</td> --%>
<%-- 								<td>${b.}</td> --%>
<%-- 								<td>${b.}</td> --%>
<%-- 								<td>${b.}</td> --%>
<%-- 								<td>${b.}</td> --%>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div>
				<h3>예약현황</h3>
				<p><a href="./myReserve.do?user_id=${sessionScope.loginVo.user_id}">예약현황</a></p>
				<div id="myReserve.do">
				
				</div>
			</div>
		</div>
		<div>
		<h2>내역</h2>
			<div>
				<h3>대출내역</h3>
				<p><a href="./myBorrowHistory.do?user_id=${sessionScope.loginVo.user_id}">대출내역</a></p>
				<div id="myBorrowHistory">
				
				</div>
			</div>
			<div>
				<p><a href="">희망도서신청</a></p>
				<div id="">
				
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<%@include file="footer.jsp" %>
</html>