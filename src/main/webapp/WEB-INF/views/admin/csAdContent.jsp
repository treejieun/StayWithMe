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
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Stay_1:1문의글 내용</title>
<style>
.main {
  margin-left: 300px;
}

#csA-header {
	padding-top: 100px;
}

#border {
	border: 3px solid #000000;
	/*border-collapse: collapse;*/
}

.form-group label, .container h3, .container h4 {
	font-family: 'S-CoreDream-2ExtraLight';
	font-weight: bold;
}
.csBoard {
	margin-top: 100px;
	margin-bottom: 200px;
}

.csBoard_content tr {
	border-collapse: collapse;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.csBoard_content th {
	background-color: #f3f3f3;
	padding: 0.5%;
}

.csBoard_content td {
	text-align: left;
	padding-left: 10px;
	font-weight: bold;
}

.csBoard_content td.contents {
	padding: 35px 10px;
}

.ck-widget img {
	width: 700px;
}

#replyContent {
	margin-top: 50px;
}

.caption {
	caption-side:top;
}

.border2 {
	border-bottom: 3px solid #000000;
	font-size : 1.2em;
	font-weight: bold;
	color: black!important;
	margin-bottom: 10px;
	width: 150px;
}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/navbar.jsp" flush="false"/>

<div class="main">
	<div class="container" id="csA-header">
		<h3>1:1 문의</h3>
		<div id="border"></div>
		
		<div class="csBoard mx-auto">
			<table class="csBoard_content mx-auto text-center">
				
				<colgroup>
					<col style="width:100px;">
					<col style="width:380px;">
					<col style="width:100px;">
					<col style="width:200px;">
				</colgroup>
				<caption class="caption">
					<div class="border2">문의</div>
				</caption>
				<tbody>
					<c:forEach items="${content}" var="content">
						<tr>
							<th scope="row">제목</th>
							<td colspan="3">${content.cs_title}</td>
						</tr>
						<tr>
							<th scope="row">작성자</th>
							<td>${content.mb_name}</td>
							<th scope="row">작성일</th>
							<td>${content.cs_date}</td>
						</tr>
						<tr>
							<td colspan="4" class="contents">${content.cs_content}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr style="border:0px;">
						<td colspan="4">
							<div align="right">
								<form class="csMbForm" method="post">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
									<input type="hidden" name="cs_code" value="${content[0].cs_code}">
									<input type="hidden" name="cs_title" value="${content[0].cs_title}">
									<input type="hidden" name="cs_content" value="${content[0].cs_content}">
								</form>
								<c:if test="${empty reply[0].cs_group}">
									<button type="submit" id="cs_adReply" class="btn btn-dark" style="margin-top:10px;">답변</button>
								</c:if>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
			
			<table class="csBoard_content mx-auto text-center" id="replyContent">
				<colgroup>
					<col style="width:100px;">
					<col style="width:380px;">
					<col style="width:100px;">
					<col style="width:200px;">
				</colgroup>
				<c:forEach items="${reply}" var="reply">
					<c:if test="${reply.mb_id ne content[0].mb_id && reply.cs_code ne content[0].cs_code}">
						<caption class="caption">
							<div class="border2">답변</div>
						</caption>
						<tbody>
							<tr>
								<th scope="row">제목</th>
								<td colspan="3">${reply.cs_title}</td>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<td>${reply.mb_name}</td>
								<th scope="row">작성일</th>
								<td>${reply.cs_date}</td>
							</tr>
							<tr>
								<td colspan="4" class="contents">${reply.cs_content}</td>
							</tr>
						</tbody>
					</c:if>
				</c:forEach>
				<tfoot>
					<tr style="border:0px;">
						<td colspan="4">
							<div align="right">
								<c:forEach items="${reply}" var="reply">
									<c:if test="${reply.mb_id ne content[0].mb_id && reply.cs_code ne content[0].cs_code}">
										<form class="csAdForm" method="post">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
											<input type="hidden" name="cs_code" value="${reply.cs_code}">
											<input type="hidden" name="cs_title" value="${reply.cs_title}">
											<input type="hidden" name="cs_content" value="${reply.cs_content}">
											<input type="hidden" name="cs_group" value="${reply.cs_group}">
										</form>
									</c:if>
								</c:forEach>
								<c:if test="${!empty reply[0].cs_group}">
									<button type="submit" id="cs_adModify" class="btn btn-dark" style="margin-top:10px;">수정</button>
									<button type="submit" id="cs_adDelete" class="btn btn-dark" style="margin-top:10px;">삭제</button>
								</c:if>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		
	</div>
</div>


<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>

var formObj1 = $("form[class='csMbForm']");
var formObj2 = $("form[class='csAdForm']");

$(document).on("click", "#cs_adReply", function() {
	formObj1.attr("action", "csReply");
	formObj1.submit();
});

$(document).on("click", "#cs_adModify", function() {
	formObj2.attr("action", "csModify");
	formObj2.submit();
});

$(document).on("click", "#cs_adDelete", function() {
	formObj2.attr("action", "csDelete");
	formObj2.submit();
});
</script>
</body>
</html>