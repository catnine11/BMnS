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
		margin-top: 40px;
	}
	
/* 	.selectBox { */
/*   position: relative; */
/*   width: 150px; */
/*   height: 35px; */
/*   margin: 3px; */
/*   border-radius: 4px; */
/*   border: 2px solid lightcoral; */
/* } */
/* .selectBox .select { */
/*   width: inherit; */
/*   height: inherit; */
/*   background: transparent; */
/*   border: 0 none; */
/*   outline: 0 none; */
/*   padding: 0 5px; */
/*   position: relative; */
/*   z-index: 3;  */
/* } */
/* .selectBox .select option { */
/*   background: lightcoral; */
/*   color: #fff; */
/*   padding: 3px 0; */
/*   font-size: 16px; */
/* } */
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="./css/button.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/search.js"></script>
<script type="text/javascript">
	function genreList(pageNum){
		var selectedGenre = $("#genreSelect").val();
		console.log(selectedGenre);
		
// 		var select = document.getElementById("genreSelect");
// 		var idx = select.selectedIndex;
// 		var opt = select.options[idx];
// 		var selectedGenre =opt.text;
// 		console.log(selectedGenre);
		
		if(selectedGenre =="전체"){
			window.location.href="./bookListAdmin.do";
		}
		
		$.ajax({
			url: "./bookListGenre.do",
			type: "post",
			data: {selectedGenre: selectedGenre,
					page: pageNum},
			dataType: "json",
			success: function (data) {
				console.log(data);
				console.log(data.selectGenre);
				console.log(data.selectGenre[0]);
				console.log(data.selectGenre.length);
				
				$("#bookList").html("");
				var html = "";
				html+="<table class='table table-hover'> ";
				html+="<tbody> ";
				
				for (var i = 0; i < data.selectGenre.length; i++) {
					var book = data.selectGenre[i];
				
				html+="		<tr id='tr-hover'>      ";
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
				html+="				<input type='button'  class='custom-btn btn-8' value='도서 상세' onclick='getDetail("+book.book_code+")'>";  
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
<!-- 		<h4>도서등록</h4> -->
<!-- 		<div> -->
<!-- 			<input id="enroll" type="text"> -->
<!-- 			<input id="enrollBtn" type="button" class="custom-btn btn-8" value="책등록" > -->
<!-- 		</div> -->
	</div>
	<p></p>
		<div class="selectGenre selectBox">
			<select id="genreSelect" class="Genre select" name="selectedGenre" onchange="genreList()">
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
			<h3>장르를 변경할 도서를 체크하고 변경버튼을 눌러주세요</h3>
			<div class="selectBox">
				<select id="genreChange" class="Genre select" name="selectedChangeGenre">
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
				<button type="submit"  class="custom-btn btn-8">장르변경</button>
			</div>
			<div id="bookList">
				<table class="table table-hover">
					<tbody>
						<c:forEach items="${lists}" var="book">
							<tr id="tr-hover">
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
									<input type="button"  class="custom-btn btn-8 btn-sm" value="도서 상세" onclick="getDetail(${book.book_code})">
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
<%-- 				${p } --%>
		<div style="text-align: center;" class="frame">
	        <ul class="paging ">
	            <c:if test="${p.startPage > 1}">
	                <li><a href="./bookListAdmin.do?page=1">◁</a></li>
	            </c:if>
	            <c:if test="${p.startPage>1}">
					<c:choose>
						<c:when test="${p.startPage-p.countPage <=0}">
							<li><a href="./bookListAdmin.do?page=1">◀</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="./bookListAdmin.do?page=${p.startPage-p.countPage}">◀</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>
	            
	            <c:forEach var="pageNum" begin="${p.startPage}" end="${p.endPage}" step="1">
	                <c:choose>
	                    <c:when test="${pageNum == p.page}">
	                        <li class="active"><a href="./bookListAdmin.do?page=${pageNum}">${pageNum}</a></li>
	                    </c:when>
	                    <c:otherwise>
	                        <li><a href="./bookListAdmin.do?page=${pageNum}">${pageNum}</a></li>
	                    </c:otherwise>
	                </c:choose>
	            </c:forEach>
	            
	            <c:if test="${p.endPage < p.totalPage}">
	                <c:choose>
						<c:when test="${p.startPage+p.countPage > p.totalPage}">
							<li><a href="./bookListAdmin.do?page=${p.totalPage}">▶</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="./bookListAdmin.do?page=${p.startPage+p.countPage}">▶</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>
				
				<c:if test="${p.endPage < p.totalPage}">               
<%-- 				 <li><a href="./bookListAdmin.do?page=${p.totalPage - p.totalPage%p.countPage+1}">▷</a></li> --%>
				 <li><a href="./bookListAdmin.do?page=${p.totalPage}">▷</a></li>
	            </c:if>
	        </ul>
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