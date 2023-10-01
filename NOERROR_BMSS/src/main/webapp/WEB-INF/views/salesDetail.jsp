<%@page import="com.gd.bmss.vo.BookInfoVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%  List<BookInfoVo> list =(List<BookInfoVo>)request.getAttribute("salesDetail");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<style type="text/css">
#container{
margin:20px 0px 0px 200px;
border:2px solid black;
height:420px;
width:450px;
}
strong{
margin:10px 35px auto;
}

.background-cover {
	float:left;
    background-size: cover;
    width: 200px; /* 원하는 너비 조절 */
    height: 300px; /* 원하는 높이 조절 */
    
}
.auth,.publ,.date,.isbn,.bPrice{
margin-left:180px;
margin-bottom: 20px;

}

#addOrder,#purchase{ 
 position: relative;  
 top:350px; 
 } 

.stNum{
position:relative;
top:220px;
width:50px;
height:20px;
}

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>판매 상세</title>
</head>
<%@include file="header.jsp"%>

<body>




<a href="javascript:history.back(-1);">뒤로가기</a>
<!-- 저자 출판사 출판연돈 isbn  -->
		<c:set var="sd" value="${salesDetail}"></c:set>
	<div id="container">
<%-- 	<%for (i=0; i<list.size(); i++){%> --%>
		<div><strong class="tit" style="font-size:26px">${sd[0].title}</strong></div>
		<div>
					 <div class="background-cover" style="background-image: url('${sd[0].thumbnail}');" data-alt="${sd[0].title}"></div>	
				
	<div class="d-flex">
    <input name="order" class="btn btn-primary" id="addOrder" type="button" value="주문목록에 담기">
    <input name="pay" class="btn btn-success" id="purchase" type="button" value="바로구매">
	</div>
						
		<ul>
		<li class="auth">저자:${sd[0].author}</li>
 <li class="publ">출판사:${sd[0].publisher}</li>
  <c:set var="frmDate" >
  <fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss" value="${sd[0].publish_date}" var="pDate"></fmt:parseDate>
  <fmt:formatDate pattern="yyyy-MM-dd" value="${pDate}"/>
  </c:set>
<%
    for(int i=0; i<list.size(); i++){
%>
       <li> <input class="bookChk" type="checkbox" value="<%= list.get(i).getStock_number() %>">목록<%=i+1%></li>
      <li>  <input class="price" type="hidden" value="<%=list.get(i).getBook_price() %>" ></li>
<%
    }
%>
<li class="date">출판연도:${frmDate}</li>
<li class="isbn">ISBN:${sd[0].isbn}</li>	
<li class="bPrice">가격:${sd[0].book_price}</li>	
		</ul>
		</div>
		
		
<!-- 		<div><input type="button" value="주문목록에 담기"></div> -->
	</div>
	
<script type="text/javascript" src="./js/order.js"></script>






<script type="text/javascript">
// var totalPrice=0;
// var totalCount=0;
// for(var i=0; i<$("");i++) {
// var price=	list.get(i).getBook_price();
// var quantity=	list.get(i).getOrder_quantity();
// var bookPrice=	price*quantity;

// totalPrice += bookPrice; 
// totalCount+=quantity;

//체크된 사이즈로 해야됨
$(document).ready(function(){
	$("#purchase").click(function(){
		var purchaseChk= new Array();//선택된수량
		var price = new Array();//선택된 가격
		
		$(".bookChk:checked").each(function(){
			purchaseChk.push($(this).val());
		})
	
		$(".price").each(function(){
		price.push($(this).val());	
		})
		
		console.log(price);
		
// 		for (var i = 0; i < purchaseChk.length; i++) {
// 				var array_element = array[i];
				
// 			}
// 			console.log(purchaseChk.length);
			console.log(purchaseChk);
		
// 	console.log(purchaseChk);
	})
	
})









<%-- var totalPrice=<%=totalPrice%> --%>
<%-- var totalCount=<%=totalCount%> --%>


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
<%-- var point = <%=totalPrice%> --%>
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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
<%@include file="footer.jsp"%>
</html>