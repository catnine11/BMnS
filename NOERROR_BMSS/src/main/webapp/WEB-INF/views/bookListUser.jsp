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
<title>NOERROR 책</title>
<style type="text/css">
	#thumbnail{
		width: 20%;
 		height: 20%;
	}
	
	.imgList li{
		position: relative;
		display: bolck;
		box-sizing: border-box;
		cursor: pointer;
/* 		float: left; */
		
	}
	
 	.imgList li .over{
 		position: absolute;
 		top: 0;
 		left: 0;
 		bottom: 0;
 		padding: 20%;
 		width: 100%;
 		text-align: center;
 		display: none;
 	}
</style>
<script type="text/javascript">
	function genreList(){
		 var selectedGenre = $("#genreSelect").val();
		 
		 $.ajax({
		        type: "POST",
		        url: "./bookListUserGenre.do",
		        data: { genre: selectedGenre }, // 선택한 장르를 서버로 보내기
		        success: function (data) {
		            // 서버로부터 받은 데이터로 도서 목록 업데이트
		            $("#bookList").html(data);
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
<%-- ${lists} --%>

<!-- <table> -->
<!-- 	<thead> -->
<!-- 		<tr> -->
<!-- 			<td colspan="2">장르 선택</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>장르</th> -->
<!-- 			<th>썸네일</th> -->
<!-- 		</tr> -->
<!-- 	</thead> -->
<!-- </table> -->

<div class="container">
		<div class="selectGenre">
			<select class="genreSelect" name="selectedGenre" onchange="genreList()">
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
		<div>
			<ul class="imgList">
			<c:forEach items="${lists}" var="book">
				<li>
					<div class="over">
						<strong>${book.title}</strong>
						<span>${book.author}</span>
						<p>${book.publisher}</p>
					</div>
					<a>
						<img id="thumbnail" src="${book.thumbnail}" onclick="location.href='/bookDetail.do?book_code=' + '${book.book_code}'">
					</a>
					<div>
					
					</div>
				</li>
			</c:forEach>
			</ul>
		</div>
</div>


</body>
<%@include file="footer.jsp" %>
</html>