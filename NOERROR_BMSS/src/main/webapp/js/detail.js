/**
 * 
 */
//관리자만 보이게
window.onload = function () {

	var adminOnlyElements = document.getElementsByClassName("adminOnly");
	var userAuth = "${sessionScope.loginVo.user_auth}";
// 	console.log("userAuth: " + userAuth);

	if (userAuth != 'A') {
		for (var i = 0; i < adminOnlyElements.length; i++) {
			adminOnlyElements[i].style.display = "none";
		}
	}else{
		for (var i = 0; i < adminOnlyElements.length; i++) {
			adminOnlyElements[i].style.display = "";
		}
	}
} 
 
 
$(document).ready(function(){
		var userAuth = $("input.user_auth").val();
		console.log("userAuth의 값 : ", userAuth);
		var user_id = $("input.user_id").val();
		console.log("user_id의 값 : ", user_id);
		var penalty_date = $("input.penalty_date").val();
		console.log("penalty_date의 값 : ", penalty_date);
		
	$("input.requestBorrow").on("click", function(){
		console.log('회원의 대출신청');
		
		var book_seq = $(this).closest("tr").find(".book_seq").val();
		var title = $(this).closest("tr").find(".borrow_title").val();
		var reserve_user = $(this).closest("tr").find(".reserve_user").val();
		console.log("book_seq:", book_seq, "제목:", title);
		console.log("예약유저:", reserve_user);
		
		if(userAuth=='U'){

			$.ajax({
				url: "./requestBorrow.do",
				type: "post",
				data: {title : title,
						user_id : user_id,
						book_seq : book_seq
				},
				success: function(){
					
					
					return false;
				},
				error: function(){
					alert('대출신청에 실패했습니다.');
				}
			});
			
			
		}else{
			alert('대출은 회원만 가능합니다. 로그인해주세요');
			location.href="./login.do";
		}
		
		
	});
	
	
	
});