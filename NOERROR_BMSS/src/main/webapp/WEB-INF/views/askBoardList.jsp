<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<%@include file="header.jsp"%>
<body>
	<div style="margin-left: 5%; margin-right: 5%;">
	<input type="button" onclick="location.href='./writeAsk.do'" value="글쓰기" style="float: right; margin-top: 30px;margin-bottom: 5px;">
		<table class="table table-hover" style="margin-top: 5%; border-top: 2px solid #e1e1e1">
			<thead>
				<tr>
					<th scope="col" class="text-center">번호</th>
					<th scope="col" class="text-center">이름</th>
					<th scope="col" class="text-center">제목</th>
					<th scope="col" class="text-center">날짜</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="lists" items="${lists}"  varStatus="vs">
					<tr>
						<td style="width: 10%" class="text-center">${lists.ask_seq}</td>
						<td style="width: 10%" class="text-center">${lists.user_name}</td>
						 <td style="width: 40%; cursor: pointer;" class="text-center" onclick="location.href='./detailAskBoard.do?ask_seq=${lists.ask_seq}&ask_title=${lists.ask_title }&pay_seq=${sessionScope.pSeq}'">${lists.ask_title}</td>
						<td style="width: 20%" class="text-center">${lists.ask_regdate}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
			<input type="hidden" id="pSeq" value="${pSeq}">

	</div>
</body>
<%@include file="footer.jsp"%>
<script type="text/javascript">
        var pSeq = $("#pSeq").val();
        console.log("pSeq 값: ", pSeq);
</script>
</html>