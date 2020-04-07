<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang = "ko">
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

<title>Stay_회원가입</title>
<style>
@font-face { font-family: 'Eoe_Zno_L'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/Eoe_Zno_L.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'S-CoreDream-2ExtraLight'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-2ExtraLight.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face { font-family: 'KBIZHanmaumGothic'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/KBIZHanmaumGothic.woff') format('woff'); font-weight: normal; font-style: normal; }

.main1 {
	margin-top: 100px;
}

#join-header {
	padding-top: 150px;
}

.form-group label, .container h3 {
	font-family: 'S-CoreDream-2ExtraLight';
	font-weight: bold;
}

#border {
	border: 3px solid #000000;
	/*border-collapse: collapse;*/
}

.mx-auto {
	width: 450px;
}

.mx-auto h2 {
	background-color: #343a40;
	color: white;
	padding: 5px;
}

.mx-auto .form {
	margin-top: 100px;
	margin-bottom: 200px;
	/*border: 1px solid gray;
	padding: 30px;*/
}

.mx-auto .form .form-group {
	margin-top: 50px;
}

.mx-auto .form .form-group .form-control, .form-control-inline {
	border: none;
	border-radius: 0;
	border-bottom: 2px solid grey;
	margin: 0px;
}

@media screen and (max-width: 576px) {
	.mx-auto {
		width: 300px;
	}
	
	.mx-auto h2 {
		font-size: 20px;
	}
}
</style>
</head>
<body>
<jsp:include page="common/header.jsp" flush="false"/>

<div class="main">
	<div class="container" id="join-header">
			<h3>회원가입</h3>
			<div id="border"></div>
			
		<div class="mx-auto">
			<form action="memberjoinpro" method="post" class="form" id="joinForm" name="member">
				<h2 class="text-center">회원정보를 입력해 주세요.</h2>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<div class="form-group">
					<label for="mb_id">아이디</label>
					<input type="text" class="form-control" id="mb_id" name="mb_id" maxlength="20" placeholder="ID">
					<div class="check_font" id="id_check"></div>
				</div>
				
				<div class="form-group">
					<label for="mb_pwd">비밀번호</label>
					<input type="password" class="form-control" id="mb_pwd" name="mb_pwd" placeholder="PASSWORD" maxlength="20">
					<div class="check_font" id="pwd_check"></div>
				</div>
				
				<div class="form-group">
					<label for="mb_pwd2">비밀번호 확인</label>
					<input type="password" class="form-control" id="mb_pwd2" name="mb_pwd2" placeholder="Confirm Password" maxlength="20">
					<div class="check_font" id="pwd2_check"></div>
				</div>
				
				<div class="form-group">
					<label for="mb_name">이름</label>
					<input type="text" class="form-control" id="mb_name" name="mb_name" placeholder="Name" maxlength="20">
					<div class="check_font" id="name_check"></div>
				</div>
				
				<div class="form-group">
					<label for="mb_birthdate">생년월일</label>
					<input type="date" class="form-control" id="mb_birthdate" name="mb_birthdate" placeholder="ex)19990101" maxlength="8" min="1930-01-01" max="2001-01-01">
					<div class="check_font" id="birth_check"></div>
				</div>
				
				<div class="form-group text-center">
					<label for="mb_sex">성별</label>
					<input type="radio" id="mb_sex1" name="mb_sex" value="M">남
					<input type="radio" id="mb_sex2" name="mb_sex" value="F">여
					<div class="check_font" id="sex_check"></div>
				</div>
				
				<div class="form-group">
					<label for="mb_email">이메일 주소</label>
					<input type="text" class="form-control" id="mb_email" name="mb_email" placeholder="E-mail" maxlength="50">
					<div class="check_font" id="email_check"></div>
				</div>
				
				<div class="form-group">
					<label for="mb_phone">휴대폰 번호("-"없이 번호만 입력해주세요)</label><br/>
						<input type="tel" class="form-control-inline col-9 col-sm-10" id="mb_phone" name="mb_phone" maxlength="11" placeholder="Phone Number">
						<button type="button" id="certificate" class="btn btn-dark">인증</button>
					<div class="check_font" id="phone_check"></div>
				</div>
				
				<div class="form-group">
					<input type="text" class="form-control-inline col-9 col-sm-10" id="mb_sms" name="mb_sms" maxlength="6" placeholder="인증 번호 입력">
					<button type="button" id="checkCertificate" class="btn btn-dark">확인</button>
					<div class="check_font" id="phone_check2"></div>
				</div>
				
				<div class="form-group text-center">
					<button type="submit" id="submitBtn" class="btn btn-dark form-control" style="border: none;">회원가입</button>
				</div>
			</form>
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
<!-- iCheck(라디오 버튼) -->
<script src="icheck-1.x/icheck.min.js"></script>
<script>

