<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />    

<%@include file="include/header.jsp"%>

<script>

	function handleRadioClick1(radio, flag) {
		
		if(flag) {
			$(radio).nextAll('#inputPlusTermVal').prop("disabled", false);
		} else {
			$(radio).prev('#inputPlusTermVal').prop("disabled", true);
			$(radio).prev('#inputPlusTermVal').val('');
		}
	}
	
	function handleRadioClick2(radio, flag) {
			
		if(flag) {
			$(radio).nextAll('#inputUptTermVal').prop("disabled", false);
		} else {
			$(radio).prev('#inputUptTermVal').prop("disabled", true);
			$(radio).prev('#inputUptTermVal').val('');
		}
	}
	
	function handleRadioClick3(radio, flag) {
		
		
		if (flag) {
			
			$(radio).prev().prop("checked",false);
			$(radio).parents('tr').next().children().eq(1).children().eq(0).prop("disabled", true);
			$(radio).parents('tr').next().children().eq(1).children().eq(1).prop("disabled", true);
			$(radio).parents('tr').next().children().eq(1).children().eq(2).prop("disabled", true);
			$(radio).parents('tr').next().children().eq(1).children().eq(1).val('');
			
		} else {
			$(radio).next().prop("checked", false);
			$(radio).parents('tr').next().children().eq(1).children().eq(0).prop("disabled", false);
			$(radio).parents('tr').next().children().eq(1).children().eq(1).prop("disabled", true);
			$(radio).parents('tr').next().children().eq(1).children().eq(2).prop("disabled", false);
			$(radio).parents('tr').next().children().eq(1).children().eq(2).prop("checked", true);
			$(radio).parents('tr').next().children().eq(1).children().eq(1).val('');
		}
		
	}
</script>

