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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>주문내역</title>
</head>

<%@include file="header.jsp"%>

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
<td class="background-cover" style="background-image: url('${ordU.thumbnail}');" data-alt="${ordU.thumbnail}"></td>
<td id="bookName" class="tit">${ordU.status_title}</td>
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
</tr>
</table>
</div>
</form>
<button id="payBtn" onclick="requestPay()">결제하기</button>
<%@include file="./footer.jsp" %>

<%		int totalPrice=0;
		int totalCount=0;
for(int i=0; i<odu.size();i++) {
		int price=	odu.get(i).getOrder_price();
		int quantity=	odu.get(i).getOrder_quantity();
		int bookPrice=	price*quantity;
		
		totalPrice += bookPrice; 
		totalCount+=quantity;
		
%>
<% }%>

<script type="text/javascript" src="./js/order.js">
</script>
<script type="text/javascript">

var totalPrice=<%=totalPrice%>
var totalCount=<%=totalCount%>


$(document).ready(function(){

$("#payBtn").click(function(){
	console.log(totalPrice);
	console.log(totalCount);
	var thumbNail=new Array();
	var stock_num=new Array();
	var title=new Array();

	$(".delBox:checked").each(function(){
var	thumb=	$(this).closest('tr').find('.background-cover').attr('data-alt');
var stNum=	$(this).val();
var tit = $(this).closest('tr').find('.tit').text();		
 	
	thumbNail.push(thumb);
	stock_num.push(stNum);
	title.push(tit);
		
	
	console.log(thumbNail)
	console.log(stock_num)
	console.log(title)
	
	
var email = '${loginVo.user_email}';
var name = '${loginVo.user_name}';
var address = '${loginVo.user_address}';
var phone = '${loginVo.user_phone}';
var merchant_uid = merchant_uid + 1;
var point = <%=totalPrice%>
var IMP = window.IMP;
IMP.init("imp46250334");
// function requestPay() {
    IMP.request_pay(
        {
            pg: "kakaopay", 
            pay_method: "kakaopay", 
            merchant_uid: merchant_uid,
            name: tit,
            amount: point,
            buyer_email: email,
            buyer_name: name,
            buyer_tel: phone,
            buyer_addr: address,
            buyer_postcode: '4868282',
        },
        function (rsp) {
            console.log(rsp);
            console.log(point);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid+"\n";
                msg += '거래ID : ' + rsp.merchant_uid+"\n";
                msg += '결제 금액 : ' + rsp.paid_amount+"\n";
                msg += '카드 승인번호 : ' + rsp.apply_num;
                alert(msg);
                var pay_method = rsp.pay_method;
                var amount = rsp.paid_amount;
                var imp_uid = rsp.imp_uid;
                $.ajax({
                    type: "POST",
                    url: "./payForm.do",
                    data: {
                        amount: amount,
                        pay_method: pay_method,
                        imp_uid:imp_uid
                    },
                    success: function(data) {
                        console.log('성공',data);
                        localStorage.setItem('payInfo',data);
                        location.href='./payInfo.do'; 
                    },
                    error: function(xhr, status, error) {
                        console.log('에러 :', status, error);
                    }
                });
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                console.log('결제실패');
                alert(msg);
            }
        }
    );
	})
// }
})
})




</script>
</body>
<%@include file="footer.jsp" %>
</html>