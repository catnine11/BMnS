window.onload = function(){
    document.getElementById("address").addEventListener("click", function(){ 
        new daum.Postcode({
            oncomplete: function(data) {
                document.getElementById("address").value = data.address; 
                document.querySelector("input[name=addressDetail]").focus(); 
            }
        }).open();
    });
};
function checkInfo(){
	var name = document.getElementById("name").value;
	var email = document.getElementById("email").value;
	var password = document.getElementById("password").value;
	var phone = document.getElementById("phone").value;
	var birth = document.getElementById("birth").value;
	var address = document.getElementById("address").value;
	var dAddress = document.getElementById("dAddress").value;
	var emailChk = /^[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z]{2,3}$/;
	var pwdChk = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
	var phoneChk = /^\d{9,11}$/;
	console.log("입력된 값 이름:",name,"\n","이메일 :",email,"\n","비번 :",password,"\n","전번 :",phone,"\n","생일 :",birth,"\n","주소 :",address,dAddress);
	if(name == ""){
		alert("이름을 작성해 주세요");
		document.getElementById("name").focus();
		return false;
	}
	if(name.length > 9){
		alert("이름은 9자 이하여야 합니다");
		document.getElementById("name").focus();
		return false;
	}
	//이메일 인증에
	if(!emailChk.test(email)){
		alert("이메일 형식에 맞게 입력해 주세요");
		return false;
	}
	if(email == ""){
		alert("이메일을 작성해 주세요");
		document.getElementById("email").focus();
		return false;
	}
	if(password == ""){
		alert("비밀번호을 작성해 주세요");
		document.getElementById("password").focus();
		return false;
	}
	if(!pwdChk.test(password)){
		alert("패스워드는 8자리이상 16자리이하 영문,숫자,특수문자를 포함해야 합니다");
		document.getElementById("password").focus();
		return false;
	}
	if(phone == ""){
		alert("전화번호를 작성해 주세요");
		document.getElementById("phone").focus();
		return false;
	}
	if(!phoneChk.test(phone)){
		alert("정확한 전화번호를 입력해 주세요");
		return false;
	}
	if(birth == "" || birth.length > 8 || birth.length < 8){
		alert("생년월일 8자리를 작성해 주세요");
		document.getElementById("birth").focus();
		return false;
	}
	if(address == ""){
		alert("주소를 입력해 주세요");
		document.getElementById("address").focus();
		return false;
	}
	if(dAddress == ""){
		alert("상세주소를 작성해 주세요");
		document.getElementById("dAddress").focus();
		return false;
	}
	


};



function emailChk() {
    var width = '700';
    var height = '500';
    var left = Math.ceil(( window.screen.width - width )/2);
    var top = Math.ceil(( window.screen.height - height )/2); 
// 	var userEmail = opener.document.getElementById("email").value;
	const userEmail = document.getElementById('email').value;
	const sendData = { email: userEmail };
	localStorage.setItem('sendData', JSON.stringify(sendData));
    window.open('./emailChk.do', '이메일인증', 'width='+ width +', height='+ height +', left=' + left + ', top='+ top );
 
};

function phoneChk(){
	var width = '700';
    var height = '500';
    var left = Math.ceil(( window.screen.width - width )/2);
    var top = Math.ceil(( window.screen.height - height )/2); 
    const userPhone = document.getElementById('phone').value;
	const sendData = { phone: userPhone };
	localStorage.setItem('sendData', JSON.stringify(sendData));
    window.open('./phoneChk.do', '휴대폰인증', 'width='+ width +', height='+ height +', left=' + left + ', top='+ top );
 
}





