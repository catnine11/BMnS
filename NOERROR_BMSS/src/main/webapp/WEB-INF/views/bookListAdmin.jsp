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

</head>
<%@include file="header.jsp" %>
<body>
	<div class="container">
<!-- 		<form action="./changeGenre.do" id="genreChangeForm" method="post" onsubmit="return changeGenre()"> -->
		<form action="./changeGenre.do" id="genreChangeForm" method="post" onsubmit="return changeGenre();">
		<div class="selectGenre">
			<select id="genreSelect" class="Genre" name="selectedGenre">
				<option value="">전체</option>
				<option value="000">총류</option>
				<option value="100">철학</option>
				<option value="200">종교</option>
				<option value="300">사회과학</option>
				<option value="400">자연과학</option>
				<option value="500">기술과학</option>
				<option value="600">예술</option>
				<option value="700">언어</option>
				<option value="800">문학</option>
				<option value="900">역사</option>
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
<script type="text/javascript">



	function changeGenre(){
		//1 id가 genreChangeForm인 값이 "" 없는 경우 
		//2.chkBook name을 가진 dom을 찾아서 checked가 true인 갯수가 1개 이상인 경우 
		// if문에 1번2번 조건이라면 return false
		
		var chks = document.getElementsByName("chkBook");
		
		var cnt = 0;
		for(let c of chkBook){
			if(c.checked){
				cnt++;
				console.log("cnt");
			}
		}
		
		if(cnt ==0){
			alert("한 개 이상의 글을 선택해 주세요");
			return false;
		}
		
		var all = document.getElementById("genreSelect");
			
		
		var selectedOption = document.getElementById("genreSelect")
		var idx = selectedIndex.selectedIndex;
		var opt = selectedOption.options[idx];
		
		console.log("선택된 옵션값: " + opt.value);
		console.log("선택된 옵션의 텍스트: " + selectedText);
		
		return false;
	}


	
	
</script>
</html>