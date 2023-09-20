<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
<link rel="stylesheet" href="./css/popup.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<body>
	 <div class="container" style="width: 350px;">
      <form id="findPassword" action="./findPwdChk.do" method="post">
      <div class="group">   
        <input id="email"  name="email" type="text"  required="required">
        <span class="highlight"></span>
        <span class="bar"></span>
        <label>이메일</label>
      </div>
      <div class="group">      
        <input type="text"  id="ip2" name="confirmNum" required="required"> 
        <span class="highlight"></span>
        <span class="bar"></span>
        <label>휴대폰 번호</label>
      </div>
		<div id="bD">
        <button id="phoneChk" type="submit">인증번호받기</button>
      </div>
      </form>
      
    <form id="numChk" action="./numChk.do" method="post">
      <div class="group">      
        <input type="text" required name="chkNum"> 
        <span class="highlight"></span>
        <span class="bar"></span>
        <label>인증번호</label>
      </div>
      <div id="bD">
        <button type="submit" id="chkBtn">인증번호확인</button>
      </div>
    </form>
  </div>
</body>
<script type="text/javascript">
$(document).ready(function() {
    $("#findPassword").submit(function(event) {
        event.preventDefault();
        var phone = $("#ip2").val();
        $.ajax({
            url: "./phoneChkForm.do",
            type: "POST",
            data: {
                phone: phone
            },
            success: function(response) {
                if (response === "Success") {
                    alert("인증 번호가 전송되었습니다.");
                } else {
                    alert("인증 번호 전송 중 오류가 발생했습니다.");
                }
            },
            error: function() {
                alert("인증 번호 전송 중 오류가 발생했습니다.");
            }
        });
    });
    
    $("#chkBtn").click(function(event) {
        event.preventDefault();
        var confirmNum = $("input[name='chkNum']").val();
        var phone = $("#ip2").val();
        var email = $("#email").val()

        $.ajax({
            url: "./numCheck.do",
            type: "POST",
            data: {
            	phone: phone,
            	email:email,
                confirmNum: confirmNum
            },
            success: function(msg) {
                if (msg === "") {
                    alert("인증번호가 일치하지 않습니다.");
                    console.log(confirmNum);
                } else {
                	console.log(confirmNum);
                    alert("인증이 완료되었습니다.");
                    localStorage.setItem('verified', 'true');
                    alert("비밀번호가 초기화 되었습니다 \n 회원정보에 입력된 이메일로 비밀번호가 발송되었습니다.");
                    window.close();
                }
            },
            error: function() {
                alert("인증번호 확인 중 오류가 발생했습니다.");
                console.log(confirmNum);
            }
        });
    });
});
</script>
</body>
</html>