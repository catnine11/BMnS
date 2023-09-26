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
    background-size: cover;
    width: 100px; /* 원하는 너비 조절 */
    height: 100px; /* 원하는 높이 조절 */
}
</style>
<%@include file="header.jsp"%>
<body>
<table>
<tr>
<td>썸네일</td>
<td>도서명</td>
<td>저자</td>
<td>출판사</td>
<td>ISBN</td>
</tr>
<c:forEach var="b" items="${bookList}">
<tr>
<td class="background-cover" style="background-image: url('${b.thumbnail}');" data-alt="${b.thumbnail}"></td>
<td><a href="./bookDetail.do?book_code=${b.book_code}">${b.title}</a></td>
<td>${b.author}</td>
<td>${b.publisher}</td>
<td>${b.isbn}</td>
</tr>
</c:forEach>
</table>
</body>
<%@include file="footer.jsp" %>
</html>
