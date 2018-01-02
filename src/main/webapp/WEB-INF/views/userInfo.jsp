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
		<h3><strong>&emsp;사용자 정보</strong></h3>
		<div class="box">
           <div class="box-body">   
				<br>
				<table class="table" style="width:500px;" align="center">
					<tbody>
						<tr>
							<th style="text-align:center">&ensp;이 &emsp; &ensp; 름 </th>
								<td>
									<input type="text" name="" value="정연태" style="width:375px; text-align:center" disabled>
								</td>
						</tr>
						<tr>
							<th style="text-align:center">&ensp;소&ensp;속&ensp;팀</th>
								<td>
									<input type="text" name="" value="플랜티넷팀" style="width:375px; text-align:center" disabled>
								</td>
						</tr>
						<tr>
							<th style="text-align:center">&ensp;휴&ensp;대&ensp;폰</th>
					         	<td>
					         		<input type="text" name="" value="010" style="width:90px; text-align:center" disabled> -
					             	<input type="text" name="" value="6808" style="width:130px; text-align:center" disabled> -
					             	<input type="text" name="" value="2992" style="width:130px; text-align:center" disabled>
					        	</td>
						</tr>      
						<tr>
							<th style="text-align:center">&ensp;이&ensp;메&ensp;일</th>
					         	<td>
					         		<input type='text' name="" value="ytjung0206" style="width:175px; text-align:center" disabled> @
					            	<input type='text' name="" value="plantynet.com" style="width:180px; text-align:center" disabled>
					         	</td>
				      	</tr>   
					</tbody>
				</table>
				<div class="center-block" style="width:600px; padding:10px;">
					<button id="btnUpdate" type="button" class="btn btn-default col-md-offset-3">&emsp;정보 수정 &emsp;</button>
					<button id="btnPassword" type="submit" class="btn btn-default col-md-offset-1">비밀번호 변경</button>
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
				          <form role="form">
					          <table class="table" style="width:500px;" align="center">
								<tbody>
									<tr>
										<th style="text-align:center">&ensp;이 &emsp; &ensp; 름 </th>
											<td>
												<input type="text" name="" value="정연태" style="width:375px; text-align:center">
											</td>
									</tr>
									<tr>
										<th style="text-align:center">&ensp;소&ensp;속&ensp;팀</th>
											<td>
												<input type="text" name="" value="플랜티넷팀" style="width:375px; text-align:center">
											</td>
									</tr>
									<tr>
										<th style="text-align:center">&ensp;휴&ensp;대&ensp;폰</th>
								         	<td>
								         		<input type="text" name="" value="010" style="width:90px; text-align:center"> -
								             	<input type="text" name="" value="6808" style="width:130px; text-align:center"> -
								             	<input type="text" name="" value="2992" style="width:130px; text-align:center">
								        	</td>
									</tr>      
									<tr>
										<th style="text-align:center">&ensp;이&ensp;메&ensp;일</th>
								         	<td>
								         		<input type='text' name="" value="ytjung0206" style="width:175px; text-align:center"> @
								            	<input type='text' name="" value="plantynet.com" style="width:180px; text-align:center">
								         	</td>
							      	</tr>   
								</tbody>
							</table>
				          </form>
				          <div class="modal-footer center-block" style="width:500px; padding:10px;">
							<button id="" type="submit" style="float:left" class="btn btn-success col-md-offset-5" data-dismiss="modal">저장</button>
					        <button type="submit" style="float:left" class="btn btn-default col-md-offset-1" data-dismiss="modal">취소</button>
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
				          <form role="form">
					          <table class="table" style="width:500px" align="center">
								<tbody>
									<tr>
										<th style="text-align:center;">현재 패스워드</th>
											<td>
												<input type="text" name="" value="" style="width:375px; text-align:center">
											</td>
									</tr>
									<tr>
										<th style="text-align:center;">변경할 패스워드</th>
											<td>
												<input type="text" name="" value="" style="width:375px; text-align:center">
											</td>
									</tr>
								</tbody>
							</table>
				          </form>
				          <div class="modal-footer center-block" style="width:500px; padding:10px;">
							<button id="" type="submit" style="float:left" class="btn btn-success col-md-offset-5" data-dismiss="modal">저장</button>
					        <button type="submit" style="float:left" class="btn btn-default col-md-offset-1" data-dismiss="modal">취소</button>
						  </div>
				        </div>
				      </div>
			    	</div>
			  	  </div> 
			</div>
		</div>
	</div>
</div>

<%@include file="include/footer.jsp"%>

<script>
	$(document).ready(function(){
	    $("#btnUpdate").click(function(){
	        $("#userUpdatePopup").modal();
	    });
	});
	
	$(document).ready(function(){
	    $("#btnPassword").click(function(){
	        $("#userPasswordPopup").modal();
	    });
	});
</script>

</body>

