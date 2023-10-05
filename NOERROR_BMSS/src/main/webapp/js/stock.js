// 재고목록 상세조회  SPA구현하는 함수 
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

	


 	$("#stockDel").html("");
 		html="";
html+=""
html+="		<table id='container' class='table table-bordered'>                                                                                                  ";
html+="		<thead>                                                                                                 ";
html+="		<tr>                                                                                                    ";
html+="			<th class='col-lg-3'>재고번호</th>                                                                                   ";
html+="			<th class='col-lg-5'>도서명</th>                                                                                     ";
html+="			<th class='col-lg-3'>도서상태</th>                                                                                   ";
html+="			<th class='col-lg-1'>도서 가격</th>                                                                                  ";
html+="		</tr>                                                                                                   ";
html+="		</thead>                                                                                                   ";
html+="		<tbody>                                                                                                   ";
		for (let obj of data)    {   
html+="			<tr class='delTr'>                                                                                                ";
html+="				<td class='stockNum'>"+obj.stock_number+"</td>                                                     ";
html+="				<td>"+obj.status_title+"</td>                                                                      ";
html+=`<td><select class='changeBookStatus' name='status_code'>                                        
    <option value='A' ${obj.status_code == 'A' ? "selected" : ""}>일반</option>
    <option value='B' ${obj.status_code == 'B' ? "selected" : ""}>재고</option>
</select></td>`;
html += `<td><input style='width:70px;' class='price' type='number' name='price' value='${obj.book_price}'}></td>`;
html+="					<td><input class='book_seq' type='hidden' value='"+obj.book_seq+"'></td>";                                                             
html+="				<td><input class='btn btn-success' type='button' value='가격 변경'></td>                                ";
html+="			</tr>                                                                                               ";
 
 }                                                                                         
html+="		</tbody>";
html+="		</table>                                                                                                ";
 
 $("#stockDel").html(html);	
 	
      },
      error: function(){
      }
    });
  })
});



	///관리자의 도서 가격 변경함수		
			$("#stockDel").on("click", "input.btn.btn-success", function() {
    	var price= $(this).closest('tr').find('.price').val() 
		var stockNum=$(this).closest('tr').find('.stockNum').text();

    $.ajax({
        url: "./changePrice.do",
        type: "post",
        data: {
            stockNum: stockNum,
            price: price
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
			
			
	
//관리자의 도서 상태 변경 함수 
		$("#stockDel").on("change","select.changeBookStatus",function(){
			var status_code=$(this).closest('tr').find('.changeBookStatus').find("option:selected").val();
			var book_seq=$(this).closest("tr").find(".book_seq").val();
			var book_tr=$(this).closest('tr');
			
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
		
		
//삭제 체크박스 전체체크 메소드
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

//관리자의 재고목록 대상 삭제 함수
$(document).ready(function(){
	$('#inStockDel').click(function(){
		var checkedNums=new Array();
		$("input.delChk:checked").each(function(){
//			console.log($(this).closest('tr').find('.book_seq').text());
			checkedNums.push($(this).closest('tr').find('.stockNum').val());
		})
		console.log(checkedNums);
		var result=confirm("삭제하시겠습니까?");
		if(result){
			
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
			
			
		},
		error:function(data){
			
		}
			
		})
		    } else {
        // 사용자가 "아니오" 버튼을 클릭한 경우
        alert('삭제를 취소하셨습니다.');
    }
		
		
	})
	
	
})












