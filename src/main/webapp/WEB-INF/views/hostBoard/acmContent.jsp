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
<!-- datepicker -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- multi date picker 추가 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker3.min.css">
<!-- iCheck(라디오버튼) -->
<link rel="stylesheet" href="icheck-1.x/skins/flat/flat.css">

<title>Stay_숙소 수정</title>
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

form {
	/*margin-top: 50px;*/
	margin-bottom: 100px;
}

.border2 {
	border-bottom: 3px solid #000000;
	font-size : 1.2em;
}
.form-check-label { 
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  /* font-size: 18px;*/
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.form-check-label input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
}

/* On mouse-over, add a grey background color */
.form-check-label:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.form-check-label input:checked ~ .checkmark {
  background-color: #343a40;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.form-check-label input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.form-check-label .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}

#acm_rule .form-check-label, #acm_amenity .form-check-label, #top-container .row, #acm_bedding, #space_type {
	margin-bottom: 25px;
}


#acm_time .form-control, #acm_address .form-control, #complete-btn .form-control {
	border: none;
	border-radius: 0;
	border-bottom: 2px solid grey;
	margin: 0px;
    margin-bottom: 25px;
   }
}

/*사진 좌우로 글씨를 쓸수 있게 해줌 근디 없어도 되는거같은디......*/
:root {
	--ck-image-style-spacing: 1.5em;
}

.ck-content {
	& .image-style-side	{
		max-width: 50%;
		float: right;
		margin-left: var(--ck-image-style-spacing);
	}
}
/*사진 좌우로 글씨를 쓸수 있게 해줌*/

</style>
</head>
<body ng-app="addAcm" ng-controller="acmCtrl">
<jsp:include page="../common/header.jsp" flush="false"/>

