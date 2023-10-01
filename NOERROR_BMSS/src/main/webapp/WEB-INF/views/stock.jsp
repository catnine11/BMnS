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



	<div class="container text-center" class="table table-bordered">
		<div class="row">
			<div class="col-sm-6">

				<h1>재고</h1>

				<div>
					<form>
						<table id="container" class="table table-bordered">
						<thead>
							<tr id="stocklist">
								<th>도서명</th>
							</tr>
							</thead>
							<tbody>
							<c:forEach var="a" items="${list}">
								<tr>
									<td class="detailTD"><input type="hidden"class="booksDetail" name="booksDetail" value="${a.book_code}">
										${a.status_title}</td>
									<td>
									<td><input type="hidden" class="statCode" value="${status_code}"></td>
								</tr>
							</c:forEach>
							</tbody>
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