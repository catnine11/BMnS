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


$(document).on('click', 'input#delBtn', function(){
    var checkedOrder = new Array();
    $("input[name='delCheck']:checked").each(function(){
//	console.log( $(this).closest('tr').find('.stNum').text());
        checkedOrder.push($(this).closest('tr').find('.stNum').text());
    });
    
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

function dtWindow(id){
	window.open('./orderDetail.do?id='+id,'주문조회 상세창','width=800,height=600');
	
	
}






