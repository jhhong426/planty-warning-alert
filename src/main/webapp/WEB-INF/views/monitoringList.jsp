<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
<link rel="stylesheet" href="/resources/demos/style.css">  

<%@include file="include/header.jsp"%>

<div class="content-wrapper" style="min-height: 951.444px;">
	<div class="box" style="min-height:951.444px;">
		<h2><strong>&emsp;모니터링</strong></h2>
		
		<div class="box">
			<div class="row">
				<h4 class="col-md-1"><strong>기간 : </strong></h4>
				<div class="col-md-3">
					<input type="text" id="preDate" class="inline">&emsp;~&emsp;
					<input type="text" id="postDate" class="inline">
				</div>
				<div class="col-md-8"></div>
			</div>
			<div class="row">
				<h4 class="col-md-1"><strong>서버명 : </strong></h4>
				<div class="col-md-3">
					<select id="serverCategory" class="form-control form-group-inline"
						onchange="ServerChange()" style="display: inline-block">
						<option value="0">전체</option>
					</select>
				</div>
				<div class="col-md-8"></div>
			</div>
			<div class="row">
				<h4 class="col-md-1"><strong>장애코드 : </strong></h4>
				<div class="col-md-2">
					<select id="codeCategory" class="form-control form-group-inline"
						onchange="CodeChange()" style="display: inline-block">
						<option value="0">전체</option>
					</select>
				</div>
				<div class="col-md-1">
					<button style="height:35px"><strong>조회</strong></button>
				</div>
				<div class="col-md-8"></div>
			</div>
			
       <div class="box-body">
			

			<table id="errorList" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th style="text-align: center">서버명</th>
					<th style="text-align: center">IP</th>
					<th style="text-align: center">장애코드</th>
					<th style="text-align: center">담당자</th>
					<th style="text-align: center">메시지</th>
					<th style="text-align: center">알림방법</th>
					<th style="text-align: center">알림일시</th>
					<th style="text-align: center">장애일시</th>
				</tr>
			</thead>
			<tbody style="text-align: center">
				<!--<c:forEach var="voNot" items="${reportYetVO}">-->
					<tr>
						<td>${voNot.report_no}</td>
						<td>${voNot.report_category}</td>
						<td>${voNot.report_contents}</td>
						<td>${voNot.email}</td>
						<td>${voNot.reg_date}</td>
						<td>${voNot.survey_no}</td>
						<td>${voNot.survey_no}</td>
						<td>${voNot.survey_no}</td>
					</tr>
				<!--</c:forEach>-->
			</tbody>
			</table>
			
			
		   </div>
		</div>
	</div>
</div>

<%@include file="include/footer.jsp"%>

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="/resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

$(function() {
	$("#preDate").datepicker({
		dateFormat : "yy-mm-dd"
	});
});

$(function() {
	$("#postDate").datepicker({
		dateFormat : "yy-mm-dd"
	});
});

$(function() {
	$("#errorList").DataTable(
			{
				"language" : {
					'zeroRecords' : "검색 결과가 없습니다.",
					'info' : "에러 알림 건수 :  _TOTAL_ 개",
					'infoEmpty' : "에러 알림 건수 :  _TOTAL_ 개",
					'infoFiltered' : " ",
					"lengthMenu" : "출력 개수 :  _MENU_",
					'paginate' : {
						"first" : "처음",
						"last" : "마지막",
						"next" : "다음",
						"previous" : "이전"
					}

				},
				"lengthMenu" : [ 15, 25, 50 ],
				"lengthChange" : true,
				"searching" : true,
				"paging" : true,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false,
				"dom" : '<"top"<"col-md-4"i><"col-md-6"B><"col-md-2"l>>'
						+ 'rt' + '<"bottom pull-left"<"col-md-12"p>>',
				"order" : [ [ 4, "desc" ] ]

			})
});

</script>