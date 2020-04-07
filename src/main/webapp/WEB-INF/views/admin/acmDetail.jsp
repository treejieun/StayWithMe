<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- csrf정보  -->
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- datepicker -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- multi date picker 추가 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">

<title>Stay_숙소 정보</title>
<style>
.main {
  margin-left: 300px;
}

#acmDetail-header {
	padding-top: 100px;
}

#border {
	border: 3px solid #000000;
	/*border-collapse: collapse;*/
}

.form-group label, .container h3, .container h4 {
	font-family: 'S-CoreDream-2ExtraLight';
	font-weight: bold;
}

.mainDiv {
	margin-top: 40px;
    width: 90%;
    margin-bottom: 150px;
}

.option {
	padding:10px 0px;
	font-weight:bold;
}

#title {
	word-break: keep-all;
	margin-bottom: 10px;
    padding: 10px 0px;
    border-top: 2px solid black;
    border-bottom: 2px solid black;
    text-align: center;
}

.amenity {
	width:130px;
	margin-right: 15px;
	display:inline-block;
}

.ck-widget img {
	width: 100%;
}

#sideSticker {
	position :fixed;
	top: 200px;
	border : 1px solid gray;
	width : 300px;
	margin-left : 10px;
	margin-right : 10px;
	height : auto;
}
/*스크롤 footer까지 넘어가지 않게 하는 부분*/
#sideSticker.on {
	position: static!important;
	/*width: 100%!important;*/
	top:0px!important;
}

#sideSticker.on2 {
	position: static!important;
	/*width: 100%!important;*/
	/*top:800px!important;*/
}

.sideSub {
	margin: 10px;
	width:70%;
	border-top:1px solid lightgray;
}

.rule {
    width:120px;
    display:inline-block;
}


#sideTitle {
	text-align:center;
	width:180px;
	background-color:lightgrey;
	margin-bottom:10px;
	margin-top:20px;
}

@media screen and (max-width: 991px) {
	#sideSticker {
		position: static!important;
		margin-top: 30px;
		width: 250px;
	}
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/navbar.jsp" flush="false"/>

