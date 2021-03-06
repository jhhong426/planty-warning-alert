<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 

<%@include file="include/header.jsp"%>

<style type="text/css"> 
	 a:link { color: black; text-decoration: none;}
	 a:visited { color: black; text-decoration: underline;}
	 a:hover { color: blue; text-decoration: underline;}
</style>

<div class="content-wrapper" style="width:auto; height:auto; padding:0px;">
	<div class="box" style="width:auto; height:auto; padding:0px;">
		<h3><strong>&emsp;서버 목록</strong></h3>
            <div class="box">
              <div class="box-body">
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
                 	<button id="btnRegister" type="button" class="btn btn-success">등록</button>
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
						
					<c:forEach items = "${serverList}" var = "item">
						<tr>
				       		<td><a href = "/serverInfo?id=${item.serverId }">${item.serverNm}</a></td>
				       		<td><a href = "/serverInfo?id=${item.serverId }">${item.ip}</a></td>
				       		<td>${item.rgsde}</td>
				       		<td><button onclick="updateBtnClicked('${item.serverId}','${item.serverNm}','${item.ip}')" type="button" class="btn btn-primary" >수정</button></td>
				       		<td><form name="" method="post" action="/deleteServer" onsubmit="return deleteConfirm();" style="margin-bottom: 0px;">
				       				<input id="serverId" name="serverId" type="hidden" value="${item.serverId}">
				       				<button type="submit" class="btn btn-danger" >삭제</button>
				       			</form>
				       		</td>
			       		</tr>
     				</c:forEach>
					</tbody>
		         </table>
			  </div>
		  </div>
	</div>
</div>
			    
			    <!-- 서버 등록 팝업창 기능 -->
				  <div class="modal fade" id="serverRegisterPopup" role="dialog">
				    <div class="modal-dialog">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4>서버 등록</h4>
				        </div>
				        <div class="modal-body" style="padding:40px 50px;">
				          <form role="form" action = "/addServer" method = "post" onsubmit="return isConflict();" accept-charset="utf-8">
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
												<input id="registerIp" maxlength="15" name="ip"  style="width:375px; text-align:center">
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
				          <form role="form" action = "/updateServer" method = "post" onsubmit="return changeCheck();">
				          <input id = "serverIdHidden" type="hidden" name="serverId" value="">
					          <table class="table" style="width:500px;" align="center">
								<tbody>
									<tr>
										<th style="text-align:center">&ensp;서&ensp;버&ensp;명</th>
											<td>
												<input id = "serverNm" type="text" name="serverNm" value="" style="width:375px; text-align:center">
											</td>
									</tr>
									<tr>
										<th style="text-align:center">&emsp;&emsp;I P&ensp;&ensp;</th>
											<td>
												<input id = "ip" maxlength="15" type="text" name="ip" value="" style="width:375px; text-align:center">
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


<%@include file="include/footer.jsp"%>

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="/resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- <script src="/resources/plugins/fastclick/fastclick.js"></script>
<script src="/resources/plugins/knob/jquery.knob.js"></script>
<script src="/resources/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="resources/dist/js/demo.js"></script>
<script src="resources/dist/js/app.js"></script> -->

<script>
	//서버 등록 팝업창 띄우기 버튼 
	$(document).ready(function(){
	    $("#btnRegister").click(function(){
	        $("#serverRegisterPopup").modal();
	        $("#registerServerNm").val("");
	        $("#registerIp").val("");
	        
	        
	    });
	});
	
	// 서버 정보 수정 팝업창 띄우기 버튼 
	function updateBtnClicked(serverId,serverNm,ip){
		    	$("#serverNm").val(serverNm);
		    	$("#ip").val(ip);
		    	$("#serverNm").data("tempServerNm", serverNm );
				$("#ip").data("tempIp", ip );
		    	$("#serverIdHidden").val(serverId);
		        $("#serverUpdatePopup").modal();
	}
	 
	
	// 서버 정보 수정 체크
	function changeCheck(){
		var serverNm = $("#serverNm").val();
		var ip = $("#ip").val();
		var tempServerNm = $("#serverNm").data("tempServerNm");
		var tempIp = $("#ip").data("tempIp");
		
		if(serverNm=="" || ip==""){
			alert("모든 항목을 입력해야 합니다");	
			return false;
		}
		
		if(!(/\d+\.\d+\.\d+\.\d+/.test(ip)) || !(ip.match(/\d+\.\d+\.\d+\.\d+/)==ip)){
			alert("잘못된 IP 입니다");
			return false;
		}
		
		var flag = false;
		 $.ajax({
	            type : "POST",
	            url :"/checkServerList",
	            data : {serverNm : serverNm , ip : ip},
	            async: false,
	            error : function(){
	                alert('통신실패!!');
	                return false;
	            },
	            success : function(data){
	            	if(data["isIpExist"] == true &&  ip != tempIp){
	            		alert("이미 존재하는 IP 입니다.");
	            		flag = false;
	            		return false;
	            	}
	            	
	            	if(data["isServerNmExist"] == true && serverNm != tempServerNm){
	            		alert("이미 존재하는 서버명 입니다.");
	            		flag = false;
	            		return false;
	            	}
	            	
	            	if(data["isIpExist"] == false && data["isServerNmExist"] == false){
	            		flag = true;
	            		return false;
	            	}
	            	
	            	flag = true;
	            	return false;
	            }
	        });
		if(flag == true){
			return true;
		}else{
			return false;
		}
		
		
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
                                 '<"bottom"<"col-md-4"B><"col-md-8"p>>',
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
		if (confirm("정말 삭제하시겠습니까?") == true){    
		    return true;
		}else{  
		    return false;
		}
	}
	
	function isConflict(){	
		var ip = $("#registerIp").val();
		var serverNm = $("#registerServerNm").val();
		
		if(!(/\d+\.\d+\.\d+\.\d+/.test(ip)) || !(ip.match(/\d+\.\d+\.\d+\.\d+/)==ip)){
			alert("잘못된 IP 입니다");
			return false;
		}
		
		if(ip == "" || serverNm == ""){
			alert("모든항목을 입력해주세요");
			return false;
		}
		
		 var flag = false;
		 $.ajax({
	            type : "POST",
	            url :"/checkServerList",
	            data : {serverNm : serverNm , ip : ip},
	            async: false,
	            error : function(){
	                alert('통신실패!!');
	                return false;
	            },
	            success : function(data){
	            	if(data["isIpExist"] == true){
	            		alert("이미 존재하는 IP 입니다.");
	            		flag = false;
	            		return false;
	            	}
	            	
	            	if(data["isServerNmExist"] == true){
	            		alert("이미 존재하는 서버명 입니다.");
	            		flag = false;
	            		return false;
	            	}
	            	
	            	if(data["isIpExist"] == false && data["isServerNmExist"] == false){
	            		flag = true;
	            		return false;
	            	}
	            }
	        });
		 
		 if(flag == true){
			return true;
		}else{
			return false
		}		 
		 

	}
	
</script>
