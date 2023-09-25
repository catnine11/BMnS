<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOERROR 책check 내 서재</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/myLibrary.js"></script>
<style type="text/css">
	table, tr, th, td{
		text-align: center;
	}
</style>
</head>
<%@include file="header.jsp" %>
<body>
${sessionScope.loginVo}
<br>
<input type="hidden" name="user_id" class="user_id" value="${sessionScope.loginVo.user_id}">
<input type="hidden" name="penalty_date" class="penalty_date" value="${sessionScope.loginVo.penalty_date}">

<div class="container">
	<div>
		<div>
		<h2>현황</h2>
			<div>
				<h3>대출현황</h3>
				<p><a href="./myBorrowNow.doS?user_id=${sessionScope.loginVo.user_id}">대출현황</a></p>
				<div id="myBorrowNow">
					<table>
						<tbody>
							<tr>
								<th>제목</th>
								<th>저자</th>
								<th>출판사</th>
								<th>장르</th>
								<th>대출일</th>
								<th>반납(예정)일</th>
								<th>연장</th>
							</tr>
							<c:forEach var="book" items="${borrowNow}">
							<c:forEach var="b" items="${book.bsVo}">
							<tr>
								<td>${b.borrow_title}</td>
								<td>${book.author}</td>
								<td>${book.publisher}</td>
								<td>${book.genre_name}</td>
								<td>${b.start_date}</td>
								<td>
									<%
									    // 현재 날짜를 가져옵니다.
									    Date currentDate = new Date();
									    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
									    String formattedCurrentDate = sdf.format(currentDate);
									    pageContext.setAttribute("currentDate", formattedCurrentDate);
									    System.out.println("현재시간"+currentDate);
									    
									%>
									<c:choose>
										<c:when test="${b.return_date < currentDate}">
<%-- 											<p style="color: red;">(${b.return_date-currentDate}일 연체중)</p> --%>
											<p>${b.return_date}예정,<br><span style="color: red;"> 연체중</span></p>
										</c:when>
										<c:otherwise>
											<p style="color: black;">${b.return_date}</p>
										</c:otherwise>
										</c:choose>
								</td>
								<td><c:choose>
	<%-- 								<td>${b.renew}</td> --%>
										<c:when test="${b.renew=='Y'}">
											<p style="color: red;">연장불가</p>
										</c:when>
										<c:otherwise>
											<input type="hidden" class="book_seq" value="${b.book_seq}">
											<input type="button" class="renew" value="연장">
										</c:otherwise>
									</c:choose></td>
							</tr>
							</c:forEach>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div>
				<h3>예약현황</h3>
				<p><a href="./myReserve.do?user_id=${sessionScope.loginVo.user_id}">예약현황</a></p>
				<div id="myReserve">
<%-- 				${reserveList} --%>
					<table>
						<tbody>
							<tr>
								<th>제목</th>
								<th>저자</th>
								<th>출판사</th>
								<th>장르</th>
								<th>예약일</th>
								<th>반납예정일</th>
								<th>예약취소</th>
							</tr>
							<c:forEach var="book" items="${reserveList}">
							<c:forEach var="r" items="${book.bsVo}">
							<tr>
								<td>${r.reserve_title}</td>
								<td>${book.author}</td>
								<td>${book.publisher}</td>
								<td>${book.genre_name}</td>
								<td>${r.reserve_date}</td>
								<td>
									<%
									    // 현재 날짜를 가져옵니다.
									    Date currentDate = new Date();
									    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
									    String formattedCurrentDate = sdf.format(currentDate);
									    pageContext.setAttribute("currentDate", formattedCurrentDate);
									    System.out.println("현재시간"+currentDate);
									    
									%>
									<c:choose>
										<c:when test="${r.return_date < currentDate}">
<%-- 											<p style="color: red;">(${r.return_date-currentDate}일 연체중)</p> --%>
											<p>${r.return_date}예정,<br><span style="color: red;"> 연체중</span></p>
										</c:when>
										<c:otherwise>
											<p style="color: black;">${r.return_date}</p>
										</c:otherwise>
										</c:choose>
								</td>
								<td>
									<c:if test="${r.reserve_status=='Y'}">
										<input type="hidden" name="book_seq" class="book_seq" value="${r.book_seq}">
										<input type="hidden" name="user_id" class="user_id" value="${sessionScope.loginVo.user_id}">
										<input type="button" class="cancelReserve" value="예약취소">
									</c:if>
								</td>
							</tr>
							</c:forEach>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div>
		<h2>내역</h2>
			<div>
				<h3>대출내역</h3>
				<p><a href="./myBorrowHistory.do?user_id=${sessionScope.loginVo.user_id}">대출내역</a></p>
				<div id="myBorrowHistory">
					<table>
						<tbody>
							<tr>
								<th>제목</th>
								<th>저자</th>
								<th>출판사</th>
								<th>장르</th>
								<th>대출일</th>
								<th>반납(예정)일</th>
								<th>대출상태</th>
							</tr>
							<c:forEach var="book" items="${borrowHistory}">
							<c:forEach var="b" items="${book.bsVo}">
							<tr>
								<td>${b.borrow_title}</td>
								<td>${book.author}</td>
								<td>${book.publisher}</td>
								<td>${book.genre_name}</td>
								<td>${b.start_date}</td>
								<td>
									<%
									    // 현재 날짜를 가져옵니다.
									    Date currentDate = new Date();
									    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
									    String formattedCurrentDate = sdf.format(currentDate);
									    pageContext.setAttribute("currentDate", formattedCurrentDate);
									    System.out.println("현재시간"+currentDate);
									    
									%>
									<c:choose>
										<c:when test="${b.return_date < currentDate}">
<%-- 											<p style="color: red;">(${b.return_date-currentDate}일 연체중)</p> --%>
											<p>${b.return_date}예정,<br><span style="color: red;"> 연체중</span></p>
										</c:when>
										<c:otherwise>
											<p style="color: black;">${b.return_date}</p>
										</c:otherwise>
										</c:choose>
								</td>
								<td><c:choose>
<%-- 								<td>${b.borrow_status}</td> --%>
									<c:when test="${b.borrow_status=='Y'}">
										<p style="color: red;">대출중</p>
									</c:when>
									<c:otherwise>
										<p>반납완료</p>
									</c:otherwise>
								</c:choose></td>
							</tr>
							</c:forEach>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div>
				<p><a href="">희망도서신청</a></p>
				<div id="">
				
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<%@include file="footer.jsp" %>
</html>