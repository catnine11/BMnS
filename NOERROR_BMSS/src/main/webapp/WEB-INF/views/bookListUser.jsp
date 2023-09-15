<%@page import="com.gd.bmss.vo.BookInfoVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOERROR 책</title>
<style type="text/css">
	#thumbnail{
		width: 30%;
 		height: 30%;
	}
</style>
<script type="text/javascript">

</script>
</head>
<%@include file="header.jsp" %>
<body>
<%-- ${lists} --%>

<!-- <table> -->
<!-- 	<thead> -->
<!-- 		<tr> -->
<!-- 			<td colspan="2">장르 선택</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>장르</th> -->
<!-- 			<th>썸네일</th> -->
<!-- 		</tr> -->
<!-- 	</thead> -->
<!-- </table> -->

<div class="container">
	<form action="./bookListUserGenre.do" method="post">
		<div class="selectGenre">
			<select class="Genre">
				<option>전체</option>
				<option>총류</option>
				<option>철학</option>
				<option>종교</option>
				<option>사회과학</option>
				<option>자연과학</option>
				<option>기술과학</option>
				<option>예술</option>
				<option>언어</option>
				<option>문학</option>
				<option>역사</option>
			</select>
		</div>
	</form>
		<div>
			<ul class="imgList">
			<c:forEach items="${lists}" var="book">
				<li>
					<a>
						<img id="thumbnail" src="${book.thumbnail}" onclick="/bookDetail.do?book_code="+${book.book_code}>
					</a>
					<div>
					
					</div>
				</li>
			</c:forEach>
			</ul>
		</div>
</div>


</body>
<%@include file="footer.jsp" %>
</html>