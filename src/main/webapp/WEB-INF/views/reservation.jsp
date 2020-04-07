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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
<title>Stay_예약 페이지</title>
<style>
#accInformation {
	position :absolute;
	top: 0px;
}
.form-control {
	border: none;
	border-radius: 0;
	border-bottom: 2px solid grey;
}
#reservation-header {
	padding-top: 150px;
}
#border {
	border: 3px solid #000000;
	/*border-collapse: collapse;*/
}

.reservationTabMenu {
	margin-top: 40px;
    width: 90%;
    margin-bottom: 150px;
}

.nav-tabs {
	border: 0px!important;
}

.informationTab {
	width: 50%;
	cursor: pointer;
	border-top: 1px solid #343a40;
	border-left: 1px solid #343a40;
	border-right: 1px solid #343a40;
    background-color: #343a40;
    color: white;
    font-weight: bold;
}

.informationTab a {
	display: block;
	padding-top: 5px;
    height: 35px;
    width: 100%;
}

.tab-content {
	padding-top: 30px;
}

.informationForm {
	width: 400px;
}

.informationTab_info {
	font-size:15px;
	font-weight: bold;
	padding: 20px;
	padding-bottom: 50px;
    margin-bottom: 50px;
    border-bottom: 1px solid lightgrey;
}

.informationTab_info i {
	font-size: 40px;
    margin-bottom: 10px;
}

#myPage_name {
	margin-bottom: 50px;
}

.form-group .btn {
	font-weight: bold;
}

.form_center {
	padding-left: 35px;
}
.myPageform {
	display : flex;
	align-items: center;
	width : 100%;
	height : 280px;
	border-bottom: 1px solid lightgrey;
}
.myPage {
	margin : 0 auto;
	border : 1px solid black;
	width : 85%;
	height : 85%;
}



@media screen and (max-width: 576px) {
	.reservationTabMenu {
		width: 300px;
	}
	
	.reservation {
		width: 150px;
		cursor: pointer;
	}
	
	.informationTab_info {
		font-size: 14px;
	}
	
	.informationTab a {
		width: 150px;
	}
	
	.informationForm {
		width: 300px;
	}
	
	.form_center {
		padding-left: 20px;
	}
	
}

