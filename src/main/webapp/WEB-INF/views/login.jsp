<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

<title>Stay_Login</title>
<style>
.main1 {
	margin-top: 100px;
}

#login-container {
	padding-top: 150px;
}
#border {
	border: 3px solid #000000;
	/*border-collapse: collapse;*/
}

.container h3, label, #loginForm .btn {
	font-weight: bold;
	font-family: 'S-CoreDream-2ExtraLight';
}

#loginForm .form-control {
	border: none;
	border-radius: 0;
	border-bottom: 2px solid grey;
	margin: 0px;
}
#loginForm {
	width: 400px;
	margin-top: 80px;
	margin-bottom: 150px;
}

.justify-content-between {
	color: #ff7272;
}

.justify-content-between a {
	cursor: pointer;
	font-size: 14px;
    font-weight: bold;
    
}

.justify-content-between a:hover {
	text-decoration: underline!important;
}

#loginJoinBtn {
	margin-top: 50px;
}

#login {
	margin-top: 20px;
}
#login, #singup {
	border: 1px solid grey;
	border-radius: 0.7;
}

@media screen and (max-width: 576px) {
	#loginForm {
		width: 300px;
		font-size: 20px;
	}
}
.modal-content .modal-header, .modal-content .modal-footer {
	border: 0px;
}
</style>
</head>
<body>
<jsp:include page="common/header.jsp" flush="false"/>

<div class="main">
	<div class="container" id="login-container">
		<h3>로그인</h3>
		<div id="border"></div>
		<div class="d-flex flex-wrap align-content-center justify-content-center" style="min-height: 500px;">
			
			<form method="POST" action="login" id="loginForm">
				<!-- frontController로 안감 -->
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
				
				<label style="font-size: 15px;">아이디</label> 
				<input type="text" class="form-control" name="mb_id" placeholder="ID"> <br />
				
				<label style="font-size: 15px;">비밀번호 </label> 
				<input type="password" class="form-control" name="mb_pwd" placeholder="PASSWORD">
				
				<div class="d-flex justify-content-between">
					<a onclick="findIdPwd()">아이디/비밀번호 찾기</a>
				</div>
				<div id="loginJoinBtn">
					<input class="btn btn-dark w-100 form-control" style="margin-bottom: 15px; border : none;" type="submit" value="로 그 인" id="login"/> <br/> 
					<input class="btn btn-dark w-100 form-control" type="button" value="회원가입" id="signin" style = "border : none;"/>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="loginBtnModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<img src="img/logo.jpg">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center" style="font-weight:bold;">
				 로그인을 실패하셨습니다.
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<img src="img/logo.jpg">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center" style="font-weight:bold;">
				 로그인 후 이용 가능합니다.
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<h3>${foundId2}</h3>
<jsp:include page="common/footer.jsp" flush="false"/>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- datepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
	$(document).ready(function() {
		<c:choose>
		<c:when test="${not empty log}">
			
		</c:when>
		<c:when test="${not empty error}">
			$("#loginBtnModal").modal("show");
		</c:when>
		<c:otherwise>
			$("#loginModal").modal("show");
		</c:otherwise>
		</c:choose>
		/*
		$("#form").submit(function(){
		event.preventDefault();
				$.ajax({
					url : $("#form").attr("action"), //데이터를 보낼 서버의 주소(url)
					//.attr("action")이면 action의 속성을 가져오기
					type : $("#form").attr("method"), //데이터를 보낼 방식(get, post)(type)
					
					data : $("#form").serialize(), //보낼 데이터(data)
					//.serialize()는 폼에서 입력받은 모든데이터를 말함
					dataType : "text", //서버에서 반환되는 데이터 타입
					
					beforeSand : function(xhr,settings) { //데이터를 보내기 전 해야 하는 것
						xhr.setrequestheader("X-CSRF-TOKEN",$("meta[name='_csrf']").attr("content"));
					},
					success : function() {
						location.href = "index";
					},
					error : function() {
						alert("server error");
					}
				});
			});
			
		 */
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
<script>
$(document).ready(function(){
	$("#signin").click(function(){
		location.href = "memberjoin";
	});
});

function findIdPwd() {
	$.ajax ({
		data : "",
		url : "findIdPwd",
		dataType : "html",
		success : function(data) {
			$(".main").html(data);
		}
	});
}

</script>

</body>
</html>