/**
 * 
 */
//관리자만 보이게
window.onload = function () {

	var adminOnlyElements = document.getElementsByClassName("adminOnly");
	var userAuth = $("input.user_auth").val();
		console.log("userAuth의 값 : ", userAuth);

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
	$("#borrowStatus").on("change","select.changeBookStatus",function(){
		
		var status_code=$(this).closest("tr").find(".changeBookStatus").find("option:selected").val();
		var book_seq=$(this).closest("tr").find(".book_seq").text();
				
			console.log("도서상태 : ", status_code);
			console.log("도서seq: ",book_seq);
			$.ajax({
				method:"post",
				url:"./chageBookStatus.do",
				data:{book_seq:book_seq,status_code:status_code},
				success:function(){
					alert("도서상태 변경을 완료했습니다.");
				},
				error:function(){
					alert("도서상태 변경에 실패했습니다.");
				}
			})
	});
});
 
 
var modal = document.getElementsByClassName("modal");
// 모달을 표시하는 함수
function showModal() {
	modal.style.display = "block";
}

 
$(document).ready(function(){
		var userAuth = $("input.user_auth").val();
		console.log("userAuth의 값 : ", userAuth);
		var user_id = $("input.user_id").val();
		console.log("user_id의 값 : ", user_id);
		var penalty_date = $("input.penalty_date").val();
		console.log("penalty_date의 값 : ", penalty_date);
		var currentDate = $("input.nowDate").val();
		console.log(currentDate);
		
		
	$("input.requestBorrow").on("click", function(){
		console.log('회원의 대출신청');
		
		var book_seq = $(this).closest("tr").find(".book_seq").val();
		var title = $(this).closest("tr").find(".borrow_title").val();
		var reserve_user = $(this).closest("tr").find(".reserve_user").val();
		console.log("book_seq:", book_seq, "제목:", title);
		console.log("예약유저:", reserve_user);
		
		if(userAuth=='U'){

			if(reserve_user==user_id){
				var nextButton = document.getElementById("nextButton");
				nextButton.addEventListener("click", function () {
					modal.style.display = "none";
	
					$.ajax({
						url: "./borrowReserver.do",
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
				});
				
			}else if(!reserve_user || reserve_user.trim() === ""){
				
				if(penalty_date>currentDate){
					alert('연체회원입니다. '+penalty_date+'일까지 도서를 대출할 수 없습니다');
					return false;
				}else{
					
					$.ajax({
						url: "./requestBorrow.do",
						type: "post",
						data: {title : title,
								user_id : user_id,
								book_seq : book_seq
						},
						success: function(){
							alert('도서를 2주 뒤까지 반납해주세요.')
							
						},
						error: function(){
							alert('대출신청에 실패했습니다.');
						}
					});
					
				}
			}else{
				alert('예약중인 도서는 예약자만 대출이 가능합니다.')
			}
			
		}else{
			alert('대출은 회원만 가능합니다. 로그인해주세요');
			location.href="./login.do";
		}
		
	});
	
	
	
	
	
});