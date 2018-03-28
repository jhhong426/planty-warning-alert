<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<%@include file="include/header.jsp"%>

<div class="content-wrapper" style="width:auto; height:100%; padding:0px;">
	<div class="box" style="width:auto; height:100%; padding:0px;">
		<h3><strong>&emsp;사용자 정보</strong></h3>
		<div class="box">
           <div class="box-body">   
				<br>
				<table class="table" style="width:500px;" align="center">
					<tbody>
						<tr>
							<th style="text-align:center">&ensp;이 &emsp; &ensp; 름 </th>
								<td>
									<input class="form-control" type="text" name="" value="${userInfo.managerNm} " style="width:375px; text-align:center" disabled>
								</td>
						</tr>
						<tr>
							<th style="text-align:center">&ensp;휴&ensp;대&ensp;폰</th>
					         	<td>
					         		<input class="form-control" type="text" name="" value="${userInfo.phoneNo}" style="width:375px; text-align:center" disabled>
					        	</td>
						</tr>      
						<tr>
							<th style="text-align:center">&ensp;이&ensp;메&ensp;일</th>
					         	<td>
					         		<input class="form-control" type='text' name="" value="${userInfo.email}" style="width:375px; text-align:center" disabled>
					         	</td>
				      	</tr>   
					</tbody>
				</table>
				<div class="center-block" style="width:600px; padding:10px;">
					<button id="btnUpdate" type="button" class="btn btn-primary col-md-offset-4">&emsp;정보 수정 &emsp;</button>
					<button id="btnPassword" type="submit" class="btn btn-danger col-md-offset-1">비밀번호 변경</button>
				</div>
			</div>
		</div>
	</div>
</div>
		
				  <!-- 사용자 정보 수정 팝업창 기능 -->
				  <div class="modal fade" id="userUpdatePopup" role="dialog">
				    <div class="modal-dialog">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4>사용자 정보 수정</h4>
				        </div>
				        <div class="modal-body" style="padding:40px 50px;">
				          <form id="frmChangeInfo">
					          <table class="table" style="width:500px;" align="center">
								<tbody>
									<tr>
										<th style="text-align:center">&ensp;이 &emsp; &ensp; 름 </th>
											<td>
											    <input id="managerId" type="hidden" name="managerId" value="${userInfo.managerId}"/>
												<input data-value="${userInfo.managerNm}" id="managerNm" type="text" name="managerNm" value="" style="width:375px; text-align:center">
											</td>
									</tr>
									<tr>
										<th style="text-align:center">&ensp;휴&ensp;대&ensp;폰</th>
								         	<td>
								         		<input data-value="${phoneNoOne}" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;" maxlength=3 id="pOne" type="text" name="pOne" value="" style="width:90px; text-align:center"> -
								             	<input data-value="${phoneNoTwo}" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;" maxlength=4 id="pTwo" type="text" name="pTwo" value="" style="width:130px; text-align:center"> -
								             	<input data-value="${phoneNoThree}" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;" maxlength=4 id="pThree" type="text" name="pThree" value="" style="width:130px; text-align:center">
								        	</td>
									</tr>      
									<tr>
										<th style="text-align:center">&ensp;이&ensp;메&ensp;일</th>
								         	<td>
								         		<input data-value="${splitEmail[0]}" id="eOne" type='text' name="eOne" value="" style="width:175px; text-align:center"> @
								            	<input data-value="${splitEmail[1]}" id="eTwo" type='text' name="eTwo" value="" style="width:180px; text-align:center">
								         	</td>
							      	</tr>   
								</tbody>
							</table>
				            </form>
				            <div class="modal-footer center-block" style="width:500px; padding:10px;">
							  <button id="btnChangeInfo" style="float:left" class="btn btn-success col-md-offset-5" >저장</button>
					          <button id="btnCloseInfo" style="float:left" class="btn btn-default col-md-offset-1" data-dismiss="modal">취소</button>
						    </div>
				        </div>
				      </div>
			    	</div>
			  	  </div> 
		  	  
			  	  <!-- 비밀번호 변경 팝업창 기능 -->
				  <div class="modal fade" id="userPasswordPopup" role="dialog">
				    <div class="modal-dialog">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4>비밀번호 변경</h4>
				        </div>
				        <div class="modal-body" style="padding:40px 50px;">
				          <form id="frmChangePw">
					          <table class="table" style="width:500px" align="center">
								<tbody>
									<tr>
										<th style="text-align:center;">현재 패스워드</th>
											<td>
												<input id="orginPassword" class="form-control" type="password" name="orginPassword" value="" style="width:300px; text-align:center">
											</td>
									</tr>
									<tr>
										<th style="text-align:center;">변경할 패스워드</th>
											<td>
												<input id="changePassword" class="form-control" type="password" name="changePassword" value="" style="width:300px; text-align:center">
											</td>
									</tr>
								</tbody>
							</table>
				          </form>
				          <div class="modal-footer center-block" style="width:500px; padding:10px;">
							<button id="btnChangePw" style="float:left" class="btn btn-success col-md-offset-5">저장</button>
					        <button id="btnClosePw" style="float:left" class="btn btn-default col-md-offset-1" data-dismiss="modal">취소</button>
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