<div class="main">
<div id="top-container" class="container">
	<h3>숙소등록</h3>
	<div id="border"></div>
	<div class="row d-flex justify-content-center pt-5" style="max-width:1200px;">
		<div class="col-10 col-sm-10 mt-3 mb-3">
			<form name="frm" method="POST" action ="acmModify" enctype="multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<sec:authentication property="principal.username" var="mb_id"/>
				<input type="hidden" id="mb_id" name="mb_id" value="${mb_id}"><br/>
				<input type="hidden" id="acm_code" name="acm_code" value="${dto.acm_code }">
				<div class="row mb-5">
					<div class="col-sm-3 border2">대여공간 (택 1)</div> 
				</div>
				<div><!-- 대여공간 정보 -->
					<!--********************** name=acm_room_type **********************-->
					<div class="room_type">
					<c:set var="type" value="${acm_room_type }" />
					<c:choose>
						<c:when test="${type == 'wholeH' }">
							<div>
								<div class="mb-3">
									<input type="radio" id="acm_room_type1" name="acm_room_type" value="wholeH" checked> 집 전체<br/>
									<div style="margin-left:20px;">
										<label  for="acm_room_type1">게스트가 숙소 전체를 다른 사람과 공유하지 않고 단독으로 이용합니다. 일반적으로 침실, 욕실, 부엌이 포함됩니다.</label>
									</div>
								</div>
								<div class="mb-3">
									<input type="radio" id="acm_room_type2"  name="acm_room_type" value="exclusiveR"> 개인실<br/>
									<div style="margin-left:20px;">
										<label  for="acm_room_type2">게스트에게 개인 침실이 제공됩니다. 침실 이외의 공간은 공용일 수 있습니다.</label>
									</div>
								</div>
								<div class="mb-3">
									<input type="radio" id="acm_room_type3"   name="acm_room_type" value="shareR"> 다인실<br/>
									<div style="margin-left:20px;">
										<label  for="acm_room_type3">게스트는 개인 공간 없이, 다른 사람과 함께 쓰는 침실이나 공용 공간에서 숙박합니다.</label>
									</div>
								</div>
							</div>						
						</c:when>
						<c:when test="${type == 'exclusiveR' }">
							<div>
								<div class="mb-3">
									<input type="radio" id="acm_room_type1" name="acm_room_type" value="wholeH"> 집 전체<br/>
									<div style="margin-left:20px;">
										<label  for="acm_room_type1">게스트가 숙소 전체를 다른 사람과 공유하지 않고 단독으로 이용합니다. 일반적으로 침실, 욕실, 부엌이 포함됩니다.</label>
									</div>
								</div>
								<div class="mb-3">
									<input type="radio" id="acm_room_type2"  name="acm_room_type" value="exclusiveR" checked> 개인실<br/>
									<div style="margin-left:20px;">
										<label  for="acm_room_type2">게스트에게 개인 침실이 제공됩니다. 침실 이외의 공간은 공용일 수 있습니다.</label>
									</div>
								</div>
								<div class="mb-3">
									<input type="radio" id="acm_room_type3"   name="acm_room_type" value="shareR"> 다인실<br/>
									<div style="margin-left:20px;">
										<label  for="acm_room_type3">게스트는 개인 공간 없이, 다른 사람과 함께 쓰는 침실이나 공용 공간에서 숙박합니다.</label>
									</div>
								</div>
							</div>	
						</c:when>
						<c:otherwise>
							<div>
								<div class="mb-3">
									<input type="radio" id="acm_room_type1" name="acm_room_type" value="wholeH"> 집 전체<br/>
									<div style="margin-left:20px;">
										<label  for="acm_room_type1">게스트가 숙소 전체를 다른 사람과 공유하지 않고 단독으로 이용합니다. 일반적으로 침실, 욕실, 부엌이 포함됩니다.</label>
									</div>
								</div>
								<div class="mb-3">
									<input type="radio" id="acm_room_type2"  name="acm_room_type" value="exclusiveR"> 개인실<br/>
									<div style="margin-left:20px;">
										<label  for="acm_room_type2">게스트에게 개인 침실이 제공됩니다. 침실 이외의 공간은 공용일 수 있습니다.</label>
									</div>
								</div>
								<div class="mb-3">
									<input type="radio" id="acm_room_type3"   name="acm_room_type" value="shareR" checked> 다인실<br/>
									<div style="margin-left:20px;">
										<label  for="acm_room_type3">게스트는 개인 공간 없이, 다른 사람과 함께 쓰는 침실이나 공용 공간에서 숙박합니다.</label>
									</div>
								</div>
							</div>	
						</c:otherwise>
					</c:choose>

					</div>
					
				</div>
				
				<div class="row mb-5 mt-5">
					<div class="col-sm-3 border2">공간 정보</div> 
				</div>
				<div><!-- 공간 정보 -->
					<div class="d-flex justify-content-between" id="space_type">
						<div>공간 타입</div>
						<div class="col-sm-4 col-md-3 col-6">
							<!-- ********************** name="acm_type" ********************** -->
							<select class="form-control" name="acm_type" id="acm_type" >
								<option selected value="apt">아파트</option>
								<option value="flat">주택</option>
								<option value="guestHouse">게스트하우스</option>
								<option value="villa">빌라</option>
								<option value="Hanok">한옥스테이</option>
								<option value="pension">펜션</option>
								<option value="temple">템플스테이</option>
					 		</select>
						</div>
					</div>
					<!--********************** name="bed" name="floor" **********************-->
					
					<div class="d-flex justify-content-between" id="acm_bedding" style="height:38px;">
						<div>침실 타입</div>
						<c:set var="bedding" value="${acm_bedding }" />
						<c:choose>
							<c:when test="${bedding == 'bed' }">
								<div>
									<div class="d-inline">
										<input type="radio" id="bed" name="acm_bedding" value="bed" checked>
										<label for="bed">침대</label>
									</div>
									<div class="d-inline">
										<input type="radio" id="floor" name="acm_bedding" value="floor">
										<label for="floor">온돌</label>
									</div>
								</div>							
							</c:when>
							<c:otherwise>
								<div>
									<div class="d-inline">
										<input type="radio" id="bed" name="acm_bedding" value="bed">
										<label for="bed">침대</label>
									</div>
									<div class="d-inline">
										<input type="radio" id="floor" name="acm_bedding" value="floor" checked>
										<label for="floor">온돌</label>
									</div>
								</div>							
							</c:otherwise>
						</c:choose>
					</div>
				    
				    <!-- ********************** name="acm_guest_num" ********************* -->
					<div class="row">
						<div class="col-sm-8">최대 숙박 가능 인원은 몇 명인가요?</div>
						<div class="col-sm-4">
							<input type="number" id="acm_guest_num" name="acm_guest_num" value="${dto.acm_guest_num}" min="1" max="500" step="1"/>
						</div>
					</div>
					
					
					<!-- *************************** name="acm_room_num"  ****************-->
					<div class="row">
						<div class="col-sm-8">게스트가 사용할 방의 개수는 몇 개인가요?</div>
						<div class="col-sm-4">
							<input type="number" id="acm_room_num" name="acm_room_num" value="${dto.acm_room_num}"  min="1" max="100" step="1"/>
						</div>
					</div>
					
					
					<!-- **************************  name= "acm_bath_num" ************* -->
					<div class="row">
						<div class="col-sm-8">게스트가 사용할 수 있는 화장실은 몇 개인가요?</div>
						<div class="col-sm-4">
							<input type="number" id="acm_bath_num" name= "acm_bath_num" value="${dto.acm_bath_num}" min="1" max="100" step="1"/>
						</div>
					</div>
					
					
					<!-- ****************************** name="acm_area" **************-->
					<div class="row">
						<div class="col-sm-8">게스트가 사용할 전체 공간의 대략적인 평수를 입력해주세요 (단위 : m²) </div>
						<div class=" col-sm-4">
							<input type="number" id="acm_area" name= "acm_area" value="${dto.acm_area}" min="1" max="100" step="1"/>
							<!-- <input type="number" name="acm_area" value="4.5" data-decimals="1" min="0" max="9" step="0.1" /><!-- data-suffix="m²" --> 
							
						</div>
					</div>
				</div>
				
				<div class="row mb-5 mt-5">
					<div class="col-sm-3 border2">주소</div> 
				</div>
				<div><!-- 주소 정보 -->
				<!-- 3번째 -->
					<div class="mb-5" id="acm_address">
						<div class="row d-flex justify-content-start">
							<div class="col-sm-3 col-5">
								<input class="form-control btn btn-dark" type="button" onclick="daumPostcode()" value="주소찾기">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6" style="height: 63px;">
								<input class="form-control" type="text" name="address" value="${dto.acm_address }"  id="address"><br>
							</div>
							<div class="col-sm-6" style="height: 63px;">
								<input class="form-control" type="text" name="extraAddress" id="extraAddress">
							</div>
							<div class="col-sm-12">
								<div id="address_check"></div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-9">
								<input class="form-control" type="text" name="detailAddress" value="${dto.acm_add_detail}"   id="detailAddress">
							</div>
							<div class="col-sm-3 d-flex justify-content-end">
								<input class="form-control" type="text" name="postcode" id="postcode" placeholder="우편번호">
							</div>
							<div class="col-sm-9">
								<div id="detailAddress_check"></div>
							</div>
							<div class="col-sm-3">
								<div id="postcode_check"></div>
							</div>
						</div>
						
						<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
						</div>
					</div>
			    </div>
			    
				<div class="row mb-5 mt-5">
					<div class="col-sm-3 border2">숙소 규칙</div> 
				</div>
				<div><!-- 숙소 규칙 -->
					<!-- ********************** acm_checkin_time, acm_checkout_time **********************-->
					<div class="row" id="acm_time"> 
						<div class="col-sm-6">
							<div class="form-group">
				  				<label for="acm_checkin_time" class="col-form-label">체크인 시간</label>
								<div>
								    <input class="form-control not" type="time" value="${dto.acm_checkin_time }" name="acm_checkin_time" id="acm_checkin_time">
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
				  				<label for="acm_checkout_time" class="col-form-label">체크아웃 시간</label>
								<div>
								    <input class="form-control not" type="time" value="${dto.acm_checkout_time }" name="acm_checkout_time" id="acm_checkout_time">
								</div>
							</div>
						</div>
					</div>
					<!-- *********************** acm_rule *********** -->
					<div class="row mt-5 mb-5" id="acm_rule">
						<div class="col-sm-6">
							<label class="form-check-label"> 유아(2세 미만) 숙박에 적합함
							  <input type="checkbox" name="acm_rule" value="infant">
							  <span class="checkmark"></span>
							</label>
							<label class="form-check-label"> 어린이(2~12세) 숙박에 적합함
							  <input type="checkbox" name="acm_rule" value="child">
							  <span class="checkmark"></span>
							</label>
							<label class="form-check-label"> 반려동물 동반에 적합함
							  <input type="checkbox" name="acm_rule" value="pet">
							  <span class="checkmark"></span>
							</label>
						</div>
						<div class="col-sm-6">
							<label class="form-check-label"> 흡연 가능
							  <input type="checkbox" name="acm_rule" value="smoking">
							  <span class="checkmark"></span>
							</label>
							<label class="form-check-label"> 행사나 파티 허용
							  <input type="checkbox" name="acm_rule" value="party">
							  <span class="checkmark"></span>
							</label>
							<label class="form-check-label"> 상업적 이용 가능
							  <input type="checkbox" name="acm_rule" value="commercial">
							  <span class="checkmark"></span>
							</label>
						</div>
					</div>
				</div>	
				
				<div class="row mb-5 mt-5">
					<div class="col-sm-3 border2">예약 정보</div> 
				</div>
				<div><!-- 예약 정보 -->
					<!-- *****************   name="acm_charge" ********************** -->
					<div class="row">
						<div class="col-sm-8">설정하고 싶은 하루 숙박료를 입력해주세요 (단위 : 원)</div>
						<div class="col-sm-4">
							<input type="number" name="acm_charge" value="${dto.acm_charge }" min="1000" max="5000000" step="1000"/>
						</div>
					</div>
					
					
					<!-- ***************** acm_availdate ***********-->
					<div class="input-group date form-group d-flex justify-content-between" id="datepicker">
						<div>
							<label class="mb-3" for="acm_availdate">예약 가능한 날짜를 선택해주세요</label>
						</div>
						<div>
					    	<input type="hidden" id="acm_availdate" name="acm_availdate" value="${dto.acm_availdate}" required />
					    </div>
					</div>
					<!-- 달력 아이콘
					<i class="glyphicon glyphicon-calendar"></i>  -->
				</div>
				
				
				<div class="row mb-5 mt-5">
					<div class="col-sm-3 border2">숙소 소개</div> 
				</div>
				<div><!-- 숙소 소개 -->
					<!-- ***********  name="acm_title" *************** -->
					<div class="row form-group">
						<label class="mb-3 col-sm-2" for="acm_title">이름 지정</label>
						<div class="col-sm-10">
							<input class="form-control" id="acm_title" name="acm_title" placeholder="숙소 이름을 정해주세요" type="text" value="${dto.acm_title }">
						</div>
					</div>
					
					<!-- ************ name="acm_info"***************** -->
					<div class="row form-group">
						<label class="mb-3 col-sm-2" for="editor">숙소 소개</label>
						<div class="col-sm-10">
							<div id="toolbar-container" style="max-width:100%"></div>
							<div id="editor" class="ck-content" style="max-width:100%;min-height:300px;border:1px solid grey;line-height:0.5rem">${dto.acm_info}</div>
							<textarea id="div1" name="acm_info" style="display:none;"></textarea>
						</div>
					</div>
				</div><!-- 숙소 소개 -->
				<div class="row mb-5 mt-5">
					<div class="col-sm-3 border2">편의시설</div> 
				</div>
				<div class="row mt-5 mb-5" id="acm_amenity"><!-- 편의시설 amenity -->
					<div class="col-sm-3 col-6">
						<label class="form-check-label"> 무선인터넷
						  <input type="checkbox" name="acm_amenity" value="wifi">
						  <span class="checkmark"></span>
						</label>
						<label class="form-check-label"> TV
						  <input type="checkbox" name="acm_amenity" value="tv">
						  <span class="checkmark"></span>
						</label>
						<label class="form-check-label"> 주방
						  <input type="checkbox" name="acm_amenity" value="kitchen">
						  <span class="checkmark"></span>
						</label>
						<label class="form-check-label"> 식기 제공
						  <input type="checkbox" name="acm_amenity" value="dish">
						  <span class="checkmark"></span>
						</label>
						<label class="form-check-label"> 방 잠금장치
						  <input type="checkbox" name="acm_amenity" value="lock">
						  <span class="checkmark"></span>
						</label>
					</div>
					<div class="col-sm-3 col-6">
						<label class="form-check-label"> 수건
						  <input type="checkbox" name="acm_amenity" value="towel">
						  <span class="checkmark"></span>
						</label>
						<label class="form-check-label"> 세탁기
						  <input type="checkbox" name="acm_amenity" value="washer">
						  <span class="checkmark"></span>
						</label>
						<label class="form-check-label"> 건조기
						  <input type="checkbox" name="acm_amenity" value="dryer">
						  <span class="checkmark"></span>
						</label>
						<label class="form-check-label"> 샤워시설
						  <input type="checkbox" name="acm_amenity" value="shower"> 
						  <span class="checkmark"></span>
						</label>
						<label class="form-check-label"> 헤어드라이기
						  <input type="checkbox" name="acm_amenity" value="hairdryer">
						  <span class="checkmark"></span>
						</label>
					</div>
					<div class="col-sm-3 col-6">
						<label class="form-check-label"> 선풍기
						  <input type="checkbox" name="acm_amenity" value="fan">
						  <span class="checkmark"></span>
						</label>
						<label class="form-check-label"> 소화기
						  <input type="checkbox" name="acm_amenity" value="extinguisher">
						  <span class="checkmark"></span>
						</label>
						<label class="form-check-label"> 발코니
						  <input type="checkbox" name="acm_amenity" value="balcony">
						  <span class="checkmark"></span>
						</label><label class="form-check-label"> 마당
						  <input type="checkbox" name="acm_amenity" value="garden"> 
						  <span class="checkmark"></span>
						</label>
						<label class="form-check-label"> 난방기구
						  <input type="checkbox" name="acm_amenity" value="heater">
						  <span class="checkmark"></span>
						</label>
					</div>
					<div class="col-sm-3 col-6">
						<label class="form-check-label"> 인포메이션 데스크
						  <input type="checkbox" name="acm_amenity" value="infodesk">
						  <span class="checkmark"></span>
						</label>
						<label class="form-check-label"> 아침식사 제공
						  <input type="checkbox" name="acm_amenity" value="breakfast">
						  <span class="checkmark"></span>
						</label>
						<label class="form-check-label"> BBQ 시설
						  <input type="checkbox" name="acm_amenity" value="bbq">
						  <span class="checkmark"></span>
						</label><label class="form-check-label"> 주차공간
						  <input type="checkbox" name="acm_amenity" value="park"> 
						  <span class="checkmark"></span>
						</label>
						<label class="form-check-label"> 에어컨
						  <input type="checkbox" name="acm_amenity" value="aircon">
						  <span class="checkmark"></span>
						</label>
					</div>
				</div>
				<div align="right">
					<input type="submit" class="btn btn-dark" style="margin-top:10px;" value="수정"></input>
					<button type="button" onclick="delConfirmM()" class="btn btn-dark" style="margin-top:10px;">삭제</button>
				</div>
			</form>
		</div>
	</div>
