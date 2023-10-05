<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOERROR 책 목록-관리자</title>
<style type="text/css">
	table{
		text-align: center;
	}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/search.js"></script>
<script type="text/javascript">
	function genreList(){
		var selectedGenre = $("#genreSelect").val();
		console.log(selectedGenre);
		
		if(selectedGenre =="전체"){
			window.location.href="./bookListAdmin.do";
		}
		
		$.ajax({
			url: "./bookListGenre.do",
			type: "post",
			data: {selectedGenre: selectedGenre},
			dataType: "json",
			success: function (data) {
				console.log(data);
				console.log(data.selectGenre);
				console.log(data.selectGenre[0]);
				console.log(data.selectGenre.length);
				
				$("#bookList").html("");
				var html = "";
				html+="<table> ";
				html+="<tbody> ";
				
				for (var i = 0; i < data.selectGenre.length; i++) {
					var book = data.selectGenre[i];
				
				html+="		<tr>      ";
				html+="			<td>  ";
				html+="				<input type='checkbox' name='chkBook' value='"+book.book_code+"'>";
				html+="			</td>  ";
				html+="			<td>"+book.book_code+"</td>";
				html+="			<td>   ";
				html+="				<img src='"+book.thumbnail+"'>";
				html+="			</td>  ";
				html+="			<td>"+book.genre_name+"</td>";
				html+="			<td>"+book.title+"</td>     ";
				html+="			<td>"+book.author+"</td>    ";
				html+="			<td>"+book.publisher+"</td> ";
				html+="			<td>"+book.publish_date+"</td>";
				html+="			<td>                         ";
				html+="				<input type='button' value='도서 상세' onclick='getDetail("+book.book_code+")'>";  
				html+="			</td>                        ";
				html+="		</tr>                            ";
				}
				$('#bookList').html(html);
				html+="</tbody>                              ";
				html+="</table>                             ";

			},
			error: function () {
				alert("도서 목록을 불러오는 중 오류가 발생했습니다.");
			}
		});
	}
	
	function getDetail(book_code){
		var url = './bookDetail.do?book_code='+book_code;
		window.location.href = url;
	}
	
</script>
</head>
<%@include file="header.jsp" %>
<body>
	<div class="container">
	<div class="insertBook">
		<h4>도서등록</h4>
		<div>
		<input id="enroll" type="text">
		<input id="enrollBtn" type="button" value="책등록" >
	</div>
	
	</div>
		<div class="selectGenre">
		<p></p>
			<select id="genreSelect" class="Genre" name="selectedGenre" onchange="genreList()">
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
		</div>
		<form action="./changeGenre.do" id="genreChangeForm" method="post" onsubmit="return changeGenre();">
			<div>
			<h3>장르를 변경할 도서를 체크하고 변경버튼을 눌러주세요</h3>
				<select id="genreChange" class="Genre" name="selectedChangeGenre">
<!-- 					<option value="">전체</option> -->
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
				<button type="submit">장르변경</button>
			</div>
			<div id="bookList">
				<table>
					<tbody>
						<c:forEach items="${lists}" var="book">
							<tr>
								<td>
									<input type="checkbox" name="chkBook" value="${book.book_code}">
								</td>
								<td>${book.book_code}</td>
								<td>
									<img src="${book.thumbnail}">
								</td>
								<td>${book.genre_name}</td>
								<td>${book.title}</td>
								<td>${book.author}</td>
								<td>${book.publisher}</td>
								<td>${book.publish_date}</td>
								<td>
									<input type="button" value="도서 상세" onclick="getDetail(${book.book_code})" class=" btn btn-info btn-sm">
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</form>
	</div>
</body>
<%@include file="footer.jsp" %>
<script type="text/javascript">

	function changeGenre(){
		//1 id가 genreChange인 값이 "" 없는 경우 
		//2.chkBook name을 가진 dom을 찾아서 checked가 true인 개수가 1개 이상인 경우 
		// if문이 1번2번 조건이라면 return false
		
		var select = document.getElementById("genreChange");
		var idx = select.selectedIndex;
		var opt = select.options[idx];
		console.log("선택된 옵션값: " + opt.value);
		console.log("선택된 옵션의 텍스트: " + opt.text);
// 		if(opt.value == ""){
// 			alert("전체로는 장르를 변경할 수 없습니다.");
// 			return false;
// 		}
		
		var chks = document.getElementsByName("chkBook");
		var cnt = 0;
		for(let c of chks){
			if(c.checked){
				cnt++;
				console.log("cnt : "+cnt);
			}
		}
		if(cnt ==0){
			alert("한 개 이상의 글을 선택해 주세요");
			return false;
		}
		
	}
	
</script>
</html>