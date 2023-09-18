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
}
#head{
	position: relative;
	background: #fff;
	border-bottom: 1px solid #e1e1e1;
}
</style>
<%
	UserVo loginVo = (UserVo)session.getAttribute("loginVo");
%>
</head>
<body>
	<header>
	고유번호 | 이름&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 구분<br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${loginVo.user_id} &nbsp;| ${sessionScope.loginVo.user_name} | ${loginVo.user_email} | ${loginVo.gubun}
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
					<li class="nav-menu"><a class="menu" href="/NOERROR_BMSS" ><img class="logo" src="./img/BMSS아이콘.png">NOERROR 책check</a></li>
					<li><a class="navtab" id="navdrop" href="#">자료검색</a></li>
					<li><a class="navtab" id="navdrop" href="#">이용안내</a></li>
					<li><a class="navtab" id="navdrop" href="#">도서관소식</a></li>
					<li><a class="navtab" id="navdrop" href="#">도서관소개</a></li>
					<li></li>
				</ul>
			</div>
		</nav>
	</header>
</body>
</html>