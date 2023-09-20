<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<%@include file="header.jsp"%>
<body>

	<div style="margin-left: 5%; margin-right: 5%;">
	<h2>내 정보</h2>
		<table class="table table-hover" style="margin-top: 5%; border-top: 2px solid #e1e1e1">
			<thead>
				<tr>
					<th scope="col" class="text-center">이름</th>
					<th scope="col" class="text-center">이메일</th>
					<th scope="col" class="text-center">전화번호</th>
					<th scope="col" class="text-center">생년월일</th>
					<th scope="col" class="text-center">주소</th>
					<th scope="col" class="text-center">가입날짜</th>
					<th scope="col" class="text-center">패널티 현황</th>
					<th scope="col" class="text-center"></th>
				</tr>
			</thead>
			<tbody>

					<tr>
						<!-- 				<td style="width: 5%"><a class="text-reset">asdasd</a></td> -->
						<td style="width: 10%" class="text-center">${loginVo.user_name}</td>
						<td style="width: 20%" class="text-center">${loginVo.user_email}</td>
						<td style="width: 10%" class="text-center">${loginVo.user_phone}</td>
						<td style="width: 10%" class="text-center">${loginVo.user_birth}</td>
						<td style="width: 20%" class="text-center">${loginVo.user_address}</td>
						<td style="width: 10%" class="text-center">${loginVo.user_joindate}</td>
						<c:choose>
						<c:when test="${loginVo.penalty_date eq null}">
							<td style="width: 10%" class="text-center"><b>없음</b></td>
						</c:when>
						<c:otherwise>
						<td style="width: 10%; color: red;" class="text-center">${loginVo.penalty_date}</td>
						</c:otherwise>
						</c:choose>
						<td style="width: 3%" class="text-center"><input
							type="button" value="대출정보" onclick="location.href='#'"> <input
							type="button" value="예약정보" onclick="location.href='#'"> <input
							type="button" value="결제정보" onclick="location.href='#'"></td>
					</tr>
			</tbody>
		</table>

		<p class="text-center">
				<button id="modifyBtn" name="modify" onclick="location.href='./modifyUser.do'">정보수정</button>
				<button id="deleteBtn" name="delete" onclick="location.href='./deleteUser.do'">회원탈퇴</button>
			<a class="text-reset" href="/boardChat?requestedPage="></a>&nbsp;&nbsp;
		</p>
		
    <a href="./myLibrary.do">내 서재</a>

	</div>
</body>
<%@include file="footer.jsp"%>
</html>