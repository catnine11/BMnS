<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판 상세보기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	#divOne{
		border: 1px solid skyblue; 
		margin: 30px;
		padding-bottom: 40px; 
		padding-left: 80px; 
		padding-right: 80px; 
		padding-top: 33px;
	}
	table{
		width: 60%;
		margin: auto;
		border: 1px solid #ccc;
	}
	#modiBtn, #listBtn, #cancleBtn{
		width: 60%;
		margin: 20px 20%;
		background-color: lime;
		border-color: #ccc;
	}
	th, td{
		text-align: center;
	}
</style>
</head>
<%@include file="header.jsp"%>
<body>
	<div id="divOne">
	<input type="hidden" id="seq" name="pay_seq" value="${p_seq }">
        <table class="cell" border="1">
                <tr class="article-title">
                    <th>번호</th>
                    <td colspan="3">${ask_seq}</td>
                </tr>
                <tr class="article-title">
                    <th>이름</th>
                    <td colspan="3">${boardVo.user_name}</td>
                </tr>
                <tr class="article-title">
                    <th>제목</th>
                    <td colspan="3">${ask_title }</td>
                </tr>
                <tr class="article-info">
                    <th>날짜</th>
                    <td>${boardVo.ask_regdate}</td>
                </tr>
                <tr class="article-body" style="height: 600px; ">
                    <td colspan="4">${boardVo.ask_contents}</td>
                </tr>
        </table>
		<input id="listBtn" type="button" onclick="location.href='./askBoardList.do'" value="목록보기" >
		<c:choose>
		<c:when test="${loginVo.user_id eq boardVo.user_id}">
		<input id="modiBtn" type="button" onclick="location.href='./updateForm.do?ask_seq=${ask_seq}&ask_title=${ask_title}'" value="수정하기" style="margin-top: 0px;">
		</c:when>
		<c:when test="${loginVo.user_auth eq 'A'}">
		<input id="cancleBtn" type="button" value="결제취소승인" onclick="cancle()">
		</c:when>
		</c:choose>
       </div>
			<input type="hidden" id="ask_seq" name="ask_seq" value="${ask_seq}">
</body>
<%@include file="footer.jsp"%>
<script type="text/javascript">
var seq = document.getElementById("seq").value;
console.log("pay_seq 값 : ",seq);
function cancle(){
	 $.ajax({
		 type:"post",
		 url:"./canclePayInfo.do",
		 data:{
			 pay_seq : "${pay_seq}"
		 },
		 success:function(result){
			console.log(result);
			alert("환불되었습니다");
			location.href="./payInfo.do";
			 
		 }
	 })
}
</script>
</html>