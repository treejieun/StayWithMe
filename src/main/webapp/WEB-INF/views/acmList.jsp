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

<title>Stay_숙소 리스트</title>
<style>
.main1 {
	margin-top: 100px;
}

#acmList-header {
	padding-top: 110px;
}

.container-fluid h3 {
	margin-top: 20px;
}

#border {
	border: 3px solid #000000;
	margin-bottom: 20px;
	/*border-collapse: collapse;*/
}

#selectDiv {
	text-align: right;
    margin-bottom: 20px;
}

.select-grp {
	display: inline;
}

.acm-select {
	width: 90px;
    height: 38px;
}

.form-group label, .container-fluid h3, .container-fluid h4 {
	font-family: 'S-CoreDream-2ExtraLight';
	font-weight: bold;
}

.mapcont {
	width: 40%;
    position: fixed;
    bottom: 0px;
    top: 100px;
    left: 0;
    z-index: 1;
    /*top: 0;*/
}

#map{
    position: relative;
    overflow: hidden;
    height: 100%;
    width: 100%;
}

.emptyList {
	font-size: 25px;
	padding-top: 100px;
    text-align: center;
    font-weight: bold;
}

.acmList {
	width: 60%;
    position: fixed;
    margin-left: 50%;
    top: 100px;
    right: 0;
    bottom: 0;
    overflow: auto;
    /*z-index: 1;
    top: 0;*/
}

.listForm {
	display : flex;
	align-items: center;
	width : 100%;
	height : 250px;
	border-bottom: 1px solid lightgrey;
	border-top: 1px solid lightgrey;
	border-collapse: collapse;
}

.listSection {
	position: fixed;
	/*margin : 0 auto;*/
	width : 85%;
	height : 85%;
}


.lsImgDiv {
	display: inline-block;
	float: right;
	width: 300px;
	height: 200px;
	cursor: pointer;
}

.lsImg {
	width: 300px;
	height: 200px;
	border-radius: 5px;
}

.lsConDiv {
	float: left;
	display: block;
	padding-left: 20px;
	width: 100%;
	cursor: pointer;
}

.contHead {
	font-size: 13px;
}

.lsConDivMobile {
	display: none;
}

.scrollFix {
	overflow: hidden;
	line-height: 1.35;
    width: 270px;
}

.infoTitle {
	width: 100%;
	margin-top: 10px;
	margin-bottom: 10px;
	word-break: keep-all;
	font-size: 17px;
	font-weight: bold;
	text-align: center;
	display: block;
}

.paging {
	/*align: center;*/
	margin-top: 10px;
}

.paging .pagination {
	display: inline-flex;
}

.dd li:hover {
	background-color: #cccccc;
}

.paging .pagination .page-item.active .page-link {
	background-color: #cccccc!important;
	border-color: #cccccc!important;
}

.gm-style .gm-style-iw-c {
	padding: 0!important;
	max-width: 300px!important;
}

.gm-style .gm-style-iw-d {
	overflow: visible!important;
	display: contents;
}
@media screen and (min-width: 1000px) and (max-width: 1300px) {
	.mapcont {
		width: 30%;
		position: fixed;
	}
	.acmList {
		width: 70%;
		position: fixed;
	}
}

@media screen and (max-width: 1000px) {
	#acmList-header {
		padding-top: 120px;
	}
	.mapcont {
		display: none;
	}
	
	.acmList {
		margin-left: 0;
		position: relative;
		top: 0;
		width: 100%;
	}
}

@media screen and (max-width: 640px) {
	.listForm {
		height: 410px;
		align-items: normal;
		padding-top: 10px;
		display: inline-block;
		position: relative;
	}
	
	.lsImgDiv {
		width: 100%;
    	height: 300px;
	}
	.lsImg {
		width: 100%;
    	height: 300px;
	}
	
	.lsConDiv {
		display: none;
	}
	
	.lsConDivMobile {
		display: block;
	}
	
	.heartDiv {
		position: absolute;
		top: 20px;
		right : 20px;
	}
}

