<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
 #body{
 	margin: 10% 45%;
 }
</style>
</head>
<%@include file="header.jsp"%>
<body>
	<div id="body">
		<form action="./pwdChk.do" method="post">
			비밀번호 <input id="password" name="pwd" type="password" placeholder="비밀번호" >
		<input type="submit" value="확인">
		</form>
	</div>
	
	<!---------------------------------------------------------------------------------------------------->
	<form action="./modifyInfo.do" method="post">
	<div id="nextBody" style="display: none;">
		비밀번호 변경&nbsp;<input id="modifyPwd" type="password" placeholder="변경할 비밀번호">
		<br>
		주소 &nbsp;<input size="50" id=modifyAddr type="text" value="${loginVo.user_address}" readonly="readonly" >
		<br>
		상세주소 &nbsp;<input type="text" id="detailAddr" name="ModifyAddrD" >
	<br><input type="submit" id="modifyBtn" value="수정" onclick="modiChk()">
	<input type="button" id="backBtn" value="취소" onclick="history.back(-1)">
	</div>
	</form>
	
<footer class="footer">	
<%@include file="footer.jsp"%>
</footer>	
</body>
<script type="text/javascript" src="./js/modifyUser.js"></script>
</html>