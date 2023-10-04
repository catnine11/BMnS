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
 .frame {
  width: 90%;
  margin: 40px auto;
  text-align: center;
}
.custom-btn {
  width: 70px;
  height: 35px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}
.btn-8 {
  background-color: #f0ecfc;
background-image: linear-gradient(315deg, #f0ecfc 0%, #c797eb 74%);
  line-height: 42px;
  padding: 0;
  border: none;
}
.btn-8 span {
  position: relative;
  display: block;
  width: 100%;
  height: 100%;
}
.btn-8:before, .btn-8:after {
  position: absolute;
  content: "";
  right: 0;
  bottom: 0;
/*   background: #c797eb; */
  transition: all 0.3s ease;
}
.btn-8:before{
   height: 0%;
   width: 2px;
}
.btn-8:after {
  width: 0%;
  height: 2px;
}
.btn-8:hover:before {
  height: 100%;
}
.btn-8:hover:after {
  width: 100%;
}
#msform {
	width: 400px;
	margin: 50px auto;
	text-align: center;
	position: relative;
}
#msform fieldset {
	background: white;
	border: 1px solid #F5EFFB;
	border-radius: 3px;
	box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
	padding: 20px 30px;
	box-sizing: border-box;
	width: 80%;
	margin: 0 10%;
	position: relative;
}
#msform input, #msform textarea {
	padding: 15px;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-bottom: 10px;
	width: 100%;
	box-sizing: border-box;
	font-family: montserrat;
	color: #2C3E50;
	font-size: 13px;
}

#msform .action-button:hover, #msform .action-button:focus {
	box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}

.fs-subtitle {
	font-weight: normal;
	font-size: 13px;
	color: #666;
	margin-bottom: 20px;
}
</style>
</head>
<%@include file="header.jsp"%>
<body>
	<div id="body">
		<form action="./pwdChk.do" method="post">
			<b>비밀번호</b> <input id="password" name="pwd" type="password" placeholder="비밀번호" >
		<input class="custom-btn btn-8" type="submit" value="확인">
		</form>
	</div>
	
	<!---------------------------------------------------------------------------------------------------->
	<form action="./modifyInfo.do" method="post" id="msform">
	<fieldset  id="nextBody" style="display: none;">
	<div>
	<h2 class="fs-title">회원정보수정</h2>
		비밀번호 변경<br><input id="modifyPwd" name="password" type="password" placeholder="변경할 비밀번호">
									<input id="defaultPwd" name="passwordD" type="hidden" value="${loginVo.user_password }">
		주소 &nbsp;<input size="50" id=modifyAddr name="address" type="text" value="${loginVo.user_address}" readonly="readonly" >
		상세주소 &nbsp;<input type="text" id="detailAddr" name="ModifyAddrD" >
	<button class="custom-btn btn-8" type="submit" id="modifyBtn" onclick="return modiChk()"><span>수정</span></button>
	<button type="button" id="backBtn" class="custom-btn btn-8" onclick="history.back(-1)"><span>취소</span></button>
	</div>
	 </fieldset>
	</form>
	
	
</body>
<%@include file="footer.jsp"%>
<script type="text/javascript" src="./js/modifyUser.js"></script>
</html>