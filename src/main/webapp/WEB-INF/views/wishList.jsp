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
<title>Stay_위시리스트</title>
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
@font-face { font-family: 'Eoe_Zno_L'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/Eoe_Zno_L.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'S-CoreDream-2ExtraLight'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-2ExtraLight.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'KBIZHanmaumGothic'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/KBIZHanmaumGothic.woff') format('woff'); font-weight: normal; font-style: normal; }

.main1 {
	margin-top: 100px;
}

#top-container {
	padding-top: 150px;
}
.form-group label, .container h3, .container div, .container h4{
	font-family: 'S-CoreDream-2ExtraLight';
	font-weight: bold;
}
#border {
	border: 3px solid #000000;
	/*border-collapse: collapse;*/
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  overflow : hidden;
  margin-top: 10px;
  margin-bottom: 10px;
  text-align: center;
  position: relative;
}
.heartDiv {
	position: absolute;
	top: 5px;
	right : 10px;
}

.tImgDiv {
    overflow : hidden;
	display: inline-block;
	height : 230px;
	max-height: 230px;
}
.tImg {
	border-radius: 5px;
	width: 100%;
	height : 100%;
}
#address {
	height : 22px;
 	white-space: nowrap; 
 	overflow: hidden;
 	width : 80%;
 	text-align: center;
}
#title {
	white-space: nowrap; /*한줄로 모두 처리*/
 	overflow: hidden;	/*넘치는 부분 없애버림*/
	width : 90%;
	margin:auto;
	margin-top:10px; 
	margin-bottom:10px;
}
#noneDivIn {
	border-style: dashed;;
	border-width: 3px;
	border-color: #343a40;
}
#noneDiv {
	width : 90%;
	border-style: solid;
	border-width: 3px;
	border-color: #343a40;
}
.mx-auto h2 {
	background-color: #343a40;
	max-width : 600px;
	margin : auto; 
	color: white;
	padding: 5px;
	word-break : keep-all;
}
#howTo {
	max-width : 600px;
	margin : auto; 
	word-break : keep-all;
}
@media screen and (max-width: 576px) {
	#noneDiv {
		width: 300px;
	}
	
	.mx-auto h2 {
		font-size: 20px;
	}
}
</style>
</head>
<body>
<div ng-app="myWishList" ng-cloak ng-controller="myCtrl">
	<div ng-include="'header'"></div>
	<div class="main">
		<div class="container" id="top-container">
			<h3>위시리스트</h3>
			<div id="border"></div>
			<div ng-if="products.length == 0 || !products">
				<div id="noneDiv" class="mx-auto p-1 mt-5 mb-5">
					<div id="noneDivIn" class="p-5">
						<div class="mx-auto text-center">
							<img ng-src="img/logo.jpg" class="img-fluid">
						</div>
						<h2 class="text-center">관심 있는 숙소를 저장해보세요.</h2>
						<div id="howTo"  class="text-center">
							<span class="heart" style="font-size: 1.5em;"><!-- onclick="wish()"  -->
								<i class="far fa-heart"></i>
							</span> 버튼을 누르시면 위시리스트에서 다시 보실 수 있습니다
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12 col-sm-6 col-lg-4" ng-repeat ="x in products track by $index">
					<div class="card">
						<div class="tImgDiv" ng-click="info(x.acm_code)" >
							<img ng-src="upImg/{{x.acm_thumbnail}}" class="tImg">
						</div>
						<div class="lsConDiv my-auto" ng-click="info(x.acm_code)">
							<div id="address" class="mx-auto">{{x.acm_address}}</div>
							<h4 id="title">{{x.acm_title}}</h4>
							<span>인원 {{x.acm_guest_num}}명 /</span>
							<span> 침실 {{x.acm_room_num}}개 /</span>
							<span> 화장실 {{x.acm_bath_num}}개</span>
							<h5 style="color:#ec6969;">
								{{x.acm_charge}}
								<span style="color:black; font-size:0.9rem;"> /1박</span>
							</h5>
						</div>
						<div style="height:100%;" class="float-right heartDiv">
							<input type="hidden"/>
							<span class="heart" ng-click="removeItem($index)" style="font-size: 1.5em;"><!-- onclick="wish()"  -->
							  <i class="fas fa-heart"></i>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div ng-include="'footer'"></div>
</div>


<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- n g -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<!-- 
<script>
$.noConflict();
	jQuery(".menu-toggle").click(function() {
		jQuery("nav").toggleClass("active");
		jQuery(".main").toggleClass("main1");
	});
    
}); 

</script>-->

<script>
angular.element(".heart").css({"color": "#FC4C4E"});
var app = angular.module("myWishList", []);
app.controller("myCtrl", function($scope) {
    //$scope.products = ["Milk", "Bread", "Cheese"]; 
    $scope.products = JSON.parse(localStorage.getItem("wishKey"));	/*로컬스토리지를 객체로 하기*/
    console.log("products : " + $scope.products); //value(array)
    
    //상품 (행) 삭제
   $scope.removeItem = function (x) {
      $scope.products.splice(x, 1); //ng-click의index와 splice의 번호로 같이 삭제됨
      localStorage.removeItem("wishKey"); //하트 클릭해서 하나가 삭제되면 로컬스토리지 wishKey배열이 다 사라짐 
      localStorage.setItem("wishKey",JSON.stringify($scope.products));//로컬스토리에 새로 저장.(value값은 이제 다시 문자열로 products 배열이 들어감)
     }
   $scope.info = function(x) {
	   location.href='acmInfo?acm_code=' + x;
   }
});
</script>
</body>
</html>