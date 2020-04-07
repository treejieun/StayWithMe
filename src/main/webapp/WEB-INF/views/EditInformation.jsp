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
<title>Stay_회원정보 수정</title>
<style>
#edit-header {
	padding-top: 150px;
}
#border {
	border: 3px solid #000000;
	/*border-collapse: collapse;*/
}
.main1 {
	margin-top : 100px;
}
.d-flex #form .form-control {
	border: none;
	border-radius: 0;
	border-bottom: 2px solid grey;
	margin: 0px;
}
#information {
	margin-top: 100px;
    margin-bottom: 150px;
}
.Validation {
	margin : 0px;
}
.btn {
	border: 1px solid grey;
	border-radius: 0.7;
}
</style>
</head>
<body ng-app = "myApp">
<jsp:include page="common/header.jsp" flush = "flase"></jsp:include>
	<div class="main">
		<div class="container" id="edit-header">
			<h3>회원정보 수정</h3>
			<div id="border"></div>
			<form id="information" class = "d-flex justify-content-center" method = "POST" ng-controller = "myCtrl">
				<div id = "form" style = "margin : 0px; width : 450px;">
					<sec:authentication property="principal.username" var="mb_id"/>
					<sec:authentication property="principal.authorities" var="mb_grade"/>
					<label>아이디</label>
					<input type = "text" class = "row form-control" id = "id" value = "${mb_id}" disabled/>
					<br/>
				
					<div>
						<label>새 비밀번호</label>
						<input type = "password" class = "form-control" placeholder="변경할 비밀번호를 입력하세요." id ="mb_pwd1" name = "checkPwd"/>
						<div class = "password Validation" id ="mb_pwd1_check"></div>
						<br/>
						<label>비밀번호 확인</label>
						<div class = "row m-0">
							<input type = "password" class = "form-control col-9 col-sm-10 d-inline" placeholder="동일한 비밀번호를 입력하세요." id ="mb_pwd2"/>
							<input type ="button"class = "form-control d-inline col-3 col-sm-2 btn btn-dark pwdBtn" value = "수정"/> <br/>
						</div>
						<div class = "password1 Validation" id ="mb_pwd2_check"></div>
					</div>
					<br/>
					<div>
						<label>이메일</label>
						<div class = "row m-0">
							<input type = "email" class = "form-control col-9 col-sm-10 d-inline" id="mb_email" value = "${dto.mb_email}"/>
							<input type ="button"class = "form-control d-inline col-3 col-sm-2 btn btn-dark emailBtn" value = "수정"/> <br/>
						</div>
						<div class = "email Validation" id ="email_check"></div>
					</div>
					<br/>
					<div>
						<label>전화번호</label>
						<div class = "row m-0">
							<input type = "tel" class = "form-control col-9 col-sm-10 d-inline" id="mb_phone" value = "${dto.mb_phone}"/>
							<input type ="button"class = "form-control d-inline col-3 col-sm-2 btn btn-dark phoneBtn" value = "인증"/> <br/>
						</div>
						<div class = "tel Validation" id ="phone_check"></div><br/>
						<div class = "row m-0">
							<input type = "text" class = "form-control col-9 col-sm-10 d-inline" placeholder="인증번호를 입력해주세요." id="mb_phone1"/>
							<input type ="button"class = "form-control d-inline col-3 col-sm-2 btn btn-dark phoneBtn1" value = "확인"/> <br/>
						</div>
						<div class = "tel Validation" id ="phone_check1"></div><br/>
						<input type ="button"class = "form-control d-inline col-3 col-sm-2 btn btn-dark phoneBtn2" value = "수정"/> <br/>
					</div>
					<br/>
					<!-- 권한이 host일 경우 보이게 하고 guest일 경우 안보이게 하면됨 -->
					<div class = "address">
						<div>
							<sec:authorize access="hasAnyRole('ROLE_HOST', 'ROLE_ADMIN')">
								<label>주소</label>
								<div class="mb-5" id="acm_address"> <!-- form안에서 이전,다음버튼과 컨텐츠과의 거리 -->
									<div class="row d-flex justify-content-start">
										<div class="col-sm-3 col-5">
											<input class="form-control btn btn-dark" type="button" onclick="daumPostcode()" value="주소찾기">
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12" style="height: 63px;">
											<input class="form-control" type="text" name="address"  id="address" value = "${dto1.ho_address}">
											<div id="address_check"></div><br/>
										</div>
									</div>
									<br/>
									<div class="row">
										<div class="col-sm-9">
											<input class="form-control" type="text" name="detailAddress"  id="detailAddress" value = "${dto1.ho_add_detail}">
										</div>
										<div class="col-sm-3 d-flex justify-content-end">
											<input class="form-control" type="text" name="postcode"  id="postcode" value = "${dto1.ho_zip}">
										</div>
										<div class="col-sm-9">
											<div id="detailAddress_check"></div>
										</div>
										<div class="col-sm-3">
											<div id="postcode_check"></div>
										</div>
									<br/>
									</div>
									<div class="row d-flex justify-content-end">
										<div class="col-sm-3 col-5">
											<input type ="button" class = "form-control btn btn-dark addressBtn" value = "수정"/> <br/>
										</div>
									</div>
								</div>
							</sec:authorize>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
