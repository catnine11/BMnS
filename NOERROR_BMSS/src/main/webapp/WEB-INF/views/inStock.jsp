<%@page import="com.gd.bmss.vo.Paging_Vo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>재고대상목록</title>
<style type="text/css">
td{text-align: center;}
th{
text-align: center;

}

</style>
</head>
<%@include file="header.jsp"%>
<% Paging_Vo p =(Paging_Vo) request.getAttribute("page"); %>
<body>

<div class="container">
<table class="table">
<thead>
<tr>
<td><input type='checkbox' name='allChk'></td> 
<th scope="col" style="text-align: center;">체크</th>
<th scope="col" style="text-align: center;">재고대상 수량</th>
<th scope="col" style="text-align: center;">도서상태</th>
<th scope="col" style="text-align: center;" class="bkName">도서명</th>
<th scope="col" style="text-align: center;">관리번호</th>
</tr>
</thead>
<c:forEach varStatus="vs" var="g" items="${lists}">
<tr>
<td><input class="stockNum" type="hidden" value="${g.stock_number}">
<td><input class='delChk' type='checkbox' name='delChk' value='${g.book_code}'></td>
<td >${vs.index+1}</td>
<td><select class='InStockStatus' name='status_code'>                                        
    <option value='A' ${g.status_code == 'A' ? "selected" : ""}>일반</option>
    <option value='B' ${g.status_code == 'B' ? "selected" : ""}>재고</option>
</select></td>
<td>${g.status_title}</td>
<td class="book_seq">${g.book_seq}</td>
</tr>
</c:forEach>
<tr><td><input id="inStockDel" type="button" value="삭제"> </td></tr>
</table>
</div>

<div style="font-size:30px;text-align: center;">
<% if(p.getStartPage()>1){
%>
<a href="./cronStockList.do?page=1">◁◁</a>
<% 
	
}

if(p.getPage()>1){
	if(p.getStartPage()-p.getCountPage()<=0){
		%>
		<a href="./cronStockList.do?page=1">◁</a>
		<% 

	}else{
		%>
		<a href="./cronStockList.do?page=<%=p.getStartPage()-p.getCountPage()%>">◁</a>
		<% 
	}
}
	%>
	<!-- 페이지번호 -->
	<%
	for(int i=p.getStartPage(); i<=p.getEndPage();i++){
		
		%>
		<a href="./cronStockList.do?page=<%=i%>">&nbsp;&nbsp;<%=i%>&nbsp;&nbsp;</a>
		<%
	}
	%>
	
	<!-- 그림표지 -->
	<%
		if(p.getPage()<p.getTotalPage()){
			if(p.getStartPage()+p.getCountPage()>p.getTotalPage()){
			
			%>
			<a href="./cronStockList.do?page=<%=p.getTotalPage() %>">▶</a>
			<% 
			
		}else{
			%>
			<a href="./cronStockList.do?page=<%=p.getStartPage()+p.getCountPage()%>">▶</a>
			<% 
		}
		}
	if(p.getEndPage()<p.getTotalPage()){
		%>
		<a href="./cronStockList.do?page=<%=p.getTotalPage()%>">▶▶</a>
		<% 
	}
	%>
</div>

<script type="text/javascript" src="./js/stock.js"></script>
</body>
<%@include file="footer.jsp"%>
</html>