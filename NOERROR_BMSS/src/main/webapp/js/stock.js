// SPA 및 셀렉트 input 태그 로직 처리 메소드
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
			
		
		   
html+="			<tr class='delTr'>                                                                                                ";
html+="				<td><input class='delChk' type='checkbox' name='delChk' value='"+obj.book_code+"'></td>                                                       ";
html+="				<td class='stockNum'>"+obj.stock_number+"</td>                                                     ";
html+="				<td>"+obj.status_title+"</td>                                                                      ";
html+=`<td><select class='changeBookStatus' name='status_code'>                                        
    <option value='A' ${obj.status_code == 'A' ? "selected" : ""}>일반</option>
    <option value='B' ${obj.status_code == 'B' ? "selected" : ""}>재고</option>
</select></td>`;
html+=`<td><select class='sellStatus' name='sellStatus'>                                              
    <option value='N' ${obj.sell_status == 'N' ? 'selected' : ''}>판매불가</option>          
    <option value='Y' ${obj.sell_status == 'Y' ? 'selected' : ''}>판매가능</option>           
</select></td>`;                                                                             
html += `<td><input class='price' type='number' name='price' value='${obj.book_price}'}></td>`;
html+="					<td><input class='book_seq' type='hidden' value='"+obj.book_seq+"'></td>";                                                             
html+="				<td><input class='chPrice' type='button' value='가격 변경'></td>                                ";
html+="			</tr>                                                                                               ";
 
 }                                                                                         
html+="	<tr>	<td><input id='delButton' type='button' value='삭제' ></td></tr>                                                   ";
html+="		</table>                                                                                                ";
 	
 $("#stockDel").html(html);	
 	
       stockLogic(html);
      },
      error: function(){
      }
    });
  })
});

//재고 디테일 로직 함수 
function stockLogic(){
	
	   	$(".changeBookStatus, .sellStatus, .price").each(function(){
		var status=	$(this).closest("tr").find('.changeBookStatus');
		var sellStatus =	$(this).closest("tr").find('.sellStatus');
		var price=$(this).closest("tr").find('.price')
		var btn=$(this).closest("tr").find(".chPirce");
//		console.log("책상태",status);
//		console.log("판매상태",sellStatus);
//		console.log("가격인풋",price);
	//재고 로직 판매 불가일떄는 가격이 있어도  괜찮지 않을까 ? 실시간으로 적영되는 방법 물어보기
	if (status.val() === 'B' && sellStatus.val() === 'Y') {
        price.prop("readonly", false);
        status.prop("disabled",true);
    } else {
        price.prop("readonly", true);
    }
    
     if (status.val() === 'B') {
        sellStatus.prop("disabled", false);
    } else {
        sellStatus.prop("disabled", true);
    }
    
    if(status.val() !== 'B'&& sellStatus.val() !== 'Y'){
	btn.disabled=true;
}	
})
}









	///도서 가격 변경 메소드 		
			$("#stockDel").on("click", "input.chPrice", function() {
    	var price= $(this).closest('tr').find('.price').val() 
		var stockNum=$(this).closest('tr').find('.stockNum').text();
//    console.log(stockNum); 
    // console.log(price); 

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
			
			
	//도서 판매 여부 변경 메소드 N->Y Y->N
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
				 console.log (data);
				 console.log(data.status);
				alert("도서 판매여부가 변경되었습니다.");
			},
			error : function() {
				alert("판매여부 변경실패 ");
			}

		})
			
		})
		


