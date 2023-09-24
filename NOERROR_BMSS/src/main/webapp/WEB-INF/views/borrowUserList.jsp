<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자의 대출관리</title>
</head>
<%@include file="header.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/borrowUserList.js"></script>
<style type="text/css">
	table, tr, th, td{
		text-align: center;
	}
	#borrowOneUserNow {
    display: none; 
	}
	
	#borrowOneUserNow.show {
	    display: block;
	}
	
</style>
</head>
<body>
<!-- 
전체회원 대출현황조회 /borrowAllUserNow.do
특정회원 대출현황조회 /borrowOneUserNow.do
특정회원 대출내역조회 /borrowOneUserHistory.do
전체회원 예약현황조회 /reserveAllUser.do
 -->
${sessionScope.loginVo}
<br>
<%-- <input type="hidden" name="penalty_date" class="penalty_date" value="${sessionScope.loginVo.penalty_date}"> --%>

<div class="container">
	<div>
		<div>
		<h2>현황</h2>
			<div>
				<h3>대출현황</h3>
				<p><a href="./borrowAllUserNow.do">전체회원</a></p>
				<div id="borrowAllUserNow">
					<input type="button" class="returnBook" value="반납">
					<table>
						<tbody>
							<tr>
								<th>
									<input type="checkbox">
								</th>
								<th>관리번호</th>
								<th>회원아이디</th>
								<th>도서제목</th>
								<th>대출일</th>
								<th>반납(예정)일</th>
								<th>연장여부</th>
								<th>회원상세현황</th>
							</tr>
							<c:forEach var="borrow" items="${borrowNow}">
								<tr>
									<td>
										<input type="checkbox" name="chkBook" value="${borrow.book_seq}">
									</td>
									<td>${borrow.book_seq}</td>
									<td>${borrow.user_id}</td>
									<td>${borrow.borrow_title}</td>
									<td>${borrow.start_date}</td>
									<td>${borrow.return_date}</td>
									<td>
										<c:choose>
										<c:when test="${borrow.renew=='Y'}">
											<p style="color: red;">연장불가</p>
										</c:when>
										<c:otherwise>
											<p style="color: black;">연장가능</p>
										</c:otherwise>
										</c:choose>
									</td>
									<td>
										<input type="hidden" name="user_id" class="user_id" value="${borrow.user_id}">
										<input type="button" class="detailUserBorrow" value="회원상세" onclick="location.href='./borrowOneUserNow.do'">
<%-- 										<input type="button" class="detailUserBorrow" value="회원상세" onclick="oneUserborrowNow(${borrow.user_id})"> --%>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div id="borrowOneUserNow" >
				<p><a href="./borrowOneUserNow.do">특정회원</a></p>
					<table>
						<tbody>
							<tr>
								<th>회원아이디</th>
								<th>관리번호</th>
								<th>도서제목</th>
								<th>대출일</th>
								<th>반납(예정)일</th>
								<th>연장여부</th>
								<th>패널티여부</th>
								<th>패널티기간</th>
							</tr>
							<c:forEach var="borrow" items="${borrowOneNow}">
								<tr>
									<td>${borrow.user_id}</td>
									<td>${borrow.borrow_seq}</td>
									<td>${borrow.borrow_title}</td>
									<td>${borrow.start_date}</td>
									<td>${borrow.return_date}</td>
									<td>
										<c:choose>
										<c:when test="${borrow.renew=='Y'}">
											<p style="color: red;">연장불가</p>
										</c:when>
										<c:otherwise>
											<p style="color: black;">연장가능</p>
										</c:otherwise>
										</c:choose>
									</td>
									<td>
<%-- 										<input type="hidden" name="user_id" class="user_id" value="${borrow.user_id}"> --%>
<!-- 										<input type="button" class="detailUserBorrow" value="회원상세"> -->
									</td>
									<td>
<%-- 										<input type="hidden" name="user_id" class="user_id" value="${borrow.user_id}"> --%>
<!-- 										<input type="button" class="detailUserBorrow" value="회원상세"> -->
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div>
				<h3>예약현황</h3>
