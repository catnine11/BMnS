<%@page import="com.gd.bmss.vo.Paging_Vo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.background-cover {
	margin-left:20px;
/* 	float:left; */
    background-size: cover;
    width: 102px; /* 원하는 너비 조절 */
    height: 120px; /* 원하는 높이 조절 */
}
h4{
	margin:0 auto;
}
table{
margin-left: 100px;
margin-top:20px;
margin-bottom: 10px;
height: 150px;
}
.container {
  display: flex;
  flex-direction: column; /* 세로로 배치하고 싶을 때 */
  border: 2px solid black;
  width:300px;
  padding:10px;
}

.pa{
color: #7266A8;  
}

.pdiv{
font-size:30px;
text-align: center;

}

</style>
<meta charset="UTF-8">
<title>판매도서 목록</title>
</head>
<%@include file="header.jsp" %>

<% Paging_Vo p =(Paging_Vo) request.getAttribute("page"); %>
<body>
<%-- ${saleList} --%>



<c:forEach items="${lists}" var="s" >
  <table class="container">
    <tr>
      <td class="background-cover" style="background-image: url('${s.thumbnail}');" data-alt="${s.title}"></td>
      <td>
       <h4><a class="pa" href="./salesDetail.do?book_code=${s.book_code}">&nbsp;&nbsp;${s.title}</a><br></h4> 
      &nbsp;&nbsp;${s.author}(저자)<br>
       <c:set var="formattedDate">
         <fmt:parseDate value="${s.publish_date}" pattern="yyyy-MM-dd HH:mm:ss" var="pDate" />
         <fmt:formatDate value="${pDate}" pattern="yyyy-MM-dd" />
       </c:set>
     &nbsp;&nbsp;${s.publisher}|${formattedDate}<br>
      </td>
    </tr>
  </table>
</c:forEach>

<!-- 왼쪽 오른쪽 표시 -->
<div class="pdiv">
<% if(p.getStartPage()>1){
%>
<a class="pa" href="./getSellableStock.do?page=1">◁◁</a>
<% 
	
}

if(p.getPage()>1){
	if(p.getStartPage()-p.getCountPage()<=0){
		%>
		<a class="pa" href="./getSellableStock.do?page=1">◁</a>
		<% 

	}else{
		%>
		<a class="pa" href="./getSellableStock.do?page=<%=p.getStartPage()-p.getCountPage()%>">◁</a>
		<% 
	}
}
	%>
	<!-- 페이지번호 -->
	<%
	for(int i=p.getStartPage(); i<=p.getEndPage();i++){
		
		%>
		<a  class="pa" href="./getSellableStock.do?page=<%=i%>">&nbsp;&nbsp;<%=i%>&nbsp;&nbsp;</a>
		<%
	}
	%>
	
	<!-- 그림표지 -->
	<%
		if(p.getPage()<p.getTotalPage()){
			if(p.getStartPage()+p.getCountPage()>p.getTotalPage()){
			
			%>
			<a class="pa" href="./getSellableStock.do?page=<%=p.getTotalPage() %>">▶</a>
			<% 
			
		}else{
			%>
			<a class="pa" href="./getSellableStock.do?page=<%=p.getStartPage()+p.getCountPage()%>">▶</a>
			<% 
		}
		}
	if(p.getEndPage()<p.getTotalPage()){
		%>
		<a class="pa" href="./getSellableStock.do?page=<%=p.getTotalPage()%>">▶▶</a>
		<% 
	}
	%>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

<%@include file="footer.jsp" %>
</html>