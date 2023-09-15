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
</style>
</head>
<body>
	<header>
		<div id="snb">
			<div id="siteMenu" class="siteMenu">
				<div class="site">
					<div class="login">
						<a id="login" href="./login.do" style="text-decoration: none; font-size: 20px; margin-right: 5px; color: black;">로그인</a>
						<a id="logout" href="./logout.do" style="text-decoration: none; font-size: 20px; margin-right: 5px; color: black;">로그아웃</a>
					</div>
					<div class="join">
						<a id="join" href="./join.do" style="text-decoration: none; font-size: 20px; margin-right: 5px; color: black;">회원가입</a>
						<a id="myInfo" href="./detailUser.do" style="text-decoration: none; font-size: 20px; margin-right: 5px; color: black;">내정보</a>
					</div>
				</div>
			</div>
		</div>

		<nav id="head">
			<div id="heads">
				<div id="Banner" style="overflow: auto"></div>
				<ul class="tab">
					<li class="nav-menu"><a class="menu" href="/noerrorbmss" ><img class="logo" src="./img/BMSS아이콘.png">NOERROR 책check</a></li>
					<li><a class="navtab" id="navdrop" href="#">자료검색</a></li>
					<li><a class="navtab" id="navdrop" href="#">이용안내</a></li>
					<li><a class="navtab" id="navdrop" href="#">도서관소식</a></li>
					<li><a class="navtab" id="navdrop" href="#">도서관소개</a></li>
					<li></li>
				</ul>
			</div>
		</nav>

	</header>
	<script type="text/javascript">
// 	window.onload = function() {
// 	    var loginButton = document.getElementById("login");
// 	    var logoutButton = document.getElementById("logout");
// 	    var joinButton = document.getElementById("join");
// 	    var myInfoButton = document.getElementById("myInfo");

// 	    checkSession();
	    
// 	    function checkSession() {
// 	        var userSession = sessionStorage.getItem("loginVo");
// 	        var socialSession = sessionStorage.getItem("info");
// 	        console.log(userSession);
// 	        if (userSession || socialSession) {
// 	            loginButton.style.display = "none"; 
// 	            joinButton.style.display = "none"; 
// 	            logoutButton.style.display = "block"; 
// 	            myInfoButton.style.display = "block"; 
// 	        } else {
// 	            loginButton.style.display = "block"; 
// 	            joinButton.style.display = "block"; 
// 	            logoutButton.style.display = "none"; 
// 	            myInfoButton.style.display = "none"; 
// 	        }
// 	    }
	    
// 	    logoutButton.onclick = function() {
// 	        sessionStorage.removeItem("loginVo");
// 	        sessionStorage.removeItem("info");
// 	        checkSession();
// 	    }
// 	}

	</script>
</body>
</html>