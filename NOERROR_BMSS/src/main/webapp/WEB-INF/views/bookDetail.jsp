<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOERROR 책 상세페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/bookDetail.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/bookDetail.js"></script>
</head>
<%@include file="header.jsp" %>
<body>
<%-- ${sessionScope.loginVo} --%>
<input type="hidden" name="loginVo" value="${sessionScope.loginVo}">
<input type="hidden" name="user_auth" class="user_auth" value="${sessionScope.loginVo.user_auth}">
<input type="hidden" name="user_id" class="user_id" value="${sessionScope.loginVo.user_id}">
<input type="hidden" name="penalty_date" class="penalty_date" value="${sessionScope.loginVo.penalty_date}">

<div class="container">
	<div class="title">
		<h2>상세정보</h2>
	</div>
	<div class="">
<%-- 		${detail} --%>
		<div class="outline">
			<div class="bookinfo">
				<div class="thumb">
					<img id="thumbnail" src="${detail.thumbnail}" alt="${detail.title}">
				</div>
				<div class="binfo">
					<div class="adminOnly">
<!-- 						<input type="button" name="" value="도서정보수정" class="custom-btn btn-8"> -->
					</div>
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
								<c:choose>
									<c:when test="${detail.genre_code==0}">
									&nbsp;&nbsp; 한국십진분류법 : 000
									</c:when>
									<c:otherwise>
									&nbsp;&nbsp; 한국십진분류법 : ${detail.genre_code}
									</c:otherwise>
								</c:choose>
							</li>
							<li>
								 ${detail.genre_name}
							</li>
						</ul>
						<div>
						<ul>
							<li>
								<strong>추가정보</strong>
							</li>
							<c:choose>
							<c:when test="${empty detail.content && empty detail.intro && empty detail.review && empty detail.authorinfo}">
								<li>등록된 정보가 없습니다.</li>
							</c:when>
 							<c:otherwise>
								<li><div>
									<strong>목차</strong>
								&nbsp;&nbsp; ${detail.content}</div></li>
								<li><div>
									<strong>책 소개</strong>
								&nbsp;&nbsp; ${detail.intro}</div></li>
								<li><div>
									<strong>서평</strong>
								&nbsp;&nbsp; ${detail.review}</div></li>
								<li><div>
									<strong>저자소개</strong>
								&nbsp;&nbsp; ${detail.authorinfo}</div></li>
								</c:otherwise>
							</c:choose>
						</ul>
						</div>
					</div>
				</div>
				<div class="seqByBookCode">
				${cnt}
<%-- 				${detail}<br> --%>
<%-- 				${detail.bsVo}<br> --%>

			<input type="hidden" class="nowDate" value="${currentDate}">
<%-- 			${status} --%>
				<c:choose>
					<c:when test="${empty status && sessionScope.loginVo.user_auth!='A'}">
						<b>현재 대출 또는 예약 가능한 책이 없습니다.</b>
					</c:when>
				<c:otherwise>
				
				<table>
					<tbody id="borrowStatus">
						<tr>
							<th class="adminOnly">관리번호</th>
							<th>장르</th>
							<th class="adminOnly">도서상태</th>
							<th>대출상태</th>
							<th>반납예정일</th>
							<th>예약상태</th>
							<th class="adminOnly">도서상태변경</th>
						</tr>
<%-- 						<c:forEach  var="d" items="${status.bsVo}"> --%>
							<c:choose>
							<c:when test="${sessionScope.loginVo.user_auth=='A'}">
								<c:forEach  var="d" items="${detail.bsVo}">
								<tr>
									<td class="adminOnly book_seq">${d.book_seq}</td>
									<td>${status.genre_name}</td>
									<td class="adminOnly status_code">${d.status_code}</td>
									<td>${d.borrow_status}</td>
									<td>${d.return_date}</td>
									<td>${d.reserve_status}</td>
									<td class="adminOnly">
										<select class="changeBookStatus" name="status_code">                                        
											<option value="A" ${d.status_code =="A"? "selected": ""}>일반</option>
											<option value="B" ${d.status_code =="B"? "selected": ""}>재고</option>
											<option value="C" ${d.status_code =="C"? "selected": ""}>분실</option>
											<option value="D" ${d.status_code =="D"? "selected": ""}>파손</option>
											<option value="E" ${d.status_code =="E"? "selected": ""}>예정</option>
										</select>
									</td>
								</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
							<c:forEach  var="d" items="${status.bsVo}">
								<c:if test="${d.status_code=='A'}">
									<tr>
										<td class="adminOnly">${d.book_seq}</td>
										<td>${status.genre_name}</td>
										<td class="adminOnly">${d.status_code}</td>
										<td>
											<c:choose>
											<c:when test="${d.borrow_status == 'Y'}">
												<p style="color: red;">대출중</p>
 											</c:when>
 											</c:choose>
 											<c:choose>
											<c:when test="${d.borrow_status == 'N' || d.borrow_status == null}">
												<input type="hidden" name="borrow_title" class="borrow_title" value="${status.title}">
												<input type="hidden" name="user_id" class="user_id" value="${sessionScope.loginVo.user_id}">
												<input type="hidden" name="reserve_user" class="reserve_user" value="${d.user_id}">
												<input type="hidden" name="book_seq" class="book_seq" value="${d.book_seq}">
												<input type="button" class="requestBorrow custom-btn btn-8 btn-sm" value="대출신청">
 											</c:when>
 											</c:choose>
										</td>
										<td>
											<c:if test="${d.borrow_status == 'Y'}">
<!-- 												<p style="color: red;">대출중</p> -->
												${d.return_date}
 											</c:if>				
										</td>
										<td>
											<c:if test="${d.reserve_status == 'Y'}">
												<p style="color: red;">예약중</p>
	 										</c:if>
											<c:if test="${d.reserve_status == 'N' || d.reserve_status == null}">
												<input type="hidden" name="book_seq" class="book_seq" value="${d.book_seq}">
												<input type="hidden" name="borrow_status" class="borrow_status" value="${d.borrow_status}">
												<input type="hidden" name="reserve_title" class="reserve_title" value="${status.title}">
												<input type="button" class="requestReserve custom-btn btn-8 btn-sm" value="예약신청">
		 									</c:if>
										</td>
										<td class="adminOnly"></td>
									</tr>
								</c:if>		
								</c:forEach>			
							</c:otherwise>
							</c:choose>
<%-- 						</c:forEach> --%>
					</tbody>
				</table>
				</c:otherwise>
				</c:choose>
				</div>
				<div id="modalReserver" class="modal">
					<div class="modal-content">
						<p>예약한 도서를 대출하시겠습니까?</p>
						<button id="nextButton" class="custom-btn btn-8">Y</button>
						<button onclick="closeModal()" class="custom-btn btn-8">N</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	
	function openModal() {
	  var modal = document.getElementById("modalReserver");
	  modal.style.display = "block";
	}
	
	function closeModal(){
		var modal = document.getElementById("modalReserver");
		modal.style.display = "none";
	}
	
	window.onclick = function (event) {
		  var modal = document.getElementById("modalReserver");
		  if (event.target == modal) {
		    modal.style.display = "none";
		  }
	};
	
</script>
</body>
<%@include file="footer.jsp" %>
</html>