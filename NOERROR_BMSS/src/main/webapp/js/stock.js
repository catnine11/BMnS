
$(document).ready(function(){
	$(".detailTD").on("click",function(){
    var seq = $(this).closest('td').find(".booksDetail").val();
    console.log(seq);
    
    $.ajax({
      method: "post",
      url: "./booksDetail.do",
      data: {seq:seq},
      dataType: "json",
      success: function(data){
	console.log(data)
//	JSON.stringify(data);
	


 	$("#stockDel").html("");
 		html="";
 		html+=""
html+="	<table>                                                                                                     ";
html+="		<tr>                                                                                                    ";
html+="			<td><input type='checkbox' name='allChk'></td>                                                      ";
html+="			<td>재고번호</td>                                                                                   ";
html+="			<td>도서명</td>                                                                                     ";
html+="			<td>도서상태</td>                                                                                   ";
html+="			<td>판매가능 여부</td>                                                                              ";
html+="			<td>도서 가격</td>                                                                                  ";
html+="		</tr>                                                                                                   ";
		for (let i=0; i<data.length; i++)    {       
			var books =data.seq[i];                                                
html+="			<tr>                                                                                                ";
html+="				<td><input type='checkbox' name='delChk'                                                        ";
html+="					value='"+books.book_code+"'></td>                                                             ";
html+="				<td class='stockNum'>"+books.stock_number+"</td>                                                     ";
html+="				<td>${a.status_title}</td>                                                                      ";
html+="				<td><select class='changeBookStatus' name='status_code'>                                        ";
html+="						<option value='A' ("+status_code+" === 'D') ? 'selected' : ''>일반</option>                 ";
html+="						<option value='B' ("+status_code+" === 'D') ? 'selected' : ''>재고</option>                 ";
html+="						<option value='C' ("+status_code+" === 'D') ? 'selected' : ''>분실</option>                 ";
html+="						<option value='D' ("+status_code+" === 'D') ? 'selected' : ''>예정</option>                 ";
html+="				</select></td>                                                                 ";
html+="				<td><select class='sellStatus' name='sellStatus'>                                               ";
html+="						<option value='N' ("+sell_status+" == 'N' ? 'selected' : '')>판매불가</option>           ";
html+="						<option value='Y' ("+sell_status+" 'Y' ? 'selected' : '')>판매가능</option>           ";
html+="				</select></td>                                                                                  ";
html+="				<td><input class='price' type='number' name='price'                                             ";
html+="					value='"+book_price+"'></td>                                                               ";
html+="				<td><input class='chPrice' type='button' value='가격 변경'></td>                                ";
html+="			</tr>                                                                                               ";
 }                                                                                         
html+="	<tr>	<td><input type='submit' value='삭제' ></td></tr>                                                   ";
html+="		</table>                                                                                                ";
 	
 	
 	
       
        
      },
      error: function(){
      }
    });
  })
});










	$(document).ready(
			function() {
				$("input[name='price']").on(
						"keyup",
						function(event) {
							if (event.key === "Enter") {
								event.preve
						
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
			console.log(status)
			console.log(num);
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
			var book_seq=$(this).closest('tr').find('.book_seq').val();
			var book_tr=$(this).closest('tr');
			
			console.log("도서상태 : ", status_code);
			console.log("도서seq: ",book_seq);
			console.log("도서tr: ",book_tr);
			$.ajax({
				method:"post",
				url:"./chageBookStatus.do",
				data:{book_seq:book_seq,status_code:status_code},
				success:function(){
					alert("도서상태 변경을 완료했습니다.");
					if(status_code !="B"){
						book_tr.remove();
					}
					
					
				},
				error:function(){
					
					alert("도서상태 변경에 실패했습니다.");
					
				}
			})
		})
		
		
	})
	
	$(document).ready(function(){
		$("input[name='allChk']").click(function(event){
			
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
	
	
	
function delStock(){
	console.log("체크");
	var frm = document.forms[0];
	var delChk = document.getElementsByName("delChk");
	console.log($("input:checkbox[name=delChk]:checked").length);
	let jQueryCnt =$("input:checkbox[name=delChk]:checked").length;
	let cnt =0;
	console.log(delChk.length)
	for(let i=0; i<delChk.length;i++){
		console.log(delChk[i].checked)
		if(delChk[i].checked){
			cnt++;
		}
	}
	
	if(jQueryCnt>0){ // 한개도 체크가 안되었을때
		frm.action="./stocksDel.do";
		frm.method="post";
		frm.submit();	
	}else{
		alert("체크항목은 필수 입니다");
		return false;
	}
	
}