//모든 공백 체크 정규식
var empJ = /\s/g;
var idJ = /^[a-z0-9][a-z0-9_-]{3,20}$/;
var pwdJ = /^[A-Za-z0-9]{4,20}$/; 
var nameJ = /^[가-힣]{2,20}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
var emailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var phoneJ = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
var birthJ = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
var result = null;

$(document).ready(function() {
	$(".menu-toggle").click(function() {
		$("nav").toggleClass("active");
		$(".main").toggleClass("main1");
	});
	
	$("input").iCheck({
		checkboxClass: "icheckbox_flat",
		radioClass: "iradio_flat"
	});
	//아이디 검사
	$("#mb_id").blur(function() {
		id();
		idCheck();
	});
	
	//비밀번호 검사
	$("#mb_pwd").blur(function() {
		pwd();
	});
	
	//비밀번호 재확인
	$("#mb_pwd2").blur(function() {
		pwd2();
	});
	
	//이름 검사
	$("#mb_name").blur(function() {
		name();
	});
	
	//생년월일 검사
	$("#mb_birthdate").blur(function() {
		birth();
	});
	
	//이메일 검사
	$("#mb_email").blur(function() {
		email();
	});
	
	//전화번호 검사
	$("#certificate").click(function() {
		phone();
		phoneCheck();
	});
	
	//문자인증 입력여부 검사
	$("#checkCertificate").click(function() {
		sms();	
	});
		

	//문자 인증
	$("#certificate").on("click", function() {
		if($("#mb_phone").val()!="" && phoneJ.test($("#mb_phone").val()) == true && result == 0) {
			$.ajax({
			       url : "sendSms",
			       data : {
			    	   mb_phone : $("#mb_phone").val()
			       },
			       success : function(result){
			    	   console.log(result);
			             /*if(result=="") {
			            		$("#phone_check2").text("인증번호전송에 실패하였습니다.");
				            	$("#phone_check2").css("color", "red");
			             }
			             else {               
			                $("#inform1").text("인증번호를 발송했습니다");
			                $("#inform1").css("color", "blue");
			            */
			            if(result != null) {
			                $("#checkCertificate").on("click", function() {                     
			                   if(JSON.parse(result)==($("#mb_sms").val())){
			                      $("#phone_check2").text("인증되었습니다."); 
			                      $("#phone_check2").css("color", "blue");
			                      
			                   } else {
			                      $("#phone_check2").text("인증실패. 다시 입력하세요.");
			                      $("#phone_check2").css("color", "red");
			                   }
			                })
			             }
			             
			       }
			 })
		}
	});
	
	//전체 유효성
	$("form").on("submit", function() {
		id();
		pwd();
		pwd2();
		name();
		birth();
		sex();
		email();
		phone();
		sms();
		
		if(idC == false || pwdC == false || pwd2C == false || nameC == false || birthC == false || sexC == false || emailC == false || phoneC == false || smsC == false) {
			return false;
		}
		else {
			return true;
		}
		
	});
});