</div>
</div>
<!-- Modal -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<img src="img/logo.jpg">
				<button type="button" id="modalClose1" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div id="modal_body"class="modal-body text-center" style="font-weight:bold;">
				 
			</div>
			<div class="modal-footer">
				<button type="button" onclick="location.href='acmDelete?acm_code=${dto.acm_code}'" class="btn btn-dark" data-dismiss="modal">네</button>
				<button type="button" class="btn btn-dark" data-dismiss="modal">아니오</button>
			</div>
		</div>
	</div>
</div>
<!-- Modal 222 -->
<div class="modal fade" id="modal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<img src="img/logo.jpg">
				<button type="button" id="modalClose1" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div id="modal_body2"class="modal-body text-center" style="font-weight:bold;">
				 
			</div>
			<div class="modal-footer">
				<button type="button" id="modalClose2" class="btn btn-dark" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"/>


<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>

<!-- ckEditor DecoupledEditor  -->
<script src="https://cdn.ckeditor.com/ckeditor5/16.0.0/decoupled-document/ckeditor.js"></script>
<script src="https://ckeditor.com/apps/ckfinder/3.4.5/ckfinder.js"></script>


<script src="js/bootstrap-input-spinner.js"></script>
<!-- iCheck(라디오 버튼) -->
<script src="icheck-1.x/icheck.min.js"></script>

