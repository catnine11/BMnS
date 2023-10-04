<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 주문 상세</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">

td,th{
text-align: center;
}
</style>
</head>
<body>
<div id="container">
<table class="table">
<thead>
<tr>
<th>주문번호</th>
<th>ID</th>
<th>이름</th>
<th>재고번호</th>
<th>관리번호</th>
<th>수량</th>
<th>가격</th>
<th>결제상태</th>
<th>주소</th>
</tr>
</thead>
<c:forEach var="d" items="${detail}">
<tr>
<td>${d.order_seq}</td>
<td>${d.user_id}</td>
<td>${d.user_name}</td>
<td class="stNum">${d.stock_number}</td>
<td class="stNum">${d.book_seq}</td>
<td>${d.order_quantity}</td>
<td>${d.order_price}</td>
<c:choose>
<c:when test="${d.pay_status==1}">
<td>주문 대기</td>
</c:when>

<c:when test="${d.pay_status==2}">
<td>결제대기</td>
</c:when>
<c:when test="${d.pay_status==3}">
<td>결제완료</td>
</c:when>

<c:when test="${d.pay_status==4}">
<td>결제취소대기</td>
</c:when>
<c:when test="${d.pay_status==5}">
<td>결제취소</td>
</c:when>
</c:choose>
<td>${d.user_address}</td>
<td>${d.order_date}</td>
</tr>

</c:forEach>

</table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>