<script>

	$(document).ready(function(){
	    
	    $("#btnUpdate").click(function(){
	        //정보 수정 팝업이 클릭 될 때마다 값 넣어줌(수정 후 취소 시 원본 값이 달라지는 것을 막기 위함)
	        $("#managerNm").val($("#managerNm").data("value")); 
	        $("#pOne").val($("#pOne").data("value")); 
	        $("#pTwo").val($("#pTwo").data("value")); 
	        $("#pThree").val($("#pThree").data("value"));
	        $("#eOne").val($("#eOne").data("value"));
	        $("#eTwo").val($("#eTwo").data("value"));
	        
	        $("#userUpdatePopup").modal();
	    });
	    
	    $("#btnPassword").click(function(){
            $("#userPasswordPopup").modal();
        });
	    $('#btnClosePw').click(function(){
	        $("#orginPassword").val('');
            $("#changePassword").val('');
	    });
	    
	    //비밀번호 변경 관련 script
	    $("#btnChangePw").click(function(){
	        var _data = $("#frmChangePw").serialize();
	        
	        if($("#orginPassword").val() == '' || $("#changePassword").val() == ''){
	            alert("모든 항목을 입력해주세요.");
	        }
	        else{
	            $.ajax({
	                type: "POST",
	                url: "/userInfo/changePw",
	                data: _data,
	                
	                success: function(result){
	                    
	                    if(result.flag){
	                        
	                        window.location.reload();
	                        alert("변경 완료");
	                    }
	                    else{
	                        alert("현재 비밀번호가 올바르지 않습니다.");
	                        $("#orginPassword").val('');
	                        $("#changePassword").val('');
	                    }
	                },
	                
	                error:function(request,status){
	                    alert("변경 에러");
	                }
	            });
	        }
	    });
	    
	    
	    // 사용자 정보 수정 관련 script
	    $("#btnChangeInfo").click(function(){
	       if($("#managerNm").val() == '' || $("#pOne").val() == '' || $("#pTwo").val() == '' || $("#pThree").val() == '' || $("#eOne").val() == '' || $("#eTwo").val() == ''){
	           alert("모든 항목을 입력해주세요.");
	       }
	       else{
	           var managerId = $("#managerId").val();
	           var managerNm = $("#managerNm").val();
	           var phoneNo = $("#pOne").val() + $("#pTwo").val() + $("#pThree").val();
	           var email = $("#eOne").val() + "@" + $("#eTwo").val();
	           
	           var _data = {
	                   "managerId":managerId,
	                   "managerNm":managerNm,
	                   "phoneNo":phoneNo,
	                   "email":email
	           };
	           
	           $.ajax({
                   type: "POST",
                   url: "/userInfo/changeInfo",
                   data: _data,
                   
                   success: function(result){
                       
                       if(result.flag){
                           
                           window.location.reload();
                           alert("변경 완료");
                       }
                       else{
                           alert("변경 에러");
                           window.location.reload();
                       }
                   },
                   
                   error:function(request,status){
                       alert("변경 에러");
                   }
               });
	           
	           
	       }
	    });
	   
	});// document(ready)
	
	
</script>

</body>
