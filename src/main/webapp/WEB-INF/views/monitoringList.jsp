<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 

<%@include file="include/header.jsp"%>

<style type="text/css"> 
	 a:link { color: black; text-decoration: none;}
	 a:visited { color: black; text-decoration: underline;}
	 a:hover { color: blue; text-decoration: underline;}	 
</style>

<div class="content-wrapper" style="min-height: 951.444px;"> 
	<div class="box" style="min-height:951.444px;">
		<h3><strong>&emsp;모니터링 > 상세목록</strong></h3>
		<div class="box">
		<div class="box-body">
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
				<div class="" style="float:left; width:25%">
					<select id="serverCategory" class="form-control form-group-inline" onchange="ServerChange(this.value);" style="display: inline-block">
						<option value="">전체</option>
						<c:forEach var="item" items="${serverList}">
						<option value="${item.serverId}">${item.serverNm}</option>
						</c:forEach>
					</select>
				</div>
				<div class="" style="float:left; width:65%"></div>
			</div>
			<div class="row">
				<h4 class="" style="float:left; width:10%"><strong>&emsp;&emsp;장애코드 &ensp;: </strong></h4>
				<div class="" style="float:left; width:25%">
					<select id="codeCategory" class="form-control form-group-inline" style="display: inline-block">
						<option value="">전체</option>
					</select>
				</div>
				<div class="" style="float:left; width:5%">
					<p></p>
				</div>
				<div class="" style="float:left; width:5%">
					<button id="btnSearch" style="height:35px" class="btn btn-primary"><strong>조회</strong></button>
				</div>
				<div class="" style="float:left; width:55%"></div>
			</div>
			
       		<div class="box-body">			
 				<table class="table table-bordered table-hover display" id="errorList">
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
					<tbody style="text-align: center" id="body" hidden="hidden">
						<c:forEach var="item" items="${errorLogList}">
							<tr>
								<td><a href="/monitoringServer?serverId=${item.serverId}">${item.serverNm}</a></td>
								<td><a href="/monitoringServer?serverId=${item.serverId}">${item.ip}</a></td>
								<td>${item.eventCode}</td>
								<td>${item.managerNm}</td>
								<td title="${item.msg}">
									<c:choose>
							         	<c:when test="${fn:length(item.msg)>5}">
							         		<c:out value="${fn:substring(item.msg,0,4)}"/>...
							            </c:when>
							          	<c:otherwise>
							            	<c:out value="${item.msg}"/>
							            </c:otherwise> 
							        </c:choose> 
							    </td>
								<td>
									<c:choose>
								       <c:when test = "${item.ntfcMth == 'ALM01' }">
								           Email
								       </c:when>
								       <c:when test = "${item.ntfcMth == 'ALM02' }">
								           SMS + Email
			                           </c:when>
								    </c:choose>
								</td>
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
</div>

<%@include file="include/footer.jsp"%>
<script src="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>

<script src="/resources/plugins/fastclick/fastclick.js"></script>
<script src="/resources/plugins/knob/jquery.knob.js"></script>
<script src="/resources/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="resources/dist/js/demo.js"></script>
<script src="resources/dist/js/app.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="/resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>

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


var errorList = $("#errorList").DataTable({
    "language"    : {
         'zeroRecords'       : "검색결과가 없습니다.",
         'info'              : "검색결과 :  _TOTAL_ 건",
         'infoEmpty'         : "검색결과 :  _TOTAL_ 건",
         'infoFiltered'      : " ",
         'lengthMenu'        : "표시 개수 :  _MENU_",
         'paginate'          : {
              "first" : "<<",
              "previous" : "<",
              "last"  : ">>",
              "next"  : ">"
      }
    },
    "scrollY"              : 400,
    "scrollCollapse"       : true,
    "lengthMenu"           : [ 10, 20, 30 ],
    "pageLength"           : 10,
    "pagingType"           : "full_numbers",
    "dom"                  : '<"top"<"col-md-2"i><"col-md-8"B><"col-md-2"l>>' +
                             'rt' +
                             '<"bottom"<"col-md-8"p><"col-md-4"B>>',
    "select"              : "multi",
    "autoWidth" : false,
    "ordering": false
});


function ServerChange(serverIdNum) {

	$("#codeCategory").empty();
	$("#codeCategory").append("<option value=''>전체</option>");

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
 
//검색 버튼이나 엔터 눌러야 검색 결과 나오도록 설정했음
// 버튼 검색 이벤트
$("#btnSearch").click(function(){
	Search(); 
});

//엔터 검색 이벤트
/* $("#preDate").keypress(function(e) { 
	if (e.keyCode === 13) { 
		e.preventDefault();
		Search();
	} 
});
$("#postDate").keypress(function(e) { 
	if (e.keyCode === 13) { 
		e.preventDefault();
		Search();
	} 
}); */
$("#serverCategory").keypress(function(e) { 
	if (e.keyCode === 13) { 
		e.preventDefault();
		Search();
	} 
});
$("#codeCategory").keypress(function(e) { 
	if (e.keyCode === 13) { 
		e.preventDefault();
		Search();
	} 
});

//검색
function Search() {
	$('#body').show();
	errorList.columns().search("").draw();
	
	$.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
		var min = parseInt(dateParsing($('#preDate').val()));
		var max = parseInt(dateParsing($('#postDate').val()));
		var age = parseFloat(dateParsing(data[6])) || 0; 

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