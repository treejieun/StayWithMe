<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- datepicker -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">

<title>Insert title here</title>
<style>
@font-face { font-family: 'Eoe_Zno_L'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/Eoe_Zno_L.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'S-CoreDream-2ExtraLight'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-2ExtraLight.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'KBIZHanmaumGothic'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/KBIZHanmaumGothic.woff') format('woff'); font-weight: normal; font-style: normal; }

.header {
	/*커밋-push test 5*/
    background-color: #fff;
    border-bottom: 1px solid #e5e5e5;
}

nav, figure, footer, header {
    display: block;
}


.header #logo {
    position: relative;
    line-height: 100px;
}

.header #logo img {
    transition: all .2s ease-in-out;
    width: 300px;
    height: auto;
}

.row .navbar {
    border-left: 1px solid #e5e5e5;
    border-right: 1px solid #e5e5e5;
    border-top: 0;
    border-bottom: 0;
    margin-bottom: 0;
    border-radius: 0;
    display: block;
    padding: 0;
    position: relative;
    min-height: 50px;

}

.navbar .top-navbar, .navbar .main-navbar {
    height: 50px;
    border-bottom: 1px solid #e5e5e5;
    margin: 0;
}
.header .search-box {
    width: 40%;
}
.header .link-box, .header .search-box {
    float: left;
    text-align: center;
}

.header .link-box {
    width: 30%;
    border-left: 1px solid #e5e5e5;
}
.header .link-box ul {
    margin: 0 2% 0 3%;
    width: 93%;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-justify-content: space-around;
    -ms-flex-pack: distribute;
    justify-content: space-around;
}

.header .link-box li {
    float: left;
}
.header .link-box li a, .header .search-box a {
   font-family: 'Eoe_Zno_L';
    display: inline-block;
    color: #000;
    font-size: 13px;
    height: 50px;
    line-height: 50px;
    text-decoration: none;
    font-weight: 700;
}

.header .main-navbar ul {

    margin: 0 2% 0 3%;
    width: 93%;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-justify-content: space-around;
    -ms-flex-pack: distribute;
    justify-content: space-around;
}

.header .main-navbar li {
    float: left;
}
.header .main-navbar li a {
	font-family: 'Eoe_Zno_L';
    display: inline-block;
    color: #000;
    font-size: 13px;
    height: 50px;
    line-height: 50px;
    text-decoration: none;
    font-weight: 700;
}

@media screen and (max-width: 767px) {
	
   .header .container {
      max-width: 1000px;
   }
   .header #logo img {
       width: 200px;
       height: auto;
       margin-left: 0;
   }
   
   .menu-toggle {
      display: block;
      width: 40px;
      height: 70px;
      margin: 5px;
      float: right;
      cursor: pointer;
      text-align: center;
      font-size: 30px;
      
   }
   .menu-toggle:before {
      content: '\f0c9';
      font-family: fontAwesome;
      line-height:20px;
   }
   
   .row #top-nav-bar {
   		border-top: 1px solid #e5e5e5;
		display: none;
		width:100%;
		margin-left: 0!important;
       	margin-right: 0!important;
   }
   /*nav {
      display:none!important;
   }
   
   nav.active {
      display: block!important;
      width:100%;
      margin-left: 0!important;
       margin-right: 0!important;
   }
   
   nav.active .top-navbar {
      border-top: 1px solid #e5e5e5;
      margin-right: 10px;
      width: 100%;
   }*/
}

* {
	font-family: 'S-CoreDream-2ExtraLight';
}

</style>
</head>
<body>

