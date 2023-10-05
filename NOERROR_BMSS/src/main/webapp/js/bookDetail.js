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

//관리자의 도서상태변경
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
					location.reload();
				},
				error:function(){
					alert("도서상태 변경에 실패했습니다.");
				}
			})
	});
});
 
 
$(document).ready(function(){
		var userAuth = $("input.user_auth").val();
		console.log("userAuth의 값 : ", userAuth);
		var user_id = $("input.user_id").val();
		console.log("user_id의 값 : ", user_id);
		var penalty_val = $("input.penalty_date").val();
		var penalty_date = new Date(penalty_val);
		console.log("penalty_date의 값 : ", penalty_date);
		var currentDate = new Date();
		console.log("현재시간 : ",currentDate);
		
	//대출신청
	$("input.requestBorrow").on("click", function(){
		
		var book_seq = $(this).closest("tr").find(".book_seq").val();
		var title = $(this).closest("tr").find(".borrow_title").val();
		var reserve_user = $(this).closest("tr").find(".reserve_user").val();
		console.log("book_seq:", book_seq, "제목:", title);
		console.log("예약유저:", reserve_user);
		
		if(userAuth=='U'){

			if(reserve_user==user_id){
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
				
			}else if(!reserve_user || reserve_user.trim() === ""){
				console.log('일반회원의 대출신청');
				
				if(penalty_date>currentDate){
					alert('연체회원입니다. '+penalty_val+'일까지 도서를 대출할 수 없습니다');
					return false;
				}else{
					
					$.ajax({
						url: "./requestBorrow.do",
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
			}else{
				alert('예약중인 도서는 예약자만 대출이 가능합니다.')
			}
			
		}else{
			alert('대출은 회원만 가능합니다. 로그인해주세요');
			location.href="./login.do";
		}
		
	});
	
	
	//예약신청
	$("input.requestReserve").on("click", function(){
		
		var book_seq = $(this).closest("tr").find(".book_seq").val();
		var title = $(this).closest("tr").find(".reserve_title").val();
		var borrow_status = $(this).closest("tr").find(".borrow_status").val();
		console.log("book_seq:", book_seq, "제목:", title, "대출상태:", borrow_status);
		
		if(userAuth=='U'){
			
			if(borrow_status=='Y'){
				console.log("user_id "+user_id+"의 도서 book_seq "+book_seq+" 예약신청");
				
				if(penalty_date>currentDate){
					alert('연체회원입니다. '+penalty_val+'일까지 도서를 예약할 수 없습니다');
					return false;
				}else{
					
					$.ajax({
						url: "./requestReserve.do",
						type: "post",
						data: { title : title,
								user_id : user_id,
								book_seq : book_seq
								},
						success: function(data){
							console.log(data);
							
							var cnt = data.cnt;
							console.log(cnt);
							
							if(cnt>=2){
								console.log("예약실패 - 2권까지만 예약 가능")
								alert('2권까지만 예약이 가능합니다. 예약취소 후 이용해주세요');
//								location.href= "redirect:/myReserve.do";
								location.href= "./myReserve.do?user_id="+user_id;
							}else{
								alert('예약이 완료되었습니다. 현재 예약하신 도서는 '+(cnt+1)+'권, 앞으로 '+(1-cnt)+'권 더 예약 가능합니다.');
								location.reload();
							}
							
//							switch(data.msg){
//								case '1' :console.log("대출 실패-책 4권까지만 대출 가능");
//											alert('2권까지만 예약이 가능합니다. 도서반납 후 이용해주세요')
//											 break;
//								case '2' :console.log("대출 완료"); 
//									alert('대출이 완료되었습니다. 현재 대여한 도서는 '+(data.cnt+1)+'권, 앞으로 '+(3-data.cnt)+'권 더 대출 가능합니다. 도서를 2주 뒤까지 반납해주세요');
//											
//											location.reload();
//											break;
//							}
							
						},
						error: function(){
							alert('예약신청에 실패했습니다.');
						}
			
					});
				}
				
			}else{
				console.log("대출중이 아닌 도서에 대한 예약신청-예약없을때")
				alert('예약은 대출된 도서만 가능합니다. 도서를 대출해주세요.');
			}
			
		}else{
			alert('예약은 회원만 가능합니다. 로그인해주세요');
			location.href="./login.do";
		}
		
		
	});
	
	
});