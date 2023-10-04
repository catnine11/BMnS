<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<title>NOERROR 책check</title>
<style type="text/css">
body {
	text-align: center;
}
.shortcutZone{
	-webkit-text-size-adjust: 100%;
    font-size: 18px;
    font-weight: normal;
    line-height: 1.6;
    font-family: 'Noto Sans KR', 'Noto Sans TC', '맑은 고딕', 'Malgun Gothic', 'AppleGothic', sans-serif;
    color: #555;
    letter-spacing: -0.25px;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    border: 0;
}
.shortcutList{
	    -webkit-text-size-adjust: 100%;
    font-size: 18px;
    font-weight: normal;
    line-height: 1.6;
    font-family: 'Noto Sans KR', 'Noto Sans TC', '맑은 고딕', 'Malgun Gothic', 'AppleGothic', sans-serif;
    color: #555;
    letter-spacing: -0.25px;
    box-sizing: border-box;
    margin: 0;
    border: 0;
    display: flex;
    flex-wrap: wrap;
    align-items: flex-start;
    justify-content: space-between;
    width: 100%;
    height: 100%;
    padding: 15px 0 30px;
}
.shortcutList > div{
	width: 15%;
}
.shortcutList > div a{
    -webkit-text-size-adjust: 100%;
    font-size: 18px;
    font-weight: normal;
    line-height: 1.6;
    font-family: 'Noto Sans KR', 'Noto Sans TC', '맑은 고딕', 'Malgun Gothic', 'AppleGothic', sans-serif;
    letter-spacing: -0.25px;
    box-sizing: border-box;
    text-decoration: none;
    color: inherit;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    width: 100%;
    height: 100%;
}
.shortcutList > div a span {
    display: flex;
    flex-direction: column;
    align-items: center;
    font-size: 1.222em;
    font-weight: 500;
    color: #333;
}
</style>
</head>
<%@include file="header.jsp"%>
<body>

<a id="payInfo2"></a>
	<div style="background-color: #D9E5FF; padding-bottom: 100px;">
		<div>
			<form id="search">
				<select name="selectOpt">
					<option class="searchOption" value="TITLE">제목</option>
					<option class="searchOption" value="AUTHOR">저자</option>
					<option class="searchOption" value="ISBN">ISBN</option>
				</select> 
				<input id="booksearch"   type="text" name="inputVal" placeholder="검색어를 입력하세요">
				<button id="srcBtn" type="button">도서검색</button>
			</form>
		</div>
<div>
	<input id="enroll" type="text">
	<input id="enrollBtn" type="button" value="책등록" >
	<script type="text/javascript" src="./js/search.js"></script>
</div>
	
	</div>
	<div class="shortcutZone">
					<div class="shortcutList">
						<div class="item1"><a href="./askBoardList.do"><span><img src="./img/3746544_board_cooking_cutting_kitchen_knife_icon.png"> 문의게시판</span></a></div>
						<div class="item2"><a href="/"><span>주문현황</span></a></div>
						<div class="item3"><a href="/"><span>도서보기</span></a></div>
						<div class="item4"><a href="/"><span>대출현황</span></a></div>
						<div class="item5"><a href="/"><span>예약현황</span></a></div>
						<div class="item6"><a href="/"><span>???</span></a></div>
					</div>
				</div>
<%@include file="footer.jsp" %>
</body>

</html>