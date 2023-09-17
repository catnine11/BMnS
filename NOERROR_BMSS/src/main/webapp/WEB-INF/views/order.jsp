<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="header.jsp"%>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>Insert title here</title>
<style type="text/css">
table{
postion:relative;
margin:100px auto;
text-align: center;
}



</style>
</head>
<body>
<form action="./delOrder.do" method="post">
<div id="container">
<table>
<tr>
<td><input type="checkbox" name="allCheck"></td>
<td>아이디</td>
<td>주문번호</td>
<td>재고번호</td>
<td>수량</td>
<td>가격</td>
<td>결제상태</td>
<td>주소</td>
<td>주문날짜</td>
</tr>
<c:forEach var="o" items="${oderList}">
<tr>
<td><input type="checkbox" name="delCheck" value="${o.stock_number}"></td>
<td>${o.user_id}</td>
<td>${o.order_number}</td>
<td>${o.stock_number}</td>
<td>${o.order_quantity}</td>
<td>${o.order_price}</td>
<td>${o.pay_status}</td>
<td>${o.user_address}</td>
<td>${o.order_date}</td>
</tr>
</c:forEach>
<tr><td><input id="del" type="submit" value="삭제"></td></tr>
</table>
</div>
</form>
<script type="text/javascript" src="./js/order.js"></script>
</body>
<%@include file="footer.jsp"%>
</html>