<div class="content-wrapper" style="width:auto; height:auto; padding:0px;">
	<div class="box" style="width:auto; height:auto; padding:0px;">
		<h3><strong>&emsp;서버 목록 > 서버 상세정보</strong></h3>
		<div class="box">
           <div class="box-body">
            <h5><strong>&emsp; &bull; &ensp;서버 정보</strong></h5>
           	<div class="row">
           	   <form role="form">
		          <table class="table" style="margin-left:15px;width:400px;" align="left">
					<tbody style="display:block; border:1px solid gray;">
						<tr>
							<th style="text-align:center">&ensp;서&ensp;버&ensp;명</th>
								<td>
									<input class="form-control" type="text" name="" value="${serverInfo.serverNm}" style="width:280px; text-align:center" disabled>
								</td>
						</tr>
						<tr>
							<th style="text-align:center">&emsp;&emsp;I P&ensp;&ensp;</th>
								<td>
									<input class="form-control" type="text" name="" value="${serverInfo.ip}" style="width:280px; text-align:center" disabled>
								</td>
						</tr>
					</tbody>
				</table>
	          </form>
	        </div>
            <hr>
            
            <%-- <h5><strong>&emsp; &bull; &ensp;서버 모니터링</strong></h5>

            <div class="left-block" style="width:400px; padding:10px;">
                <a href="/monitoringServer?serverId=${serverInfo.serverId}" class="btn btn-primary col-md-offset-1">모니터링</a>
            </div>
            <hr> --%>
           	<h5><strong>&emsp; &bull; &ensp;장애 및 담당자 목록</strong></h5>
           	<div class="row" style="background-color:#F2F2F2">
				<div class="col-md-2 text-center">
					<h4><strong>장애코드</strong></h4>
				</div>
				<div class="col-md-4 text-center">
					<h4><strong>상세설명</strong></h4>
				</div>
				<div class="col-md-3 text-center">
					<h4><strong>등록일</strong></h4>
				</div>
				<div class="col-md-1 text-center">
					<h4><strong>수정</strong></h4>	
				</div>
				<div class="col-md-1 text-center">
					<h4><strong>삭제</strong></h4>
				</div>
			</div>
			
			
			<c:forEach items = "${eventList}" var = "event">
			<div class="box box-default">
				<div class="box-header with-border">
					<div class="box-tools pull right">
	                     <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-plus"></i></button>
	                 </div>
					<div class="row" id="container">
						<div class="col-md-2 text-center" style="position:relative; right:6px;">
						     <input id="eventId" type="hidden" value="${event.eventId }">
							<h4 id="eventCode">${event.eventCode}</h4>
						</div>
						<div class="col-md-4 text-center">
							<h4 id="description">${event.description}</h4>
						</div>
						<div class="col-md-3 text-center">
							<h4>${event.rgsde}</h4>
						</div>
						<div class="col-md-1 text-center" style="position:relative; left:6px;">
							<button id="btnUpdateEvent" type="button" class="btn btn-primary btn-sm btnUpdateEvent" onclick="">수정</button>
						</div>
						<div class="col-md-1 text-center" style="position:relative; left:6px;">
							<button data-eventId="${event.eventId}" id="btnDeleteEvent" type="button" class="btn btn-danger btn-sm btnDeleteEvent" onclick="">삭제</button>
						</div>
					</div>
				</div>
				<div class="box-body">
					<table style="width:80%; margin:auto;">
					  <tr style="height:30px;">
					    <th class="col-md-2 text-center" bgcolor="#E6E6E6" style="border:2px gray solid;">담당자</th>
					    <th class="col-md-2 text-center" bgcolor="#E6E6E6" style="border:2px gray solid;">알림방법</th>
					    <th class="col-md-1 text-center" bgcolor="#E6E6E6" style="border:2px gray solid;">알림수신</th>
					    <th class="col-md-1 text-center" bgcolor="#E6E6E6" style="border:2px gray solid;">알림간격</th>
					    <th class="col-md-2 text-center" bgcolor="#E6E6E6" style="border:2px gray solid;">등록일</th>
					    <th class="col-md-2 text-center" bgcolor="#E6E6E6" style="border:2px gray solid;">수정일</th>
					    <th class="col-md-1 text-center" bgcolor="#E6E6E6" style="border:2px gray solid;">수정</th>
					    <th class="col-md-1 text-center" bgcolor="#E6E6E6" style="border:2px gray solid;">삭제</th>
					  </tr>
					  <c:forEach items="${eventMngrInfoList}" var="eventMngInfo">
                      <c:if test="${event.eventId == eventMngInfo.eventId }">
					  <tr style="height:30px;">
					    <input id="eventId2" type="hidden" value="${event.eventId }"/>
					    <input id="eventCode2" type="hidden" value="${event.eventCode }"/>
					    <input id="managerId" type="hidden" value="${eventMngInfo.managerId }"/>
					    <td id="managerNm" class="col-md-2 text-center" style="border:1px gray solid;">${eventMngInfo.managerNm}</td>
					    <c:choose>
					       <c:when test = "${eventMngInfo.alertMth == 'ALM01' }">
					           <td id="alertMth" class="col-md-1 text-center" style="border:1px gray solid;">Email</td>
					       </c:when>
					       <c:when test = "${eventMngInfo.alertMth == 'ALM02' }">
					           <td id="alertMth" class="col-md-1 text-center" style="border:1px gray solid;">SMS + Email</td>
                           </c:when>
					    </c:choose>
					    <c:choose>
					       <c:when test = "${eventMngInfo.alertTerm eq 99999999 }">
					           <td id="alertTerm" data-val="${eventMngInfo.alertTerm}" class="col-md-1 text-center" style="border:1px gray solid;">받지 않음</td>
					           <td id="" class="col-md-1 text-center" style="border:1px gray solid;">-</td>
					       </c:when>
					       <c:when test = "${eventMngInfo.alertTerm eq 0 }">
					           <td id="" data-val="${eventMngInfo.alertTerm}" class="col-md-1 text-center" style="border:1px gray solid;">받음</td>
					           <td id="alertTerm" class="col-md-1 text-center" style="border:1px gray solid;">설정안함</td>
					       </c:when>
					       <c:otherwise>
					       		<td id="alertTerm" data-val="${eventMngInfo.alertTerm}" class="col-md-1 text-center" style="border:1px gray solid;">받음</td>
					       		<td id="alertTerm" data-val="${eventMngInfo.alertTerm}" class="col-md-1 text-center" style="border:1px gray solid;">${eventMngInfo.alertTerm}분</td>
					       </c:otherwise>
					    </c:choose>
					    
					    
					    <td class="col-md-2 text-center" style="border:1px gray solid;">${eventMngInfo.rgsde}</td>
					    <c:choose>
					    	<c:when test="${eventMngInfo.updde == '0000-00-00 00:00:00'}">
					    		<td class="col-md-2 text-center" style="border:1px gray solid;">-</td>
					    	</c:when>
					    	<c:otherwise>
					    		<td class="col-md-2 text-center" style="border:1px gray solid;">${eventMngInfo.updde}</td>
					    	</c:otherwise>
					    </c:choose>
					    
					    <td class="col-md-1 text-center" style="border:1px gray solid;">
					    	<button id="btnUpdateEvntMngr" type="button" class="btn btn-primary btn-xs btnUpdateEvntMngr" onclick="">수정</button></td>
					    <td class="col-md-1 text-center" style="border:1px gray solid;">
					    	<button data-managerId="${eventMngInfo.managerId}" data-eventId="${eventMngInfo.eventId}" id="btnDeleteEvntMngr" type="button" class="btn btn-danger btn-xs btnDeleteEvntMngr" onclick="">삭제</button></td>
					  </tr>
					  </c:if>
					  </c:forEach>
					</table>
				</div>
			</div>
			</c:forEach>
			
			<br>
			<hr>
			
			<h5><strong>&emsp; &bull; &ensp;장애 및 담당자 등록</strong></h5>

            <div class="left-block" style="width:400px; padding:10px;">
				<button id="btnAddEvent" type="submit" class="btn btn-primary col-md-offset-1">장애 코드 등록</button>
				<button id="btnAddEvntMngr" type="submit" class="btn btn-primary col-md-offset-1"> 담당자 등록 </button>
			</div>
		
		    </div>
        </div>
	</div>
