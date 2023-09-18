
	$(document).ready(
			function() {
				$("input[name='price']").on(
						"keyup",
						function(event) {
							if (event.key === "Enter") {
								var stockNum = $(this).closest("tr").find(
										".stockNum").text()
								var price = $(this).val();
								
								console.log(price);
								$.ajax({
									url : "./changePrice.do",
									type : "post",
									data : {
										stockNum : stockNum,
										price : price
									},
									dataType:'json',
									success : function(data) {
										console.log(data);

									
										console.log(data);
										alert("가격이 변경되었습니다.");
									},
									error : function() {
										alert("가격변경 실패");
									}
								});
							}
						});
			});
			
			
	$(document).ready(function(){
		$("select[name='sellStatus']").on("change",function(){
			var status=$(this).closest("tr").find(".ss").find("option:selected").val();
			var num =$(this).closest("tr").find(".stockNum").text();
			console.log(num);
			console.log(status)
			$.ajax({
			method : "post",
			url : "./changeStatus.do",
			data : {
				status :status,
				num :num
			},
			success : function(data) {
				alert("도서 판매여부가 변경되었습니다.");
			},
			error : function() {
				alert("판매여부 변경실패 ");
			}

		})
			
		})
		
	})

	
	$(document).ready(function(){
		$("select[name='status_code']").on("change",function(){
			var status_code=$(this).closest('tr').find('.cbs').find("option:selected").val();
			var book_seq=$(this).closest('tr').find('.book_seq').text();
			console.log(status_code);
			console.log(book_seq);
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
		})
		
		
	})
	
	$(document).ready(function(){
		$("input[name='allChk']").click(function(){
			var allChk= $(this).is(":checked");
			console.log(allChk);
				$("input[name='delChk']").prop("checked",allChk);
				
			$("input[name='delChk']").click(function(){
				var ischeck =true;
			$("input[name='delChk']").each(function(){
				
				if(!$(this).is(":checked")){
					//체크가 false라면
					ischeck=false;
					
				}
				//체크가 true라면
				$("input[name='allChk']").prop("checked",ischeck);
				
			})
				
			})
		
			
			
		})
		
		
	})

