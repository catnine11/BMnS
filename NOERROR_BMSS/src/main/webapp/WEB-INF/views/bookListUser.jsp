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
		width: 13%;
 		height: 15%;
 		cursor: pointer;
 		margin: 5px;
	}
	
	
	ul{
		list-style: none;
	}
	
	.imgList li{
		position: relative;
		display: block;
		box-sizing: border-box;
		
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="./css/button.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function genreList(pageNum){
// 		var selectedGenre = $("#genreSelect").val();
// 		console.log(selectedGenre);
		
		var select = document.getElementById("genreSelect");
		var idx = select.selectedIndex;
		var opt = select.options[idx];
		var selectedGenre =opt.text;
		var selectCode= opt.value ;
		console.log("선택된 옵션값: " + selectCode);
		console.log("선택된 옵션의 텍스트: " + selectedGenre);
		
		if(selectedGenre =="전체"){
			window.location.href="./bookListUser.do";
		}
		
		$.ajax({
			url: "./bookListGenre.do",
			type: "post",
			data: {selectedGenre: selectedGenre,
					selectCode: selectCode,
					page: pageNum},
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
				html+="		<img id='thumbnail' src='"+book.thumbnail+"' onclick='getDetail("+book.book_code+")'>";
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
	
	function getDetail(book_code){
	
		location.href ='./bookDetail.do?book_code='+book_code;
	}
	
</script>
</head>
<%@include file="header.jsp" %>
<body>
<div class="container">
	<div class="selectGenre selectBox">
		<select id="genreSelect" class="Genre select" name="selectedGenre" onchange="genreList()">
			<option value="100000">전체</option>
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
					<img id="thumbnail" src="${book.thumbnail}" onclick="getDetail('${book.book_code}')">
				</a>
			</li>
		</c:forEach>
		</ul>
	</div>
	
<%-- 	${p } --%>
	<div style="text-align: center" class="frame">
        <ul class="paging">
            <c:if test="${p.startPage > 1}">
                <li><a href="./bookListUser.do?page=1">◁</a></li>
            </c:if>
            <c:if test="${p.startPage>1}">
				<c:choose>
					<c:when test="${p.startPage-p.countPage <=0}">
						<li><a href="./bookListUser.do?page=1">◀</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="./bookListUser.do?page=${p.startPage-p.countPage}">◀</a></li>
					</c:otherwise>
				</c:choose>
			</c:if>
            
            <c:forEach var="pageNum" begin="${p.startPage}" end="${p.endPage}" step="1">
                <c:choose>
                    <c:when test="${pageNum == p.page}">
                        <li class="active"><a href="./bookListUser.do?page=${pageNum}">${pageNum}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="./bookListUser.do?page=${pageNum}">${pageNum}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            
            <c:if test="${p.endPage < p.totalPage}">
                <c:choose>
					<c:when test="${p.startPage+p.countPage > p.totalPage}">
						<li><a href="./bookListUser.do?page=${p.totalPage}">▶</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="./bookListUser.do?page=${p.startPage+p.countPage}">▶</a></li>
					</c:otherwise>
				</c:choose>
			</c:if>
			
			<c:if test="${p.endPage < p.totalPage}">               
			 <li><a href="./bookListUser.do?page=${p.totalPage - p.totalPage%p.countPage+1}">▷</a></li>
            </c:if>
        </ul>
    </div>
		
</div>


</body>
<%@include file="footer.jsp" %>
</html>