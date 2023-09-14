function enterKey(){
	if(window.event.keycode == 13){
		loginCheck();
	}
}

window.onload = function(){
	document.querySelector("button[type=submit]").onclick = function(e){
		console.log("@@@로그인 버튼 클릭@@@");
		e.preventDefault();
		loginCheck();
	}
	
}

function loginCheck(){
	console.log("@@@로그인 검수 실행@@@");
	var email = document.getElementById("email").value;
	var pwd = document.getElementById("password").value;
	console.log("입력받은 아이디,패스워드 값: ", email, pwd);
	
	var form = document.forms[0];
	form.action = "./afterLogin.do";
	form.method = "get";
	
	var regex = /^[a-zA-Z0-9._-]+@[a-z]+\.[a-zA-Z]{2,}$/;
	
	var obj = {
		"email": email,
		"pwd": pwd
	}
	
	objectData.email = "이메일";
	objectData.pwd = "비밀번호";
	console.log("obj 객체 : ",obj);
	
	if(!regex.test(email) && !regex.test(pwd)){
		alert("잘못된 아이디와 비밀번호를 입력하였습니다");
	} else {
		fetch("./loginCheck.do",{
			method : "POST",
			headers : {"Content-Type": "application/json"},
			body:
				JSON.stringify(obj), // 외부에서 javascript 객체를 생성하여 전달
		}).then( 
			response => {
				if(!response.ok){
					throw new Error("검색된 회원의 정보가 없습니다 \n 회원가입해주세요 ");
				} else {
					return response.json();
				}
			}
		).then( 
			data => {
				console.log("반환된 data: ",data);
				location.href='./afterLogin.do';
			}
		).catch((e)=>{ //예외 throw가 발생하면 처리되는 곳
			alert(e.message);
//			function(e){
//				alert(e.message);
//			}
		});
	}
}