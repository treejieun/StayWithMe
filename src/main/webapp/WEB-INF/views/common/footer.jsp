<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- datepicker -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.1/css/bootstrap-datepicker.min.css" rel="stylesheet" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
<title>Insert title here</title>
<style>
footer {
    max-height:300px;
    width:100%;	
}
div {
	word-break : keep-all;
}
</style>
<body>
<footer class="bg-dark">
	<div class="text-center text-secondary pt-4 pb-4">
		<div>�湮�ڼ� : <span id="visitN"></span></div>
		<div>ȸ�� �湮�� : <span id="visitMN"></span></div>
		<div>&nbsp;</div>
		<div>- ��ȣ : (��)����������</div> 
		<div>- ��ǥ�� : ������, �谡��, �輺��</div>
		<div>- ����� �ּ� : </div>
		<!-- 
		<div>* ������������ ��� �ŷ��� ���� å�Ӱ� ȯ��, �ο� ���� ó���� ���������̿��� �����մϴ�.</div>
		<div>* �ڼ��� ���Ǵ� ������Ʈ�� Contact �Ǵ� ����(1234-5678)���� �����մϴ�.</div> -->
	</div>
</footer>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	//�̺�Ʈ�� �ޱ� ���� �̺�Ʈ�ҽ� ��ü ����
	var eventSource = new EventSource("event"); //������û��ΰ� eventEx
	eventSource.addEventListener("up_visit",function(event){
        $("#visitN").text(event.data);
     },false);
     eventSource.addEventListener("up_visitM",function(event){
        $("#visitMN").text(event.data);
     },false);
});
</script>

</body>
</html>