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
<title>Stay_아이디 찾기 결과</title>
</head>
<style>
.findResult {
	font-size: 15px;
	font-weight: bold;
	padding: 20px;
	padding-bottom: 50px;
    margin-bottom: 20px;
}

.findResult p {
	font-size: 30px;
	font-weight: 900;
	margin-bottom: 0;
}

.findResult p i {
	font-size: 20px;
	position: relative;
	bottom: 10px;
}

#goLoginBtn {
	width: 123px;
}

@media screen and (max-width: 576px) {
	.findResult p {
		font-size: 18px;
		line-height: 300%;
	}
}
</style>
<body>
<div class="findTab_info text-center">
	<i class="fas fa-search"></i><br/>
	<p style="font-size:30px;">조회 결과</p>
</div>
<div class="findResult text-center">
	입력하신 회원정보와 일치하는 아이디는<br/>
	<p>
		<i class="fas fa-quote-left"></i>${foundId}<i class="fas fa-quote-right"></i><br/>
	</p>
	입니다. 로그인 하시겠습니까?
</div>
<div id="btnCenter" class="text-center">
	<button type="button" id="goLoginBtn" class="btn btn-dark">로그인</button>&nbsp;&nbsp;
	<button type="button" id="goFindPwdBtn" class="btn btn-dark">비밀번호 찾기</button>
</div>

<script>
foundId = "${foundId}";

$(document).ready(function() {
	$("#goLoginBtn").click(function() {
		location.href="login?log=start";
	});
	
	$("#goFindPwdBtn").click(function() {
		//event.preventDefault();
		$.ajax ({
			data : "",
			url : "findIdPwd",
			success : function(data) {
				$(".main").html(data);
				
				$("#defaultTab2").trigger("click");
				//$("#defaultTab1").removeClass("active");
				$("#findId").removeClass("active");
				$("#findPwd").addClass("active");
				/*var i;
				var findTab;
				var findTab = document.getElementsByClassName("findTab");
				
				
				for(i = 0 ; i < findTab.length ; i++) {
					findTab[i].style.backgroundColor = "";
					findTab[i].style.color = "white";
				}
				
				elmnt.style.backgroundColor = color;
				elmnt.style.color = "black";*/

			}
		});
	});
});

</script>
</body>
</html>