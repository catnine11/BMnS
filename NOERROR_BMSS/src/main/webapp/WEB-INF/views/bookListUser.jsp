<%@page import="com.gd.bmss.vo.BookInfoVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOERROR 책 목록</title>
<style type="text/css">

	#thumbnail{
		width: 15%;
 		height: 15%;
 		cursor: pointer;
	}
	
	ul{
		list-style: none;
	}
	
	.imgList li{
		position: relative;
		display: block;
		box-sizing: border-box;
/*    		float: left;    */
		
	}
	
 	.imgList li .over{
 		position: absolute;
 		top: 0;
 		left: 0;
 		bottom: 0;
 		padding: 20%;
 		width: 100px;
 		text-align: center;
  		display: none; 
 	}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	function genreList(){
		var selectedGenre = $("#genreSelect").val();
		console.log(selectedGenre);
		
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
				
				for (var i = 0; i < data.selectGenre.length; i++) {
				    var book = data.selectGenre[i];
				
				html+="<ul class='imgList'>";
				html+="<li>";
				html+="	<div class='over'>";
				html+="		<strong>"+book.title+"</strong>";
				html+="		<span>"+book.author+"</span>";
				html+="		<p>"+book.publisher+"</p>";
				html+="	</div>";
				html+="	<a>";
				html+="		<img id='thumbnail' src='"+book.thumbnail+"' onclick='location.href='./bookDetail.do?book_code="+book.book_code+">";
				html+="	</a>";
				html+="</li>";
				html+="</ul>";
				}
				$('#bookList').html(html);

			},
			error: function () {
				alert("도서 목록을 불러오는 중 오류가 발생했습니다.");
			}
		});
	}
	
</script>
</head>
<%@include file="header.jsp" %>
<body>
<div class="container">
	<div class="selectGenre">
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
	<div id="bookList">
		<ul class="imgList">
		<c:forEach items="${lists}" var="book">
			<li>
				<div class="over">
					<strong>${book.title}</strong>
					<span>${book.author}</span>
					<p>${book.publisher}</p>
				</div>
				<a>
					<img id="thumbnail" src="${book.thumbnail}" onclick="location.href='./bookDetail.do?book_code=${book.book_code}'">
				</a>
			</li>
		</c:forEach>
		</ul>
	</div>
		
</div>


</body>
<%@include file="footer.jsp" %>
</html>