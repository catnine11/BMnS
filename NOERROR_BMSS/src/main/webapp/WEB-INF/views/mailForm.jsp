<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증</title>
<link rel="stylesheet" href="./css/popup.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
window.onload = function() {
  const sendData = JSON.parse(localStorage.getItem('sendData'));

  if (sendData && sendData.email) {
    const thisEmail = document.getElementById('email');
    thisEmail.value = sendData.email;
console.log(thisEmail.value);
  }
};

$(document).ready(function() {
    $("#emailForm").submit(function(event) {
        event.preventDefault();
        var email = $("input[name='email']").val();
        $.ajax({
            url: "./sendRandomCode.do",
            type: "POST",
            data: {
                email: email
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
    
    $("#confirmBtn").click(function(event) {
        event.preventDefault();
        var confirmNum = $("input[name='confirmNum']").val();
        var email = $("input[name='email']").val();

        $.ajax({
            url: "./verifyCode.do",
            type: "POST",
            data: {
                email: email,
                confirmNum: confirmNum
            },
            success: function(response) {
                if (response === "Success") {
                    console.log(confirmNum);
                    alert("인증이 완료되었습니다.");
                    localStorage.setItem('verified', 'true');
                    window.close();
                } else {
                    alert("인증번호가 일치하지 않습니다.");
                    console.log(confirmNum);
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
</head>
<body>
  <div class="container">
    <form id="emailForm" action="./sendRandomCode.do" method="post">
      <div class="group">      
        <input id="email"  name="email" type="text" required>
        <span class="highlight"></span>
        <span class="bar"></span>
        <label>이메일</label>
      </div>
      <div id="bD">
        <button id="emailChk" type="submit">인증번호받기</button>
      </div>
    </form>

    <form id="verifyCodeForm" action="./verifyCode.do" method="post">
      <div class="group">      
        <input type="text" required name="confirmNum"> 
        <span class="highlight"></span>
        <span class="bar"></span>
        <label>인증번호</label>
      </div>
      <div id="bD">
        <button type="submit" id="confirmBtn">인증번호확인</button>
      </div>
    </form>
  </div>

</body>
</html>