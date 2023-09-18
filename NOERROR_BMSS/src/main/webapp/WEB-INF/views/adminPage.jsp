<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<link rel="stylesheet" href="./css/adminPage.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/ionicons@4.4.1/dist/ionicons.js"></script>
</head>
<%@include file="header.jsp"%>
<body>
	<div class="search" style="float: right; margin-right: 5%; margin-top: 5%; margin-bottom: 5px;">
      <input type="text" class="search__input" placeholder="검색">
      <div class="search__icon">
        <ion-icon name="search"></ion-icon>
      </div>
    </div>
	<div style="margin-left: 5%; margin-right: 5%;">
		<table class="table table-hover" style="margin-top: 5%; border-top: 2px solid #e1e1e1">
			<thead>
				<tr>
					<th scope="col" class="text-center">유저번호</th>
					<th scope="col" class="text-center">이름</th>
					<th scope="col" class="text-center">이메일</th>
					<th scope="col" class="text-center">전화번호</th>
					<th scope="col" class="text-center">주소</th>
					<th scope="col" class="text-center">가입날짜</th>
					<th scope="col" class="text-center">패널티 현황</th>
					<th scope="col" class="text-center">로그인 유형</th>
					<th scope="col" class="text-center"></th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="lists" items="${lists}"  varStatus="vs">
					<tr>
						<!-- 				<td style="width: 5%"><a class="text-reset">asdasd</a></td> -->
						<td style="width: 7%" class="text-center">${lists.user_id}</td>
						<td style="width: 10%" class="text-center">${lists.user_name}</td>
						<td style="width: 20%" class="text-center">${lists.user_email}</td>
						<td style="width: 10%" class="text-center">${lists.user_phone}</td>
						<td style="width: 20%" class="text-center">${lists.user_address}</td>
						<td style="width: 10%" class="text-center">${lists.user_joindate}</td>
						<td style="width: 10%" class="text-center">${lists.penalty_date}</td>
						<td style="width: 10%" class="text-center">${lists.gubun}</td>
						<td style="width: 3%" class="text-center"><input
							type="button" value="대출정보" onclick="location.href='#'"> <input
							type="button" value="예약정보" onclick="location.href='#'"> <input
							type="button" value="결제정보" onclick="location.href='#'"></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>

		<p class="text-center">


			<a class="text-reset" href="/boardChat?requestedPage="></a>&nbsp;&nbsp;

		</p>
	</div>
</body>
<%@include file="footer.jsp"%>
</html>