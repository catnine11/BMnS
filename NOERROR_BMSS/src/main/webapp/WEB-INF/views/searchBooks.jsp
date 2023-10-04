<%@page import="com.gd.bmss.vo.Paging_Vo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 검색 결과</title>
</head>
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
</style>
<%@include file="header.jsp"%>
<% Paging_Vo p =(Paging_Vo) request.getAttribute("page"); %>
<body>
<!-- <tr> -->
<!-- <td>썸네일</td> -->
<!-- <td>도서명</td> -->
<!-- <td>저자</td> -->
<!-- <td>출판사</td> -->
<!-- <td>ISBN</td> -->
<!-- </tr> -->
<c:forEach varStatus="vs" var="b" items="${lists}">
<table class="container">
<tr>
<td class="background-cover" style="background-image: url('${b.thumbnail}');" data-alt="${b.thumbnail}"></td>
<td>
<h4><a href="./searchBooks.do?book_code=${b.book_code}">${vs.index + 1}.${b.title}</a></h4> 
 저자:${b.author}<br>
출판사:${b.publisher}<br>
ISBN:${b.isbn}
</td>
</tr>
</table>
</c:forEach>

<div style="font-size:30px;text-align: center;">
<% if(p.getStartPage()>1){
%>
<a href="./searchBooks.do?page=1&selectOpt=${selectOpt}&inputVal=${inputVal}">◁◁</a>
<% 
	
}

if(p.getPage()>1){
	if(p.getStartPage()-p.getCountPage()<=0){
		%>
		<a href="./searchBooks.do?page=1&selectOpt=${selectOpt}&inputVal=${inputVal}">◁</a>
		<% 

	}else{
		%>
		<a href="./searchBooks.do?page=<%=p.getStartPage()-p.getCountPage()%>&selectOpt=${selectOpt}&inputVal=${inputVal}">◁</a>
		<% 
	}
}
	%>
	<!-- 페이지번호 -->
	<%
	for(int i=p.getStartPage(); i<=p.getEndPage();i++){
		
		%>
		<a href="./searchBooks.do?page=<%=i%>&selectOpt=${selectOpt}&inputVal=${inputVal}">&nbsp;&nbsp;<%=i%>&nbsp;&nbsp;</a>
		<%
	}
	%>
	
	<!-- 그림표지 -->
	<%
		if(p.getPage()<p.getTotalPage()){
			if(p.getStartPage()+p.getCountPage()>p.getTotalPage()){
			
			%>
			<a href="./searchBooks.do?page=<%=p.getTotalPage()%>&selectOpt=${selectOpt}&inputVal=${inputVal}">▶</a>
			<% 
			
		}else{
			%>
			<a href="./searchBooks.do?page=<%=p.getStartPage()+p.getCountPage()%>&selectOpt=${selectOpt}&inputVal=${inputVal}">▶</a>
			<% 
		}
		}
	if(p.getEndPage()<p.getTotalPage()){
		%>
		<a href="./searchBooks.do?page=<%=p.getTotalPage()%>&selectOpt=${selectOpt}&inputVal=${inputVal}">▶▶</a>
		<% 
	}
	%>
</div>

</body>
<%@include file="footer.jsp" %>
</html>
