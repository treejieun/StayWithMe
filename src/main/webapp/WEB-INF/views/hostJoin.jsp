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
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<!-- 기본값으로 Header가 존재 (X-CSRF-TOKEN) default값 -->
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Stay_호스트 등록</title>
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

.form-group label, .container h3, .container div{
	font-family: 'S-CoreDream-2ExtraLight';
	font-weight: bold;
}

#border {
	border: 3px solid #000000;
	/*border-collapse: collapse;*/
}
.border2 {
	border-bottom: 3px solid #000000;
	font-size : 1.2em;
}
#top-container .row {
	margin-bottom: 25px;
}
#ho_address .form-control, #complete-btn .form-control, #ho_acc_num {
	border: none;
	border-radius: 0;
	border-bottom: 2px solid grey;
	margin: 0px;
    margin-bottom: 25px;
   }
}
</style>
</head>
<body ng-app="hostJoin" ng-controller="hostCtrl">
<jsp:include page="common/header.jsp" flush="false"/>

<div class="main">
<div id="top-container" class="container">
	<h3>호스트등록</h3>
	<div id="border"></div>
	<div class="row d-flex justify-content-center pt-5" style="max-width:1200px;">
		<div class="col-10 col-sm-10 mt-3 mb-3"> <!-- dddddddddd -->
			<form method="POST" action ="hostWrite" enctype="multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<sec:authentication property="principal.username" var="mb_id"/>
				<input type="hidden" id="mb_id" name="mb_id" value="${mb_id}">
				<div class="row mb-5 mt-5">
					<div class="col-sm-3 border2">주소</div> 
				</div>
				<div><!-- 주소 정보 -->
					<div class="mb-5" id="ho_address"> <!-- form안에서 이전,다음버튼과 컨텐츠과의 거리 -->
						<div class="row d-flex justify-content-start">
							<div class="col-sm-3 col-5">
								<input class="form-control btn btn-dark" type="button" onclick="daumPostcode()" value="주소찾기">
							</div>
						</div>
						<div class="row d-flex justify-content-between">
							<div class="col-sm-6">
								<input class="form-control" type="text" name="ho_address"  id="address" placeholder="주소 찾기를 클릭해 주소를 검색해주세요">
							</div>
							<div class="col-sm-6">
								<input class="form-control" type="text" id="extraAddress" placeholder="참고주소">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-9">
								<input class="form-control" type="text" name="ho_add_detail"  id="detailAddress" placeholder="상세주소를 입력해주세요">
							</div>
							<div class="col-sm-3 d-flex justify-content-end">
								<input class="form-control" type="text" name="ho_zip"  id="postcode" placeholder="우편번호" value="00000">
							</div>
						</div>
						
						<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
						</div>
					</div>
			    </div>
			    
			    <div class="row mb-5 mt-5">
					<div class="col-sm-3 border2">계좌 정보</div> 
				</div>
				<div><!-- 계좌 정보 -->
					<div class="mb-5"> <!-- form안에서 이전,다음버튼과 컨텐츠과의 거리 -->
						<div class="row">
							<div class="col-sm-3">
								<select class="form-control" ng-model="selectedBank" ng-options="x for x in banks">
								</select>
								<input type="hidden" value="{{selectedBank}}" name="ho_account"  id="ho_account">
							</div>
							<div class="col-sm-9">
								<input class="form-control" type="text" name="ho_acc_num"  id="ho_acc_num" placeholder="계좌번호를 입력해 주세요">
							</div>
						</div>
					</div>
			    </div>
			    <sec:authorize access="hasAnyRole('ROLE_GUEST')">
				    <div id="complete-btn" class="d-flex flex-row-reverse">
					    <div class="text-center">
							<button type="submit" class="form-control btn btn-dark" style="border: none;">호스트 등록 하기</button>
						</div>
					</div>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
				    <div id="complete-btn" class="d-flex flex-row-reverse">
					    <div class="text-center">
							<a href="hostBoard" class="form-control btn btn-dark" style="border: none;">호스팅 안내판으로 이동</a>
						</div>
					</div>
				</sec:authorize>
			</form>
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

<!-- ng -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>

<!-- 다음 주소 검색 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>
var app = angular.module('hostJoin', []);
app.controller('hostCtrl', function($scope) {
    $scope.banks = ["국민", "신한", "농협"];
});
</script>

<script>
function daumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}
</script>
<script>
$(document).ready(function(){
	$(".menu-toggle").click(function() {
 		$("nav").toggleClass("active"); 
 		$(".main").toggleClass("main1");
 	});
});	
</script>
</body>
</html>