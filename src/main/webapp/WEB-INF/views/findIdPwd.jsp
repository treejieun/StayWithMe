<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- iCheck(라디오버튼) -->
<link rel="stylesheet" href="icheck-1.x/skins/flat/flat.css">
<title>Stay_아이디/비밀번호 찾기</title>
<style>
#find-header {
	padding-top: 150px;
}

.findTabMenu {
	margin-top: 100px;
    width: 500px;
    margin-bottom: 150px;
}

.nav-tabs {
	border: 0px!important;
}

.findTab {
	width: 250px;
	cursor: pointer;
	border-top: 1px solid #343a40;
	border-left: 1px solid #343a40;
	border-right: 1px solid #343a40;
    background-color: #343a40;
    color: white;
    font-weight: bold;
}

.findTab a {
	display: block;
	padding-top: 5px;
    height: 35px;
    width: 250px;
}

.tab-content {
	padding-top: 30px;
}

.findForm {
	width: 400px;
}

.findTab_info {
	font-size:15px;
	font-weight: bold;
	padding: 20px;
	padding-bottom: 50px;
    margin-bottom: 50px;
    border-bottom: 1px solid lightgrey;
}

.findTab_info i {
	font-size: 40px;
    margin-bottom: 10px;
}

#findId_name {
	margin-bottom: 50px;
}

.form-group .form-control, .form-group .form-control-inline {
	border: none;
	border-radius: 0;
	border-bottom: 2px solid grey;
	margin: 0px;
	margin-right: 20px;
}

.form-group .btn {
	font-weight: bold;
}

.form_center {
	padding-left: 35px;
}

@media screen and (max-width: 576px) {
	.findTabMenu {
		width: 300px;
	}
	
	.findTab {
		width: 150px;
		cursor: pointer;
	}
	
	.findTab_info {
		font-size: 14px;
	}
	
	.findTab a {
		width: 150px;
	}
	
	.findForm {
		width: 300px;
	}
	
	.form_center {
		padding-left: 20px;
	}
}

</style>
</head>
<body>
<div class="main">
	<div class="container" id="find-header">
		<h3>아이디/비밀번호 찾기</h3>
		<div id="border"></div>
		
		<div class="findTabMenu mx-auto">
			<!-- tab 메뉴 -->
			<ul class="nav nav-tabs text-center">
				<li class="findTab" id="defaultTab1" onclick='findTab(this, "white")'><a data-toggle="tab" data-target="#findId">ID 찾기</a>
				<li class="findTab active" id="defaultTab2" onclick='findTab(this, "white")'><a id="def" data-toggle="tab" data-target="#findPwd">비밀번호 찾기</a>
			</ul>
			<!-- tab 메뉴 -->
			<!-- tab 선택에 따른 내용 -->
			<div class="tab-content">

				<div id="findId" class="tab-pane active mx-auto">
					<div class="findTab_info text-center">
						<i class="fas fa-exclamation-circle"></i><br/>
						회원정보에 등록된 전화번호와<br/>
						입력한 전화번호가 같아야 인증번호를 받을 수 있습니다.
					</div>
					<form action="#" class="mx-auto findForm">
						<div class="form-group">
							<label for="findId_name">이름</label>
							<input type="text" class="form-control mx-auto col-10" id="findId_name" name="mb_name" maxlength="20" placeholder="이름"> 
							<div class="check_font" id="name_check"></div>
						</div>
						<div class="form-group">
							<label for="findId_phone">휴대폰 번호</label><br/>
							<div class="form_center">
								<input type="tel" class="form-control-inline col-8 col-sm-8" id="findId_phone" name="mb_phone" maxlength="11" placeholder='"-"없이 번호만 입력'>
								<button type="button" onclick="namePhoneCheck(); phoneCertify();" id="phone_certify" class="btn btn-dark">인증</button>
								<div class="check_font" id="phone_check"></div>
							</div>
						</div>
						<div class="form-group">
							<div class="form_center">
								<input type="text" class="form-control-inline col-8 col-sm-8" id="findId_sms" name="mb_sms" maxlength="6" placeholder="인증 번호 입력">
								<button type="button" id="sms_confirm" class="btn btn-dark">확인</button>
								<div class="check_font" id="phone_check2"></div>
							</div>
						</div><br/><br/>
						<div class="form-group text-center">
							<button type="button" id="findIdBtn" class="btn btn-dark form-control" style="border: none;">아이디 찾기</button>
						</div>
					</form>
				</div>
				
				<div id="findPwd" class="tab-pane">
					<div class="findTab_info text-center">
						<i class="fas fa-exclamation-circle"></i><br/>
						회원정보에 등록된 이메일로<br/>
						임시 비밀번호를 발송해 드립니다.
					</div>
					<form method="POST" action="#" class="mx-auto findForm">
						<div class="form-group">
							<label for="findPwd_id">아이디</label><br/>
							<div class="form_center">
								<input type="text" class="form-control-inline col-8 col-sm-8" id="findPwd_id" name="mb_id" maxlength="20" placeholder='아이디'>
								<button type="button" id="id_confirm" onclick="idCheck()" class="btn btn-dark">확인</button>
								<div class="check_font" id="id_check"></div>
							</div>
						</div>
						<div class="form-group">
							<label for="findPwd_email">이메일</label>
							<input type="text" class="form-control mx-auto col-10" id="findPwd_email" name="mb_email" maxlength="50" placeholder="이메일"> 
						</div><br/><br/>
						<div class="form-group text-center">
							<button type="button" id="findPwdBtn" onclick="emailCheck();" class="btn btn-dark form-control" style="border: none;">임시 비밀번호 발송</button>
						</div>
					</form>
				</div>
			</div>
			<!-- tab 선택에 따른 내용 -->
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="findModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<img src="img/logo.jpg">
				<button type="button" id="modalClose1" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div id="findModal_body"class="modal-body text-center" style="font-weight:bold;">
				 
			</div>
			<div class="modal-footer">
				<button type="button" id="modalClose2" class="btn btn-dark" data-dismiss="modal">Close</button>
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
<!-- iCheck(라디오 버튼) -->
<script src="icheck-1.x/icheck.min.js"></script>
<script>
var emailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var phoneJ = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
var foundId = null;
var foundEmail = null;