</div>
		
			<!-- 장애코드 수정 팝업창 기능 -->
			  <div class="modal fade" id="errorUpdatePopup" role="dialog">
			    <div class="modal-dialog">
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4>장애코드 수정</h4>
			        </div>
			        <div class="modal-body" style="padding:40px 50px;">
			          <form role="form" id="frmUpdateEvent" action="/updateEvent" method="post">
				          <table class="table" style="width:400px;" align="center">
							<tbody>
								<tr>
									<th style="text-align:center">장애코드</th>
										<td>
										    <input type="hidden" id="inputUptEventId" name="eventId" value="">
											<input id="inputUptEventCode" type="text" name="" value="" style="width:250px; text-align:center" disabled>
										</td>
								</tr>
								<tr>
									<th style="text-align:center">상세설명</th>
										<td>
											<input id="inputUptDescription" type="text" name="description" value="" style="width:250px; text-align:center">
										</td>
								</tr>
								<tr>
									<th style="text-align:center">서&ensp;버&ensp;명</th>
							         	<td>
							         		<input type="text" name="" value="${serverInfo.serverNm}" style="width:250px; text-align:center" disabled>
							        	</td>
								</tr>  
							</tbody>
						</table>
			          </form>
			          <div class="modal-footer center-block" style="width:500px; padding:10px;">
						<button id="btnUpdateEventGo" style="float:left" class="btn btn-success col-md-offset-5">수정</button>
				        <button style="float:left" class="btn btn-default col-md-offset-1" data-dismiss="modal">취소</button>
					  </div>
			        </div>
			      </div>
		    	</div>
		  	  </div>
		  	  
		  	  <!-- 장애담당자 수정 팝업창 기능 -->
			  <div class="modal fade" id="errorAdminUpdatePopup" role="dialog">
			    <div class="modal-dialog">
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4>장애담당자 수정</h4>
			        </div>
			        <div class="modal-body" style="padding:40px 50px;">
			          <form role="form" id="frmUpdateEvntMngr" action="/updateEvntMngr" method="post">
				          <table class="table" style="width:400px;" align="center">
							<tbody>
								<tr>
									<th style="text-align:center">서&ensp;버&ensp;명</th>
										<td>
											<input type="text" name="" value="${serverInfo.serverNm}" style="width:250px; text-align:center" disabled>
										</td>
								</tr>
								<tr>
									<th style="text-align:center">장애코드</th>
										<td>
										    <input id="inputUptEventId2" type="hidden" name="eventId" value="" style="width:250px; text-align:center">
										    <input id="inputUptManagerId2" type="hidden" name="oldManagerId" value="" style="width:250px; text-align:center">
										    <input id="inputUptFlag" type="hidden" name="flag" value="" style="width:250px; text-align:center">
											<input id="inputUptEventCode2" type="text" name="" value="" style="width:250px; text-align:center" disabled>
										</td>
								</tr>
								<tr>
									<th style="text-align:center">알림방법</th>
							         	<td>
							         		<select id="selUptAlertMth" onChange="" name="alertMth" class="form-control inline-block" style="display:inline; width:250px; height:35px">
							                    <option value="ALM01">Email</option>
							                    <option value="ALM02">SMS + Email</option>
							                </select>
							        	</td>
								</tr>
								<tr>
									<th style="text-align:center">알림수신</th>
							         	<td>
							         		<input type="radio" name="" value="1234" onclick="handleRadioClick3(this, false);" checked/>받음&ensp;
							         		<input type="radio" id="sleepTerm" name="alertTerm" value="99999999" onclick="handleRadioClick3(this, true);"/>받지 않음
							        	</td>
								</tr>   
								<tr>
									<th style="text-align:center">알림간격</th>
							         	<td>
							         		<input type="radio" id="custTerm" name="alertTerm" value="1234"onclick="handleRadioClick2(this, true);"/>
							         		<input type="text" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;" maxlength=3 id="inputUptTermVal" name="inputTermVal" style="display:inline; width:50px; text-align:center" disabled> 분&ensp;
							        		<input type="radio" id="noTerm" name="alertTerm" value="0" onclick="handleRadioClick2(this, false);" checked/>설정안함&ensp;
							        	</td>
								</tr>  
								<%-- <tr>
									<th style="text-align:center">알림간격</th>
							         	<td>
							         		<input type="radio" id="noTerm" name="alertTerm" value="0" onclick="handleRadioClick2(this, false);" checked/>설정안함&ensp;
							         		<input type="radio" id="sleepTerm" name="alertTerm" value="99999999"onclick="handleRadioClick2(this, false);"/>중지&ensp;
							         		<input type="radio" id="custTerm" name="alertTerm" value="1234"onclick="handleRadioClick2(this, true);"/>입력
							         		<input type="text" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;" maxlength=3 id="inputUptTermVal" name="inputTermVal" style="display:inline; width:50px; text-align:center" disabled> 분
							        	</td>
								</tr>   --%>    
								<tr>
									<th style="text-align:center">담&ensp;당&ensp;자</th>
							         	<td>
							         		<select id="selUptManager" onChange="" name="managerId" class="form-control inline-block" style="display:inline; width:250px; height:35px">
							         		    <c:forEach items="${managerList}" var="manager">
							                    <option value="${manager.managerId}">${manager.managerNm }</option>
							                    </c:forEach>
							                </select>
							         	</td>
						      	</tr>   
							</tbody>
						</table>
			          </form>
			          <div class="modal-footer center-block" style="width:500px; padding:10px;">
						<button id="btnUpdateEvntMngrGo"style="float:left" class="btn btn-success col-md-offset-5">수정</button>
				        <button style="float:left" class="btn btn-default col-md-offset-1" data-dismiss="modal">취소</button>
					  </div>
			        </div>
			      </div>
		    	</div>
		  	  </div>
		  	  
		  	  <!-- 장애코드 등록 팝업창 기능 -->
			  <div class="modal fade" id="errorRegisterPopup" role="dialog">
			    <div class="modal-dialog">
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4>장애코드 등록</h4>
			        </div>
			        <div class="modal-body" style="padding:40px 50px;">
			          <form role="form" id="frmAddEvent" action="/plusEvent" method="post">
				          <table class="table" style="width:400px;" align="center">
							<tbody>
								<tr>
									<th style="text-align:center">장애코드</th>
										<td>
											<input id="inputAddEventCode" type="text" name="eventCode" style="width:250px; text-align:center">
										</td>
								</tr>
								<tr>
									<th style="text-align:center">상세설명</th>
										<td>
											<input id="inputAddDescription" type="text" name="description" value="" style="width:250px; text-align:center">
										</td>
								</tr>
								<tr>
									<th style="text-align:center">서&ensp;버&ensp;명</th>
							         	<td>
							         	    <input type="hidden" name="serverId" value="${serverInfo.serverId}" />
							         		<input type="text" name="" value="${serverInfo.serverNm }" style="width:250px; text-align:center" disabled>
							        	</td>
								</tr>  
							</tbody>
						</table>
			          </form>
			          <div class="modal-footer center-block" style="width:500px; padding:10px;">
						<button id="btnAddEventGo" style="float:left" class="btn btn-success col-md-offset-5">등록</button>
				        <button style="float:left" class="btn btn-default col-md-offset-1" data-dismiss="modal">취소</button>
					  </div>
			        </div>
			      </div>
		    	</div>
		  	  </div>
               
              <!-- 장애담당자 등록 팝업창 기능 -->
			  <div class="modal fade" id="errorAdminRegisterPopup" role="dialog">
			    <div class="modal-dialog">
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4>장애담당자 등록</h4>
			        </div>
			        <div class="modal-body" style="padding:40px 50px;">
			          <form role="form" id="frmAddEvntMngr" action="/plusEvntMngr" method="post">
				          <table class="table" style="width:400px;" align="center">
							<tbody>
								<tr>
									<th style="text-align:center">서&ensp;버&ensp;명</th>
										<td>
											<input type="text" name="" value="${serverInfo.serverNm}" style="width:250px; text-align:center" disabled>
										</td>
								</tr>
								<tr>
									<th style="text-align:center">장애코드</th>
										<td>
											<select id="" onChange="" name="eventId" class="form-control inline-block" style="display:inline; width:250px; height:35px">
							                    <c:forEach items="${eventList}" var="event">
							                    <option value="${event.eventId }">${event.eventCode }</option>
							                    </c:forEach>
							                </select>
										</td>
								</tr>
								<tr>
									<th style="text-align:center">알림방법</th>
							         	<td>
							         		<select id="" onChange="" name="alertMth" class="form-control inline-block" style="display:inline; width:250px; height:35px">
							                    <option value="ALM01">Email</option>
							                    <option value="ALM02">SMS + Email</option>
							                </select>
							        	</td>
								</tr>
								<tr>
									<th style="text-align:center">알림수신</th>
							         	<td>
							         		<input type="radio" name="" value="1234" onclick="handleRadioClick3(this, false);" checked/>받음&ensp;
							         		<input type="radio" name="alertTerm" value="99999999" onclick="handleRadioClick3(this, true);"/>받지 않음
							        	</td>
								</tr>    
								<tr>
									<th style="text-align:center">알림간격</th>
							         	<td>
							         		<input type="radio" name="alertTerm" value="1234" onclick="handleRadioClick1(this, true);"/>
							         		<input type="text" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;" maxlength=3 id="inputPlusTermVal" name="inputTermVal" style="display:inline; width:50px; text-align:center" disabled> 분&ensp;
							        		<input type="radio" name="alertTerm" value="0" onclick="handleRadioClick1(this, false);" checked/>설정안함&ensp;
							        	</td>
								</tr>   
								<%-- <tr>
									<th style="text-align:center">알림간격</th>
							         	<td>
							         		<input type="radio" name="alertTerm" value="0" onclick="handleRadioClick1(this, false);" checked/>설정안함&ensp;
							         		<input type="radio" name="alertTerm" value="99999999" onclick="handleRadioClick1(this, false);"/>중지&ensp;
							         		<input type="radio" name="alertTerm" value="1234" onclick="handleRadioClick1(this, true);"/>입력
							         		<input type="number" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;" maxlength=3 id="inputPlusTermVal" name="inputTermVal" style="display:inline; width:50px; text-align:center" disabled> 분
							        	</td>
								</tr> --%>          
								<tr>
									<th style="text-align:center">담&ensp;당&ensp;자</th>
							         	<td>
							         		<select id="" onChange="" name="managerId" class="form-control inline-block" style="display:inline; width:250px; height:35px">
							                    <c:forEach items="${managerList}" var="manager">
                                                <option value="${manager.managerId}">${manager.managerNm }</option>
                                                </c:forEach>
							                </select>
							         	</td>
						      	</tr>    
							</tbody>
						</table>
			          </form>
			          <div class="modal-footer center-block" style="width:500px; padding:10px;">
						<button id="btnAddEvntMngrGo"  style="float:left" class="btn btn-success col-md-offset-5">등록</button>
				        <button style="float:left" class="btn btn-default col-md-offset-1" data-dismiss="modal">취소</button>
					  </div>
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
<script src="resources/dist/js/app.js"></script>