<jsp:include page="common/footer.jsp" flush="false"/>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- angularjs -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- iCheck(라디오 버튼) -->
<script src="icheck-1.x/icheck.min.js"></script>
<script>
$(document).ready(function() {
	$(".menu-toggle").click(function() {
		$("nav").toggleClass("active");
		$(".main").toggleClass("main1");
	});
});
</script>
<script>
$(document).ready(function() {
	$("#mb_pwd1").blur(function() {
		pwd();
	});
	$("#mb_pwd2").blur(function() {
		pwd1();
	});
	$("#mb_email").blur(function() {
		email();
	});
	$(".phoneBtn").click(function() {
		phone();
		
	})
	$(".phoneBtn1").click(function() {
		sms();	
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
    $(".addressBtn").click(function() {
    	postcode();
    	address();
    	detailAddress();
    });
});
</script>
<script>
//모든 공백 체크 정규식
var empJ = /\s/g;
var idJ = /^[a-z0-9][a-z0-9_-]{3,20}$/;
var pwdJ = /^[A-Za-z0-9]{4,20}$/; 
var nameJ = /^[가-힣]{2,20}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
var emailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var phoneJ = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
var birthJ = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
var postJ = /^\d{5}$/;
var result = null;

function pwd() {
	if($("#mb_pwd1").val() == "") {
		//mb_pwd에 아무것도 적지 않았을때
		$("#mb_pwd1_check").text("비밀번호를 입력하세요");
		$("#mb_pwd1_check").css("color" , "red");
		pwdA = false;
	}
	else if (pwdJ.test($("#mb_pwd1").val()) != true) {
		$("#mb_pwd1_check").text("4~20자의 영문 대 소문자, 숫자만 사용 가능합니다.");
		$("#mb_pwd1_check").css("color", "red");
		pwdA = false;
	}
	else {
		$.ajax({
			url : "checkPwd",
			data : {mb_pwd1 : $("#mb_pwd1").val()},
			Type : "POST",
			success : function(data) {
				console.log(data);
				if(data == "true") {
					$("#mb_pwd1_check").text("현재 비밀번호입니다. 비밀번호를 변경해주세요.");
					$("#mb_pwd1_check").css("color", "red");
					pwdA = false;
				}
				else {
					$("#mb_pwd1_check").text("사용 가능한 비밀번호 입니다.");
					$("#mb_pwd1_check").css("color", "blue");
					pwdA = true;
				}
			},
			error : function() {
				alert("server error");
			}
		}); 
	}
}

function pwd1() {
	if($("#mb_pwd2").val() == "" || $("#mb_pwd1").val() != $("#mb_pwd2").val()) {
		$("#mb_pwd2_check").text("비밀번호가 일치하지 않습니다.");
		$("#mb_pwd2_check").css("color", "red");
		pwdA = true;
	}
	
	else {
		$("#mb_pwd2_check").text("비밀번호가 일치합니다.");
		$("#mb_pwd2_check").css("color", "blue");
		pwdB = true;
	}
}

function email() {
	if($("#mb_email").val() == "") {
		$("#email_check").text("이메일을 작성해주세요");
		$("#email_check").css("color", "red");
		emailA = false;
	}
	
	else if(emailJ.test($("#mb_email").val()) != true) {
		$("#email_check").text("이메일 형식이 올바르지 않습니다.");
		$("#email_check").css("color", "red");
		emailA = false;
	}
	
	else {
		$("#email_check").text("");
		emailA = true;
	}
}

function phone() {
	if($("#mb_phone").val() == "") {
		$("#phone_check").text("전화번호를 입력하세요.");
		$("#phone_check").css("color", "red");
		phoneA = false;
	}
	else if(phoneJ.test($("#mb_phone").val()) != true) {
		$("#phone_check").text("전화번호 형식이 올바르지 않습니다.");
		$("#phone_check").css("color", "red");
		phoneA = false;
	}
	else if($("#mb_phone").val() != "" && phoneJ.test($("#mb_phone").val()) == true) {
		$.ajax({
			type : "POST",
			data : {mb_phone : $("#mb_phone").val()},
			url : "phoneCheck",
			success : function(data) {
				if(data == 1) {
					$("#phone_check").text("중복된 전화번호 입니다.");
					$("#phone_check").css("color", "red");
					phoneA = false;
					result = data;
				} else if(data == 0) {
					$("#phone_check").text("사용가능한 전화번호 입니다.");
					$("#phone_check").css("color", "blue");
					phoneA = true;
					result = data;
				}
			}
		});
		if(result == 1)
			return false;
		else
			$.ajax({
			       url : "sendSms",
			       data : {
			    	   mb_phone : $("#mb_phone").val()
			       },
			       success : function(result){
			    	   console.log(result);
			            if(result != null) {
			                $(".phoneBtn1").on("click", function() {                     
			                   if(JSON.parse(result)==($("#mb_phone1").val())){
			                      $("#phone_check1").text("인증되었습니다."); 
			                      $("#phone_check1").css("color", "blue");
			                      phoneB = true;
			                      
			                   } else {
			                      $("#phone_check1").text("인증실패. 다시 입력하세요.");
			                      $("#phone_check1").css("color", "red");
			                      phoneB = false;
			                   }
			                });
			             }
			             
			       }
			 });
		return true;
		
	}
}
function sms() {
	if($("#mb_phone1").val() == "") {
		$("#phone_check1").text("인증실패. 다시 입력하세요.");
        $("#phone_check1").css("color", "red");
        phoneB = false;
	}
	phoneB = true;
}

</script>
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

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("postcode").value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
    function postcode() {
    	if($("#postcode").val() == "") {
    		$("#postcode_check").text("우편번호를 입력하세요.");
    		$("#postcode_check").css("color", "red");
    		addressA = false;
    		console.log(addressA)
    	}
    	
    	else if(postJ.test($("#postcode").val()) != true) {
    		$("#postcode_check").text("우편번호는 5자리 숫자입니다");
    		$("#postcode_check").css("color", "red");
    		addressA = false;
    		console.log(addressA)
    	}
    	
    	else {
    		$("#postcode_check").text("");
    		addressA = true;
    		console.log(addressA)
    	}
    }
    
    function address(){
    	if($("#address").val() == ""){
    		$("#address_check").text("주소찾기 버튼을 눌러 주소를 검색하세요.");
    		$("#address_check").css("color","red");
    		addressB = false;
    		console.log(addressB)
    	}
    	else {
    		$("#address_check").text("");
    		addressB = true;
    		console.log(addressB)
    	}
    }
    
    function detailAddress(){
    	if($("#detailAddress").val() == ""){
    		$("#detailAddress_check").text("상세주소를 입력해주세요.");
    		$("#detailAddress_check").css("color","red");
    		addressC = false;
    		console.log(addressC)
    	}
    	else {
    		$("#detailAddress_check").text("");
    		addressC = true;
    		console.log(addressC)
    	}
    }
</script>
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
	$(".pwdBtn").click(function() {
		event.preventDefault;
		if(pwdA == false || pwdB == false) {
			return false;
		}
		else{
			$.ajax({
				url : "myPagePwd",
				data : {checkPwd : $("#mb_pwd1").val()},
				type : "POST",
				success : function(data) {
					if(data == "success") {
						location.href = "index";
						
					} else {
						alert("수정에 실패하였습니다.");
					}
				}
			});
		}
	});
	
	$(".emailBtn").click(function() {
		event.preventDefault;
		if(emailA == true) {
			$.ajax({
				type : "POST",
				data : {mb_email : $("#mb_email").val()},
				url : "myPageEmail",
				success : function(data) {
					if(data == "success") {
						location.href = "index";
						
					} else {
						alert("수정에 실패하였습니다.");
					}
				}
			});
		}
		else {
			return false;
		}
	});
	
	$(".phoneBtn2").click(function() {
		event.preventDefault;
		if(phoneA == true && phoneB == true) {
			$.ajax({
				type : "POST",
				data : {mb_phone : $("#mb_phone").val()},
				url : "myPagePhone",
				success : function(data) {
					if(data == "success") {
						location.href = "index";
						
					} else {
						alert("수정에 실패하였습니다.");
					}
				}
			});
		}
		else {
			return false;
		}
	});
	
	$(".addressBtn").click(function() {
		event.preventDefault;
		if(addressA == true && addressB == true && addressC == true) {
			$.ajax({
				type : "POST",
				data : {postcode: $("#postcode").val(), address: $("#address").val(),
					detailAddress: $("#detailAddress").val()},
				url : "myPageAddress",
				success : function(data) {
					if(data == "success") {
						location.href = "index";
						
					} else {
						alert("수정에 실패하였습니다.");
					}
				}
			});
		}
		else {
			return false;
		}
	});
});
</script>
</body>
</html>