//탭메뉴 클릭시 탭배경과 텍스트의 색상 변경
function findTab(elmnt, color) {
	var i;
	var findTab;
	var findTab = document.getElementsByClassName("findTab");
	
	
	for(i = 0 ; i < findTab.length ; i++) {
		findTab[i].style.backgroundColor = "";
		findTab[i].style.color = "white";
	}
	
	elmnt.style.backgroundColor = color;
	elmnt.style.color = "black";
}
$("#defaultTab1").trigger("click"); //페이지에 들어갔을때 처음부터 클릭되게

//아이디찾기 이름&전화번호 유효성 검사
function namePhoneCheck() {
	var findModal_body = document.getElementById("findModal_body");
	var findId_name = document.getElementById("findId_name");
	var name_check = document.getElementById("name_check");
	var findId_phone = document.getElementById("findId_phone");
	
	if(findId_name.value == "") {
		$("#findModal").modal("show");
		findModal_body.innerHTML = "이름을 입력하세요.";
	}
	
	else if(findId_phone.value == "") {
		$("#findModal").modal("show");
		findModal_body.innerHTML = "전화번호를 입력하세요.";	
	}
	
	else if(phoneJ.test(findId_phone.value) != true) {
		$("#findModal").modal("show");
		findModal_body.innerHTML = "전화번호 형식이 올바르지 않습니다.";	
	}
}

//인증문자 발송
function phoneCertify() {
	if(findId_name.value != "" && phoneJ.test(findId_phone.value) == true){
		var mb_name = findId_name.value;
		var mb_phone = findId_phone.value;
		
		$.ajax({
			url: "findIdCheck",
			data: {mb_name : mb_name, mb_phone : mb_phone},
			type:"POST",
			success: function(data) {
				console.log(data);
				if(data != "notFoundId") {
					$("#findModal").modal("show");
					findModal_body.innerHTML = "인증번호가 발송되었습니다.";
					sendSms();
					foundId = data;
				}
				else {
					$("#findModal").modal("show");
					findModal_body.innerHTML = "입력하신 정보가 회원정보와<br/>일치하지 않습니다.<br/> 다시 확인해주세요.";	
					foundId = data;
				}
				return foundId;
			}
		});

	}
}

