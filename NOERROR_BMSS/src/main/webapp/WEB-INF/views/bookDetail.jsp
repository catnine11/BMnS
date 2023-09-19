<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOERROR 책 상세페이지</title>
<style type="text/css">
	#thumbnail{
		height: 250px;
		width: 200px;
		padding: 10px;
		margin-top: 20px;
	}
</style>
</head>
<%@include file="header.jsp" %>
<body>
	<div class="container">
		<div class="title">
			<h2>상세정보</h2>
		</div>
		<div class="">
			<div class="outline">
				<div class="bookinfo">
					<div class="thumb">
						<img id="thumbnail" src="${lists.thumbnail}" alt="${lists.title}">
					</div>
					<div class="info">
						<div class="title">
							<h2>${lists.title}</h2>
						</div>
						<div class="info">
							<ul class="">
<!-- 								li -->
							</ul>
						</div>
					</div>
				</div>
			
			</div>
		</div>
	</div>
</body>
<%@include file="footer.jsp" %>
</html>