a{
	color: black!important;
}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<div id="ctrlDiv" ng-app="myWishList" ng-cloak ng-controller="myCtrl" class="main">
	<div class="container-fluid" id="acmList-header">
		
		
		<div class="mx-auto">
			<div class="mx-auto">
				<section class="mapcont">
					<div id="map"></div>
				</section>
				<section class="acmList">
					<div style="margin-top:40px; width: 90%;" class="mx-auto">
						<h3>
							숙소 리스트
							<c:if test="${!empty location}">
								<i class="fas fa-angle-right"></i> ${location}
							</c:if>
						</h3>
						<div id="border"></div>
						
						<form action="acmList" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<div id="selectDiv">
								<div class="select-grp">
									<select class="acm-select" name="location">
										<option value="전체">&nbsp;&nbsp;지역&nbsp;&nbsp;</option>
										<option value="강원">&nbsp;&nbsp;강원&nbsp;&nbsp;</option>
										<option value="경기">&nbsp;&nbsp;경기&nbsp;&nbsp;</option>
										<option value="경남">&nbsp;&nbsp;경남&nbsp;&nbsp;</option>
										<option value="경북">&nbsp;&nbsp;경북&nbsp;&nbsp;</option>
										<option value="대구">&nbsp;&nbsp;대구&nbsp;&nbsp;</option>
										<option value="부산">&nbsp;&nbsp;부산&nbsp;&nbsp;</option>
										<option value="서울">&nbsp;&nbsp;서울&nbsp;&nbsp;</option>
										<option value="인천">&nbsp;&nbsp;인천&nbsp;&nbsp;</option>
										<option value="전남">&nbsp;&nbsp;전남&nbsp;&nbsp;</option>
										<option value="전북">&nbsp;&nbsp;전북&nbsp;&nbsp;</option>
										<option value="제주">&nbsp;&nbsp;제주&nbsp;&nbsp;</option>
										<option value="충남">&nbsp;&nbsp;충남&nbsp;&nbsp;</option>
										<option value="충북">&nbsp;&nbsp;충북&nbsp;&nbsp;</option>
										<option value="대전">&nbsp;&nbsp;대전&nbsp;&nbsp;</option>
										<option value="세종">&nbsp;&nbsp;세종&nbsp;&nbsp;</option>
										<option value="울산">&nbsp;&nbsp;울산&nbsp;&nbsp;</option>
										<option value="광주">&nbsp;&nbsp;광주&nbsp;&nbsp;</option>
									</select>
								</div>
								<button type="submit" class="btn btn-dark" style="margin-bottom: 5px;">검색</button>
							</div>
						</form>
					</div>
					<c:if test="${empty list}">
						<div class="section mx-auto d-flex flex-wrap align-content-center container-fluid">
							<div class="emptyList mx-auto">
								<i class="fas fa-exclamation-circle" style="font-size:40px;"></i><br/>
								<p style="padding-top:10px;">이 지역에 등록된 숙소가 없습니다.</p>
							</div>
						</div>
					</c:if>
					<c:forEach items="${list}" var="list">
						<div class="section mx-auto d-flex flex-wrap align-content-center container-fluid" value="${list.acm_address}">
							<div class="listForm">
								<div class="lsImgDiv" onClick="location.href='acmInfo?acm_code=${list.acm_code}'">
									<img src="/stay/resources/upImg/${list.acm_thumbnail}" class="lsImg">
								</div>
								<div class="lsConDiv my-auto" onClick="location.href='acmInfo?acm_code=${list.acm_code}'">
									<c:choose>
										<c:when test="${list.acm_type eq 'apt'}">
											<span class="contHead">아파트</span>
										</c:when>
										<c:when test="${list.acm_type eq 'flat'}">
											<span class="contHead">주택</span>
										</c:when>
										<c:when test="${list.acm_type eq 'guestHouse'}">
											<span class="contHead">게스트하우스</span>
										</c:when>
										<c:when test="${list.acm_type eq 'villa'}">
											<span class="contHead">빌라</span>
										</c:when>
										<c:when test="${list.acm_type eq 'Hanok'}">
											<span class="contHead">한옥스테이</span>
										</c:when>
										<c:when test="${list.acm_type eq pension}">
											<span class="contHead">펜션</span>
										</c:when>
										<c:otherwise>
											<span class="contHead">템플스테이</span>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${list.acm_room_type eq 'wholeH'}">
											<span class="contHead">&nbsp;&nbsp;전체</span>
										</c:when>
										<c:when test="${list.acm_room_type eq 'exclusiveR'}">
											<span class="contHead">&nbsp;&nbsp;개인실</span>
										</c:when>
										<c:when test="${list.acm_room_type eq 'shareR'}">
											<span class="contHead">&nbsp;&nbsp;다인실</span>
										</c:when>
									</c:choose>
									<br/>
									<span id="address">${list.acm_address}</span>
									<!-- <input type="hidden" name="address" value="${list.acm_address}"> -->
									<h4 style="margin-top:10px; word-break: keep-all;" class="title" value="${list.acm_address}">${list.acm_title}</h4>
									<span>인원 ${list.acm_guest_num}명 /</span>
									<span> 침실 ${list.acm_room_num}개 /</span>
									<c:choose>
										<c:when test="${list.acm_bedding eq 'bed'}">
											<span> 침대 /</span>
										</c:when>
										<c:otherwise>
											<span> 온돌방 /</span>
										</c:otherwise>
									</c:choose>
									<span> 화장실 ${list.acm_bath_num}개</span>
									<h4 style="margin-top:10px; color:#ec6969;">
										${list.acm_charge}
										<span style="color:black; font-size:0.9rem;"> /1박</span>
									</h4>
								</div><!-- lsConDiv -->
								<br/>
								<div class="lsConDivMobile my-auto">
									
									<c:choose>
										<c:when test="${list.acm_type eq 'apt'}">
											<span class="contHead">아파트</span>
										</c:when>
										<c:when test="${list.acm_type eq 'flat'}">
											<span class="contHead">주택</span>
										</c:when>
										<c:when test="${list.acm_type eq 'guestHouse'}">
											<span class="contHead">게스트하우스</span>
										</c:when>
										<c:when test="${list.acm_type eq 'villa'}">
											<span class="contHead">빌라</span>
										</c:when>
										<c:when test="${list.acm_type eq 'Hanok'}">
											<span class="contHead">한옥스테이</span>
										</c:when>
										<c:when test="${list.acm_type eq pension}">
											<span class="contHead">펜션</span>
										</c:when>
										<c:otherwise>
											<span class="contHead">템플스테이</span>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${list.acm_room_type eq 'wholeH'}">
											<span class="contHead">&nbsp;&nbsp;전체</span>
										</c:when>
										<c:when test="${list.acm_room_type eq 'exclusiveR'}">
											<span class="contHead">&nbsp;&nbsp;개인실</span>
										</c:when>
										<c:when test="${list.acm_room_type eq 'shareR'}">
											<span class="contHead">&nbsp;&nbsp;다인실</span>
										</c:when>
									</c:choose>
									<h4 style="margin-top:10px; word-break: keep-all;">${list.acm_title}</h4>
								</div><!-- lsConDivMobile -->
								<div style="height:100%;" class="heartDiv">
									<input type="hidden" class="tg"/>
									<input type="hidden" class="hiddenCode" value="${list.acm_code}">
									<span class="heart" style="font-size: 1.5em;"><!-- onclick="wish()"  -->
									  <i class="far fa-heart"></i>
									</span>
								</div>
							</div><!-- listForm -->
						</div>
					</c:forEach>
					<div>
						<div class="paging" align="center">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link" href="acmList${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
								</c:if> 
							
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
									<li class="page-item pageNumber"><a class="page-link pageNum" href="acmList${pageMaker.makeQuery(idx)}" num="${idx}">${idx}</a></li>
								</c:forEach>
							
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page-item"><a class="page-link" href="acmList${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
								</c:if> 
							</ul>
						</div>
					</div>
				</section>
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
<!-- n g -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<!-- geocoding -->
<script async defer src="https://maps.googleapis.com/maps/api/js?&key=AIzaSyB_AJKPN0Wc4MHuwPgdbLdzCeqRk4hGDV8&callback=initMap"></script>


<script>
//var lite = angular.element(".heart").css({"color": "#FC4C4E"});
//var lite = angular.element(".heart").css("color");
//console.log("lite : " + lite);
//console.log('${jsonList}');
//console.log(json.length);
//alert("ssss" + json[2].acm_title);
$(function () {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function (e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});

var json = JSON.parse('${jsonList}');
var obj = [];	//jason array 담을
var app = angular.module("myWishList", []);

var wishCode = new Array;
app.controller("myCtrl", function($scope) {
	$scope.products = JSON.parse(localStorage.getItem("wishKey"));
	$scope.removeItem = function (x) {	//products는 로컬스토리지, json은 acmList
		$scope.products = JSON.parse(localStorage.getItem("wishKey"));	/*로컬스토리지를 객체로 하기*/
		//console.log("$scope.products[i].acm_code ; " + $scope.products[1].acm_code);
		//console.log("json[x].acm_title : " + json[2].acm_code);
		for (var i = 0; i < $scope.products.length; i++){
			if($scope.products[i].acm_code == json[x].acm_code){
				//alert("로컬스토리지에 저장된 순서" + i);
				$scope.products.splice(i, 1); //ng-click의index와 splice의 번호로 같이 삭제됨
			    localStorage.removeItem("wishKey"); //하트 클릭해서 하나가 삭제되면 로컬스토리지 wishKey배열이 다 사라짐 
			    localStorage.setItem("wishKey",JSON.stringify($scope.products));//로컬스토리에 새로 저장.(value값은 이제 다시 문자열로 products 배열이 들어감)
			    return;
			}
		}
		//console.log("333" + json[x].acm_code);
		//console.log($scope.products[0].acm_code); 로컬스토리지 저장된 위시숙소
		/*angular.forEach($scope.products, function(value) {
			  console.log(value.acm_code);
			});*/
		/*for (var i = 0; i < 3; i++) {
			if($scope.products[i].acm_thumbnail == x){	//x는 클릭한 곳의 파일명
				//alert(i); i는 스토리지에 저장된 색인번호
			}
			}*/
		//alert("heart의 ix : " + x);
	}
	$scope.getWishCode = function(){
		$scope.products = JSON.parse(localStorage.getItem("wishKey"));	/*로컬스토리지를 객체로 하기*/
		
		if ($scope.products != null){
			for (var i = 0; i < $scope.products.length; i++){
				wishCode.push($scope.products[i].acm_code);
			}
			
		}
	}
});

$(document).ready(function() {
	angular.element(document.getElementById('ctrlDiv')).scope().getWishCode();
	//console.log("wishCode : "  + wishCode + "  && wishCode.length : " + wishCode.length);
	
	 $(".heart").each(function(index,item){
		 var hC = $(this).parent().parent().parent().find(".hiddenCode").val();
		 $.each(wishCode, function(idex, it){
			 if (it == hC){
				 $(item).find("i").removeClass("far fa-heart").addClass("fas fa-heart");
				 $(item).css({"color": "#FC4C4E"});
				 $(item).parent().parent().parent().find('input[type=hidden]').val(1);
			 }
		 });
		 //$(item).addClass('li_0' + index);
	 });
	
	
	 $(".heart").on("click",function(){
		    var target = $(this).parent().parent().parent().find(".tg").val();
			var ix = $(".heart").index(this);
		    if(target == 0)
		    {
		        target = 1;
		        $(this).parent().find(".tg").val(target);
		        $(this).find("i").removeClass("far fa-heart").addClass("fas fa-heart");
				$(this).css({"color": "#FC4C4E"});
				 //console.log(json[ix].acm_title);
				 console.log("json[ix]    :     " + json[ix]);	//[object Object]
				 
				 if(localStorage.getItem("wishKey") == null) {
						obj[0] = json[ix];
						var y = JSON.stringify(obj);
						//alert(obj.length);
						console.log("obj   " + obj);	//[object Object]
						localStorage.setItem("wishKey",y);
						//alert(localStorage.getItem("wishKey"));
					
					}
					
					else{
						var z= localStorage.getItem("wishKey"); //json string
						obj = JSON.parse(z); //jason array
						leng = obj.length;//배열의 원소개수
						obj[leng] = json[ix];
						var a = JSON.stringify(obj);
						localStorage.setItem("wishKey",a);
					}
		    }
		    else
		    {
		        target = 0;
		        $(this).parent().find(".tg").val(target);
		        $(this).find("i").removeClass("fas fa-heart").addClass("far fa-heart");
		        $(this).css({"color": "black"});
		        angular.element(document.getElementById('ctrlDiv')).scope().removeItem(ix);
		    }
		    $(this).parent().find(".tg").val(target);
		});
	

});


$(document).ready(function() {
	$(".menu-toggle").click(function() {
		$("nav").toggleClass("active");
		$(".main").toggleClass("main1");
	});
	
	var x;
	var endPage = window.location.search.substr(34,1);
	console.log(endPage);
	var d = window.location.pathname;
	if(endPage == "") {
		$(".pageNumber").eq(0).addClass("active");
	}
	else if(endPage == $(".pageNum").eq(0).attr("num")) {
		$(".pageNumber").eq(0).addClass("active");
	}
	else if(endPage == $(".pageNum").eq(1).attr("num")) {
		$(".pageNumber").eq(1).addClass("active");
	}
	else if(endPage == $(".pageNum").eq(2).attr("num")) {
		$(".pageNumber").eq(2).addClass("active");
	}
	else if(endPage == $(".pageNum").eq(3).attr("num")) {
		$(".pageNumber").eq(3).addClass("active");
	}
	else if(endPage == $(".pageNum").eq(4).attr("num")) {
		$(".pageNumber").eq(4).addClass("active");
	}
	
});

//geocoder callback함수(비동기 처리)
function initMap() {
	//기본적으로 보여질 좌표와 확대정도 설정하여 id가 map인 곳에 뿌려줌
	var map = new google.maps.Map(document.getElementById("map"), {
		zoom: 11,
		center: {
			lat: 37.564524,
			lng: 126.973872
		}
	});
	//주소-좌표 변환 객체 생성
	var geocoder = new google.maps.Geocoder();
	
	//section클래스의 각 value값(미리 정해놓은 각 섹션 안의 숙소 주소)을 array에 저장
	var addressArray = [];
	$(".section").each(function(){
		var value = $(this).attr("value");
		addressArray.push(value);
	});
	
	//lsImg클래스의 각 이미지 주소를 array에 저장
	var imgArray = [];
	$(".lsImg").each(function() {
		var src = $(this).attr("src");
		imgArray.push(src);
	});
	
	//title클래스의 각 내용과 value값을 array에 저장
	var titleArray = [];
	$(".title").each(function() {
		var html = $(this).text();
		var val = $(this).attr("value");
		titleArray.push({
			"html" : html,
			"addr" : val
		});
	});

	var xObject = [];
	var markers = [];
	var info = [];
	var total = addressArray.length;
	var counter = 0;
	var thumbnail = "${list[0].acm_thumbnail}";
	var HOME_PATH = window.HOME_PATH||'.';
	
	//section클래스의 각 value값을 array에 저장해 그것을 for문처리.
	//비동기라 페이지에 보이는 section순서에 따라 처리가 이루어지지 않고 매번 결과 순서가 다르게 나옴.
	addressArray.forEach(function(addr) {
		
		//주소로 좌표 검색. geocoder안의 address값에 for문으로 돌려주는 각 addressArray의 값을 addr로 대입하여 넣어줌
		geocoder.geocode({'address':addr}, function(result, status) {
			console.log(result);
			console.log(status);
			
			//결과 값을 활용하기 위해 배열에 필요 정보를 각각 푸쉬해줌
			xObject.push({
				"addr" : addr,
				"lat" : result[0].geometry.location.lat(),
				"lng" : result[0].geometry.location.lng()
			});
			
			//0부터 계속해서 반복
			counter++;
			
			var marker, i;
			
			//addressArray배열의 길이와 counter값이 같을 때
			if(total === counter) {
				for(i = 0 ; i < total ; i++) {
					
					//마커 생성함. 마커, section, info창이 각각 동일한 정보를 담고 있는지 확인해야하기 때문에 id 설정함.
					marker = new google.maps.Marker({
						
						//위에서 푸쉬한 xObject배열 이용
						id: xObject[i].addr,
						position: new google.maps.LatLng(xObject[i].lat, xObject[i].lng),
						map: map,
						icon: "https://maps.google.com/mapfiles/ms/icons/blue-dot.png"
					});
					
					//마커를 활용하기 위해 배열 안에 푸쉬해준다.
					markers.push(marker);
					
					//인포창을 생성해줌. 마찬가지로 xObject배열 이용
					var infowindow = new google.maps.InfoWindow({
						id: xObject[i].addr,
						maxWidth: 1000
					});
					
					//활용 위해 배열 안에 푸쉬함.
					info.push(infowindow);
					
				}
				
				//각 마커를 눌렀을때 인포창이 뜨고 마커 색이 변경되는 for문
				markers.forEach(function(marker, k) {
					for(var k = 0, kk = markers.length; k<kk; k++) {
						
						//for문을 돌리는 각각의 마커의 아이디가 마찬가지로 반복으로 돌리는 info의 아이디와 같은 경우만 골라냄.
						if(info[k].id == marker.id) {
							
							//그때의 인포창
							var infom = info[k];
							
							//마커가 클릭됐을때의 이벤트 처리.
							marker.addListener("click", function() {
								
								//인포창이 떠있을때 클릭하면 닫히고 색상이 원래대로 돌아감.
								if(infom.getMap()) {
									infom.close();
									marker.setIcon("https://maps.google.com/mapfiles/ms/icons/blue-dot.png");
								}
								
								//인포창이 띄워져있지 않으면 클릭했을때 열리게 함.
								else {
									infom.open(map, marker);
									
									//그때의 마커 속성을 바꿔줌.
									marker.setIcon("https://maps.google.com/mapfiles/ms/icons/red-dot.png");
									for(var n = 0 , nn = markers.length; n < nn; n++) {
										
										//인포창과 그 안에 들어갈 내용이 같은 정보를 갖고 있을 때
										if(infom.id == titleArray[n].addr) {
											//인포내용 set
											infom.setContent('<div class="scrollFix">' +
										            '	<div style="display:block;width:270px;height:180px;"><img src="'+ imgArray[n] + '" style="width:100%;height:100%;"></div>' +
										            '	<div class="infoTitle container">' + titleArray[n].html + '</div>' +
										            '</div>');
										}
									}
								}
							});
							
							
						}
					}
					
				});
				
				//각 숙소정보 섹션마다 마우스오버&아웃을 처리(=for문)
				$(".section").each(function() {
					$(this).on({
						mouseover: function() {
							for(var j = 0; j < total; j++) {
								if(markers[j].id == $(this).attr("value")) {
									markers[j].setIcon({
										url: "https://maps.google.com/mapfiles/ms/icons/red-dot.png",
										scaledSize: new google.maps.Size(40,40)
									});
									map.setCenter(new google.maps.LatLng(xObject[j].lat, xObject[j].lng));
									
								}
							}
						},
						mouseout: function() {
							for(var j = 0; j < total; j++) {
								if(markers[j].id == $(this).attr("value")) {
									markers[j].setIcon("https://maps.google.com/mapfiles/ms/icons/blue-dot.png");
									markers[j].setAnimation(null);
								}
							}
						}
					});
				});
				
			}
			
		});
		
	});
}


</script>
</body>
</html>