<div class="main">
	<div class="container" id="acmDetail-header">
		<h3>숙소 정보</h3>
		<div id="border"></div>
		
		<div class="mainDiv mx-auto">
			<div class = "row" style = "margin-botoom : 300px">
				<div class = "col-lg-8">
					<div class="option">
						<i class="fas fa-home"></i>
						<c:choose>
							<c:when test="${acmInfo[0].acm_type eq 'apt'}">
								<span class="contHead">아파트</span>
							</c:when>
							<c:when test="${acmInfo[0].acm_type eq 'flat'}">
								<span class="contHead">주택</span>
							</c:when>
							<c:when test="${acmInfo[0].acm_type eq 'guestHouse'}">
								<span class="contHead">게스트하우스</span>
							</c:when>
							<c:when test="${acmInfo[0].acm_type eq 'villa'}">
								<span class="contHead">빌라</span>
							</c:when>
							<c:when test="${acmInfo[0].acm_type eq 'Hanok'}">
								<span class="contHead">한옥스테이</span>
							</c:when>
							<c:when test="${acmInfo[0].acm_type eq pension}">
								<span class="contHead">펜션</span>
							</c:when>
							<c:otherwise>
								<span class="contHead">템플스테이</span>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${acmInfo[0].acm_room_type eq 'wholeH'}">
								<span class="contHead">&nbsp;전체</span>
								<br/>
								<span style="font-weight:normal;">게스트가 숙소 전체를 다른 사람과 공유하지 않고 단독으로 이용합니다. <br/>일반적으로 침실, 욕실, 부엌이 포함됩니다.</span>
							</c:when>
							<c:when test="${acmInfo[0].acm_room_type eq 'exclusiveR'}">
								<span class="contHead">&nbsp;개인실</span>
								<br/>
								<span style="font-weight:normal;">게스트에게 개인 침실이 제공됩니다. 침실 이외의 공간은 공용일 수 있습니다.</span>
							</c:when>
							<c:when test="${acmInfo[0].acm_room_type eq 'shareR'}">
								<span class="contHead">&nbsp;다인실</span>
							</c:when>
						</c:choose>
					</div>
					<div class="option" style="border-top: 1px solid lightgray;">
						<i class="fas fa-home"></i>
						숙소 정보
						<br/>
						<span style="font-size:14px;font-weight:normal;">
							인원 ${acmInfo[0].acm_guest_num}명 /
							침실 ${acmInfo[0].acm_room_num}개 /
							<c:choose>
								<c:when test="${acmInfo[0].acm_bedding eq 'bed'}">
									<span> 침대 /</span>
								</c:when>
								<c:otherwise>
									<span> 온돌방 /</span>
								</c:otherwise>
							</c:choose>
							화장실 ${acmInfo[0].acm_bath_num}개
						</span>
					</div>
					<h3 id="title">${acmInfo[0].acm_title}</h3>
					<div class="infoContent">
						${acmInfo[0].acm_info}
					</div>
					<div style="border-top: 3px solid #000000; padding: 15px 0px;">
						<div class="amenityTitle">
							<h4 style="border-bottom:1px solid lightgrey;padding-bottom:5px;">편의시설</h4>
						</div>
						<div>
							<c:forEach items="${amenity}" var="amenity">
								<c:choose>
									<c:when test="${amenity.acm_amenity eq 'wifi'}">
										<span class="amenity">
											<i class="fas fa-wifi"></i>
											<span>무선 인터넷</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'tv'}">
										<span class="amenity">
											<i class="fas fa-tv"></i>
											<span>TV</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'kitchen'}">
										<span class="amenity">
											<i class="fas fa-utensils"></i>
											<span>주방</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'dish'}">
										<span class="amenity">
											<i class="fas fa-bullseye"></i>
											<span>식기 제공</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'lock'}">
										<span class="amenity">
											<i class="fas fa-lock"></i>
											<span>방 잠금장치</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'towel'}">
										<span class="amenity">
											<i class="fas fa-scroll"></i>
											<span>수건</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'washer'}">
										<span class="amenity">
											<i class="fas fa-tshirt"></i>
											<span>세탁기</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'dryer'}">
										<span class="amenity">
											<i class="fas fa-wind"></i>
											<span>건조기</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'shower'}">
										<span class="amenity">
											<i class="fas fa-bath"></i>
											<span>샤워 시설</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'hairdryer'}">
										<span class="amenity">
											<i class="fas fa-bullhorn"></i>
											<span>헤어 드라이기</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'fan'}">
										<span class="amenity">
											<i class="fas fa-fan"></i>
											<span>선풍기</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'extinguisher'}">
										<span class="amenity">
											<i class="fas fa-fire-extinguisher"></i>
											<span>소화기</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'balcony'}">
										<span class="amenity">
											<i class="fas fa-store"></i>
											<span>발코니</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'garden'}">
										<span class="amenity">
											<i class="fas fa-seedling"></i>
											<span>마당</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'heater'}">
										<span class="amenity">
											<i class="fas fa-temperature-high"></i>
											<span>난방기구</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'breakfast'}">
										<span class="amenity">
											<i class="fas fa-coffee"></i>
											<span>아침식사 제공</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'bbq'}">
										<span class="amenity">
											<i class="fas fa-drumstick-bite"></i>
											<span>BBQ 시설</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'park'}">
										<span class="amenity">
											<i class="fas fa-parking"></i>
											<span>주차공간</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'aircon'}">
										<span class="amenity">
											<i class="fab fa-diaspora"></i>
											<span>에어컨</span>
										</span>
									</c:when>
									<c:when test="${amenity.acm_amenity eq 'infodesk'}">
										<span class="amenity">
											<i class="fas fa-info-circle"></i>
											<span>인포 데스크</span>
										</span>
									</c:when>
								</c:choose>
								
							</c:forEach>
						</div>
					</div>
				</div>
				<div class = "mx-auto col-11 col-sm-8 col-lg-4 row" style = "position : relative;">
					<div style="width:90%;">
						<div id="sideSticker">
							<h4 id="sideTitle" class="mx-auto">예약가능 날짜</h4>
							<div align="center" id="datepicker" style = "font-weight : bold">
								<div>
							    	<input type="hidden" id="acm_availdate" name="acm_availdate" value="${acmInfo[0].acm_availdate}" required />
							    </div>
							</div>
							<div class="mx-auto" style="padding-bottom:10px;">
								<div class="mx-auto sideSub">
								</div>
								<div style="text-align:center;">
									<h4><i class="fas fa-won-sign"></i> ${acmInfo[0].acm_charge}<span style="font-size:13px;">/1박</span></h4>
									<span>체크인: ${acmInfo[0].acm_checkin_time} / </span>
									<span>체크아웃: ${acmInfo[0].acm_checkout_time}</span>
									<div class="mx-auto sideSub">
									</div>
									<h4 id="rule" class="mx-auto" style="width:150px;background-color:lightgrey;margin:20px;">숙소규정</h4>
									<c:forEach items="${rule}" var="rule">
										<c:choose>
											<c:when test="${rule.acm_rule eq 'infant'}">
												<span class="rule" style="width:250px;">
													<span>유아(2세 미만) 숙박 <i class="far fa-circle"></i></span>
												</span>
											</c:when>
											<c:when test="${rule.acm_rule eq 'child'}">
												<span class="rule" style="width:250px;">
													<span>어린이(2~12세) 숙박 <i class="far fa-circle"></i></span>
												</span>
											</c:when>
											<c:when test="${rule.acm_rule eq 'pet'}">
												<span class="rule">
													<span>반려동물 <i class="far fa-circle"></i></span>
												</span>
											</c:when>
											<c:when test="${rule.acm_rule eq 'smoking'}">
												<span class="rule">
													<span>흡연 <i class="far fa-circle"></i></span>
												</span>
											</c:when>
											<c:when test="${rule.acm_rule eq 'party'}">
												<span class="rule">
													<span>행사/파티 <i class="far fa-circle"></i></span>
												</span>
											</c:when>
											<c:when test="${rule.acm_rule eq 'commercial'}">
												<span class="rule">
													<span>상업적 이용 <i class="far fa-circle"></i></span>
												</span>
											</c:when>
										</c:choose>
									</c:forEach>
									<div style="margin:20px;">		
										<button type="button" onClick="location.href='acmArticle'" class="btn btn-dark" style="width:70%;">목록으로</button>					
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- datepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>

