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
    </div>
	<div style="margin-left: 5%; margin-right: 5%;">
		<table class="table table-hover" style="margin-top: 5%; border-top: 2px solid #e1e1e1">
			<thead>
				<tr>
					<th scope="col" class="text-center">이름</th>
					<th scope="col" class="text-center">이메일</th>
					<th scope="col" class="text-center">전화번호</th>
					<th scope="col" class="text-center">결제금액</th>
					<th scope="col" class="text-center">결제시간</th>
					<th scope="col" class="text-center">결제상태</th>
					<th scope="col" class="text-center"></th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="lists" items="${lists}"  varStatus="vs">
					<tr>
						<td style="width: 10%" class="text-center">${lists.user_name}</td>
						<td style="width: 20%" class="text-center">${lists.user_email}</td>
						<td style="width: 10%" class="text-center">${lists.user_phone}</td>
						<td style="width: 7%" class="text-center">${lists.pay_money}</td>
						<td style="width: 20%" class="text-center">${lists.pay_time}</td>
						<td style="width: 10%" class="text-center">${lists.pay_status}</td>
						<td style="width: 3%" class="text-center">
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