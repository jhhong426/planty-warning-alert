<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 

<%@include file="include/header.jsp"%>

<!-- 서버 상세정보 링크 부분 a태그 css 설정 -->
<style type="text/css"> 
	 a:link { color: black; text-decoration: none;}
	 a:visited { color: black; text-decoration: underline;}
	 a:hover { color: blue; text-decoration: underline;}
</style>

<div class="content-wrapper" style="min-height:951.444px;">
	<div class="box" style="min-height:951.444px;">
		<h3><strong>&emsp;서버 목록</strong></h3>

               <div class="row">
                 <div class="col-md-2">
                   <select id="serverCategory" class="form-control form-group-inline" onchange="selectChange()" style="display:inline-block">
                     <option value="1">IP</option>
                     <option value="0">서버명</option>
                   </select>
                 </div>
                 <div class="col-md-3">
                   <input type="text" id="searchEnter" class="form-control"></input>
                 </div>
                 <div class="col-md-1">
                 	<button id="btnSearch" class="btn btn-default" onclick="searchClicked()"><i class="fa fa-search"></i></button>
                 </div>
                 <div class="col-md-1">
                 	<button id="btnRegister" type="button" class="btn btn-default">등록</button>
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
					<tbody style="text-align:center">   <!-- 이대로 수정버튼 누르면 맨 위의 row데이터만 작동함 -->
						
						<c:forEach items = "${serverList}" var = "item">
							<tr>
					       		<td><a href = "/serverInfo?id=${item.serverId }">${item.serverNm}</a></td>
					       		<td><a href = "/serverInfo?id=${item.serverId }">${item.ip}</a></td>
					       		<td>${item.rgsde}</td>
					       		<td><button onclick="updateBtnClicked('${item.serverId}','${item.serverNm}','${item.ip}')" type="button" class="btn btn-default" >수정</button></td>
					       		<td><form name="" method="post" action="/deleteServer" onsubmit="return deleteConfirm();" style="margin-bottom: 0px;">
					       				<input id="serverId" name="serverId" type="hidden" value="${item.serverId}">
					       				<button type="submit" class="btn btn-default" >삭제</button>
					       			</form>
					       		</td>
				       		</tr>
      					</c:forEach>
					
					</tbody>
			    </table>
			    
			    <!-- 서버 등록 팝업창 기능 -->
				  <div class="modal fade" id="serverRegisterPopup" role="dialog">
				    <div class="modal-dialog">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4>서버 등록</h4>
				        </div>
				        <div class="modal-body" style="padding:40px 50px;">
				          <form role="form" action = "/addServer" method = "get" onsubmit="return isConflict();">
					          <table class="table" style="width:500px;" align="center">
								<tbody>
									<tr>
										<th style="text-align:center">&ensp;서&ensp;버&ensp;명</th>
											<td>
												<input id="registerServerNm" name="serverNm" value="" style="width:375px; text-align:center">
											</td>
									</tr>
									<tr>
										<th style="text-align:center">&emsp;&emsp;I P&ensp;&ensp;</th>
											<td>
												<input id="registerIp" name="ip"  style="width:375px; text-align:center">
											</td>
									</tr>
									<tr>
										<th style="text-align:center">&ensp;관&ensp;리&ensp;팀</th>
								         	<td>
								         		<input type="text" name="" value="${sessionScope.sessionVO.teamNm}" style="width:375px; text-align:center" disabled>
								        	</td>
									</tr>
								</tbody>
							</table>
				          
				          <div class="modal-footer center-block" style="width:500px; padding:10px;">
							<button id="" type="submit" style="float:left" class="btn btn-success col-md-offset-5">등록</button>
					        <button type="submit" style="float:left" class="btn btn-default col-md-offset-1" data-dismiss="modal">취소</button>
						  </div>
						  </form>
				        </div>
				      </div>
			    	</div>
			  	  </div> 
			  	  
			  	  <!-- 서버 정보 수정 팝업창 기능 -->
				  <div class="modal fade" id="serverUpdatePopup" role="dialog">
				    <div class="modal-dialog">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4>서버 정보 수정</h4>
				        </div>
				        <div class="modal-body" style="padding:40px 50px;">
				          <form role="form" action = "/updateServer" method = "post">
				          <input id = "serverIdHidden" type="hidden" name="serverId" value="">
					          <table class="table" style="width:500px;" align="center">
								<tbody>
									<tr>
										<th style="text-align:center">&ensp;서&ensp;버&ensp;명</th>
											<td>
												<input id = "serverNm" type="text" name="serverNm" value="DB#1" style="width:375px; text-align:center">
											</td>
									</tr>
									<tr>
										<th style="text-align:center">&emsp;&emsp;I P&ensp;&ensp;</th>
											<td>
												<input id = "ip" type="text" name="ip" value="121.241.223.110" style="width:375px; text-align:center">
											</td>
									</tr>
									<tr>
										<th style="text-align:center">&ensp;관&ensp;리&ensp;팀</th>
								         	<td>
								         		<input type="text" name="" value="플랜티넷팀" style="width:375px; text-align:center" disabled>
								        	</td>
									</tr>
									
								</tbody>
							 </table>
					         <div class="modal-footer center-block" style="width:500px; padding:10px;">
					        	<button id="" type="submit" style="float:left" class="btn btn-success col-md-offset-5">수정</button>
						        <button type="button" style="float:left" class="btn btn-default col-md-offset-1" data-dismiss="modal">취소</button>
						 	 </div>
						 </form>
				        </div>
				      </div>
			    	</div>
			  	  </div> 
			 
	</div>
</div>


<%@include file="include/footer.jsp"%>

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
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
	//서버 등록 팝업창 띄우기 버튼 
	$(document).ready(function(){
	    $("#btnRegister").click(function(){
	        $("#serverRegisterPopup").modal();
	    });
	});
	
	// 서버 정보 수정 팝업창 띄우기 버튼 
	function updateBtnClicked(serverId,serverNm,ip){
		    	$("#serverNm").val(serverNm);
		    	$("#ip").val(ip);
		    	$("#serverIdHidden").val(serverId);
		        $("#serverUpdatePopup").modal();
	}
	 
	   
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
        "dom"                  : '<"top"<"col-md-2"i><"col-md-8"B><"col-md-2"l>>' +
                                 'rt' +
                                 '<"bottom"<"col-md-8"p><"col-md-4"B>>',
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
	
	function searchClicked(){
		/* $.ajax({
			  method: "GET",
			  url: "/searchServer",
			  data: { method: "ip", keyword: "Boston" }
			})
			  .done(function() {
			  }); */
	}
	
	function deleteConfirm(){
		if (confirm("정말 삭제하시겠습니까??") == true){    
		    return true;
		}else{  
		    return false;
		}
	}
	
	function isConflict(){
		var ip = $("#registerIp").val();
		var serverNm = $("#registerServerNm").val();
		
		if(ip == "" || serverNm == ""){
			alert("모든항목을 입력해주세요");
			return false;
		}
		
		<c:forEach items="${serverList}" var="item">
			if(ip == "${item.ip}" && serverNm == "${item.serverNm}"){
				alert("ip와 서버명이 동일한 값이 있습니다.");
				return false;
			}
		</c:forEach>
		return true;
	}
	
</script>
