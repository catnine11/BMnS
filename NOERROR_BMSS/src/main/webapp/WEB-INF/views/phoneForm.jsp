<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴대폰 인증</title>
<style type="text/css">
	body 				 { background:url(https://scotch.io/wp-content/uploads/2014/07/61.jpg); }
.container 		{ 
  font-family:'Roboto';
  width:600px; 
  margin:30px auto 0; 
  display:block; 
  background:#FFF;
  padding:10px 50px 50px;
}
h2 		 { 
  text-align:center; 
  margin-bottom:50px; 
}
h2 small { 
  font-weight:normal; 
  color:#888; 
  display:block; 
}
.group 			  { 
  position:relative; 
  margin-bottom:10px; 
}
input 				{
  font-size:18px;
  padding:10px 10px 10px 5px;
  display:block;
  width:300px;
  border:none;
  border-bottom:1px solid #757575;
}
input:focus 		{ outline:none; }
label 				 {
  color:#999; 
  font-size:18px;
  font-weight:normal;
  position:absolute;
  pointer-events:none;
  left:5px;
  top:10px;
  transition:0.2s ease all; 
  -moz-transition:0.2s ease all; 
  -webkit-transition:0.2s ease all;
}
input:focus ~ label, input:valid ~ label 		{
  top:-20px;
  font-size:14px;
  color:#5264AE;
}
.bar 	{ position:relative; display:block; width:300px; }
.bar:before, .bar:after 	{
  content:'';
  height:2px; 
  width:0;
  bottom:1px; 
  position:absolute;
  background:#5264AE; 
  transition:0.2s ease all; 
  -moz-transition:0.2s ease all; 
  -webkit-transition:0.2s ease all;
}
.bar:before {
  left:50%;
}
.bar:after {
  right:50%; 
}
input:focus ~ .bar:before, input:focus ~ .bar:after {
  width:50%;
}
.highlight {
  position:absolute;
  height:60%; 
  width:100px; 
  top:25%; 
  left:0;
  pointer-events:none;
  opacity:0.5;
}
input:focus ~ .highlight {
  -webkit-animation:inputHighlighter 0.3s ease;
  -moz-animation:inputHighlighter 0.3s ease;
  animation:inputHighlighter 0.3s ease;
}
@-webkit-keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}
@-moz-keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}
@keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}
#bD{
	padding-bottom: 30px;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
window.onload = function() {
  const sendData = JSON.parse(localStorage.getItem('sendData'));

  if (sendData && sendData.phone) {
    const thisPhone = document.getElementById('phone');
    thisPhone.value = sendData.phone;
console.log(thisPhone.value);
  }
};

$(document).ready(function() {
    $("#phoneForm").submit(function(event) {
        event.preventDefault();
        var phone = $("input[name='phone']").val();
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
                	console.log(phone);
                    alert("인증 번호 전송 중 오류가 발생했습니다.");
                }
            },
            error: function() {
            	console.log(phone);
                alert("인증 번호 전송 중 오류가 발생했습니다.");
            }
        });
    });
    
    $("#confirmBtn").click(function(event) {
        event.preventDefault();
        var confirmNum = $("input[name='confirmNum']").val();
        var phone = $("input[name='phone']").val();

        $.ajax({
            url: "./confirm.do",
            type: "POST",
            data: {
                phone: phone,
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
    <form id="phoneForm" action="./phoneChkForm.do" method="post">
      <div class="group">      
        <input id="phone"  name="phone" type="text" required>
        <span class="highlight"></span>
        <span class="bar"></span>
        <label>휴대폰번호</label>
      </div>
      <div id="bD">
        <button id="phoneChk" type="submit">인증번호받기</button>
      </div>
    </form>

    <form id="confirmForm" action="./confirm.do" method="post">
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