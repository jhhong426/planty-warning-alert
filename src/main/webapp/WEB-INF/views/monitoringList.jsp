<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css">

<%@include file="include/header.jsp"%>

<style type="text/css"> 
	 a:link { color: black; text-decoration: none;}
	 a:visited { color: black; text-decoration: underline;}
	 a:hover { color: blue; text-decoration: underline;}
</style>

<div class="content-wrapper" style="min-height: 951.444px;">
	<div class="box" style="min-height:951.444px;">
		<h2><strong>&emsp;모니터링</strong></h2>
		
		<div class="box">
			<div class="row">
				<br>
				<h4 class="" style="float:left; width:10%"><strong>&emsp;&emsp;기&emsp;&emsp;간 &ensp;: </strong></h4>
				<div class="" style="float:left; width:30%">
					<input type="text" id="preDate" class="inline form-control" value="--- 선택  ---" width="12px" style="text-align:center;">
					&emsp;~&emsp;
					<input type="text" id="postDate" class="inline form-control" value="--- 선택  ---" width="12px" style="text-align:center;">
				</div>
				<div class="" style="float:left; width:60%"></div>
			</div>
			<div class="row">
				<h4 class="" style="float:left; width:10%"><strong>&emsp;&emsp;서&ensp;버&ensp;명 &ensp;: </strong></h4>
				<div class="" style="float:left; width:30%">
					<select id="serverCategory" name="serverCategory" class="form-control form-group-inline"
						onchange="ServerChange(this.value);" style="display: inline-block">
						<option value="">전체</option>
						<c:forEach var="item" items="${serverList}">
						<option value="${item.serverId}">${item.serverNm}</option>
						</c:forEach>
					</select>
				</div>
				<div class="" style="float:left; width:60%"></div>
			</div>
			<div class="row">
				<h4 class="" style="float:left; width:10%"><strong>&emsp;&emsp;장애코드 &ensp;: </strong></h4>
				<div class="" style="float:left; width:30%" id="codeDynamicCategory">
					<select id="codeCategory" class="form-control form-group-inline"
						style="display: inline-block">
						<option value="">전체</option>
					</select>
				</div>
				<div class="" style="float:left; width:5%">
					<p></p>
				</div>
				<div class="" style="float:left; width:5%">
					<button style="height:35px" onclick="Search()"><strong>조회</strong></button>
				</div>
				<div class="" style="float:left; width:50%"></div>
			</div>
			
       		<div class="box-body">
			
				<table id="errorList" cellpadding="5" cellspacing="0" border="0" style="width:100%; margin: 0 auto 2em auto;">
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
					<c:forEach var="item" items="${errorLogList}">
						<tr>
							<td><a href="/monitoringServer?serverId=${item.serverId}">${item.serverNm}</a></td>
							<td><a href="/monitoringServer?serverId=${item.serverId}">${item.ip}</a></td>
							<td>${item.eventCode}</td>
							<td>${item.managerNm}</td>
							<td>${item.msg}</td>
							<td>${item.ntfcMth}</td>
							<td>${item.ntfcde}</td>
							<td>${item.logde}</td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
			
		   </div>
		</div>
	</div>
</div>

<%@include file="include/footer.jsp"%>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>

<script>

$(function() {
	$("#preDate").datepicker({
		dateFormat : "yy-mm-dd",
		defaultDate : "today",
		onClose : function(selectedDate){
		    $("#postDate").datepicker("option", "minDate", selectedDate);
		}
	}).datepicker("setDate","today");
	
	$("#postDate").datepicker({
		dateFormat : "yy-mm-dd",
		defaultDate : "today",
		onClose : function(selectedDate){
		    $("#preDate").datepicker("option", "maxDate", selectedDate);
		}
	}).datepicker("setDate","today");
});


$(document).ready(function() {
	
	$("#errorList").DataTable(
		{
			"language" : {
				'zeroRecords'  : "검색 결과가 없습니다.",
				'info'		   : "에러 알림 건수 :  _TOTAL_ 개",
				'infoEmpty'    : "에러 알림 건수 :  _TOTAL_ 개",
				'infoFiltered' : " ",
				"lengthMenu"   : "출력 개수 :  _MENU_",
				'paginate' : { 
					"first" : "<<",
	          		  "previous" : "<",
	          		  "last"  : ">>",
	           		  "next"  : ">"
				}
			},
			"lengthMenu" : [ 15, 25, 50 ],
			"lengthChange" : true,
			"pagingType"   : "full_numbers",
			"searching" : true,
			"paging" : true,
			"ordering" : true,
			"info" : true,
			"autoWidth" : false,
			"dom" : '<"top"<"col-md-4"i><"col-md-6"B><"col-md-2"l>>'
					+ 'rt' + '<"bottom"<"col-md-8"p><"col-md-4"B>>',
			"order" : [ [ 4, "desc" ] ]
		}
	)
});


function ServerChange(serverIdNum) {
	//var $target = $("select[name='codeCategory']")
	
	//$target.empty();
	$("#codeCategory").empty();
	$("#codeCategory").append("<option value=''>전체</option>");
	alert(serverIdNum)
	if (serverIdNum == ''){
		return;
	}
	else {
		$.ajax({
            type: "POST",
            url: "/monitoringList/changeServer",
            async:false,
            data: { serverId : serverIdNum },
            dataType: "json",
            success: function(data){
                $(data.result).each(function(i){
                	var str = "<option value='" + data.result[i].eventId + "'>" + data.result[i].eventCode + "</option>";
                	$("#codeCategory").append(str);
                }) 
            },  
            error:function(){
                alert("변경 중 에러가 발생하였습니다. 다시 시도해주세요.");
                return;
            }
        });	
	}
	
}

var dateParsing = function(arg) {
	var splitArg = arg.split("-");
	var stringArg = splitArg[0] + splitArg[1] + splitArg[2];
	var intArg = parseInt(stringArg);
	return intArg;
};

// 검색
function Search() {
	
	$('#errorList').DataTable().columns().search("").draw();
	
	$.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
		var min = parseInt(dateParsing($('#preDate').val()));
		var max = parseInt(dateParsing($('#postDate').val()));
		var age = parseFloat(dateParsing(data[6])) || 0; // use data for the age column

		if ((isNaN(min) && isNaN(max)) || (isNaN(min) && age <= max)
				|| (min <= age && isNaN(max))
				|| (min <= age && age <= max)) {
			return true;
		}
		return false;
	});
	
	if($('#serverCategory option:selected').text() == '전체') {
		$('#errorList').DataTable().column(0).search('');
	}
	else {
		$('#errorList').DataTable().column(0).search($('#serverCategory option:selected').text());
	}
	
	if($('#codeCategory option:selected').text() == '전체') {
		$('#errorList').DataTable().column(2).search('');
	} else {
		$('#errorList').DataTable().column(2).search($('#codeCategory option:selected').text());
	}
	
	$("#errorList").DataTable().draw();
}

</script>