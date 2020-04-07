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
<title>Stay_숙소글 관리</title>
<style>
.main {
  margin-left: 300px;
}

#acmArti-header {
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
.acmBoard {
	margin-top: 100px;
	margin-bottom: 200px;
}

.acmBoard_list tr {
	border-collapse: collapse;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.acmBoard_list th {
	background-color: #f3f3f3;
	padding: 0.5%;
}

.acmBoard_list td.acmTitle {
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

.acmBoard_list a, .pagination a {
	color: black!important;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/navbar.jsp" flush="false"/>

<div class="main">
	<div class="container" id="acmArti-header">
		<h3>숙소 목록</h3>
		<div id="border"></div>
		
		<div class="acmBoard mx-auto">
			
			<table class="acmBoard_list mx-auto text-center">
				<colgroup>
					<col style="width:50px;"><!-- 숙소번호 -->
					<col style="width:350px;"><!-- 제목 -->
					<col style="width:300px;"><!-- 주소 -->
					<col style="width:200px;"><!-- 상세주소 -->
					<col style="width:60px;"><!-- 집유형 -->
					<col style="width:100px;"><!-- 아이디 -->
					<col style="width:50px;"><!-- 체크 -->
				</colgroup>
				<thead>
					<tr>
						<th scope="col">숙소번호</th>
						<th scope="col">제목</th>
						<th scope="col">주소</th>
						<th scope="col">상세주소</th>
						<th scope="col">집유형</th>
						<th scope="col">아이디</th>
						<th scope="col"><input type="checkbox"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
							<td>${list.acm_code}</td>
							<td>
								<a href="acmDetail?acm_code=${list.acm_code}">
									${list.acm_title}
								</a>
							</td>
							<td>${list.acm_address}</td>
							<td>${list.acm_add_detail}</td>
							<td>${list.acm_type}</td>
							<td>${list.mb_id}</td>
							<td><input type="checkbox"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<div class="paging" align="center">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="page-item"><a class="page-link" href="acmArticle${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
						</c:if> 
					
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<li class="page-item pageNumber"><a class="page-link pageNum" href="acmArticle${pageMaker.makeQuery(idx)}" num="${idx}">${idx}</a></li>
						</c:forEach>
					
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li class="page-item"><a class="page-link" href="acmArticle${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
						</c:if> 
					</ul>
				</div>
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