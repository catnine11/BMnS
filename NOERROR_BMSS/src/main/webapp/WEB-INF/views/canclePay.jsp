<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제취소문의</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<%@include file="header.jsp"%>
<body>
	

</body>
<%@include file="footer.jsp"%>
<script type="text/javascript">
function cancle(){
	 $.ajax({
		 type:"post",
		 url:"./canclePayInfo.do",
		 success:function(result){
			console.log(result);
			alert("환불되었습니다");
			location.href="./payInfo.do";
			 
		 }
	 })
}

//결제정보 확인
function doCheck(){
	 $.ajax({
		 type:"post",
		 url:"./payment/payInfo",
		 success:function(result){
			 console.log(result);
			 location.href="./payment/moveNext";
		 }
	 })
}

</script>
</html>