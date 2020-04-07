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
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- datepicker -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
<title>Stay_예약 확인 페이지</title>
<style>
.main1 {
	margin-top: 100px;
}

#board {
	padding-top: 150px;
}

#border {
	border: 3px solid #000000;
	/*border-collapse: collapse;*/
}
.resCheck {
	margin-top: 100px;
	margin-bottom: 200px;
}

.resCheck_list tr {
	border-collapse: collapse;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.resCheck_list th {
	background-color: #f3f3f3;
	padding: 0.5%;
}
</style>
</head>
<body>
<jsp:include page="common/header.jsp" flush = "flase"></jsp:include>
	<div class="container main" id="board">
		<h3>예약 확인</h3>
		<div id="border"></div>
		<div class = "resCheck mx-auto" style = "max-width : 100%">
			<table class="resCheck_list mx-auto text-center m-0" style = "width : 100%; max-width : 1000px;">
				<colgroup>
					<col style = "width : 10%;">
					<col style = "width : 30%;">
					<col style = "width : 15%;">
					<col style = "width : 15%;">
					<col style = "width : 35%;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">예약 번호</th>
						<th scope="col">숙소 명</th>
						<th scope="col">체크인</th>
						<th scope="col">체크아웃</th>
						<th scope="col">주소</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="5" style="height:400px;">
									<h4 class="board_notice text-center">
										<i class="fas fa-exclamation-circle"></i><br/><br/>
										예약된 숙소가 없습니다. 예약을 해주세요.
									</h4>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items = "${list}" var = "list">
								<tr style = "height : 90px;">
									<td>${list.res_code}</td>
									<td>${list.acm_title}</td><!-- 숙소 명 -->
									<td>${list.res_checkin_date}</td><!-- checkIn -->
									<td>${list.res_checkout_date}</td><!-- checkOut -->
									<td>${list.acm_address} ${list.acm_add_detail}</td><!-- 주소 -->
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
				<tfoot>
					
				</tfoot>
			</table>
		</div>
	</div>
<jsp:include page="common/footer.jsp" flush = "flase"></jsp:include>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- datepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/js/bootstrap-datepicker.min.js"></script>
<script>
$(document).ready(function() {
	$(".menu-toggle").click(function() {
		$("nav").toggleClass("active");
		$(".main").toggleClass("main1");
	});
});
</script>
<script>
function parse(str) {
    var y = str.substr(0, 4);
    var m = str.substr(4, 2);
    var d = str.substr(6, 2);
    return new Date(y,m-1,d);
}
</script>
<script>

</script>
</body>
</html>