<%@page import="com.gd.bmss.vo.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#snb {
	position: relative;
	background: #fff;
	border-bottom: 1px solid #e1e1e1;
	padding-bottom: 40px;
}

.site {
	display: flex;
	float: right;
	margin-top: 5px;
	margin-right: 10px;
	justify-content: space-between;
}

.gnb {
	overflow: hidden;
	position: relative;
	height: 86px;
	max-width: 1500px;
	margin: 0 auto;
	padding-right: 120px;
	display: flex;
}

ul {
	list-style: none;
}

.tab {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: white;
	padding: 8px 12px;
	text-align: center;
	font-size: 12px;
	font-weight: bolder;
	margin: 0;
	opacity: 0.9;
	min-width: 100px;
	height: 90px;
	font-style: normal;
}

.navtab {
	color: #000;
	text-decoration: none;
	font-size: 20px;
}
.menu, .menu:hover{
	font-size: 30px;
	color: #000;
	text-decoration: none;
}

.navtab:hover {
	color: #a4a2a2;
}
img{
	height: 50px;
	width: 40px;
	margin-top: 20px;
}
#head{
	position: relative;
	background: #fff;
	border-bottom: 1px solid #e1e1e1;
}
.nav-menu{
margin-bottom: 20px;
}
#loginInfo{
	text-decoration: none;
	color: black;
	cursor: default;
}
</style>
<%
	UserVo loginVo = (UserVo)session.getAttribute("loginVo");
%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<header>
		<div id="snb">
			<div id="siteMenu" class="siteMenu">
				<div class="site">
					<div class="login">
					<%
					if(loginVo == null){
						%>
						<a id="login" href="./login.do" style="text-decoration: none; font-size: 20px; margin-right: 5px; color: black;">로그인</a>
						<%
					}else{
						%>	
 						<a id="loginInfo">${loginVo.user_name }님</a> 
						<a id="logout" href="./logout.do" style="text-decoration: none; font-size: 20px; margin-right: 5px; color: black;">로그아웃</a>
						<%
					}
					%>
					</div>
					<div class="join">
					<%
					if(loginVo == null){
						%>
						<a id="join" href="./join.do" style="text-decoration: none; font-size: 20px; margin-right: 5px; color: black;">회원가입</a>
						<%
					}else if(loginVo.getUser_auth().equalsIgnoreCase("A")){
						%>	
						<a id = "admin" href = "./adminPage.do" style="text-decoration: none; font-size: 20px; margin-right: 5px; color: black;">회원관리</a>
						<a class = "admin" href = "./bookListAdmin.do" style="text-decoration: none; font-size: 20px; margin-right: 5px; color: black;">도서관리</a>
						<%
					}else{
						%>
						<a id="myInfo" href="./detailUser.do" style="text-decoration: none; font-size: 20px; margin-right: 5px; color: black;">내정보</a>
						<%
					}
					%>
					</div>
				</div>
			</div>
		</div>

		<nav id="head">
			<div id="heads">
				<div id="Banner" style="overflow: auto"></div>
				<ul class="tab">

					<li class="nav-menu"><a id="imgMenu" class="menu" href="/NOERROR_BMSS" ><img class="logo" src="./img/BMSS아이콘.png"></a><a id="imenu" class="menu" href="/NOERROR_BMSS" >NOERROR 책check</a></li>

					<li><a class="navtab" id="navdrop" href="#">자료검색</a></li>
					<li><a class="navtab" id="navdrop" href="./bookListUser.do">신착도서</a></li>
					 <%if(loginVo!=null && loginVo.getUser_auth().equalsIgnoreCase("A")){ %>
		  <li class="dropdown">
                <a class="navtab dropdown-toggle" id="navdrop" data-toggle="dropdown" href="./getSellableStock.do">재고 및 주문<span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                    <li role="presentation"><a href="./stocklist.do">재고목록</a></li>
                    <li role="presentation" class="divider"></li>
                    <li role="presentation"><a href="./cronStockList.do">재고대기목록</a></li>
                    <li role="presentation" class="divider"></li>
                    <li role="presentation"><a href="./orderlist.do">주문목록</a></li>
                    <li role="presentation" class="divider"></li>
                </ul>
            </li>
            <%}else if(loginVo!=null && loginVo.getUser_auth().equalsIgnoreCase("U")){  %>
					<li><a class="navtab" id="navdrop" href="./oderListUser.do?user=${loginVo.user_id}">주문 조회</a></li>
				<%}%>
				<%if(!(loginVo!=null && loginVo.getUser_auth().equalsIgnoreCase("A"))){ %>
					<li><a class="navtab" id="navdrop" href="./getSellableStock.do">판매도서목록</a></li>
				<%} %>
					<li></li>
				</ul>
			</div>
		</nav>
		<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	</header>
</body>
</html>