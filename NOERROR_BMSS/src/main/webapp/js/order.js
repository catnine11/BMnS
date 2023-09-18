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


$(document).ready(function(){
	
	 $("input[name='delCheck']").click(function(){
		
		 var checkedCheckboxes = $("input[name='delCheck']:checked")
		 console.log(checkedCheckboxes);
		
		   });
	
	});