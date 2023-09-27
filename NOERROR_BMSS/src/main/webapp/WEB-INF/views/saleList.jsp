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
	float:left;
    background-size: cover;
    width: 102px; /* 원하는 너비 조절 */
    height: 120px; /* 원하는 높이 조절 */
}
h4{
	margin:0 auto;
}
</style>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<title>판매도서 목록</title>
</head>
<%@include file="header.jsp" %>

<body>
<c:forEach items="${saleList}" var="s" varStatus="loop">
  <table>
    <tr>
      <td class="background-cover" style="background-image: url('${s.thumbnail}');" data-alt="${s.title}"></td>
      <td>
       <h4><a href="./salesDetail.do?book_code=${s.book_code}">${loop.index + 1}. ${s.title}</a><br></h4> 
        ${s.author}(저자)<br>
       <c:set var="formattedDate">
         <fmt:parseDate value="${s.publish_date}" pattern="yyyy-MM-dd HH:mm:ss" var="pDate" />
         <fmt:formatDate value="${pDate}" pattern="yyyy-MM-dd" />
       </c:set>
       ${s.publisher}|${formattedDate}<br>
<%--         가격:${s.book_price}원 --%>
      </td>
    </tr>
  </table>
</c:forEach>







</body>

<%@include file="footer.jsp" %>
</html>