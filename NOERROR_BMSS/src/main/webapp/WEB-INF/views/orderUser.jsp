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

<title>회원 전체주문</title>
<style type="text/css">
td,th{
text-align: center;
}


</style>

</head>
<body>
${oderList[0]}
<div id="container">
<table class="table table-sm">
<thead>
<tr>
<th scope="col">주문번호</th>
<th scope="col">ID</th>
<!-- <th scope="col">재고번호</th> -->
<th scope="col">수량</th>
<th scope="col">가격</th>
<th scope="col">결제상태</th>
<!-- <th scope="col">주소</th> -->
<!-- <th scope="col">주문날짜</th> -->
</tr>
</thead>
<tbody>
<c:forEach var="o" items="${oderList}">
<tr>
<td>${o.order_seq}</td>
<td><a class="detailWindow" href="#" onclick="dtWindow(${o.user_id});return false;" >${o.user_id}</a></td>
<%-- <td class="stNum">${o.stock_number}</td> --%>
<td>${o.order_quantity}</td>
<td>${o.order_price}</td>
<c:choose>
<c:when test="${o.pay_status==1}">
<td>주문 대기</td>
</c:when>

<c:when test="${o.pay_status==2}">
<td>결제대기</td>
</c:when>
<c:when test="${o.pay_status==3}">
<td>결제완료</td>
</c:when>

<c:when test="${o.pay_status==4}">
<td>결제취소대기</td>
</c:when>
<c:when test="${o.pay_status==5}">
<td>결제취소</td>
</c:when>
</c:choose>
<%-- <td>${o.user_address}</td> --%>
<%-- <td>${o.order_date}</td> --%>
</tr>
</c:forEach>
</tbody>
</table>
</div>
<script type="text/javascript" src="./js/order.js"></script>
</body>
<%@include file="footer.jsp"%>
</html>