<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    margin-top: 30px;
    padding: 0;
    border: 0;
    border-bottom: 1px solid #ccc;
    border-top: 1px solid #ccc;
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
#srcBtn{
margin-left:0px;

}
#search{

margin-left: 350px;
}
    
</style>

</head>
<%@include file="header.jsp"%>
<body>

<a id="payInfo2"></a>
	<div style="background-color: #F5EFFB; padding-bottom: 100px;">
<div class="container text-center">
  <form id="search">
    <table>
      <tr>
        <td>
          <select name="selectOpt" class="form-select input-lg">
            <option class="searchOption" value="TITLE">도서명</option>
            <option class="searchOption" value="AUTHOR">저자</option>
            <option class="searchOption" value="ISBN">ISBN</option>
          </select>
        </td>
        <td>
          <input id="booksearch" class="form-control input-lg" type="text" name="inputVal" placeholder="검색어를 입력하세요">
        </td>
        <td>
          <button style="height:46px;" id="srcBtn" class="btn btn-success" type="button">도서검색</button>
        </td>
      </tr>
    </table>
  </form>
</div>
	
	</div>
	<div class="shortcutZone">
					<div class="shortcutList">
						<div class="item1"><a href="./askBoardList.do"><span><img src="./img/3746544_board_cooking_cutting_kitchen_knife_icon.png"> 문의게시판</span></a></div>
						<div class="item2"><a href="./orderlist.do"><span><img src="./img/ordercurrent.png">주문현황</span></a></div>
						<div class="item3"><a href="./bookListUser.do"><span>도서보기</span></a></div>
						<c:choose>
						<c:when test="${empty sessionScope.loginVo.user_id}">
							<div class="item4"><a href="./login.do"><span>대출현황</span></a></div>
							<div class="item5"><a href="./login.do"><span>예약현황</span></a></div>
						</c:when>
						<c:otherwise>
							<div class="item4"><a href="./myBorrowNow.do?user_id=${sessionScope.loginVo.user_id}"><span>대출현황</span></a></div>
							<div class="item5"><a href="./myReserve.do?user_id=${sessionScope.loginVo.user_id}"><span>예약현황</span></a></div>
						</c:otherwise>
						</c:choose>
<!-- 						<div class="item6"><a href="/"><span>???</span></a></div> -->
					</div>
				</div>
				<script type="text/javascript" src="./js/search.js"></script>
<%@include file="footer.jsp" %>
</body>

</html>