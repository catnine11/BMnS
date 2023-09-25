<%@page import="java.util.List"%>
<%@page import="com.gd.bmss.vo.OrderVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
List<OrderVo> odu = (List<OrderVo>) request.getAttribute("orderListUser");
%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.background-cover {
    background-size: cover;
    width: 100px; /* 원하는 너비 조절 */
    height: 100px; /* 원하는 높이 조절 */
}
</style>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>주문내역</title>
</head>
<body>
${orderListUser}
<form action="./delOrder.do" method="post">
<div id="container">
<table>
<tr>
<td><input type="checkbox" name="allCheck"></td>
<td>썸네일</td>
<td>도서명</td>
<td>저자</td>
<!-- <td>주소</td> -->
<td>수량</td>
<td>가격</td>
<td>결제상태<td>
</tr>
<c:forEach var="ordU" items="${orderListUser}">
<tr>
<td><input class="delBox" type="checkbox" name="delCheck" value="${ordU.stock_number}"></td>
<td class="background-cover" style="background-image: url('${ordU.thumbnail}');" data-alt="${ordU.status_title}"></td>
<td>${ordU.status_title}</td>
<td>${ordU.author}</td>
<td>${ordU.order_quantity}</td>
<td>${ordU.order_price}</td>	
<c:choose>
<c:when test="${ordU.pay_status==1}">
<td>주문 대기</td>
</c:when>

<c:when test="${ordU.pay_status==2}">
<td>결제대기</td>
</c:when>
<c:when test="${ordU.pay_status==3}">
<td>결제완료</td>
</c:when>

<c:when test="${ordU.pay_status==4}">
<td>결제취소대기</td>
</c:when>
<c:when test="${ordU.pay_status==5}">
<td>결제취소</td>
</c:when>

</c:choose>
</tr>
</c:forEach>
<tr>
<td><input id="delUBtn" type="button" value="삭제"></td>
<td><input type="button" id="payBtn" value="결제하기"></td>
</tr>
</table>
</div>
</form>

<%for(int i=0; i<odu.size();i++) {
		int price=	odu.get(i).getOrder_price();
		int quantity=	odu.get(i).getOrder_quantity();
		int totalCount=	price*quantity;
%>

<% }%>

<script type="text/javascript" src="./js/order.js"></script>


</body>
</html>