<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- csrf정보  -->
<meta name="_csrf" content="${_csrf.token}"/>
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Stay_결제 정보 수정</title>
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
<body ng-app="Account" ng-controller="AccountCtrl">
<jsp:include page="common/header.jsp" flush="false"/>

<div class="main">
<div id="top-container" class="container">
	<h3>결제 정보 수정</h3>
	<div id="border"></div>
	<div class="row d-flex justify-content-center pt-5" style="max-width:1200px;">
		<div class="col-10 col-sm-10 mt-3 mb-3">
			<form method="POST" action ="accountEdit">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
				<div><!-- 계좌 정보 -->
					<div class="mb-5"> <!-- form안에서 이전,다음버튼과 컨텐츠과의 거리 -->
						<div class="row">
							<div class="col-sm-3">
								<select class="form-control" name = "ho_account">
									<option id = "option1">국민</option>
									<option id = "option2">신한</option>
									<option id = "option3">농협</option>
								</select>
							</div>
							<div class="col-sm-9">
								<input class="form-control" type="text" name="ho_acc_num"  id="ho_acc_num" value = "${dto.ho_acc_num}">
							</div>
						</div>
					</div>
			    </div>
			    
			    <div id="complete-btn" class="d-flex flex-row-reverse">
				    <div class="text-center">
						<button type="submit" class="form-control btn btn-dark" style="border: none;">계좌변경완료</button>
					</div>
				</div>
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
<script>
$(document).ready(function(){
	$(".menu-toggle").click(function() {
 		$("nav").toggleClass("active"); 
 		$(".main").toggleClass("main1");
 	});
});	
</script>
<script>
$(document).ready(function() {
	var selected = "${dto.ho_account}";
	if($("#option1").val() == selected) {
		$("#option1").attr("selected", "selected");
	}
	else if($("#option2").val() == selected) {
		$("#option2").attr("selected", "selected");
	}
	else if($("#option3").val() == selected) {
		$("#option3").attr("selected", "selected");
	}
	
	
});
</script>
</body>
</html>