//	<td><input class='book_seq' type='hidden' value='"+obj.book_seq+"'></td>"; 
//도서 상태 변경 메소드 
		$("#stockDel").on("change","select.changeBookStatus",function(){
			var status_code=$(this).closest('tr').find('.changeBookStatus').find("option:selected").val();
			var book_seq=$(this).closest("tr").find(".book_seq").val();
			var book_tr=$(this).closest('tr');
			
//			console.log("도서상태 : ", status_code);
//			console.log("도서seq: ",book_seq);
//			console.log("도서tr: ",book_tr);
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
	




	$(document).on('click', 'input#delButton', function() {
    var checkedNums = new Array();
    $('input[name="delChk"]:checked').each(function() {
        checkedNums.push($(this).closest('tr').find('.stockNum').text());//체크된 값을 
 		
 });
 console.log(checkedNums);
  $.ajax({
	type:"post",
	url:"./stocksDel.do",
	data:{"checkedNums":checkedNums},
	
	success:function(data){
//		console.log(data.result);
//		console.log(data);
//		console.log(checkedNums.length);
		if(data.result!=checkedNums.length){
		alert("판매 가능 목록을 같이 선택 하셨습니다.");
		}else{
		 $('input[name="delChk"]:checked').each(function() {
                // 가장 가까운 '.delTr' 클래스를 가진 tr 요소를 찾아서 제거합니다.
                $(this).closest('.delTr').remove();
			alert("삭제를 완료 했습니다.");
            });
            }
		
		
	},
	
	error:function(){
		alert("주문에 추가 되었거나 가격을 확인하세요");
	}
	
})
    
   

    
   
   
});


//재고 대상목록 삭제 



//$(document).ready(function(){
//    $(".InStockStatus").on("change",  function(){
//        console.log($(this));
//        var status_code = $(this).closest('tr').find('.InStockStatus').find("option:selected").val();
//        var book_seq = $(this).closest("tr").find(".book_seq").text(); // 수정: .val() -> .text()
//        
//        console.log("도서상태 : ", status_code);
//        console.log("도서seq: ", book_seq);
//        
//        $.ajax({
//            method: "post",
//            url: "./chageBookStatus.do",
//            data: {book_seq: book_seq, status_code: status_code},
//            success:function(){
//                alert("도서상태 변경을 완료했습니다.");
//                if(status_code != "B"){
//                    // 삭제 처리 등 추가 작업
//                }
//            },
//            error:function(){
//                alert("도서상태 변경에 실패했습니다.");
//            }
//        });
//    });
//});

//재고대상 목록의  상태변경  
$(document).ready(function(){
	$('.InStockStatus').on('change',function(){
		console.log($(this));
//		status_code ,book_seq
		
		$(this).closest('tr').find('.InStockStatus').val();
	var status_code=	$(this).closest('tr').find('.InStockStatus').val();
	var book_seq=$(this).closest('tr').find('.book_seq').text();
	console.log($(this).closest('tr'));
	var book_tr =$(this).closest('tr');
//	return false;
	$.ajax({
		type:"post",
		data:{'book_seq':book_seq ,'status_code':status_code},
		url: "./chageBookStatus.do",
		success:function(data){
			console.log($(this));
			if(data.status_code=='B'){
			alert("도서가 재고목록에 등록 되었습니다.")
			book_tr.remove();
}
		},
		
		error:function(){
			
			
		}
		
		
	})
	});
	
	
	
})

$(document).ready(function(){
	$('#inStockDel').click(function(){
		var checkedNums=new Array();
		$("input.delChk:checked").each(function(){
//			console.log($(this).closest('tr').find('.book_seq').text());
			checkedNums.push($(this).closest('tr').find('.stockNum').val());
		})
		console.log(checkedNums);
		$.ajax({
		type:"post",
		url:"./stocksDel.do",
		data:{"checkedNums":checkedNums},
		success:function(data){
			console.log(data);
			console.log(data.result);
			if(data.result==0){
				alert('도서를 선택해 주세요');
				return;
			}
				$('input.delChk:checked').each(function(){
				$(this).closest('tr').remove();
			})
			alert('재고목록 대상에서 제외되었습니다');	
			
			
		}
			
		})
		
		
	})
	
	
})












//
//	html+="				<td><input type='checkbox' name='delChk'                                                      ";
//	$(document).on('click','input#delButton',function(){
//	console.log($(this).closest('tr').find('.delChk').val());
//	var frm = document.forms[0];
//	var delChk = document.getElementsByName("delChk");
//	console.log($("input:checkbox[name=delChk]:checked").length);
//	let jQueryCnt =$("input:checkbox[name=delChk]:checked").length;
//	let cnt =0;
//	console.log(delChk.length)
//	for(let i=0; i<delChk.length;i++){
//		console.log(delChk[i].checked)
//		if(delChk[i].checked){
//			return false;
//			cnt++;
//		}
//	}
//	
//	if(jQueryCnt>0){ // 한개도 체크가 안되었을때
//		frm.action="./stocksDel.do";
//		frm.method="post";
//		return false;
//		frm.submit();	
//	}else{
//		alert("체크항목은 필수 입니다");
//		return false;
//	}
//	
//
//
//
//		
//	})