//문자 인증 일치확인
function sendSms() {
	$.ajax({
		url: "sendSms",
		data : {
	    	   mb_phone : $("#findId_phone").val()
	       },
	       success : function(result){
	    	   console.log(result);
	    	   if(result != null) {
	    		   $("#sms_confirm").on("click", function() {
	    			 if(JSON.parse(result) == ($("#findId_sms").val())) {
	    				 $("#phone_check2").text("인증되었습니다.");
	    				 $("#phone_check2").css("color", "blue");
	    			 }
	    			 else {
	    				 $("#phone_check2").text("인증실패. 다시 입력하세요.");
	    				 $("#phone_check2").css("color", "red");
	    			 }
	    		  })
	    	   }   
	       }
	});
}

//아이디 찾기 버튼 누를 때 찾은 아이디값을 가지고 결과 페이지로 넘어감. ajax 사용 시 on이벤트로 하는게 좋음
$(document).on("click", "#findIdBtn", function() {
	if($("#phone_check2").text() == "인증되었습니다.") {
		$.ajax ({
			data : {foundId : foundId},
			url : "findIdSuccess",
			success : function(data) {
				$(".findTabMenu").html(data);
			}
		});
	}
	else if($("#findId_name").val() != "" && phoneJ.test($("#findId_phone").val()) == true) {
		$("#findModal").modal("show");
		findModal_body.innerHTML = "전화번호 인증 후 다시 시도해 주세요.";
	}
	else {
		namePhoneCheck();
	}
});

//아이디 유효성
function idCheck() {
	var mb_id = $("#findPwd_id").val();
	
	if($("#findPwd_id").val() == "") {
		$("#findModal").modal("show");
		$("#findModal_body").text("아이디를 입력하세요.");
	}
	else {
		$.ajax({
			data : {mb_id : mb_id},
			url : "findPwd_idCheck",
			success : function(data) {
				if(data != "notFoundId") {
					$("#findModal").modal("show");
					$("#findModal_body").text("아이디가 확인 되었습니다.");
					foundEmail = data;

				}
				else {
					$("#findModal").modal("show");
					$("#findModal_body").text("등록되지 않은 아이디입니다.");
				}
			}
			
		});	
	}
}

//이메일 유효성
function emailCheck() {
	if($("#findPwd_id").val() == "") {
		$("#findModal").modal("show");
		$("#findModal_body").text("아이디를 입력하세요.");
	}
	else if($("#findPwd_email").val() == "") {
		$("#findModal").modal("show");
		$("#findModal_body").text("이메일을 입력해 주세요.");
	}
	else {
		if($("#findPwd_email").val() == foundEmail) {
			$("#findModal").modal("show");
			$("#findModal_body").html(foundEmail + "로 이메일을 발송했습니다.<br/>창을 닫으면 로그인 페이지로 이동합니다.");
			$("#modalClose2").click(function() {
				location.href="login?log=start";
			});
			$("#modalClose1").click(function() {
				location.href="login?log=start";
			});
			
			$.ajax({
				url : "findPwd_sendEmail",
				data : {mb_email : foundEmail, mb_id : $("#findPwd_id").val()},
				success : function(data) {
					console.log("data: " + data);
					//location.href="login?log=start";
					//$("#findModal").modal("show");
					//$("#findModal_body").text(data + "로 임시 비밀번호가 발송되었습니다." + "<br/>" + "창을 닫으면 로그인페이지로 이동합니다.");
					/*$("#modalClose2").click(function() {
						location.href="login?log=start";
					});
					$("#modalClose1").click(function() {
						location.href="login?log=start";
					});*/
				}
			});
		}
		else {
			$("#findModal").modal("show");
			$("#findModal_body").text("이메일이 회원정보와 일치하지 않습니다.");
		}
	}
}
//임시 비밀번호 발송 버튼 누르면 이메일로 발송되었다는 모달창이 뜨고 close를 누르면 로그인페이지로 이동
/*$(document).on("click", "#findPwdBtn", function() {
	
	$.ajax ({
		data : "",
		url : "findIdSuccess",
		cache : false,
		success : function(data) {
			$("#findModal").modal("show");
			$("#findModal_body").text(data + "로 임시 비밀번호가 발송되었습니다.");
			location.href="login?log=start";
		}
	});
});
*/
$(function () {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function (e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});
</script>
</body>
</html>