<script>
    $("input[type='number']").inputSpinner();
    

    var postJ = /^\d{5}$/;

    var result = null;
    
    $(document).ready(function() {
    	$('#postcode').val(pad(${dto.acm_zip}, 5));
    	
        $('#datepicker').datepicker({
            startDate: new Date(),
            multidate: true,
            format: "dd/mm/yyyy",
            daysOfWeekHighlighted: "6,0",
            datesDisabled: ['07/01/2020'],
            language: 'en'
        });
        
        $(".menu-toggle").click(function() {
    		$("nav").toggleClass("active");
    		$(".main").toggleClass("main1");
    	});
        
        $("#postcode").blur(function() {
    		postcode();
    	});
        $("#address").blur(function() {
    		address();
    	});
        $("#detailAddress").blur(function() {
        	detailAddress();
    	});
        
        $("form").on("submit", function(e) {
        	postcode();
        	address();
        	detailAddress();
        	
        	if(postC == false || addressC == false || detailAddressC == false) {
    			return false;
    		}
        	else if($("#acm_title").val() == "") {
    			$("#modal2").modal("show");
    			modal_body2.innerHTML = "제목을 입력하세요";
    			return false;
    		}
    		else {
    			var x = $("#editor").html();
    			$("#div1").text(x);
    			//$("#div2").html('<!DOCTYPE html><html lang="ko"><head><meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0"></head><body>' + y + "</body></html>");
    			return true;
    		}
        });
        
        //$("#mb_id").val(sessionStorage.getItem("user"));
    });
    

    function pad(n, width) {
    	  n = n + '';
    	  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
    }
    
    
    function postcode() {
    	if($("#postcode").val() == "") {
    		console.log("postcode()");
    		$("#postcode_check").text("우편번호를 입력하세요.");
    		$("#postcode_check").css("color", "red");
    		postC = false;
    	}
    	
    	else if(postJ.test($("#postcode").val()) != true) {
    		$("#postcode_check").text("우편번호는 5자리 숫자입니다");
    		$("#postcode_check").css("color", "red");
    		postC = false;
    	}
    	
    	else {
    		$("#postcode_check").text("");
    		postC = true;
    	}
    }
    
    function address(){
    	if($("#address").val() == ""){
    		$("#address_check").text("주소찾기 버튼을 눌러 주소를 검색하세요.");
    		$("#address_check").css("color","red");
    		addressC = false;
    	}
    	else {
    		$("#address_check").text("");
			addressC = true;
    	}
    }
    
    function detailAddress(){
    	if($("#detailAddress").val() == ""){
    		$("#detailAddress_check").text("상세주소를 입력해주세요.");
    		$("#detailAddress_check").css("color","red");
    		detailAddressC = false;
    	}
    	else {
    		$("#detailAddress_check").text("");
    		detailAddressC = true;
    	}
    }
    
    /*amenity checkbox to radio*/
    $('#amenity input[type=checkbox]').on("change",function(){
        var target = $(this).parent().find('input[type=hidden]').val();
        if(target == 0)
        {
            target = 1;
        }
        else
        {
            target = 0;
        }
        $(this).parent().find('input[type=hidden]').val(target);
    });
    
    /*iCheck(라디오버튼)*/
    $(".room_type input").iCheck({
		checkboxClass: "icheckbox_flat",
		radioClass: "iradio_flat"
	});
    $("#acm_bedding input").iCheck({
		checkboxClass: "icheckbox_flat",
		radioClass: "iradio_flat"
	});
