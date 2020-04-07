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
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Stay_1:1문의</title>
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

.cs_notice .fas {
	font-size: 40px;
}
.csBoard {
	margin-top: 100px;
	margin-bottom: 200px;
}

.csBoard_list tr {
	border-collapse: collapse;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.csBoard_list th {
	background-color: #f3f3f3;
	padding: 0.5%;
}

.csBoard_list td.csTitle {
	text-align: left;
	padding-left: 10px;
	font-weight: bold;
}

.paging {
	/*align: center;*/
	margin-top: 10px;
}

.paging .pagination {
	display: inline-flex;
}

.dd li:hover {
	background-color: #cccccc;
}

.paging .pagination .page-item.active .page-link {
	background-color: #cccccc!important;
	border-color: #cccccc!important;
}

.csBoard_list a, .pagination a {
	color: black!important;
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
			
			<table class="csBoard_list mx-auto text-center">
				<colgroup>
					<col style="width:500px;">
					<col style="width:100px;">
					<col style="width:100px;">
					<col style="width:90px;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col">답변유무</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="4" style="height:400px;">
								<h4 class="cs_notice text-center">
									<i class="fas fa-exclamation-circle"></i><br/><br/>
									1:1 문의 내역이 존재하지 않습니다.
								</h4>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="list">
							<sec:authentication property="principal.username" var="mb_id"/>
							<sec:authentication property="principal.authorities" var="mb_grade"/>
							<c:choose>
								<c:when test="${mb_grade eq '[ROLE_ADMIN]' && list.mb_id ne mb_id }">
									<tr>
										<td class="csTitle">
											<a href="csAdContent?cs_code=${list.cs_code}&mb_id=${list.mb_id}">
												${list.cs_title}
											</a>
										</td>
										<td>${list.mb_id}</td>
										<td>${list.cs_date}</td>
										<c:choose>
											<c:when test="${list.cs_complete eq 'N'.charAt(0)}">
												<td class="text-danger" style="font-weight:bold;">답변대기</td>
											</c:when>
											<c:otherwise>
												<td class="text-primary" style="font-weight:bold;">답변완료</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
				<div>
					<div class="paging" align="center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li class="page-item"><a class="page-link" href="csAdmin${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
							</c:if> 
						
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li class="page-item pageNumber"><a class="page-link pageNum" href="csAdmin${pageMaker.makeQuery(idx)}" num="${idx}">${idx}</a></li>
							</c:forEach>
						
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li class="page-item"><a class="page-link" href="csAdmin${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
							</c:if> 
						</ul>
					</div>
				</div>					
			</sec:authorize>
			
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

$(document).ready(function() {
	var x;
	var endPage = window.location.search.substr(6,1);
	var d = window.location.pathname;
	if(endPage == "") {
		$(".pageNumber").eq(0).addClass("active");
	}
	else if(endPage == $(".pageNum").eq(0).attr("num")) {
		$(".pageNumber").eq(0).addClass("active");
	}
	else if(endPage == $(".pageNum").eq(1).attr("num")) {
		$(".pageNumber").eq(1).addClass("active");
	}
	else if(endPage == $(".pageNum").eq(2).attr("num")) {
		$(".pageNumber").eq(2).addClass("active");
	}
	else if(endPage == $(".pageNum").eq(3).attr("num")) {
		$(".pageNumber").eq(3).addClass("active");
	}
	else if(endPage == $(".pageNum").eq(4).attr("num")) {
		$(".pageNumber").eq(4).addClass("active");
	}
});
</script>
</body>
</html>