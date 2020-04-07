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

<title>Stay_고객센터 글작성</title>
<style>
.main1 {
	margin-top: 100px;
}

#csM-header {
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

.csBoard {
	margin-top: 100px;
	margin-bottom: 200px;
}

.csBoard_write tr {
	border-collapse: collapse;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.csBoard_write th {
	background-color: #f3f3f3;
	padding: 0.5%;
}

.csBoard_write td {
	text-align: left;
	padding-left: 10px;
	font-weight: bold;
}

#cs_title {
	width: 300px;
	border-style: none;
}

:root {
	--ck-image-style-spacing: 1.5em;
}

.ck-content {
	& .image-style-side	{
		max-width: 50%;
		float: right;
		margin-left: var(--ck-image-style-spacing);
	}
}

.modal-content .modal-header, .modal-content .modal-footer {
	border: 0px;
}

@media screen and (min-width:992px) {
	#cs_contents {
		width: 768px;
	}
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false"/>
<div class="main">
	<div class="container" id="csM-header">
		<h3>1:1 문의</h3>
		<div id="border"></div>
		
		<div class="csBoard mx-auto">
			<form method="POST" action="csMbWritePro">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
				<input type="hidden" name="mb_id" value="${mb_id}">
				<input type="hidden" name="mb_name" value="${mb_name}">
				<table class="csBoard_write mx-auto text-center">
					<colgroup>
						<col style="width:100px;">
						<col style="width:380px;">
						<col style="width:100px;">
						<col style="width:200px;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">제목</th>
							<td colspan="3"><input type="text" id="cs_title" name="cs_title"></td>
						</tr>
					</tbody>
				</table>
				<div class="mx-auto" id="cs_contents">
					<div class="mx-auto">
						<div id="toolbar-container" style="max-width:100%"></div>
						<div id="editor" style="max-width:100%;min-height:300px;border:1px solid grey;line-height:0.5rem"></div>
						<textarea class="ck-content" id="cs_content" name="cs_content" style="display:none;"></textarea>
					</div>
					<div align="right">
						<button type="submit" id="cs_writeSubmit" class="btn btn-dark" style="margin-top:10px;">작성</button>
						<button type="button" id="cs_goListBtn" onClick="location.href='csMember'" class="btn btn-dark" style="margin-top:10px;">목록</button>
					</div>
				</div>
				
			</form>
		</div>
		
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<img src="img/logo.jpg">
				<button type="button" id="modalClose1" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div id="modal_body"class="modal-body text-center" style="font-weight:bold;">
				 
			</div>
			<div class="modal-footer">
				<button type="button" id="modalClose2" class="btn btn-dark" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false"/>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- ckEditor DecoupledEditor  -->
<script src="https://cdn.ckeditor.com/ckeditor5/16.0.0/decoupled-document/ckeditor.js"></script>
<script src="https://ckeditor.com/apps/ckfinder/3.4.5/ckfinder.js"></script>

<script>
$(document).ready(function() {
	$(".menu-toggle").click(function() {
		$("nav").toggleClass("active");
		$(".main").toggleClass("main1");
	});
	
	$("form").on("submit", function(e) {
		
		
		if($("#cs_title").val() == "") {
			$("#modal").modal("show");
			modal_body.innerHTML = "제목을 입력하세요";
			return false;
		}
		else if($("#editor").html() == '<p><br data-cke-filler="true"></p>') {
			$("#modal").modal("show");
			modal_body.innerHTML = "내용을 입력하세요";
			return false;
		}
		else {
			var x = $("#editor").html();
			$("#cs_content").text(x);
			console.log("x" + x);
			
			return true;
		}
		
	});
});

</script>
<script type="module">
DecoupledEditor
    .create( document.querySelector('#editor'),{
    	//removePlugins: ['ImageUpload'],
    	language: 'ko',
    	ckfinder: {
	   		 uploadUrl: 'ckedit' //요청경로
	   	},
	   	toolbar: [ 'ckfinder', 'imageUpload', '|', 'heading', '|', 'bold', 'italic','link', 'bulletedList',
	   		'numberedList', 'blockQuote', '|', 'undo','redo','Outdent','Indent','highlight', 'fontsize',
	   		'fontfamily','insertTable','alignment']	
    })
   
    .then(function(editor) {
    	const toolbarContainer = document.querySelector( '#toolbar-container' );
        toolbarContainer.appendChild( editor.ui.view.toolbar.element );
    });
  
</script>
</body>
</html>