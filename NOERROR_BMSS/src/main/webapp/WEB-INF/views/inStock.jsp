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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>재고대상목록</title>
<style type="text/css">
td{text-align: center;}
th{
text-align: center;

}
h1{
text-align: center;
}

</style>
</head>
<body>

<h1>재고대상 목록</h1>
<div class="container">
<table class="table">
<thead>
<tr>
<td><input type='checkbox' name='allChk'></td> 
<th scope="col">체크</th>
<th scope="col">재고대상 수량</th>
<th scope="col">도서상태</th>
<th scope="col" class="bkName">도서명</th>
<th scope="col">관리번호</th>
</tr>
</thead>
<c:forEach varStatus="vs" var="g" items="${getInStock}">
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
<script type="text/javascript" src="./js/stock.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>