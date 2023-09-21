<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
<tr>
<td></td>


</tr>

<c:forEach var="ul" items="${oderUser}">
<tr>
<td>${ul.status_title}</td>
<td>${ul.thumbnail}</td>

<td><img src="${ul.thumbnail}" alt="Thumbnail"></td>
<td>${ul.author}</td>
<td>${ul.user_address}</td>


<td>${ul.order_price}</td>

</tr>
</c:forEach>

</table>


</body>
</html>