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
</head>
<body>
<!-- stock_number=6, sell_status=N, 
book_seq=56, book_price=0, 
status_title=희망(리영희 산문선)(양장본 HardCover), 
status_code=A, book_code=30 -->

<table class="container">
<tr>
<td><input type='checkbox' name='allChk'></td> 
<td>관리번호</td>
<td>도서상태</td>
<td>도서가격</td>
<td>도서명</td>
<td>도서코드</td>
</tr>
<c:forEach var="g" items="${getInStock}">
<tr>
<td><input class="stockNum" type="hidden" value="${g.stock_number}">
<td><input class='delChk' type='checkbox' name='delChk' value='${g.book_code}'></td>
<td class="book_seq">${g.book_seq}</td>
<td><select class='InStockStatus' name='status_code'>                                        
    <option value='A' ${g.status_code == 'A' ? "selected" : ""}>일반</option>
    <option value='B' ${g.status_code == 'B' ? "selected" : ""}>재고</option>
</select></td>
<td>${g.book_price}</td>
<td>${g.status_title}</td>
<td>${g.book_code}</td>
</tr>
</c:forEach>
<tr><td><input id="inStockDel" type="button" value="삭제"> </td></tr>
</table>
<script type="text/javascript" src="./js/stock.js"></script>

</body>
</html>