</script>

<!-- 다음 주소 검색 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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

function delConfirmM(){
	$("#modal").modal("show");
	modal_body.innerHTML = "정말 삭제하시겠습니까?";
}
</script>
<script type="module">
DecoupledEditor
    .create( document.querySelector('#editor'),{
    	//removePlugins: ['ImageUpload'],
    	language: 'ko',
    	ckfinder: {
	   		 uploadUrl: 'ckedit' //요청경로
	   	},
	   	toolbar: [ 'ckfinder', 'imageUpload', '|', 'heading', '|', 'bold', 'italic','link', 'bulletedList',
	   		'numberedList', 'blockQuote', '|', 'undo','redo','Outdent','Indent','highlight', 'fontsize',
	   		'fontfamily','insertTable','alignment']	
    })
   
    .then(function(editor) {
    	const toolbarContainer = document.querySelector( '#toolbar-container' );
        toolbarContainer.appendChild( editor.ui.view.toolbar.element );
    });
  
</script>
<!-- 체크박스 체크해주기 -->
<script>
var arr = new Array();
arr = "${subList}";
arr = arr.slice(0,-1);	//뒷자 잘라내기
arr = arr.substring(1);	//앞자 잘라내기
arr = arr.split(', ');

var valueArr = new Array();
$("input[type='checkbox']").each(function(){
	var value = $(this).val();
	valueArr.push(value);
});
console.log(valueArr);
console.log(valueArr.length);

