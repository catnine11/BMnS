
$(document).ready(function(){
	
	$("button").on("click",function(){
//		var searchOption= $(this).closest("div").find('option:selected').val()
		var inputVal=$(this).closest("div").find("input[name=input]").val();
//		
//		console.log(inputVal);
//		console.log(searchOption);
		
		if(inputVal==''){
			alert('검색어를 입력 하세요 ');
		}else{
			var frm = document.forms[0];
			frm.action="./searchBooks.do";
			frm.method="post";
			frm.submit();	
			
		}
	});
	
})

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
////		
////	})
