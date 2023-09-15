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
	<div class="selectGenre">
		<div>
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
		<div>
			<ul class="imgList">
				<li>
					<a>
						<img alt="" src="">
					</a>
					<div>
					
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>


</body>
<%@include file="footer.jsp" %>
</html>