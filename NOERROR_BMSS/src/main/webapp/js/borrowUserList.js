/**
 * 
 */

$(document).ready(function(){
	
	var user_id = $(this).closest("tr").find(".user_id").val();
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
});
	