//아이디 유효성
function id() {
	if($("#mb_id").val() == "") {
		$("#id_check").text("아이디를 입력하세요.");
		$("#id_check").css("color", "red");
		//$("#submitBtn").attr("type", "button");
		idC = false;
	}
	
	else if(idJ.test($("#mb_id").val()) != true) {
		$("#id_check").text("4~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
		$("#id_check").css("color", "red");
		//$("#submitBtn").attr("type", "button");
		idC = false;
	}
	
	else
		idC = true;

}

//아이디 중복체크
function idCheck() {
	if($("#mb_id").val()!="" && idJ.test($("#mb_id").val()) == true) {
		
		var mb_id={mb_id : $("#mb_id").val()};
		console.log(mb_id);
		
		$.ajax({
			async : false,
			type : "POST",
			data : mb_id,
			url : "idCheck",
			success : function(data) {
				if(data == 1) {
					$("#id_check").text("중복된 아이디 입니다.");
					$("#id_check").css("color", "red");
					//$("#submitBtn").attr("type", "button");
					result = data;
					
				} else if(data == 0) {
					$("#id_check").text("사용가능한 아이디 입니다.");
					$("#id_check").css("color", "blue");
					//$("#submitBtn").attr("type", "submit");
					result = data;
				}
			}
		});
		
		if(result == 1)
			return false;
		else
			return true;
	}
}

//비밀번호 유효성
function pwd() {
	if($("#mb_pwd").val() == "") {
		$("#pwd_check").text("비밀번호를 입력하세요.");
		$("#pwd_check").css("color", "red");
		pwdC = false;
	}
	
	else if (pwdJ.test($("#mb_pwd").val()) != true) {
		$("#pwd_check").text("4~20자의 영문 대 소문자, 숫자만 사용 가능합니다.");
		$("#pwd_check").css("color", "red");
		pwdC = false;
	}
	else {
		$("#pwd_check").text("사용 가능한 비밀번호 입니다.");
		$("#pwd_check").css("color", "blue");
		pwdC = true;
	}
}

//비밀번호 재확인
function pwd2() {
	if($("#mb_pwd").val() != $("#mb_pwd2").val() || $("#mb_pwd2").val() == "") {
		$("#pwd2_check").text("비밀번호가 일치하지 않습니다.");
		$("#pwd2_check").css("color", "red");
		pwd2C = false;
	}
	
	else {
		$("#pwd2_check").text("비밀번호가 일치합니다.");
		$("#pwd2_check").css("color", "blue");
		pwd2C = true;
	}
}

//이름 유효성
function name() {
	if($("#mb_name").val() == "") {
		$("#name_check").text("이름을 입력하세요.");
		$("#name_check").css("color", "red");
		nameC = false;
	}
	else if(nameJ.test($("#mb_name").val()) != true) {
		$("#name_check").text("2글자 이상 한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
		$("#name_check").css("color", "red");
		nameC = false;
	}
	else {
		$("#name_check").text("");
		nameC = true;
	}
}

//생년월일 유효성
function birth() {

	if($("#mb_birthdate").val() == "") {
		$("#birth_check").text("생년월일을 입력하세요.");
		$("#birth_check").css("color", "red");
		birthC = false;
	}
	
	else if(birthJ.test($("#mb_birthdate").val()) != true) {
		$("#birth_check").text("생년월일을 확인하세요.");
		$("#birth_check").css("color", "red");
		birthC = false;
	}
	else {
		$("#birth_check").text("");
		birthC = true;
	}
}

//성별 유효성
function sex() {
	if(!($("#mb_sex1").is(":checked")) && !($("#mb_sex2").is(":checked"))) {
		$("#sex_check").text("성별을 선택하세요.");
		$("#sex_check").css("color", "red");
		sexC = false;
	}
	else {
		$("#sex_check").text("");

		sexC = true;
	}
}

//이메일 유효성
function email() {
	if($("#mb_email").val() == "") {
		$("#email_check").text("이메일을 입력하세요.");
		$("#email_check").css("color", "red");
		emailC = false;
	}
	else if(emailJ.test($("#mb_email").val()) != true) {
		$("#email_check").text("이메일 형식이 올바르지 않습니다.");
		$("#email_check").css("color", "red");
		emailC = false;
	}
	else {
		$("#email_check").text("");
		emailC = true;
	}
}

//전화번호 유효성
function phone() {
	if($("#mb_phone").val() == "") {
		$("#phone_check").text("전화번호를 입력하세요.");
		$("#phone_check").css("color", "red");
		phoneC = false;
	}

	else if(phoneJ.test($("#mb_phone").val()) != true) {
		$("#phone_check").text("전화번호 형식이 올바르지 않습니다.");
		$("#phone_check").css("color", "red");
		phoneC = false;
	}
	else
		phoneC = true;
}

//전화번호 중복체크
function phoneCheck() {
	if($("#mb_phone").val()!="" && phoneJ.test($("#mb_phone").val()) == true) {
		
		var mb_phone = {mb_phone : $("#mb_phone").val()};
		console.log(mb_phone);
		
		$.ajax({
			async : false,
			type : "POST",
			data : mb_phone,
			url : "phoneCheck",
			success : function(data) {
				if(data == 1) {
					$("#phone_check").text("이미 등록된 전화번호 입니다.");
					$("#phone_check").css("color", "red");
					//$("#submitBtn").attr("type", "button");
					result = data;
					
				} else if(data == 0) {
					$("#phone_check").text("인증번호를 발송했습니다.");
					$("#phone_check").css("color", "blue");
					//$("#submitBtn").attr("type", "submit");
					result = data;
				}
				return result;
			}
		});
		
		if(result == 1)
			return false;
		else
			return true;
	}
}

//인증 유효성
function sms() {
	if($("#mb_sms").val() == "") {
		$("#phone_check2").text("인증실패. 다시 입력하세요.");
        $("#phone_check2").css("color", "red");
        smsC = false;
	}
	smsC = true;
}
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