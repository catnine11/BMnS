/**
 * 
 */

$(document).ready(function(){
//	$("input[name='allChk']").click(function(event){
//		var allChk =$(this).is(":checked");
//		console.log(allChk);
//		$("input[name='chkBooks']").prop("checked", allChk);
//		
//		$("input[name='chkBooks']").click(function(){
//			var ischeck = true;
//			$("input[name='chkBooks']").each(function(){
//				if(!$(this).is(":checked")){ 
//					//체크가 하나라도 false라면(선택 안돼있다면)
//					ischeck = false; 
//				}
//				$("input[name='allChk']").prop("checked", ischeck);
//			});
//		});
//	});
	
	$("#allChk").click(function(event){
		if($("#allChk").prop("checked")){
			$("input[type=checkbox]").prop("checked", true);
		}else{
			$("input[type=checkbox]").prop("checked", false);
		}
	});
	
	
	$("#returnBook").click(function(){
		
		var chks = document.getElementsByName("chkBooks");
		var cnt = 0;
		for(let c of chks){
			if(c.checked){
				cnt++;
			}
		}
		console.log("cnt : ",  cnt);
		
		if(cnt ==0){
			alert("한 개이상의 책을 선택해 주세요");
			return false;
		}
		
		
		var chkBooks = new Array();
		$("input.chkBooks:checked").each(function(){
		var book_seq = $(this).closest("tr").find(".book_seq").val();
			chkBooks.push(book_seq);
		})
			console.log(chkBooks);
			console.log(typeof chkBooks);
		
		$.ajax({
			url: "./returnBook.do",
			type: "post",
//			data: {"chkBooks":chkBooks},
			data: {"chkBooks":chkBooks },
			success: function(data){
				console.log(data);
				alert("책이 반납처리되었습니다.");
				location.reload();
			},
			error: function(){
				alert('반납처리에 실패했습니다.');
			}
			
		});
		
		
	});
	
	
	
});


window.onload = function(){
	var div = document.getElementById("borrowAllUserNow");
	var a = document.getElementById("showBorrowAllUserNow");
	
	a.onclick=function(event){
//		event.preventDefault();
		var currentUrl = window.location.href;
		
		if(!currentUrl.endsWith('/borrowAllUserNow.do')){
		}else{
			if(div.style.display == "none"){
				div.style.display = "block";
				event.preventDefault();
			}else{
				div.style.display = "none";
				event.preventDefault();
			}
			
		}
	}
	
	const urlParams = new URLSearchParams(window.location.search);
	const showDiv = urlParams.get('showDiv');
	const showDiv2 = urlParams.get('showDiv2');

  // showDiv 값이 'true'인 경우 div를 보이게 함
	if (showDiv === 'true') {
	const div1 = document.getElementById('borrowOneUserNow');
		if (div1) {
		div1.style.display = 'block';
		}
	}
	
	if (showDiv2 === 'true') {
	const div2 = document.getElementById('borrowOneUserHistory');
		if (div2) {
		div2.style.display = 'block';
		}
	}
  
	var reservediv = document.getElementById("getAllReserveNow");
	var reservea = document.getElementById("showgetAllReserveNow");
	
	reservea.onclick=function(event){
//		event.preventDefault();
		var currentUrl = window.location.href;
		
		if(!currentUrl.endsWith('/getAllReserveNow.do')){
		}else{
			if(reservediv.style.display == "none"){
				reservediv.style.display = "block";
				event.preventDefault();
			}else{
				reservediv.style.display = "none";
				event.preventDefault();
			}
			
		}
	}
  
  
	
}



$(document).ready(function(){
	
	$(".detailUserBorrow").click(function(event){
		
		var userId = $(this).closest("td").find(".user_id").val();
    	console.log(userId);
    	
//	    location.href ="./borrowOneUserNow.do?user_id=" + userId;
	    location.href ="./borrowOneUserNow.do?showDiv=true&user_id=" + userId;
	});
	
	
});
	