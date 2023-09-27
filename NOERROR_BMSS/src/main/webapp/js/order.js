//전체 체크박스 함수
$(document).ready(function(){
	$("input[name='allCheck']").click(function(){
		
		var ischecked=$(this).is(":checked");
		console.log(ischecked);
			$("input[name='delCheck']").prop("checked",ischecked);
	
		})
		
		$("input[name='delCheck']").click(function(){
			var allchecked =true;
			
			$("input[name='delCheck']").each(function(){
				
				if(!$(this).is(":checked")){
					
					allchecked=false;
				}
				
				$("input[name='allCheck']").prop("checked",allchecked);
				
			})
			
		})
	
	
	
	
})

//관리자 주문내역을 삭제 하는 함수;

$(document).on('click', 'input#delBtn', function(){
    var checkedOrder = new Array();
    $("input[name='delCheck']:checked").each(function(){
//	console.log( $(this).closest('tr').find('.stNum').text());
	console.log($(this));
        checkedOrder.push($(this).closest('tr').find('.stNum').text());
    console.log(checkedOrder);
    });
    console.log(checkedOrder);
    $.ajax({
        type: 'post',
        url: './delOrder.do',
        data: {'checkedOrder': checkedOrder},
        success: function(data){
		console.log(data.oderdel);
		$('input.delBox:checked').each(function(){
		
		$(this).closest('tr').remove();		
			
	
		})		
			alert("주문을 삭제 했습니다.");	
        },
        error: function(){
            alert("최소 하나이상의 도서를  체크해 주세요");
        }
    });
});




//유저가 주문내역을 삭제 하는 함수;
$(document).on('click', 'input#delUBtn', function(){
    var checkedOrder = new Array();
    $("input[name='delCheck']:checked").each(function(){
//	console.log( $(this).closest('tr').find('.stNum').text());
	console.log($(this));
        checkedOrder.push($(this).closest('tr').find('.delBox').val());
    });
    console.log(checkedOrder);
//    return false;
    $.ajax({
        type: 'post',
        url: './delOrder.do',
        data: {'checkedOrder': checkedOrder},
        success: function(data){
		console.log(data.oderdel);
		if(data.orderdel==0){
			  alert("최소 하나이상의 도서를  체크해 주세요");
			  return;
		}
		$('input.delBox:checked').each(function(){
//		console.log($(this).closest('tr').remove());
		$(this).closest('tr').remove();		
		})		
			alert("주문을 삭제 했습니다.");	
        },
        error: function(){
          
        }
    });
});





function dtWindow(id){
	window.open('./orderDetail.do?id='+id,'주문조회 상세창','width=800,height=600');
}



//유저가 주문하기
	
$(document).ready(function(){
    $("#addOrder").click(function(){
		var chkArray=new Array;
       $(".bookChk:checked").each(function(){
		chkArray.push($(this).val());
})
 $.ajax({
	type:"post",
	url:"./addOrder.do",
	data:{"chkArray":chkArray},
	success:function(){
		
	},
	error:function(){
	}
	
})
    });
});