<header id="header" class="header fixed-top">
	<div class="container">
		<div class="row">
			<figure id="logo" class="col-md-6 m-0">
				<a href="index" id="home"> <img src="img/logo.jpg" id="logoimg" alt="stay with me">
				</a>
				<div class="menu-toggle" onclick="toggle()"></div>
			</figure>

			<nav class="navbar col-md-6" id="top-nav-bar">
				<div class="top-navbar row">
					<div class="search-box">
						<a id="acmList" href="acmList?location=전체">지역별 숙소찾기</a>
					</div>
					<div class="link-box">
						<ul class="list-unstyled">
							<li class="qna-btn-li"><a href="#">Q&A</a></li>
							<li class="cs-btn-li"><a href="csMember" id="nav-cs">고객센터</a></li>
						</ul>
					</div>
					<div class="link-box">
						<ul class="list-unstyled">
							<sec:authorize access="hasAnyRole('ROLE_GUEST','ROLE_HOST', 'ROLE_ADMIN')">
								<li class="login-btn-li"><a href="logout" id="nav-logout">로그아웃</a></li>
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
								<li class="login-btn-li"><a href="login?log=start" id="nav-login">로그인</a></li>
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
								<li class="signup-btn-li"><a href="memberjoin" id = "nav-memberjoin">회원가입</a></li>
							</sec:authorize>
							<sec:authorize access="hasAnyRole('ROLE_GUEST','ROLE_HOST')">
								<li class="signup-btn-li"><a href="myPageProfile" id = "nav-myPageProfile" style="padding-top:3px;"><i class="fas fa-user-circle" style="font-size:20px;"></i></a></li>
							</sec:authorize>
							<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
								<li class="signup-btn-li"><a href="adminMain" id = "nav-adminMain">관리자</a></li>
							</sec:authorize>
						</ul>
					</div>
				</div>
				<div id="main-nav-bar" class="main-navbar row">
					<ul class="list-unstyled">
						<li class="wish-btn-li"><a href="wishList" id="wish">위시리스트</a></li>
						<sec:authorize access="isAnonymous()">
							<li class="confirm-btn-li"><a href="login">예약확인</a></li>
						</sec:authorize>
						<sec:authorize access="hasAnyRole('ROLE_GUEST','ROLE_HOST','ROLE_ADMIN')">
							<li class="confirm-btn-li"><a href="reservationCheck">예약확인</a></li>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<li class="host-btn-li"><a href="hostJoin" id="host">호스트</a></li>
						</sec:authorize>
						<sec:authorize access="hasAnyRole('ROLE_GUEST', 'ROLE_ADMIN')">
							<li class="host-btn-li"><a href="hostJoin" id="host">호스트</a></li>
						</sec:authorize>
						<sec:authorize access="hasAnyRole('ROLE_HOST')">
							<li class="host-btn-li"><a href="hostBoard?pagenum=1&contentnum=3" id="hostB">호스트</a></li>
						</sec:authorize>
						<!-- <li class="host-btn-li"><a href="#" id="host">호스트</a></li> -->
						<li class="event-btn-li"><a href="#">이벤트</a></li>
						<li class="notice-btn-li"><a href="#">공지사항</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
</header>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
function toggle() {
	var x = document.getElementById("top-nav-bar");
	var m = document.getElementById("main");
	
	if(x.style.display =="block") {
		x.style.display = "none";
	}
	else {
		x.style.display = "block";
	}
}
/*
$(document).ready(function() {
	$("#nav-login").click(function() {
		event.preventDefault();
		if ($("#nav-login").text() == "로그인") {
			location.href = "login?log=start";
		} else {
			location.href = "logout";
		}
	});
	
});

*/
</script>
<script>
/*$(document).ready(function(){
	$("#nav-memberjoin").click(function(){
		event.preventDefault();
		if($("#nav-memberjoin").text() == "회원가입") {
			location.href = "memberjoin";
		}else{
			location.href = "myPageProfile";
		}
	});
});*/
</script>
<script>/*
$(document).ready(function(){
	$("#host").click(function(){
		event.preventDefault();
		if(sessionStorage.getItem("authority") == "[ROLE_GUEST]") {
			location.href = "hostJoin";
		} else if (sessionStorage.getItem("authority") == "[ROLE_HOST]") {
			location.href="hostBoard";
		} else if (sessionStorage.getItem("authority") == "") {
			/*비회원일시 로그인으로 이동후 인덱스로 이동*//*
			location.href="hostJoin"
		}
	});
});
/*
$(document).ready(function(){
	
	
	if(sessionStorage.getItem("user") != "" && sessionStorage.getItem("user") != null){
		$("#nav-login").text("로그아웃");
		$("#nav-memberjoin").html("<i class='fas fa-user-circle'></i>");
		$("#nav-memberjoin").css({
			"font-size" : "20px"
		});
	}
});*/
</script>
</body>
</html>