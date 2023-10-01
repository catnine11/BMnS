/**
 * 
 */
 
$(document).ready(function(){
	
	var user_id = $("input.user_id").val();
//	var user_id = $(this).closest("tr").find(".user_id").val();
	console.log("user_id의 값 : ", user_id);
	
	//연장
	$("input.renew").on("click", function(){
		console.log('회원의 연장신청');
		
		var book_seq = $(this).closest("tr").find(".book_seq").val();
		console.log("book_seq:", book_seq);
		
		$.ajax({
				url: "./renew.do",
				type: "post",
				data: {
						book_seq : book_seq
					},
				success: function(){
					alert('대출기간이 7일 연장되었습니다.');
					location.reload();
				},
				error: function(){
					alert('연장은 대출이 7일 미만으로 남았을때, 예약회원이 없는 경우만 가능합니다.');
				}
		});
	});
	
	//예약취소
	$("input.cancelReserve").on("click", function(){
		console.log('회원의 예약취소');
		
		var book_seq = $(this).closest("tr").find(".book_seq").val();
		console.log("book_seq:", book_seq);
		
		
		$.ajax({
				url: "./cancelMyReserve.do",
				type: "post",
				data: {
						user_id : user_id,
						book_seq : book_seq
					},
				success: function(){
					alert('예약취소 완료');
					location.reload();
				},
				error: function(){
					alert('예약취소를 다시 진행해주세요');
				}
		});
	
	});
	
});

$(document).ready(function(){
	//예약회원의 대출신청
	$("input.requestBorrow").on("click", function(){
	
	var user_id = $("input.user_id").val();
	console.log("user_id의 값 : ", user_id);
	var penalty_val = $("input.penalty_date").val();
	var penalty_date = new Date(penalty_val);
	console.log("penalty_date의 값 : ", penalty_date);
	var currentDate = new Date();
	console.log("현재시간 : ",currentDate);
	
	var book_seq = $(this).closest("tr").find(".book_seq").val();
	var title = $(this).closest("tr").find(".borrow_title").val();
	var reserve_user = $(this).closest("tr").find(".reserve_user").val();
	console.log("book_seq:", book_seq, ", 제목:", title);
	console.log("예약유저:", reserve_user);
	
	console.log('예약회원의 대출신청');
		openModal();
		var modal = document.getElementById("modalReserver");
		var nextButton = document.getElementById("nextButton");
		nextButton.addEventListener("click", function () {
			modal.style.display = "none";
			
			if(penalty_date>currentDate){
				alert('연체회원입니다. '+penalty_val+'일까지 도서를 대출할 수 없습니다');
				return false;
			}else{
	
				$.ajax({
					url: "./borrowForReserver.do",
					type: "post",
					data: {title : title,
							user_id : user_id,
							book_seq : book_seq
					},
					success: function(data){
						console.log(data);
						console.log(data.msg);
						console.log(data.cnt);
						
						switch(data.msg){
							case '1' :console.log("대출 실패-책 4권까지만 대출 가능");
								alert('4권까지만 대출이 가능합니다. 도서반납 후 이용해주세요')
										 break;
							case '2' :console.log("대출 완료"); 
								alert('대출이 완료되었습니다. 현재 대여한 도서는 '+(data.cnt+1)+'권, 앞으로 '+(3-data.cnt)+'권 더 대출 가능합니다. 도서를 2주 뒤까지 반납해주세요');
								
										location.reload();
										break;
						}
						
					},
					error: function(){
						alert('대출신청에 실패했습니다.');
					}
				});
			}
		
		});
	
	
	});
});




