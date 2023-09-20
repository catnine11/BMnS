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
	
	.info> ul> li{
		display: inline;
	}
	
	.info> ul> li:not(:last-child)::after {
        content: " | ";
        color: #ccc;
	}
	
	table{
		text-align: center;
	}
	
</style>
<!-- <script type="text/javascript" src="./js/detail.js"></script> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
window.onload = function () {

	var adminOnlyElements = document.getElementsByClassName("adminOnly");
	var userAuth = "${sessionScope.loginVo.user_auth}";
	console.log("userAuth: " + userAuth);

	if (userAuth != 'A') {
		for (var i = 0; i < adminOnlyElements.length; i++) {
			adminOnlyElements[i].style.display = "none";
		}
	}else{
		for (var i = 0; i < adminOnlyElements.length; i++) {
			adminOnlyElements[i].style.display = "";
		}
	}
}

</script>
</head>
<%@include file="header.jsp" %>
<body>
<%-- ${sessionScope.loginVo.user_auth} --%>
<!-- <div> -->
<!-- 	<fieldset> -->
<%-- 		<div>${detail}</div> --%>
<!-- 		<hr> -->
<!-- 		<div> -->
<!-- 				<h3>사진</h3> -->
<%-- 				thumbnail : ${detail.thumbnail} --%>
<!-- 			<hr> -->
<!-- 				<h3>책상세</h3> -->
<%-- 				isbn= : ${detail.isbn} --%>
<%-- 				title= : ${detail.title} --%>
<%-- 				author= : :${detail.author}  --%>
<%-- 				genre_code= :${detail.genre_code}  --%>
<%-- 				publisher=:${detail.publisher}  --%>
<%-- 				publish_date =: :${detail.publish_date} --%>
<!-- 			<hr> -->
<!-- 				<h3>대출예약</h3> -->
<%-- 				<c:forEach var="vo" items="${detail.bsVo}"> --%>
<!-- 					<p> -->
<%-- 						status_code=:${vo.status_code}  --%>
<%-- 						return_date=:${vo.return_date}   --%>
<%-- 						borrow_status=:${vo.borrow_status}  --%>
<!-- 					</p> -->
<%-- 				</c:forEach> --%>
<!-- 		</div> -->
<!-- 	</fieldset> -->
<!-- </div> -->
<div class="container">
	<div class="title">
		<h2>상세정보</h2>
	</div>
	<div class="">
		<div class="outline">
			<div class="bookinfo">
				<div class="thumb">
					<img id="thumbnail" src="${detail.thumbnail}" alt="${detail.title}">
				</div>
				<div class="binfo">
					<div class="title">
						<b>${detail.title}</b>
					</div>
					<hr>
					<div class="info">
						<ul class="adminOnly">
							<li>
								<strong>도서번호</strong>
								&nbsp;&nbsp; ${detail.book_code}
							</li>
						</ul>
						<ul>
							<li>
								<strong>저자사항</strong>
								&nbsp;&nbsp; ${detail.author}
							</li>
						</ul>
						<ul>
							<li>
								<strong>발행사항</strong>
								&nbsp;&nbsp; ${detail.publisher}
							</li>
							<li>
								 ${detail.publish_date}
							</li>
						</ul>
						<ul>
							<li>
								<strong>표준부호</strong>
								&nbsp;&nbsp; ISBN : ${detail.isbn}
							</li>
						</ul>
						<ul>
							<li>
								<strong>분류기호</strong>
								&nbsp;&nbsp; 한국십진분류법 : ${detail.genre_code}
							</li>
							<li>
								 ${detail.genre_name}
							</li>
						</ul>
					</div>
				</div>
				
				<div class="seqByBookCode">
					<table>
						<tbody>
							<tr>
								<th class="adminOnly">관리번호</th>
								<th>장르</th>
								<th>도서상태</th>
								<th>대출상태</th>
								<th>반납예정일</th>
								<th>예약상태</th>
							</tr>
							<c:forEach  var="d" items="${detail.bsVo}">
								<c:choose>
								<c:when test="${sessionScope.loginVo.user_auth=='A'}">
									<tr>
											<td class="adminOnly">${d.book_seq}</td>
										<td>${detail.genre_name}</td>
										<td>${d.status_code}</td>
										<td>${d.borrow_status}</td>
										<td>${d.return_date}</td>
										<td>${d.reserve_status}</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:if test="${d.status_code=='A'}">
									<tr>
										<td class="adminOnly">${d.book_seq}</td>
										<td>${detail.genre_name}</td>
										<td>${d.status_code}</td>
										<td>${d.borrow_status}</td>
										<td>${d.return_date}</td>
										<td>${d.reserve_status}</td>
									</tr>
									</c:if>
								</c:otherwise>
								</c:choose>
							</c:forEach>
						</tbody>
					</table>
				</div>
					
			</div>
		</div>
	</div>
</div>
</body>
<%@include file="footer.jsp" %>
</html>