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
<title>Stay_회원목록</title>
<style>
.main {
  margin-left: 300px;
}

#memL-header {
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
.memBoard {
	margin-top: 100px;
	margin-bottom: 200px;
}

.memBoard_list tr {
	border-collapse: collapse;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.memBoard_list th {
	background-color: #f3f3f3;
	padding: 0.5%;
}

.memBoard_list td.memTitle {
	text-align: left;
	padding-left: 10px;
	font-weight: bold;
}

.caption {
	caption-side:top;
	text-align: -webkit-right;
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

.memBoard_list a, .pagination a {
	color: black!important;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/admin/navbar.jsp" flush="false"/>

<div class="main">
	<div class="container" id="memL-header">
		<h3>회원 목록</h3>
		<div id="border"></div>
		
		<div class="memBoard mx-auto">
			
			<table class="memBoard_list mx-auto text-center" id="memberList">
				<colgroup>
					<col style="width:100px;"><!-- 아이디 -->
					<col style="width:50px;"><!-- 이름 -->
					<col style="width:100px;"><!-- 생년월일 -->
					<col style="width:50px;"><!-- 성별 -->
					<col style="width:300px;"><!-- 이메일 -->
					<col style="width:130px;"><!-- 핸드폰 -->
					<col style="width:100px;"><!-- 가입일 -->
					<col style="width:100px;"><!-- 탈퇴일 -->
					<col style="width:50px;"><!-- 등급 -->
					<col style="width:50px;"><!-- 체크 -->
				</colgroup>
				<thead>
					<tr>
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">성별</th>
						<th scope="col">생년월일</th>
						<th scope="col">이메일</th>
						<th scope="col">핸드폰</th>
						<th scope="col">가입일</th>
						<th scope="col">탈퇴일</th>
						<th scope="col">등급</th>
						<th scope="col"><input type="checkbox"></th>
					</tr>
				</thead>
				<caption class="caption">
					<button id="csv" type="button" class="btn btn-dark">CSV</button>
					<button id="pdf" type="button" class="btn btn-dark">PDF</button>
				</caption>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
							<td>${list.mb_id}</td>
							<td>${list.mb_name}</td>
							<c:choose>
								<c:when test="${list.mb_sex eq 'F'.charAt(0)}">
									<td>여</td>
								</c:when>
								<c:when test="${list.mb_sex eq 'M'.charAt(0)}">
									<td>남</td>
								</c:when>
							</c:choose>
							<td>${list.mb_birthdate}</td>
							<td>${list.mb_email}</td>
							<td>${list.mb_phone}</td>
							<td>${list.mb_join_date}</td>
							<c:choose>
								<c:when test="${empty list.mb_delete_date}">
									<td>-</td>
								</c:when>
								<c:when test="${not empty list.mb_delete_date}">
									<td>${list.mb_delete_date}</td>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${list.mb_grade eq 'ROLE_ADMIN'}">
									<td>관리자</td>
								</c:when>
								<c:when test="${list.mb_grade eq 'ROLE_HOST'}">
									<td>호스트</td>
								</c:when>
								<c:when test="${list.mb_grade eq 'ROLE_GUEST'}">
									<td>게스트</td>
								</c:when>
							</c:choose>
							<td><input type="checkbox"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<div class="paging" align="center">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="page-item"><a class="page-link" href="memberList${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
						</c:if> 
					
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<li class="page-item pageNumber"><a class="page-link pageNum" href="memberList${pageMaker.makeQuery(idx)}" num="${idx}">${idx}</a></li>
						</c:forEach>
					
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li class="page-item"><a class="page-link" href="memberList${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
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
<!-- fileConvert -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.2.11/jspdf.plugin.autotable.min.js"></script>
<script src="js/tableHTMLExport.js"></script>

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
	
	$("#csv").on("click", function() {
		$("#memberList").tableHTMLExport({
			type: "csv",
			filename: "memberList.csv"
		});
	});
	
	$("#pdf").on("click", function() {
		html2canvas(document.getElementById("memberList"), {
			onrendered: function(canvas) {
				var imgData = canvas.toDataURL("images/png");
				var doc = new jsPDF("p", "mm", [297,210]);
				doc.addImage(imgData, "PNG", 5, 5, 55, 20);
				doc.save("memberList.pdf");
			}	
		});
	});
});
</script>
</body>
</html>