</style>
</head>
<body>
<jsp:include page="common/header.jsp" flush = "flase"></jsp:include>
<div class="main" >
	<div class="container" id="reservation-header">
		<h3>예약 페이지</h3>
		<div id="border"></div>
		<div class="reservationTabMenu mx-auto">
			<div class = "row" style = "margin-botoom : 300px">
				<div class = "col-sm-8">
					<form method = "post" action = "res1" id = "form">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
						<input type = "hidden" name = "acm_code" id = "acm_code" value = "${rdto.acm_code}"/>
						<div class = "row">
						<label class = "col-sm-2 text-center my-auto">숙박비</label>
						<input name = "acm_charge" id = "acm_charge" class = "form-control col-sm-10" value = "${rdto.acm_charge}" disabled/>
						</div>
						<br/>
						<!-- ***************** acm_availdate ***********-->
						<div class = "row">
							<div id = "checkInform" class = "col-sm-6">
								<div class="input-group date form-group d-flex justify-content-between" id="datepicker" style = "font-weight : bold">
									<div>
										<label class="mb-3 text-center" for="checkInDate">Check In</label>
									</div>
									<div>
								    	<input type="text" id="checkInDate" class = "form-control" name="checkInDate" placeholder="Select days" required/>
								    	<!-- 예약한 날짜가 여기에 저장이 됨 음..... 예약 가능 날짜는 한개만 가능하게 하는걸루 한다. -->
								    </div>
								</div>
							</div>		
							<div id = "checkOutform" class = "col-sm-6">
								<div class="input-group date form-group d-flex justify-content-between" id="datepicker1" style = "font-weight : bold">
									<div>
										<label class="mb-3 text-center" for="checkOutDate">Check Out</label>
									</div>
									<div>
								    	<input type="text" id="checkOutDate" class = "form-control" name="checkOutDate" placeholder="Select days" required />
								    	<!-- 예약한 날짜가 여기에 저장이 됨 음..... 예약 가능 날짜는 한개만 가능하게 하는걸루 한다. -->
								    </div>
								</div>
							</div>
						</div>	
						<div class = "row">
							<div class = "col-sm-6">
								<label>성인</label>
								<input type = "number" name = "adult" id = "adult" class = "form-control" min = "1" value = "1" onchange = "number()"/>
							</div>
							
							<div class = "col-sm-6">
								<label>어린이</label>
								<input type = "number" name = "child" id = "child" class = "form-control" min = "0" value = "0"/><br/>
							</div>
						</div>
						
						<input type = "button" id = "button" class = "btn btn-dark form-control mb-2" value = "확인" />
						
						<label>숙박 인원</label>
						<input type = "text" class = "form-control" name = "guest_num" id = "guest_num" disabled/>
						<br/>
						
						<div class = "row">
							<div class = "col-sm-6">
								<label>check In</label>
								<input type = "text" id = "checkInCheck" class = "form-control" disabled/>
							</div>
							<div class = "col-sm-6">
								<label>check Out</label>
								<input type = "text" id = "checkOutCheck" class = "form-control" disabled/>
							</div>
							<div class = "col-sm-12">
								<input type = "text" class = "form-control checkIncheckOut" disabled/>
								<input type = "hidden" id = "listDate" disabled/>
							</div>
						</div>
						<br/>
						<label>Total</label>
						<input type = "text" id = "total" name = "total" class = "form-control" disabled/>
						<br/>
						<input type ="button" class = "btn btn-dark form-control" value = "예약" id = "resBtn"/>
					</form>
				</div>
				<div class = "col-sm-4 row" style = "position : relative;">
					<div style = "width : 100%; margin-left : 10px; margin-right : 10px; ">
						<div id = "accInformation" style = "border : 1px solid grey; width : 100%; margin-left : 10px; margin-right : 10px; height : auto;">
							<div class = "text-center w-100">${rdto.acm_title}</div>
							<img class = "text-center w-100" style = "border : 1px solid grey" src = "upImg/${rdto.acm_thumbnail}" alt = "사진 없음"/>
							<div class = "text-center w-100">${rdto.acm_address}<br/>${rdto.acm_add_detail}</div>
							<div class = "row">
								<div class = "col-sm-6">
									<div class = "text-center">checkin_time</div>
									<div class = "text-center">${rdto.acm_checkin_time}</div>
								</div>
								<div class = "col-sm-6">
									<div class = "text-center">checkout_time</div>
									<div class = "text-center">${rdto.acm_checkout_time}</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="guestModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<img src="img/logo.jpg">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center" style="font-weight:bold;">
				게스트 명수가 너무 많습니다.
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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>
<!-- iCheck(라디오 버튼) -->
<script src="icheck-1.x/icheck.min.js"></script>
<!-- 아임포트 결제창 띄우기 -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<script>
$(function () {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function (e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});
</script>
<script>
$(document).ready(function() {
	$(".menu-toggle").click(function() {
		$("nav").toggleClass("active");
		$(".main").toggleClass("main1");
	});
});
</script>

<!-- datepicker를 사용하기 위한 script -->
<script>
function checkIn() {
	if($("#acm_availdate").val() == null || $("#acm_availdate").val() == "") {
		this.checkInA = false;
	}
	else{
		var checkIn = $("#acm_availdate").val();
		$("#checkIn").val(checkIn);
		this.checkInA = true;
	}
}
function checkOut() {
	if($("#acm_availdate1").val() == null || $("#acm_availdate1").val() == "") {
		checkOutA = false;
	}
	else {
		var checkOut = $("#acm_availdate1").val();
		$("#checkOut").val(checkOut);
		checkOutA = true;
	}
}
$(document).ready(function(){
	var acm_availdate = "<c:out value = '${rdto.acm_availdate}'/>"
    if($("#checkInDate").length) {
    	//숫자 1이상일 경우 true가 됨    	
        var datesEnabled = acm_availdate;
    	var date = new Date();
    	//활성화 해줄 날짜를 변수로 만들어 사용(controller에서 model로 보낸것을 el로 가지고 온것을 변수로 사용하여 적용함)
        $('#datepicker').datepicker({
        	startDate: date,
            language: "en",
            format: 'dd/mm/yyyy',
            daysOfWeekHighlighted: "6,0",
            beforeShowDay: function (date) {
            	//선택할수 있는 날짜를 지정하는 것
                var allDates = ( '0' + date.getDate() ).slice( -2 ) + "/" + ( '0' + (date.getMonth()+1) ).slice( -2 ) + "/" + date.getFullYear();
            	//date에 년,월,일을 가져옴 (포맷같은 느낌) slice()는 문자를 가져오는것 -2는 맨뒤에서 두글자를 뜻함
                if(datesEnabled.indexOf(allDates) != -1)
                    return true;
                	//인덱스 번호를 가져온다.
                
        		else
                    return false;
            }
        })
        .on("changeDate", function(e) {
        	checkIn();
		    var checkInDate = e.date, $checkOut = $("#datepicker1");
		    checkInDate.setDate(checkInDate.getDate() + 1);
		    $checkOut.datepicker("setStartDate", checkInDate);
		    $checkOut.datepicker("setDate", checkInDate).focus();
		  });
    	
        $('#datepicker1').datepicker({
        	startDate: date,
            language: "en",
            format: 'dd/mm/yyyy',
            daysOfWeekHighlighted: "6,0",
           	beforeShowDay: function (date) {
               	//선택할수 있는 날짜를 지정하는 것
                var allDates = ( '0' + date.getDate() ).slice( -2 ) + "/" + ( '0' + (date.getMonth()+1) ).slice( -2 ) + "/" + date.getFullYear();
               	//date에 년,월,일을 가져옴 (포맷같은 느낌) slice()는 문자를 가져오는것 -2는 맨뒤에서 두글자를 뜻함
                if(datesEnabled.indexOf(allDates) != -1)
                //인덱스 번호를 가져온다.
                	return true;
                   
           		else
                	return false;
               }
        })
        .on("changeDate", function(e) {
        	checkOut();
		  });
    }
});
</script>

<!-- 총 숙박인원에 관한 script -->
<script>
var guest_num = "<c:out value = '${rdto.acm_guest_num}'/>"
console.log(guest_num);

$(document).ready(function() {
	$("#adult").attr('max',Number(guest_num));
	$("#child").attr('max',Number(guest_num)-Number($("#adult").val()));
});

function number() {
	var Adult = $("#adult").val();
	$("#adult").attr('max',Number(guest_num)-Number($("#child").val()));
	$("#child").attr('max',Number(guest_num)-Number($("#adult").val()));
}
peopleNumber = Number($("#adult").val()) + Number($("#child").val());
</script>


<script>
$(document).ready(function() {
	$("#button").click(function() {
		if(checkInA == false || checkOutA == false) {
			if(Number($("#adult").val()) + Number($("#child").val()) <= guest_num) {
				$("#guest_num").val(Number($("#adult").val()) + Number($("#child").val()));
				$("#checkInCheck").val($("#checkInDate").val());
				$("#checkOutCheck").val($("#checkOutDate").val());
				var sdd = $("#checkInDate").val();
				console.log(sdd);
			    var edd = $("#checkOutDate").val();
			    console.log(edd);
			    var ar1 = sdd.split('/');
			    console.log(ar1.toString());
			    var ar2 = edd.split('/');
			    console.log(ar2.toString());
			    var da1 = new Date(ar1[2], ar1[1]-1, ar1[0]);
			    console.log(new Date(ar1[2], ar1[1]-1, ar1[0]));
			    var da2 = new Date(ar2[2], ar2[1]-1, ar2[0]);
			    console.log(new Date(ar2[2], ar2[1]-1, ar2[0]));
			    var listDate = [];
			    getDateRange(da1, da2, listDate);
			    console.log(listDate);
			    $("#listDate").val(listDate);
			    var dif = da2 - da1;
			    var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
			    var x = parseInt(dif/cDay);
			    var y = parseInt(dif/cDay) + parseInt(1);
				if(sdd && edd){
					$(".checkIncheckOut").val(x + "박 " +  y + "일");
				}
				//숫자를 천단위,를 해주려고 만듬
				function addComma(num) {
				  var regexp = /\B(?=(\d{3})+(?!\d))/g;
				  return num.toString().replace(regexp, ',');
				}
				totalNumber = Number(dif/cDay) * Number($("#acm_charge").val());
				console.log(totalNumber);
				$("#total").val(addComma(Number(dif/cDay) * Number($("#acm_charge").val())) + "원");	
				var total = $("#total").val();
				console.log("total" + $("#total").val());
			}
			else {
				$("#guestModal").modal("show");
			}
		}
	});
});

</script>



<script>
function CheckIn() {
	if($("#checkInCheck").val() == null || $("#checkInCheck").val() == "") {
		CheckIn = false;
	}
	else if($("#checkInCheck").val() != $("#checkInDate").val()) {		
		CheckIn = false;
	}
	
	else {
		CheckIn = true;
	}
	console.log(CheckIn);
}
function CheckOut() {
	if($("#checkOutCheck").val() == null || $("#checkOutCheck").val() == "") {
		CheckOut = false;
	}
	else if($("#checkOutCheck").val() != $("#checkOutDate").val()) {
		CheckOut = false;
	}
	else {
		CheckOut = true;
	}
	console.log(CheckOut);
}
function People() {
	if($("#guest_num").val() == null || $("#guest_num").val() == "") {
		People = false;
	}
	else if($("#guest_num").val() > guest_num) {
		People = false;
	}
	else {
		People = true;
	}
	console.log(People);
}

$(document).ready(function() {
	$("#resBtn").click(function() {
		event.preventDefalut;
		CheckIn();
		CheckOut();
		People();
		
		if(CheckIn == false || CheckOut == false || People == false) {
			console.log("false");
			return false;
		}
		else {
			IMP.init('imp38240115');
			//IMP.request_pay(param, callback) 는 2개의 argument를 받는 함수입니다.
			IMP.request_pay({
			    pg : 'html5_inicis', //이니시스 웹(표준)
			    pay_method : 'card', //결제 수단
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    //가맹점에서 생성 관리하는 고유 주문번호
			    name : '결제 창',
			    amount : parseInt(totalNumber),
			    currency : 'KRW',
			    language : 'ko',
			    buyer_email : '${dto.mb_email}',
			    buyer_name : '${dto.mb_name}',
			    buyer_tel : '${dto.mb_phone}'
			}, 
			function (rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					
					$.ajax({
						url : "res",
						type : "post",
						data : {
							listDate : $("#listDate").val(),
							checkIn : $("#checkInDate").val(),
							checkOut : $("#checkOutDate").val(),
							acm_code : "${rdto.acm_code}",
							amount : rsp.paid_amount,
							guestNum : $("#guest_num").val(),
							pay_method : rsp.pay_method,
							imp_uid : rsp.imp_uid,
							acm_title : "${rdto.acm_title}",
							acm_address : "${rdto.acm_address}",
							acm_add_detail : "${rdto.acm_add_detail}",
							card_name : rsp.card_name
						},
						success : function(data) {
							location.href = "reservationCheck";
						},
						error : function(request,status,error){
						    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						   }
					});
				} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				}
				//alert(msg);
			});
		}
	});
});
</script>
<!-- 아임포트 결제 관련 script -->
<!-- 아임포트 관련 개발할때 보고 한것 https://github.com/iamport/iamport-manual/blob/master/인증결제/README.md -->
<script>
$(document).ready(function() {
	<c:choose>
	<c:when test="${not empty fail}">
		$("#failModal").modal("show");
	</c:when>
	</c:choose>
});
</script>
<script>
function getDateRange(startDate, endDate, listDate) {
    var dateMove = new Date(startDate);
    var strDate = startDate;
    console.log(strDate);
	while (strDate <= endDate) {
	    var strDate = dateMove;
	    console.log("strDate : " + strDate);
	    listDate.push(strDate.toLocaleString('en-GB').slice(0, 10));
	    dateMove.setDate(dateMove.getDate() + 1);
    }
	listDate.pop();
    return listDate;
};
</script>
</body>
</html>
