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
						<b>${lists.title}</b>
					</div>
					<hr>
					<div class="info">
						<ul class="adminOnly">
							<li>
								<strong>도서번호</strong>
								&nbsp;&nbsp; ${lists.book_code}
							</li>
						</ul>
						<ul>
							<li>
								<strong>저자사항</strong>
								&nbsp;&nbsp; ${lists.author}
							</li>
						</ul>
						<ul>
							<li>
								<strong>발행사항</strong>
								&nbsp;&nbsp; ${lists.publisher}
							</li>
							<li>
								 ${lists.publish_date}
							</li>
						</ul>
						<ul>
							<li>
								<strong>표준부호</strong>
								&nbsp;&nbsp; ISBN : ${lists.isbn}
							</li>
						</ul>
						<ul>
							<li>
								<strong>분류기호</strong>
								&nbsp;&nbsp; 한국십진분류법 : ${lists.genre_code}
							</li>
							<li>
								 ${lists.genre_name}
							</li>
						</ul>
					</div>
					<div class="seqByBookCode">
						<table>
							<tbody>
								<tr>
									<th class="adminOnly">관리번호</th>
									<th>장   르</th>
									<th>도서상태</th>
									<th>대출상태</th>
									<th>반납예정일</th>
									<th>예약상태</th>
								</tr>
								<c:forEach var="d" items="${detail}" varStatus="vs">
									<tr>
										<td class="adminOnly">${d.book_seq}</td>
										<td>${d.genre_name}</td>
										<td>
										<c:if test="">
										${d.status_code}
										</c:if>
										</td>
										<td>${d.borrow_status}</td>
										<td>${d.return_date}</td>
										<td>${d.reserve_status}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>
</body>
<%@include file="footer.jsp" %>
</html>