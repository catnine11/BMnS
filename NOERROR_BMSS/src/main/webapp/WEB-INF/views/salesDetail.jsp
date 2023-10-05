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
margin:20px 0px 0px 680px;
border:2px solid black;
height:420px;
width:500px;
text-align: left;
}
.sttit .tit{
margin:0px 35px 0px 50px;
text-align:center;
font-size: 15px;

}
/* .sttit */
.background-cover {
	float:left;
    background-size: cover;
    width: 170px; /* 원하는 너비 조절 */
    height: 250px; /* 원하는 높이 조절 */
/*     margin:20px;  */
margin-left: 20px;
}
.auth,.publ,.date,.isbn{
margin-left:200px;
margin-bottom: 20px;
margin-top:10px;

}

.bookChk{
margin-bottom: 20px;
/* clear: both; */

}
.uldiv{

margin-top: 40px;

}
.d-flex{
margin-top: 60px;
 justify-content: center;
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
		<div class="sttit" ><strong class="tit" >${sd[0].title}</strong></div>
		<div id="bglidiv">
					 <div class="background-cover" style="background-image: url('${sd[0].thumbnail}');" data-alt="${sd[0].title}"></div>	
				
	<div class="uldiv">				
		<ul>
		<li class="auth"><div>저자:${sd[0].author}</div></li>
 <li class="publ"><div>출판사:${sd[0].publisher}</div></li>
  <c:set var="frmDate" >
  <fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss" value="${sd[0].publish_date}" var="pDate"></fmt:parseDate>
  <fmt:formatDate pattern="yyyy-MM-dd" value="${pDate}"/>
  </c:set>
<li class="date"><div>출판연도:${frmDate}</div></li>
<li class="isbn"><div>ISBN:${sd[0].isbn}</div></li>	
<%
    for(int i=0; i<list.size(); i++){
%>
	
       <li ><input style="margin-left: 30px" class="bookChk" type="checkbox" value="<%= list.get(i).getStock_number() %>">&nbsp;판매목록<%=i+1%>&nbsp;가격:<%=list.get(i).getBook_price()%></li>
      <li>  <input class="price" type="hidden" value="<%=list.get(i).getBook_price() %>" ></li>
	
<%
    }
%>

		</ul>

		</div>
		</div>
		
	</div>
	
	<div class="d-flex">
    <input name="order" class="btn btn-success" id="addOrder" type="button" value="주문목록에 담기">
<!--     <input name="pay" class="btn btn-success" id="purchase" type="button" value="바로구매"> -->
	</div>
	
<script type="text/javascript" src="./js/order.js"></script>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
<%@include file="footer.jsp"%>
</html>