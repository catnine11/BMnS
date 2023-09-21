<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="container">
<tr>

<td>주문번호</td>
<td>아이디</td>
<td>재고번호</td>
<td>수량</td>
<td>가격</td>
<td>결제상태</td>
<td>주소</td>
</tr>

<c:forEach var="d" items="${detail}">
<tr>
<td>${d.order_seq}</td>
<td>${d.user_id}</td>
<td>${d.stock_number}</td>
<td class="stNum">${d.stock_number}</td>
<td>${d.order_quantity}</td>
<td>${d.order_price}</td>
<td>주문완료</td>
<td>${d.user_address}</td>
<td>${d.order_date}</td>
</tr>

</c:forEach>

</table>

</body>
</html>