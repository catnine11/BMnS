//검색 버튼 터치를 통한 도서검색
$(document).ready(function(){
	
	$("#srcBtn").on("click",function(){
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
			frm.method="get";
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
        frm.method = "get";
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
        frm.attr("method", "get");
        frm.submit();
      }
    }
  });
});







//도서 등록 
$(document).ready(function(){
    $("#enrollBtn").on("click",function(){
        $.ajax({
            method: "GET",
            url: "https://dapi.kakao.com/v3/search/book",
            data: { query: $("#enroll").val() },
            headers: { "Authorization": "KakaoAK deebb5b9fe3604c7cbb30baeb31b856e" },
            success: function(res) {
               fn_aa(res);
            }
        });
    });
});
function fn_aa(res){
	for(let i=0; i<res.documents.length; i++){
		
	var isbn =res.documents[i].isbn;
	var title = res.documents[i].title;
	var author = res.documents[i].authors
	var price=res.documents[i].price
	var	publisher=res.documents[i].publisher
	var thumbnail=res.documents[i].thumbnail
	var	publish_date=res.documents[i].datetime.substring(0,10)
	
	console.log(publish_date);
	
	$.ajax({
    	   method: "post",
           url: "./save.do",
           data: {isbn:isbn,title:title ,author:author,price:price,publisher:publisher,thumbnail:thumbnail,publish_date:publish_date},
    	success:function(rep){
    		console.log(rep);
    	}
    	
    })
	}


	
}
























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
