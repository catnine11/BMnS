<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>재고</title>
</head>

<%@include file="header.jsp"%>

<style>
table {
	margin: 100px auto;
	text-align: center;
}
</style>
<body>



	<div class="container text-center">
		<h3>What We Do</h3>
		<br>
		<div class="row">
			<div class="col-sm-6">

				<div>목록</div>

				<div>
					<form>
						<table id="container">
							<tr id="stocklist">

								<td>재고목록</td>
								<td>도서명</td>
								<td>도서상태</td>
							</tr>
							<c:forEach var="a" items="${list}">
								<tr>
									<td><input class="number" type="hidden" name=num
										value="${a.stock_number}"></td>
													<td ><input type="hidden" name="booksDetail" value="${a.book_code}"></td>
									<td class="stockNum">${a.stock_number}</td>
									<td class="detailTD"><input type="hidden"
										class="booksDetail" name="booksDetail" value="${a.book_code}">
										${a.status_title}</td>
									<td>${a.status_code=='B'?"재고":""}</td>


									<td>
									<td><input class="book_seq" type="hidden"
										value="${a.book_seq}"></td>
								</tr>
							</c:forEach>
							<tr>
							</tr>
						</table>
					</form>
				</div>

			</div>




			<div class="col-sm-6">
				<form id="stockDel" action="./stocksDel.do" method="post">

				</form>
			</div>

		</div>
	</div>
	<br>


	<script type="text/javascript" src="./js/stock.js"></script>

</body>
<%@include file="footer.jsp"%>
</html>