<%-- 				<p><a href="./myReserve.do?user_id=${sessionScope.loginVo.user_id}">예약현황</a></p> --%>
<!-- 				<div id=""> -->
<%-- 				${reserveList} --%>
<!-- 					<table> -->
<!-- 						<tbody> -->
<!-- 							<tr> -->
<!-- 								<th>제목</th> -->
<!-- 								<th>저자</th> -->
<!-- 								<th>출판사</th> -->
<!-- 								<th>장르</th> -->
<!-- 								<th>예약일</th> -->
<!-- 								<th>반납예정일</th> -->
<!-- 								<th>예약취소</th> -->
<!-- 							</tr> -->
<%-- 							<c:forEach var="book" items="${reserveList}"> --%>
<%-- 							<c:forEach var="r" items="${book.bsVo}"> --%>
<!-- 							<tr> -->
<%-- 								<td>${r.reserve_title}</td> --%>
<%-- 								<td>${book.author}</td> --%>
<%-- 								<td>${book.publisher}</td> --%>
<%-- 								<td>${book.genre_name}</td> --%>
<%-- 								<td>${r.reserve_date}</td> --%>
<%-- 								<td>${r.return_date}</td> --%>
<!-- 								<td> -->
<%-- 									<c:if test="${r.reserve_status=='Y'}"> --%>
<%-- 										<input type="hidden" name="book_seq" class="book_seq" value="${r.book_seq}"> --%>
<%-- 										<input type="hidden" name="user_id" class="user_id" value="${sessionScope.loginVo.user_id}"> --%>
<!-- 										<input type="button" class="cancelReserve" value="예약취소"> -->
<%-- 									</c:if> --%>
<!-- 								</td> -->
<!-- 							</tr> -->
<%-- 							</c:forEach> --%>
<%-- 							</c:forEach> --%>
<!-- 						</tbody> -->
<!-- 					</table> -->
<!-- 				</div> -->
			</div>
		</div>
		<div>
		<h2>내역</h2>
			<div>
				<h3>대출내역</h3>
<%-- 				<p><a href="./myBorrowHistory.do?user_id=${sessionScope.loginVo.user_id}">대출내역</a></p> --%>
<!-- 				<div id="myBorrowHistory"> -->
<!-- 					<table> -->
<!-- 						<tbody> -->
<!-- 							<tr> -->
<!-- 								<th>제목</th> -->
<!-- 								<th>저자</th> -->
<!-- 								<th>출판사</th> -->
<!-- 								<th>장르</th> -->
<!-- 								<th>대출일</th> -->
<!-- 								<th>반납(예정)일</th> -->
<!-- 								<th>대출상태</th> -->
<!-- 							</tr> -->
<%-- 							<c:forEach var="book" items="${borrowHistory}"> --%>
<%-- 							<c:forEach var="b" items="${book.bsVo}"> --%>
<!-- 							<tr> -->
<%-- 								<td>${b.borrow_title}</td> --%>
<%-- 								<td>${book.author}</td> --%>
<%-- 								<td>${book.publisher}</td> --%>
<%-- 								<td>${book.genre_name}</td> --%>
<%-- 								<td>${b.start_date}</td> --%>
<%-- 								<td>${b.return_date}</td> --%>
<%-- 								<td><c:choose> --%>
<%-- <%-- 								<td>${b.borrow_status}</td> --%> --%>
<%-- 									<c:when test="${b.borrow_status=='Y'}"> --%>
<!-- 										<p style="color: red;">대출중</p> -->
<%-- 									</c:when> --%>
<%-- 									<c:otherwise> --%>
<!-- 										<p>반납완료</p> -->
<%-- 									</c:otherwise> --%>
<%-- 								</c:choose></td> --%>
<!-- 							</tr> -->
<%-- 							</c:forEach> --%>
<%-- 							</c:forEach> --%>
<!-- 						</tbody> -->
<!-- 					</table> -->
<!-- 				</div> -->
			</div>
		</div>
	</div>
</div>
<!-- <script type="text/javascript"> -->
// 	function oneUserborrowNow(user_id){
// 		var user_id =  $(this).closest("tr").find(".user_id").val();
// 		console.log(user_id)
		
// 	}
<!-- </script> -->
</body>
<%@include file="footer.jsp" %>
</html>