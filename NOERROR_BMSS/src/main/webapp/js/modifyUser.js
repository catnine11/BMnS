window.onload = function(){
    document.getElementById("modifyAddr").addEventListener("click", function(){ 
        new daum.Postcode({
            oncomplete: function(data) {
                document.getElementById("modifyAddr").value = data.address; 
                document.querySelector("#detailAddr").focus(); 
            }
        }).open();
    });
};

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
				$("#body").css('display','none');
				$("#nextBody").css('display','block');
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
function modiChk(){
	var password = document.getElementById("modifyPwd").value;
	var address = document.getElementById("modifyAddr").value;
	var dAddress = document.getElementById("detailAddr").value;
	var pwdChk = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
if(password == ""){
		alert("비밀번호을 작성해 주세요");
		document.getElementById("modifyPwd").focus();
		return false;
	}
	if(!pwdChk.test(password)){
		alert("패스워드는 8자리이상 16자리이하 영문,숫자,특수문자를 포함해야 합니다");
		document.getElementById("modifyPwd").focus();
		return false;
	}
	
}
