<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>Stay</title>
<style>
#index_header {
	padding-top: 100px;
}

.main1 {
	margin-top: 100px;
}

.carousel-item .carousel-caption p {
	font-family: 'S-CoreDream-2ExtraLight';
	font-size: 30px;
	font-style: italic;
	margin-bottom: 80px;
	margin-left: 50%;
	width: 600px;
	position: relative;
	background-color: rgba(0, 0, 0, 0.4);
	transform: translate(-50%, -50%);
}
/************************************/
.booking-form {
	font-family: 'Eoe_Zno_L';
	color: white;
}

.input-grp {
	width: 150px;
	display: inline-block;
	margin: 30px 10px;
}

.input-grp .form-control {
	font-size: 12px;
	background: transparent;
	border-radius: 0;
	color: #fff;
	box-shadow: none;
	margin: 0px 50px;
	height: 33px;
}

.input-grp .custom-select {
	background: black;
	color: #fff;
	font-size: 12px;
	border: 1px solid #ced4da;
	box-shadow: none;
	border-radius: 0;
	background: transparent;
	margin: 0px 50px;
	height: 33px;
}

option {
	background: #343a40;
	font-size: 12px;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

.banner {
	/*float: left;*/
	margin: 10px 0;
	/*position: relative;*/
}

.banner a {
	display: block;
	background-color: rgba(0, 0, 0, .5);
	width: 100%;
	height: 100%;
}

.banner img {
	z-index: 1;
	display: block;
	height: 100%;
	width: 100%;
	position: relative;
}

.centered {
	z-index: 2;
	font-family: 'S-CoreDream-2ExtraLight';
	font-weight: bold;
	border-radius: 5px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 25px;
	color: #fff;
	text-shadow: 0 1px #000;
	text-align: center;
	background-color: rgba(0, 0, 0, 0.2);
	width: 80px;
	height: 45px;
	border: 2px solid white;
}

.banner:hover img {
	z-index: -1;
	position: relative;
}
/************************************/
.main .container-fluid {
	padding: 0;
}

@media screen and (max-width: 767px) {
	.container {
		max-width: 1000px;
	}

	.carousel-item .carousel-caption p {
		font-size: 25px;
		width: 400px;
	}
	.input-grp .form-control, .input-grp .custom-select {
		margin: 0;
	}
	.booking-form .input-grp {
		width: 100%;
		margin: 10px 10px;
	}
}

@media screen and (min-width: 768px) and (max-width: 1200px) {
	.booking-form .input-grp {
		margin: 20px 20px;
		width: 25%;
	}
}

.modal-content .modal-header, .modal-content .modal-footer {
	border: 0px;
}
/*##################################*/
</style>
</head>
<body>
<jsp:include page="common/header.jsp" flush="false"/>
<div class="main" id="index_main">
	<div id="index_header">
		<!-- Carousel -->
		<div class="container-fluid carousel">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators(사진 순서 표시하는 작은 막대기들) -->
				<ul class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0"
						class="active bg-light"></li>
					<li data-target="#myCarousel" data-slide-to="1" class="bg-light"></li>
					<li data-target="#myCarousel" data-slide-to="2" class="bg-light"></li>
					<li data-target="#myCarousel" data-slide-to="3" class="bg-light"></li>
				</ul>
				<!-- 실제 내용(사진+설명) -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img style="height: 500px; width: 100%; margin: 0;"
							src="img/1.jpg" alt="seoul" class="d-block mx-auto">
						<div class="carousel-caption">
							<p>
								여행과 장소의 변화는<br /> 우리 마음에 활력을 선사한다<br /> <span
									style="font-size: 15px;">세네카</span>
							</p>
						</div>
					</div>
					<div class="carousel-item">
						<img style="height: 500px; width: 100%; margin: 0;"
							src="img/2.jpg" alt="LA" class="d-block mx-auto">
						<div class="carousel-caption">
							<p>
								바보는 방황하고,<br /> 현명한 사람은 여행한다.<br /> <span
									style="font-size: 15px;">토마스 풀러</span>
							</p>
						</div>
					</div>
					<div class="carousel-item">
						<img style="height: 500px; width: 100%; margin: 0;"
							src="img/3.jpg" alt="3" class="d-block mx-auto">
						<div class="carousel-caption">
							<p>
								낯선 땅이란 없다.<br /> 단지 여행자가 낯설 뿐이다.<br /> <span
									style="font-size: 15px;">로버트 루이스 스티븐슨</span>
							</p>
						</div>
					</div>
					<div class="carousel-item">
						<img style="height: 500px; width: 100%; margin: 0;"
							src="img/4.jpg" alt="4" class="d-block mx-auto">
						<div class="carousel-caption">
							<p>
								희망차게 여행하는 것이<br /> 목적지에 도착하는 것보다 좋다.<br /> <span
									style="font-size: 15px;">로버트 루이스</span>
							</p>
						</div>
						<!-- carousel-item(4개) -->
					</div>
					<!-- carousel-item(2개) -->
				</div>
				<!-- carousel-inner(1개) -->
			</div>
			<!-- carousel (1개) -->
		</div>
		<!-- container -->
	
		<!-- Booking Form -->
		<div class="container-fluid bg-dark">
			<form>
				<div class="booking-form container input-group">
					<div class="input-grp">
						<select class="custom-select" name="Area">
							<option value="#">&nbsp;&nbsp;지역&nbsp;&nbsp;</option>
							<option value="1">&nbsp;&nbsp;강원&nbsp;&nbsp;</option>
							<option value="2">&nbsp;&nbsp;경기&nbsp;&nbsp;</option>
							<option value="3">&nbsp;&nbsp;경남&nbsp;&nbsp;</option>
							<option value="4">&nbsp;&nbsp;경북&nbsp;&nbsp;</option>
							<option value="5">&nbsp;&nbsp;대구&nbsp;&nbsp;</option>
							<option value="6">&nbsp;&nbsp;부산&nbsp;&nbsp;</option>
							<option value="7">&nbsp;&nbsp;서울&nbsp;&nbsp;</option>
							<option value="8">&nbsp;&nbsp;인천&nbsp;&nbsp;</option>
							<option value="8">&nbsp;&nbsp;전남&nbsp;&nbsp;</option>
							<option value="8">&nbsp;&nbsp;전북&nbsp;&nbsp;</option>
							<option value="8">&nbsp;&nbsp;제주&nbsp;&nbsp;</option>
							<option value="8">&nbsp;&nbsp;충남&nbsp;&nbsp;</option>
							<option value="8">&nbsp;&nbsp;충북&nbsp;&nbsp;</option>
							<option value="8">&nbsp;&nbsp;대전&nbsp;&nbsp;</option>
							<option value="8">&nbsp;&nbsp;세종&nbsp;&nbsp;</option>
							<option value="8">&nbsp;&nbsp;울산&nbsp;&nbsp;</option>
							<option value="8">&nbsp;&nbsp;광주&nbsp;&nbsp;</option>
						</select>
					</div>
					<div class="input-grp">
						<input type="text" id="CheckIn" class="form-control select-date"
							value="Check In">
					</div>
					<div class="input-grp">
						<input type="text" id="CheckOut" class="form-control select-date"
							value="Check Out">
					</div>
					<div class="input-grp">
						<input type="number" class="form-control" placeholder="Adult">
					</div>
					<div class="input-grp">
						<input type="number" class="form-control" placeholder="Child">
					</div>
					<div class="input-grp">
						<input type="submit" class="form-control" value="제출">
					</div>
				</div>
			</form>
		</div>
		<!-- 사진 카드 -->
		<div class="container mt-3 mb-3">
			<div class="row">
				<div class="col-lg-4 col-md-6 col-sm-6 banner">
					<a href="acmList?location=서울">
						<div class="centered">서울</div> <img alt="seoul"
						src="img/seoul.jpg">
					</a>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 banner">
					<a href="acmList?location=제주">
						<div class="centered">제주</div> <img alt="jongno"
						src="img/jeju.jpg">
					</a>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 banner">
					<a href="acmList?location=인천">
						<div class="centered">인천</div> <img alt="incheon"
						src="img/incheon.jpg">
					</a>
				</div>
	
				<div class="col-lg-4 col-md-6 col-sm-6 banner">
					<a href="acmList?location=대구">
						<div class="centered">대구</div> <img alt="daegu"
						src="img/daegu.jpg">
					</a>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 banner">
					<a href="acmList?location=경기">
						<div class="centered">경기</div> <img alt="gyeonggi"
						src="img/Gyeonggi.jpg">
					</a>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 banner">
					<a href="acmList?location=강원">
						<div class="centered">강원</div> <img alt="gangwon"
						src="img/gangwon.jpg">
					</a>
				</div>
	
				<div class="col-lg-4 col-md-6 col-sm-6 banner">
					<a href="acmList?location=경남">
						<div class="centered">경남</div> <img alt="gyeongnam"
						src="img/Gyeongsangnam-do.jpg">
					</a>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 banner">
					<a href="acmList?location=경북">
						<div class="centered">경북</div> <img alt="gyeongbuk"
						src="img/Gyeongbuk.jpg">
					</a>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 banner">
					<a href="acmList?location=충남">
						<div class="centered">충남</div> <img alt="chungnam"
						src="img/chungnam.jpg">
					</a>
				</div>
	
				<div class="col-lg-4 col-md-6 col-sm-6 banner">
					<a href="acmList?location=충북">
						<div class="centered">충북</div> <img alt="chungbuk"
						src="img/chungbuk.jpg">
					</a>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 banner">
					<a href="acmList?location=전북">
						<div class="centered">전북</div> <img alt="jeonbuk"
						src="img/jeonbuk.jpg">
					</a>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 banner">
					<a href="acmList?location=전남">
						<div class="centered">전남</div> <img alt="jeonnam"
						src="img/jeonnam.jpg">
					</a>
				</div>
	
				<div class="col-lg-4 col-md-6 col-sm-6 banner">
					<a href="acmList?location=부산">
						<div class="centered">부산</div> <img alt="Busan"
						src="img/busan.jpg">
					</a>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 banner">
					<a href="acmList?location=대전">
						<div class="centered">대전</div> <img alt="#" src="img/daejeon.jpg">
					</a>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 banner">
					<a href="acmList?location=세종">
						<div class="centered">세종</div> <img alt="#" src="img/sejong.jpg">
					</a>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 banner">
					<a href="acmList?location=울산">
						<div class="centered">울산</div> <img alt="Busan"
						src="img/ulsan1.jpg">
					</a>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 banner">
					<a href="acmList?location=광주">
						<div class="centered">광주</div> <img alt="#" src="img/gwangju.jpg">
					</a>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 banner">
					<a href="#">
						<div class="centered">#</div> <img alt="#" src="img/shap2.jpg">
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<img src="img/logo.jpg">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center" style="font-weight:bold;">
				 회원가입이 성공적으로 이루어졌습니다.
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<img src="img/logo.jpg">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center" style="font-weight:bold;">
				 로그아웃되었습니다.
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="reservationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<img src="img/logo.jpg">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center" style="font-weight:bold;">
				 예약이 완료 되었습니다.
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<jsp:include page="common/footer.jsp" flush="false"/>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- datepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>

<script>
	$("#CheckIn").datepicker({
		autoclose : true
	});
	$("#CheckOut").datepicker({
		autoclose : true
	});

	$(document).ready(function() {
		<c:choose>
			<c:when test="${not empty msg}">
				$("#logoutModal").modal("show");
			</c:when>
			<c:when test="${not empty success}">
				$("#joinModal").modal("show");
			</c:when>
			<c:when test ="${not empty reservation}">
				$("#reservationModel").modal("show");
			</c:when>
		</c:choose>
		$(".menu-toggle").click(function() {
			$("nav").toggleClass("active");
			$(".main").toggleClass("main1");
		});
	});
</script>
</body>
</html>