<script>

$(document).ready(function(){
    
	// box-body default로 닫혀있게하는 설정
	$(".box-default").addClass("collapsed-box");
	
	//form ajax submit 처리 함수 
    function ajaxPost(frm, sMsg, eMsg){
        
        var _data = $(frm).serialize();
        var _url = $(frm).attr("action");
        
        $.ajax({
           type :"post",
           url : _url,
           data : _data,
           success : function(result){
               if(result.flag){
                   window.location.reload();
                   alert(sMsg);
               }
               else{
                   alert(eMsg);
               }
           }
        });
    }
	
	/////////////////////////////// 장애 코드 등록,수정 및 삭제 script ///////////////////////////////
	
	//장애 코드 수정 팝업 띄우기
	$(".btnUpdateEvent").each(function(){
	    $(this).click(function(){
	       $("#inputUptEventId").val($(this).parents("#container").children().eq(0).children("#eventId").val());
	       $("#inputUptEventCode").val($(this).parents("#container").children().eq(0).children("#eventCode").text());
	       $("#inputUptDescription").val($(this).parents("#container").children().eq(1).children("#description").text());
	       $("#errorUpdatePopup").modal();
	    });
	});
	
	//수정 완료 시 submit
	$("#btnUpdateEventGo").click(function(){
	    var frm = $("#frmUpdateEvent");
	    ajaxPost(frm,"수정되었습니다.","");
	});
	//장애 코드 삭제
	$(".btnDeleteEvent").each(function(){
	   $(this).click(function(){
	       
	       if(confirm("정말 삭제 하시겠습니까?")){
	           
	           var eventId = $(this).attr("data-eventId");
	           var _data = {
	                   "eventId": eventId
	           };
	           
	           $.ajax({
	               type : "post",
	               url : "/deleteEvent",
	               data : _data,
	               success : function(result){
	                   if(result.flag){
	                       window.location.reload();
	                       alert("삭제 되었습니다.");
	                   }
	               }
	           });
	       }
	   });
	});
	
	//장애 코드 등록 팝업 띄우기
	$("#btnAddEvent").click(function(){
	    $("#inputAddEventCode").val('');
	    $("#inputAddDescription").val('');
        $("#errorRegisterPopup").modal();
    });
	
	//장애코드 등록
	$("#btnAddEventGo").click(function(){
	    
	    if($("#inputAddEventCode").val() == '' || $("#inputAddDescription").val() == ''){
	        alert("모든 항목을 입력해주세요.");
	    }
	    else{
	        var frm = $("#frmAddEvent");
	        ajaxPost(frm,"정상 등록 되었습니다.","이미 등록된 에러코드 입니다.");
	    }
	});
	
/////////////////////////////// 담당자 수정 및 삭제  script ///////////////////////////////

    //담당자 수정 데이터 입력 후 띄우기
	$(".btnUpdateEvntMngr").each(function(){
	   $(this).click(function(){
	       var eventId = $(this).parents("tr").children().eq(0).val();
	       var eventCode = $(this).parents("tr").children().eq(1).val();
	       var managerId = $(this).parents("tr").children().eq(2).val();
	       var managerNm = $(this).parents("tr").children().eq(3).text();
	       var alertMth = $(this).parents("tr").children().eq(4).text();
	       var alertTerm = $(this).parents("tr").children().eq(5).data("val");
	       
	       $("#inputUptEventId2").val(eventId);
	       $("#inputUptEventCode2").val(eventCode);
	       $("#inputUptManagerId2").val(managerId);
	       $('#inputUptTermVal').val('');
	       $('#inputUptTermVal').prop("disabled", true);
	       
	       $('#selUptAlertMth>option').each(function () {
	           var text = $(this).text();
	           if (text == alertMth) {
	               $(this).prop('selected',true);
	           }
	       });
	       
	       $('#selUptManager>option').each(function () {
               var text = $(this).text();
               if (text == managerNm) {
                   $(this).prop('selected',true);
               }
           });
	       
	       if(alertTerm == '0'){
	    	   handleRadioClick3($('#sleepTerm'), false);
	    	   $('#noTerm').prop("checked", true);
	       } else if (alertTerm == '99999999') {
	    	   $('#sleepTerm').prop("checked", true);
	    	   handleRadioClick3($('#sleepTerm'), true);
	    	   
	       } else {
	    	   handleRadioClick3($('#sleepTerm'), false);
	    	   $('#sleepTerm').prev().prop("checked",true);
	    	   $('#custTerm').prop("checked",true);
	    	   $('#inputUptTermVal').val(parseInt(alertTerm));
	    	   $('#inputUptTermVal').prop("disabled", false);
	       }
	       
	       $("#errorAdminUpdatePopup").modal();
	   });
	});
	
	//담당자 수정 완료 시 form submit
	$("#btnUpdateEvntMngrGo").click(function(){
	    var oldMngrId = $("#inputUptManagerId2").val();
	    var newMngrId = $("#selUptManager").val();
	    
	    if(oldMngrId == newMngrId){
	        $("#inputUptFlag").val("same");
	    }
	    else{
	        $("#inputUptFlag").val("unsame");
	    }
	    
	    var frm = $("#frmUpdateEvntMngr");
	    ajaxPost(frm,"수정 되었습니다.","이미 등록된 담당자 입니다.");
	});
	
	//담당자 삭제
	$(".btnDeleteEvntMngr").each(function(){
	       $(this).click(function(){
	           
	           if(confirm("정말 삭제 하시겠습니까?")){
	               
	               var managerId = $(this).attr("data-managerId");
	               var eventId = $(this).attr("data-eventId");
	               
	               var _data = {
	                       "managerId" : managerId,
	                       "eventId" : eventId
	               };
	               
	               $.ajax({
	                   type : "post",
	                   url : "/deleteEvntMngr",
	                   data : _data,
	                   success : function(result){
	                       if(result.flag){
	                           window.location.reload();
	                           alert("삭제 되었습니다.");
	                       }
	                   }
	               });
	           }
	       });
	    });
	
	//담당자 등록 팝업 띄우기
	$("#btnAddEvntMngr").click(function(){
		
        $("#errorAdminRegisterPopup").modal();
    });
	
	//담당자 등록
    $("#btnAddEvntMngrGo").click(function(){
        var frm = $("#frmAddEvntMngr");
        ajaxPost(frm,"정상 등록 되었습니다.","이미 등록된 담당자 입니다.");
        
    });
});

</script>

