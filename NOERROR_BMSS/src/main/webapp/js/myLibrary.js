/**
 * 
 */
 
$(document).ready(function(){
	
	var user_id = $("input.user_id").val();
	console.log("user_id의 값 : ", user_id);
	
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
				},
				error: function(){
					alert('대출신청에 실패했습니다.');
				}
		});
	});
	
	
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
				},
				error: function(){
					alert('예약취소를 다시 진행해주세요');
				}
		});
	
	});
	
	
});


