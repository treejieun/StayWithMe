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
<title>Stay_호스트 안내판</title>
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

.form-group label, .container h3, .container h4 {
	font-family: 'S-CoreDream-2ExtraLight';
	font-weight: bold;
}

.board_notice .fas {
	font-size: 40px;
}
.hostBoard {
	/*margin-top: 10px;*/
	margin-bottom: 200px;
}

.hostBoard_list tr {
	border-collapse: collapse;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.hostBoard_list th {
	background-color: #f3f3f3;
	padding: 0.5%;
}

.hostBoard_list td#acmTitle {
	text-align: left;
	padding-left: 10px;
	font-weight: bold;
}
.hostBoard_list td#acmAddress, .hostBoard_list td#acmDetail {
	text-align: left;
}

a{
	color: black!important;
}

.paging {
	/*align: center;*/
	margin-top: 10px;
}

.paging .pagination {
	display: inline-flex;
}
.paging .pagination .page-item.active .page-link {
	background-color: #cccccc!important;
	border-color: #cccccc!important;
}
#addBtnDiv {
	float: right;
}

@media screen and (max-width:768px) {
	#addBtnDiv {
		float: none;
		display: grid;
	}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>
<div class="main">
	<div class="container" id="board">
		<h3>호스트 안내판</h3>
		<div id="border"></div>
		<div class="hostBoard mx-auto">
			<table class="hostBoard_list mx-auto text-center">
				<caption style="caption-side: top;">
					<span class="d-flex justify-content-end">
						<span>정렬 개수 : </span>
						<select name="contentnum" id="contentnum">
							<option value="3" selected>3</option>
							<option value="5">5</option>
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
						</select>
					</span>
				</caption>
				<colgroup>
					<col style="width:450px;">
					<col style="width:300px;">
					<col style="width:150px;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">숙소</th>
						<th scope="col">주소</th>
						<th scope="col">상세주소</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="4" style="height:250px;">
									<h4 class="board_notice text-center">
										<i class="fas fa-exclamation-circle"></i><br/><br/>
										등록된 숙소가 없습니다. 숙소를 등록해주세요
									</h4>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="list">
								<tr style="height : 90px;">
									<td id="acmTitle">
										<a href="acmContent?acm_code=${list.acm_code}">
											${list.acm_title}
										</a>
									</td>
									<td id="acmAddress">
										${list.acm_address}
									</td>
									<td id="acmDetail">
										${list.acm_add_detail}
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
				<c:choose>
					<c:when test="${empty list}">
						<tfoot>
							<tr style="border:0;">
								<td colspan="4">
									<div align="right" id="addBtnDiv">
										<button type="button" onClick="location.href='addAcm'" id="cs_write" class="btn btn-dark" style="margin-top:10px;">숙소 추가하기</button>
									</div>
								</td>
							</tr>
						</tfoot>
					</c:when>
					<c:otherwise>
						<tfoot>
							<tr style="border:0;">
								<td colspan="4">
									<div align="right" id="addBtnDiv">
										<button type="button" onClick="location.href='addAcm'" id="cs_write" class="btn btn-dark" style="margin-top:10px;">숙소 추가하기</button>
									</div>
									<div class="paging mx-auto col-6 col-lg-2">
										<ul class="pagination">
											<c:if test="${page.prev }">
												<li class="page-item"><a class="page-link" href="javascript:page(${page.getStartPage()-1});">&laquo;</a></li>
											</c:if>
											<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" var="idx">
												<li class="page-item pageNumber" id="${idx}">
													<a class="page-link pageNum" href="javascript:page(${idx});">${idx}</a>
												</li>
											</c:forEach>
											<c:if test="${page.next }" >
												<li class="page-item">
													<a class="page-link" href="javascript:page(${page.getEndPage()+1});">&raquo;</a>
												</li>
											</c:if>
										</ul>
									</div>
								</td>
							</tr>
						</tfoot>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="addAcmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<img src="img/logo.jpg">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center" style="font-weight:bold;">
				 숙소등록이 성공적으로 이루어졌습니다.
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"/>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
	if (${not empty addS}){ //${not empty addS}
		$("#addAcmModal").modal("show");
	}
	else {
		console.log("esle");
	}
	
	$(".menu-toggle").click(function() {
		$("nav").toggleClass("active");
		$(".main").toggleClass("main1");
	});
	
	console.log(getParameters('pagenum'));
	var sel = '#' + getParameters('pagenum');
	$(sel).addClass("active");

});

function page(idx){
	var pagenum = idx;
	var contentnum = $("#contentnum option:selected").val();
	location.href="hostBoard?pagenum=" + pagenum + "&contentnum=" + contentnum;
}

var getParameters = function (paramName) {
    // 리턴값을 위한 변수 선언
    var returnValue;

    // 현재 URL 가져오기
    var url = location.href;

    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');

    // 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return
    for (var i = 0; i < parameters.length; i++) {
        var varName = parameters[i].split('=')[0];
        if (varName.toUpperCase() == paramName.toUpperCase()) {
            returnValue = parameters[i].split('=')[1];
            return decodeURIComponent(returnValue);
        }
    }
};

</script>
</body>
</html>