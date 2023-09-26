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
.auth,.publ,.date,.isbn{
margin-left:180px;
margin-bottom: 20px;

}

#addOrder{
position: relative; 
top:400px;
}

#purchase{
position: relative; 
top:400px;
}

</style>
<title>판매 상세</title>
</head>
<%@include file="header.jsp"%>
<body>
<!-- 저자 출판사 출판연돈 isbn  -->
		<c:set var="sd" value="${salesDetail}"></c:set>
	<div id="container">
<%-- 	<%for (i=0; i<list.size(); i++){%> --%>
		<div><strong class="tit" style="font-size:26px">${sd[0].title}</strong></div>
		<div>
					 <div class="background-cover" style="background-image: url('${sd[0].thumbnail}');" data-alt="${sd[0].title}"></div>	
				
				<div><input name="order" id="addOrder" type="button" value="주문목록에 담기" > </div> 
				<div><input name="pay" id="purchase" type="button" value="바로구매" ></div>
						
						
						<input id="stNum" type="text" value="${sd[0].stock_number }">
		<ul>
		<li class="auth">저자:${sd[0].author}</li>
 <li class="publ">출판사:${sd[0].publisher}</li>
  <c:set var="frmDate" >
  <fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss" value="${sd[0].publish_date}" var="pDate"></fmt:parseDate>
  <fmt:formatDate pattern="yyyy-MM-dd" value="${pDate}"/>
  </c:set>
<li class="date">출판연도:${frmDate}</li>
<li class="isbn">ISBN:${sd[0].isbn}</li>	
		</ul>
		</div>
		
<!-- 		<div><input type="button" value="주문목록에 담기"></div> -->
	</div>
	

</body>
<%@include file="footer.jsp"%>
</html>