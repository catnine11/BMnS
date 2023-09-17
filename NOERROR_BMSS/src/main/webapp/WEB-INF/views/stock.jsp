<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<title>재고</title>
</head>

<%@include file="header.jsp"%>

<style>
table{

margin:100px auto;
text-align: center;
}


</style>
<body>

<div>
<form action="./stocksDel.do" method="post">
	<table id="container">
		<tr id="stocklist">
		<td><input type="checkbox" name="allChk"> </td>
			<td>재고목록</td>
			<td>도서명</td>
			<td>도서상태</td>
			<td>판매 가능여부</td>
			<td>관리번호</td>
			<td>도서 가격</td>
		</tr>
		<c:forEach var="a" items="${list}">
			<tr>
			<td><input type="checkbox" name="delChk" value="${a.stock_number}"></td>
				<td><input id=number type="hidden" name=num
					value="${a.stock_number}">
				</td>
				<td class="stockNum">${a.stock_number}</td>
				<td>${a.status_title}</td>
				<td><select class="cbs" name="status_code">
						<option value="A" ${a.status_code=='A' ? 'selected' : ''}>일반</option>
						<option value="B" ${a.status_code=='B' ? 'selected' : ''}>재고</option>
						<option value="C" ${a.status_code=='C' ? 'selected' : ''}>분실</option>
						<option value="D" ${a.status_code=='D' ? 'selected' : ''}>예정</option>
				</select></td>

				<td><select class="ss" name="sellStatus">
						<option value="N" ${a.sell_status == 'N' ? 'selected' : ''}>판매불가</option>
						<option value="Y" ${a.sell_status == 'Y' ? 'selected' : ''}>판매가능</option>
				</select></td>
				<td><input id="price" type="number" 
				name="price"
					value="${a.book_price}" ></td>
			</tr>
		</c:forEach>
		<tr><td><input type="submit" value="삭제"> </td></tr>
	</table>
	</form>
	</div>
	
<script type="text/javascript" src="./js/stock.js" ></script>
	
</body>
<%@include file="footer.jsp"%>
</html>