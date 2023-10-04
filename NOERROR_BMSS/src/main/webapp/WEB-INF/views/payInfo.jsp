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
					<th scope="col" class="text-center">결제번호</th>
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
					<tr id="tr-hover">
						<td style="width: 10%" class="text-center">${lists.pay_seq}</td>
						<td style="width: 10%" class="text-center">${loginVo.user_name}</td>
						<td style="width: 20%" class="text-center">${loginVo.user_email}</td>
						<td style="width: 10%" class="text-center">${loginVo.user_phone}</td>
						<td style="width: 10%" class="text-center">${lists.pay_money}</td>
						<td style="width: 20%" class="text-center">${lists.pay_time}</td>
						<td style="width: 10%" class="text-center">${psVo}</td>
						<td style="width: 10%" class="text-center"><input class="custom-btn btn-8"  type="button" value="결제상세" onclick="location.href='detailPay.do?pay_seq=${lists.pay_seq}'"></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
	
	
	<div id="paging"  style="margin-left: auto; margin-right: auto; text-align: center;">
		<c:if test="${pPageVo.totalPage > 1}">
            <ul class="pagination justify-content-center" id="pg" style="background-color: #F5EFFB; border-color: #F5EFFB;">
                <c:if test="${pPageVo.startPage > 1}">
                    <li class="page-item"><a  id="pgl" class="page-link" href="./payInfo.do?page=1">처음</a></li>
                </c:if>
                <c:choose>
            <c:when test="${pPageVo.startPage > 5}">
                <li class="page-item"><a  id="pgl" class="page-link" href="./payInfo.do?page=${pPageVo.startPage-5}">◁</a></li>
            </c:when>
        </c:choose>
                <c:forEach begin="${pPageVo.startPage}" end="${pPageVo.endPage}" var="i">
                    <c:choose>
                        <c:when test="${i == pPageVo.page}">
                            <li id="pgi" class="page-item active"><span  id="pgl" class="page-link">${i}</span></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a  id="pgl" class="page-link" href="./payInfo.do?page=${i}">${i}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
		<c:if test="${pPageVo.endPage < pPageVo.totalPage}">
            <li class="page-item"><a id="pgl" class="page-link" href="./payInfo.do?page=${pPageVo.startPage+pPageVo.countPage}">▷</a></li>
        </c:if>
                <c:if test="${pPageVo.endPage < pPageVo.totalPage}">
                    <li class="page-item"><a  id="pgl" class="page-link" href="./payInfo.do?page=${pPageVo.totalPage}">마지막</a></li>
                </c:if>
            </ul>
        </c:if>
</div>
	
	
</body>
<%@include file="footer.jsp"%>
</html>