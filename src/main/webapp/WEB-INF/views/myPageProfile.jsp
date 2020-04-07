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
<title>Stay_마이 페이지</title>
<style>
#information-header {
	padding-top: 150px;
}
#border {
	border: 3px solid #000000;
	/*border-collapse: collapse;*/
}

.informationTabMenu {
	margin-top: 40px;
    width: 80%;
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

.form-control {
	border: none;
	border-radius: 0;
	border-bottom: 2px solid grey;
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
	.informationTabMenu {
		width: 300px;
	}
	
	.informationTab {
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
<div class="main">
	<div class="container" id="information-header">
		<h3>마이페이지</h3>
		<div id="border"></div>
		<div class="informationTabMenu mx-auto">
			<div class="tab-content">
				<div id="myPage" class="tab-pane active mx-auto">
					<div class = "container">
						<div class = "myPageform">
							<div class = "myPage d-flex flex-wrap align-content-center justify-content-center" id ="Edit-member-information">
								<div class = "text-center">
									<h5>회원정보 수정</h5>
									<p>
										회원정보 수정을 하려면 비밀번호를 입력해 주세요<br/>
										<span>
											<input type = "password" class = "d-inline form-control" name = "checkPwd" id ="checkPwd" placeholder="비밀번호를 입력해 주세요." style = "width : 70%;"/>
											<button class = "d-inline btn btn-dark form-control" style = "width : 75px;" id = "checkPw">확인</button>
										</span>
									</p>
								</div>
								
							</div>
						</div>
						<sec:authorize access="hasAnyRole('ROLE_HOST','ROLE_ADMIN')">
							<div class = "myPageform" id = "accountEdit">
								<div class = "myPage d-flex flex-wrap align-content-center justify-content-center" id ="pay">
									<div class = "text-center">
										<h5>계좌 정보 변경</h5>
										<p>
											계좌정보를 변경하려면 비밀번호를 입력해 주세요<br/>
											<span>
					
												<input type = "password" class = "d-inline form-control" name = "checkPwd1" id ="checkPwd1" placeholder="비밀번호를 입력해 주세요." style = "width : 70%;"/>
												<button class = "d-inline btn btn-dark form-control" style = "width : 75px;" id = "checkPw1">확인</button>
											</span>
										</p>
									</div>
								</div>
							</div>
						</sec:authorize>
					</div>
				</div>
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
<!-- iCheck(라디오 버튼) -->
<script src="icheck-1.x/icheck.min.js"></script>
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
var emailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
var foundId = null;

$(document).ready(function(){	
	var result = "${result}";
	$("#checkPw").click(function(){
		event.preventDefault;
		$.ajax({
			url : "checkPwd",
			data : {checkPwd:$("#checkPwd").val()},
			Type : "POST",
			success : function(data) {
				console.log(data);
				if(data == "true") {
					location.href = "EditInformation";
				}
				else {
					location.href = "myPageProfile?fail=1";
				}
			},
			error : function() {
				alert("server error");
			}
		}); 
	});
	$("#checkPw1").click(function(){
		event.preventDefault;
		$.ajax({
			url : "checkPwd",
			data : {checkPwd:$("#checkPwd1").val()},
			Type : "POST",
			success : function(data) {
				console.log(data);
				if(data == "true") {
					location.href = "Account";
				}
				else {
					location.href = "myPageProfile?fail=1";
				}
			},
			error : function() {
				alert("server error");
			}
		}); 
	});
});
</script>
<script>
$(document).ready(function() {
<c:choose>
	<c:when test="${not empty fail}">
		alert("비밀번호 틀렸습니다.");
	</c:when>
</c:choose>
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
</body>
</html>