//검색 버튼 터치를 통한 도서검색
$(document).ready(function(){
	
	$("button").on("click",function(){
//		var searchOption= $(this).closest("div").find('option:selected').val()
		var inputVal=$(this).closest("div").find("#booksearch").val();
//		
		console.log(inputVal);
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

//엔터 버튼 터리를 통한 도서검색 

$(document).ready(function () {
  const inputVal = $("#booksearch");

  inputVal.on("keydown", function (event) {
    if (event.keyCode === 13) {
      if (inputVal.value === '') {
        alert('검색어를 입력하세요');
      } else {
        var frm = document.forms[0];
        frm.action = "./searchBooks.do";
        frm.method = "post";
        frm.submit();
      }
    }
  });
});








///관리자가 유저를 검색하는 기능

$(document).ready(function () {
  const inputVal = $("#search_input");

  inputVal.on("keydown", function (event) {
    if (event.keyCode === 13) {
      if (inputVal.val() === '') {
        alert('검색어를 입력하세요');
      } else {
        var frm = $("form:first");
        frm.attr("action", "./searchUsers.do");
        frm.attr("method", "post");
        frm.submit();
      }
    }
  });
});
// $(document).ready(function(){
//        $(".search_input").keypress(function(event){
//                var inputVal = $(this).val();
// 	console.log(inputVal);
//            if(event.keyCode === 13){
//               if(inputVal==''){
//					alert('검색어를 입력하세요');	
//                console.log(inputVal);
//}
//            }else{
//			var frm = document.forms[0];
//			frm.action="./searchUsers.do";
//			frm.method="post";
//			frm.submit();
//}
//        });
//    });


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
