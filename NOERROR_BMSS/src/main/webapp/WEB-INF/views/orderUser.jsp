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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div id="container">
<table class="table table-sm">
<thead>
<tr>
<th scope="col">주문번호</th>
<th scope="col">아이디</th>
<th scope="col">재고번호</th>
<th scope="col">수량</th>
<th scope="col">가격</th>
<th scope="col">결제상태</th>
<th scope="col">주소</th>
<th scope="col">주문날짜</th>
</tr>
</thead>
<tbody>
<c:forEach var="o" items="${oderList}">
<tr>
<td>${o.order_seq}</td>
<td><a class="detailWindow" href="#" onclick="dtWindow(${o.user_id});return false;" >${o.user_id}</a></td>
<td class="stNum">${o.stock_number}</td>
<td>${o.order_quantity}</td>
<td>${o.order_price}</td>
<td>주문완료</td>
<td>${o.user_address}</td>
<td>${o.order_date}</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
<script type="text/javascript" src="./js/order.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
<%@include file="footer.jsp"%>
</html>