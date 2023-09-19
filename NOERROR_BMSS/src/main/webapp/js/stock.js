
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
	// new Array(); length 
	//json 객체 
//	  console.log(data.length)
//	  console.log(data[0]);
//	  for(let obj of data){
//			console.log(obj.stock_number,
//			obj.sell_status,
//			obj.book_seq,
//			obj.book_price,
//			obj.status_title,
//			obj.status_code,
//			obj.book_code)
//		}
//		
		
	  

	


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
		for (let obj of data)    {    
			   
html+="			<tr>                                                                                                ";
html+="				<td><input type='checkbox' name='delChk'                                                        ";
html+="					value='"+obj.book_code+"'></td>                                                             ";
html+="				<td class='stockNum'>"+obj.stock_number+"</td>                                                     ";
html+="				<td>"+obj.status_title+"</td>                                                                      ";
html+="				<td><select class='changeBookStatus' name='status_code'>                                        ";
html+="						<option value='A' ("+obj.status_code+" === 'D') ? 'selected' : ''>일반</option>                 ";
html+="						<option value='B' ("+obj.status_code+" === 'D') ? 'selected' : ''>재고</option>                 ";
html+="						<option value='C' ("+obj.status_code+" === 'D') ? 'selected' : ''>분실</option>                 ";
html+="						<option value='D' ("+obj.status_code+" === 'D') ? 'selected' : ''>예정</option>                 ";
html+="				</select></td>                                                                 ";
html+="				<td><select class='sellStatus' name='sellStatus'>                                               ";
html+="						<option value='N' ("+obj.sell_status+" == 'N' ? 'selected' : '')>판매불가</option>           ";
html+="						<option value='Y' ("+obj.sell_status+" 'Y' ? 'selected' : '')>판매가능</option>           ";
html+="				</select></td>                                                                                  ";
html+="				<td><input class='price' type='number' name='price'                                             ";
html+="					value='"+obj.book_price+"'></td> "; 
html+="					<td><input class='book_seq' type='hidden' value='"+obj.book_seq+"'></td>";                                                             
html+="				<td><input class='chPrice' type='button' value='가격 변경'></td>                                ";
html+="			</tr>                                                                                               ";
 }                                                                                         
html+="	<tr>	<td><input type='submit' value='삭제' ></td></tr>                                                   ";
html+="		</table>                                                                                                ";
 	
 $("#stockDel").html(html);	
 	
       
        
      },
      error: function(){
      }
    });
  })
});








//<td><input class='chPrice' type='button' value='가격 변경'></td>      

	
			
			$("#stockDel").on("click", "input.chPrice", function() {
    var price= $(this).closest('tr').find('.price').val() // 값을 가져올 때 val() 대신 text() 사용
	var stockNum=$(this).closest('tr').find('.stockNum').text();
//    	console.log()

//    var stockNum = $(this).closest("tr").find(".stockNum").text(); // 주석 해제
    // var price = $(this).val(); // 주석 해제

//    console.log(stockNum); // 주석 해제
    // console.log(price); // 주석 해제

    $.ajax({
        url: "./changePrice.do",
        type: "post",
        data: {
            stockNum: stockNum,
            price: price // 변경된 부분
        },
        dataType: 'json',
        success: function(data) {
            console.log(data);
            alert("가격이 변경되었습니다.");
        },
        error: function() {
            alert("가격변경 실패");
        }
    });
});
			
			
	
		$("#stockDel").on("change","select.sellStatus",function(){
			var status=$(this).closest("tr").find(".sellStatus").find("option:selected").val();
			var num =$(this).closest("tr").find(".book_seq").val();
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
		


//	<td><input class='book_seq' type='hidden' value='"+obj.book_seq+"'></td>"; 

		$("#stockDel").on("change","select.changeBookStatus",function(){
			var status_code=$(this).closest('tr').find('.changeBookStatus').find("option:selected").val();
			var book_seq=$(this).closest("tr").find(".book_seq").val();
//			var book_tr=$(this).closest('tr');
			
			console.log("도서상태 : ", status_code);
			console.log("도서seq: ",book_seq);
//			console.log("도서tr: ",book_tr);
			$.ajax({
				method:"post",
				url:"./chageBookStatus.do",
				data:{book_seq:book_seq,status_code:status_code},
				success:function(){
					alert("도서상태 변경을 완료했습니다.");
					if(status_code !="B"){
//						book_tr.remove();
					}
					
					
				},
				error:function(){
					
					alert("도서상태 변경에 실패했습니다.");
					
				}
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