<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
 #body{
 	margin: 10% 45%;
 }
</style>
</head>
<%@include file="header.jsp"%>
<body>
	<div id="body">
		<form>
			비밀번호 <input id="password" name="pwd" type="password" placeholder="비밀번호" >
		<input type="submit" value="확인">
		</form>
	</div>
</body>
<%@include file="footer.jsp"%>
<script type="text/javascript">
$("input[type='submit']").click(function(event){
	event.preventDefault();
	var password = $("input[name='pwd']").val();
	console.log(password);
	$.ajax({
		url:"./pwdChk.do",
		type:"POST",
		data:{
			password:password
		},
		success:function(result){
			console.log(result);
			if(result == "good"){
				var del = confirm("정말 탈퇴 하시겠습니까?.");
				if (del) {
					location.href='./deleteUserForm.do';
				} else {
				  alert("취소하셨습니다. 내정보로 이동합니다.");
				  location.href='./detailUser.do';
				}
			}else{
				alert("비밀번호가 일치하지 않습니다");
				$("input[name='pwd']").val("");
			}
		},
		error: function(){
			alert("비밀번호 확인 중 오류가 발생했습니다");
		}
	});
});
</script>
</html>