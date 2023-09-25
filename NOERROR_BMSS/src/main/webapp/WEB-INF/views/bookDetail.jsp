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
<style type="text/css">
	#thumbnail{
		height: 250px;
		width: 200px;
		padding: 10px;
		margin-top: 20px;
	}
	
	li{
		list-style: none;
	}
	
	.info> ul> li{
		display: inline;
	}
	
	.info> ul> li:not(:last-child)::after {
        content: " | ";
        color: #ccc;
	}
	
	table, th, tr, td{
		text-align: center;
	}
	
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/detail.js"></script>
<script type="text/javascript">
// var loginVo = ${sessionScope.loginVo}
// window.onload = function () {

// 	var adminOnlyElements = document.getElementsByClassName("adminOnly");
// 	var userAuth = "${sessionScope.loginVo.user_auth}";
// // 	console.log("userAuth: " + userAuth);

// 	if (userAuth != 'A') {
// 		for (var i = 0; i < adminOnlyElements.length; i++) {
// 			adminOnlyElements[i].style.display = "none";
// 		}
// 	}else{
// 		for (var i = 0; i < adminOnlyElements.length; i++) {
// 			adminOnlyElements[i].style.display = "";
// 		}
// 	}
// }

</script>
</head>
<%@include file="header.jsp" %>
<body>
<%-- ${detail} --%>
${sessionScope.loginVo}
<input type="hidden" name="loginVo" value="${sessionScope.loginVo}">
<input type="hidden" name="user_auth" class="user_auth" value="${sessionScope.loginVo.user_auth}">
<input type="hidden" name="user_id" class="user_id" value="${sessionScope.loginVo.user_id}">
<input type="hidden" name="penalty_date" class="penalty_date" value="${sessionScope.loginVo.penalty_date}">

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
					<div class="adminOnly">
						<input type="button" name="" value="도서정보수정" class="">
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
								&nbsp;&nbsp; 한국십진분류법 : ${detail.genre_code}
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
							<c:when test="${empty detail.content || empty detail.intro || empty detail.review || empty detail.authorinfo}">
								<li>등록된 정보가 없습니다.</li>
							</c:when>
 							<c:otherwise>
								<li>${detail.content}</li>
								<li>${detail.intro}</li>
								<li>${detail.review}</li>
								<li>${detail.authorinfo}</li>
								</c:otherwise>
							</c:choose>
						</ul>
						</div>
					</div>
				</div>
				<div class="seqByBookCode">
				${overdue}
				${cnt}
				${cond}
			<%
				// 현재 날짜를 가져옵니다.
				Date currentDate = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String formattedCurrentDate = sdf.format(currentDate);
				pageContext.setAttribute("currentDate", formattedCurrentDate);
				System.out.println("현재시간"+currentDate);
			%>
			<input type="hidden" class="nowDate" value="${currentDate}">
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
						<c:forEach  var="d" items="${detail.bsVo}">
							<c:choose>
							<c:when test="${sessionScope.loginVo.user_auth=='A'}">
								<tr>
									<td class="adminOnly book_seq">${d.book_seq}</td>
									<td>${detail.genre_name}</td>
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
							</c:when>
							<c:otherwise>
								<c:if test="${d.status_code=='A'}">
									<tr>
										<td class="adminOnly">${d.book_seq}</td>
										<td>${detail.genre_name}</td>
										<td class="adminOnly">${d.status_code}</td>
										<td>
											<c:choose>
											<c:when test="${d.borrow_status == 'Y'}">
												<p style="color: red;">대출중</p>
 											</c:when>
 											</c:choose>
 											<c:choose>
											<c:when test="${d.borrow_status == 'N' || d.borrow_status == null}">
												<input type="hidden" name="borrow_title" class="borrow_title" value="${detail.title}">
												<input type="hidden" name="user_id" class="user_id" value="${sessionScope.loginVo.user_id}">
												<input type="hidden" name="reserve_user" class="reserve_user" value="${d.user_id}">
												<input type="hidden" name="book_seq" class="book_seq" value="${d.book_seq}">
												<input type="button" class="requestBorrow" value="대출신청">
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
												<input type="button" class="requestReserve" value=예약신청>
<%-- 												<button onclick="requestReserve(${d.book_seq})">예약신청</button> --%>
	 										</c:if>
										</td>
										<td class="adminOnly"></td>
									</tr>
								</c:if>					
							</c:otherwise>
							</c:choose>
						</c:forEach>
					</tbody>
				</table>
				</div>
				<div id="modalReserver" class="modal">
					<div class="modal-content">
						<p>예약한 도서를 대출하시겠습니까?</p>
						<button id="nextButton">Y</button>
						<button>N</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

// 	$("input.requestBorrow").on("click", function(){
// 		var book_seq = $(this).closest("tr").find(".book_seq").val();
// 		console.log(book_seq);
		
// 		var userAuth = $("input.user_auth").val();
// 		console.log("userAuth의 값 : ", userAuth);
		
// 	});

// 	function requestBorrow(book_seq){
		
// 		var book_seq = $(this).val();
// 		console.log('선택한 책의 book_seq 값:', book_seq);
		
// 		if(userAuth=='U'){
// 			console.log('회원의 대출신청');
// 			var title = "${detail.title}";
// 			var user_id = "${sessionScope.loginVo.user_id}";
// // 			var book_seq = ;
// 			console.log(title, user_id, book_seq)

// 			$.ajax({
// 				url: "./requestBorrow.do",
// 				type: "post",
// 				data: {title : title,
// 						user_id : user_id,
// 						book_seq : book_seq
// 				},
// 				success: function(){
// 					console.log(data);
// 					return false;
// 				},
// 				error: function(){
// 					alert('대출신청에 실패했습니다.');
// 				}
// 			});
			
			
// 		}else{
// 			alert('대출은 회원만 가능합니다. 로그인해주세요');
// 			location.href="./login.do";
// 		}
// 	}
	
// 	function requestReserve(book_seq){
// 		var userAuth = '${sessionScope.loginVo.user_auth}';
// 		console.log("userAuth");
		
// 		if(userAuth=='U'){
// 			console.log('회원의 예약신청');
			
			
// 		}else{
// 			alert('예약은 회원만 가능합니다. 로그인해주세요');
// 			location.href="./login.do";
// 		}
// 	}
	
	
</script>
</body>
<%@include file="footer.jsp" %>
</html>