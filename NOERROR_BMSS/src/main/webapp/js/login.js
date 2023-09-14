// function enterKey(){
//	if(window.event.keyCode == 13){
//		loginCheck();
//	}
//}
//
//window.onload = function(){
//	document.querySelector("button[type=submit]").onclick = function(e){
//		console.log("@@@로그인 버튼 클릭@@@");
//		e.preventDefault();
//		loginCheck();
//	}
//	
//}
//
//function loginCheck(){
//	console.log("@@@로그인 검수 실행@@@");
//	var email = document.getElementById("email").value;
//	var pwd = document.getElementById("password").value;
//	console.log("입력받은 아이디,패스워드 값: ", email, pwd);
//	
//	var form = document.forms[0];
//	form.action = "./afterLogin.do";
//	form.method = "get";
//	
//	var regexE = /^[a-zA-Z0-9._-]+@[a-z]+\.[a-zA-Z]{2,}$/;
//	var regexP = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
//	
//	var obj = {
//		"email": email,
//		"pwd": pwd
//	}
//	
//	if(!regexE.test(email) && !regexP.test(pwd)){
//		alert("잘못된 아이디와 비밀번호를 입력하였습니다");
//	} else {
//		fetch("./loginCheck.do",{
//			method : "POST",
//			headers : {"Content-Type": "application/json"},
//			body:
//				JSON.stringify(obj),
//		}).then( 
//			response => {
//				if(!response.ok){
//					throw new Error("검색된 회원의 정보가 없습니다 \n 회원가입해주세요 ");
//				} else {
//					return response.json();
//				}
//			}
//		).then( 
//			data => {
//				console.log("반환된 data: ",data);
//				location.href='./afterLogin.do';
//			}
//		).catch((e)=>{ 
//			alert(e.message);
//		});
//	}
//}