var fLen = document.forms["frm"].elements.length;

for(var f = 0; f < fLen; f++){
	for (var i in arr) {
		for (var n in valueArr){
			if(arr[i] == valueArr[n]){
				if(document.forms["frm"].elements[f].value == arr[i]){
					document.forms["frm"].elements[f].checked = true;
				}
			}
		}
	}
}



arr = "${subList2}";
arr = arr.slice(0,-1);	//뒷자 잘라내기
arr = arr.substring(1);	//앞자 잘라내기
arr = arr.split(', ');
for(var f = 0; f < fLen; f++){
	for (var i in arr) {
		for (var n in valueArr){
			if(arr[i] == valueArr[n]){
				if(document.forms["frm"].elements[f].value == arr[i]){
					document.forms["frm"].elements[f].checked = true;
				}
			}
		}
	}
}

//$("input:radio[name='acm_bed_type']:radio[value='floor']").prop('checked', true); 

/* arr = "${radioList}";
arr = arr.slice(0,-1);	//뒷자 잘라내기
arr = arr.substring(1);	//앞자 잘라내기
arr = arr.split(', ');
var valueArrR = new Array();
$("input[type='radio']").each(function(){
	var value = $(this).val();
	valueArrR.push(value);
});
console.log(arr);
console.log(valueArrR);
console.log(arr.length);
console.log(valueArrR.length);
for(var f = 0; f < fLen; f++){
	for (var i in arr) {
		for (var n in valueArrR){
			if(arr[i] == valueArrR[n]){
				if(document.forms["frm"].elements[f].value == arr[i]){
					console.log(arr[i]);
					document.forms["frm"].elements[f].checked = true;
				}
			}
		}
	}
} */
</script>
</body>
</html>