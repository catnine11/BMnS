<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
// 	$("#genreChangeForm").submit(function(event){
// 		event.preventDefault();
		
// 		var selectedBooks = [];
// 		$("#chkBook:checked").each(function(){
// 			selectedBooks.push($(this).val());
// 		});
		
// 		$("#selectedHidden").val(selectedBooks);
		
// 		$(this).unbind("submit").submit();
		
// 	});

// 	function changeGenre(){
// 		var chks = document.getElementById("chkBook");
// 		var cnt = 0;
// 		for(let c of chks){
// 			if(c.checked){
// 				cnt++;
// 			}
// 		}
// 	}
	
	$(document).ready(function(){
		var 
	});

	
	
</script>
</head>
<%@include file="header.jsp" %>
<body>
	<div class="container">
		<form action="./changeGenre.do" id="genreChangeForm" method="post" onsubmit="return changeGenre()">
		<div class="selectGenre">
			<select id="genreSelect" class="Genre" name="selectedGenre">
				<option>전체</option>
				<option>총류</option>
				<option>철학</option>
				<option>종교</option>
				<option>사회과학</option>
				<option>자연과학</option>
				<option>기술과학</option>
				<option>예술</option>
				<option>언어</option>
				<option>문학</option>
				<option>역사</option>
			</select>
			<button type="submit">변경</button>
		</div>
		<div>
			<table>
				<tbody>
					<c:forEach items="${lists}" var="book">
						<tr>
							<td>
								<input type="checkbox" id="chkBook" name="chkBook" value="${book.book_code}">
								<input type="hidden" id="selectedHidden" name="selectedBooks" value="">
							</td>
							<td>${book.book_code}</td>
							<td>
								<img src="${book.thumbnail}" onclick="location.href='./bookDetail.do?book_code=${book.book_code}'">
							</td>
							<td>${book.genre_name}</td>
							<td>${book.title}</td>
							<td>${book.author}</td>
							<td>${book.publisher}</td>
							<td>${book.publish_date}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		</form>
	</div>
</body>
</html>