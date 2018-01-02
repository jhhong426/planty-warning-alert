<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />    
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="/resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>

<%@include file="include/header.jsp"%>
<div class="content-wrapper" style="min-height:951.444px;">
	<div class="box" style="min-height:951.444px;">
		<h3><strong>&emsp;서버 목록</strong></h3>
		<div class="box">
           <div class="box-body">
               <div class="row">
                 <div class="col-md-2">
                   <select id="serverCategory" class="form-control form-group-inline" onchange="selectChange()" style="display:inline-block">
                     <option value="1">IP</option>
                     <option value="2">서버명</option>
                   </select>
                 </div>
                 <div class="col-md-2">
                   <input type="text" id="searchEnter" class="form-control"></input>
                 </div>
                 <div class="col-md-1">
                 	<button id="btnSearch" class="btn btn-default"><i class="fa fa-search"></i></button>
                 </div>
                 <div class="col-md-1">
                 	<button id="btnRegister" class="btn btn-default">등록</button>
                 </div>
               </div>
               
				<table id="server" class="table table-bordered table-hover display">
					<thead>
						<tr>
							<th style="text-align:center">서버명</th>
							<th style="text-align:center">IP</th>
							<th style="text-align:center">등록일</th>
							<th style="text-align:center">수정</th>
							<th style="text-align:center">삭제</th>
						</tr>
					</thead>
					<tbody style="text-align:center">
						<tr>
				       		<td>DB#1</td>
				       		<td>121.241.223.110</td>
				       		<td>2017-12-05 13:45:32</td>
				       		<td><button type="button" class="btn btn-default" onclick="">수정</button></td>
				       		<td><button type="button" class="btn btn-default" onclick="">삭제</button></td>
			       		</tr>
			       		<tr>
				       		<td>Test</td>
				       		<td>121.169.194.150</td>
				       		<td>2017-11-14 23:55:19</td>
				       		<td><button type="button" class="btn btn-default" onclick="">수정</button></td>
				       		<td><button type="button" class="btn btn-default" onclick="">삭제</button></td>
			       		</tr>
			       		<tr>
				       		<td>Tomcat</td>
				       		<td>192.168.100.003</td>
				       		<td>2017-11-17 05:25:00</td>
				       		<td><button type="button" class="btn btn-default" onclick="">수정</button></td>
				       		<td><button type="button" class="btn btn-default" onclick="">삭제</button></td>
			       		</tr>
			       		<tr>
				       		<td>Apache</td>
				       		<td>200.100.001.002</td>
				       		<td>2017-12-21 12:03:05</td>
				       		<td><button type="button" class="btn btn-default" onclick="">수정</button></td>
				       		<td><button type="button" class="btn btn-default" onclick="">삭제</button></td>
			       		</tr>
					</tbody>
			    </table>
			  </div>
			</div>
	</div>
</div>


<%@include file="include/footer.jsp"%>



<script>
    // 서버 목록 Data Table
	var server = $("#server").DataTable({
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
        "dom"                  :'<"top"<"col-md-2"i><"col-md-8"B><"col-md-2"l>>' +
                                 'rt' +
                                 '<"bottom"<"col-md-6"B><"col-md-6"p>>',
        "select"              : "multi",
        "autoWidth" : false,
        "ordering": false
    });
    
	// 서버 검색 엔터 이벤트
	$("#searchEnter").keydown(function(key){
		if(key.keyCode == 13){
			 searchServer();
		 } 
	});
	  
    // 서버 검색 아이콘 클릭 이벤트
	$("#btnSearch").click(function(){
		 searchServer(); 
	});
	  
	// 서버 검색 후 테이블 그리는 함수
	function searchServer(){
		 server
        .columns( $('#serverCategory > option:selected').val() )
        .search($("#searchEnter").val())
        .draw();
	}

	// 서버 검색 후 수행되는 함수	
    function selectChange(){
	        var temp = $("#searchEnter").val();
	        server
	              .search('')
	              .columns().search('')
	              .draw();
	        server
	              .columns( $('#serverCategory > option:selected').val() )
	              .search(temp)
	              .draw();
    }
	 
	
</script>