<script>
$(document).ready(function() {
	
	$('#datepicker').datepicker({
		format: "dd/mm/yyyy",
		multidate: true,
		daysOfWeekHighlighted: "6,0",
		daysOfWeekDisabled: "0,1,2,3,4,5,6",
		language: 'en'
	});
	
	var srcArray = [];
	
	$(".ck-widget img").each(function() {

		var src = $(this).attr("src");
		var atr = src.substring(22);
		console.log(atr);
		$(this).attr("src", atr);
	});

	if($(".rule").text() == "") {
		$("#rule").remove();
	}
	
	//기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#sideSticker").css("top")); 
	
	var windowHei = $(window).height();
	var docuHei = $(document).height();
	var side = $("#sideSticker");
	var footHei = $("footer").outerHeight();
	var sideHeiSize = side.outerHeight();
	var mainHei = $(".mainDiv").outerHeight();


	$(window).scroll(function(){ //브라우져 제공 scroll이벤트 처리
		//현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();

		var sideHei = side.offset().top;

		var val = docuHei - windowHei;
		var val2 = mainHei - sideHeiSize + "px";
		
		if(docuHei / 3 > val) {
			side.addClass("on");
			
		}
		
		else if(mainHei <= (scrollTop + sideHeiSize)) {
			$("#sideSticker").attr("style", "position:absolute;top:" + val2);
		}
		
		else {
			$("#sideSticker").attr("style", "position:fixed;top:200px");
			side.removeClass("on");
			side.removeClass("on2");
		}
		
	}).scroll();
});
</script>
</body>
</html>