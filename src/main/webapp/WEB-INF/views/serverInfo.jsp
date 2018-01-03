<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />    

<%@include file="include/header.jsp"%>
<div class="content-wrapper" style="min-height:951.444px;">
	<div class="box" style="min-height:951.444px;">
		<h3><strong>&emsp;서버 목록 > 서버 상세정보</strong></h3>
		<div class="box">
           <div class="box-body">
            <h5 class="col-md-offset-3"><strong>&emsp; &bull; &ensp;서버 정보</strong></h5>
           	<div class="row">
           	   <form role="form">
		          <table class="table" style="width:400px;" align="center">
					<tbody style="display:block; border:1px solid black;">
						<tr>
							<th style="text-align:center">&ensp;서&ensp;버&ensp;명</th>
								<td>
									<input type="text" name="" value="DB#1" style="width:280px; text-align:center" disabled>
								</td>
						</tr>
						<tr>
							<th style="text-align:center">&emsp;&emsp;I P&ensp;&ensp;</th>
								<td>
									<input type="text" name="" value="121.241.223.110" style="width:280px; text-align:center" disabled>
								</td>
						</tr>
						<tr>
							<th style="text-align:center">&ensp;관&ensp;리&ensp;팀</th>
					         	<td>
					         		<input type="text" name="" value="플랜티넷팀" style="width:280px; text-align:center" disabled>
					        	</td>
						</tr>
					</tbody>
				</table>
	          </form>
	        </div>
	        <br>
           	
           	<h5><strong>&emsp; &bull; &ensp;장애 및 담당자 목록</strong></h5>
           	<table id="serverInfo" class="table table-bordered table-hover display">
				<thead>
					<tr>
						<th style="text-align:center">장애코드</th>
						<th style="text-align:center">상세설명</th>
						<th style="text-align:center">등록일</th>
						<th style="text-align:center">수정</th>
						<th style="text-align:center">삭제</th>
					</tr>
				</thead>
				<tbody style="text-align:center">
					<tr>
			       		<td>A1</td>
			       		<td>CPU 점유율 80% 이상</td>
			       		<td>2017-12-05 16:38:56</td>
			       		<td><button id="btnUpdate" type="button" class="btn btn-default" onclick="">수정</button></td>
			       		<td><button id="" type="button" class="btn btn-default" onclick="">삭제</button></td>
		       		</tr>
		       		<tr>
			       		<td>C2</td>
			       		<td>메모리 사용량 90% 이상</td>
			       		<td>2017-12-24 17:55:32</td>
			       		<td><button id="btnUpdate" type="button" class="btn btn-default" onclick="">수정</button></td>
			       		<td><button id="" type="button" class="btn btn-default" onclick="">삭제</button></td>
		       		</tr>
		       		<tr>
			       		<td>B3</td>
			       		<td>방화벽 해제</td>
			       		<td>2017-12-27 10:12:13</td>
			       		<td><button id="btnUpdate" type="button" class="btn btn-default" onclick="">수정</button></td>
			       		<td><button id="" type="button" class="btn btn-default" onclick="">삭제</button></td>
		       		</tr>
				</tbody>
		    </table>
           	
           	<h5><strong>&emsp; &bull; &ensp;장애 및 담당자 등록</strong></h5>
            <div class="left-block" style="width:400px; padding:10px;">
				<button id="btnRegister" type="submit" class="btn btn-default col-md-offset-1">장애 코드 등록</button>
				<button id="btnAdminRegister" type="submit" class="btn btn-default col-md-offset-1"> 담당자 등록 </button>
			</div>
               
               
           <!-- 여기부터는 각 팝업창(4개)에 대한 설정들임. -->    
               
               
           <!-- 장애코드 수정 팝업창 기능 -->
			  <div class="modal fade" id="errorUpdatePopup" role="dialog">
			    <div class="modal-dialog">
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4>장애코드 수정</h4>
			        </div>
			        <div class="modal-body" style="padding:40px 50px;">
			          <form role="form">
				          <table class="table" style="width:400px;" align="center">
							<tbody>
								<tr>
									<th style="text-align:center">장애코드</th>
										<td>
											<input type="text" name="" value="A1" style="width:250px; text-align:center">
										</td>
								</tr>
								<tr>
									<th style="text-align:center">상세설명</th>
										<td>
											<input type="text" name="" value="CPU 점유율 80% 이상" style="width:250px; text-align:center">
										</td>
								</tr>
								<tr>
									<th style="text-align:center">서&ensp;버&ensp;명</th>
							         	<td>
							         		<input type="text" name="" value="Test" style="width:250px; text-align:center" disabled>
							        	</td>
								</tr>  
							</tbody>
						</table>
			          </form>
			          <div class="modal-footer center-block" style="width:500px; padding:10px;">
						<button id="" type="submit" style="float:left" class="btn btn-success col-md-offset-5">수정</button>
				        <button type="submit" style="float:left" class="btn btn-default col-md-offset-1" data-dismiss="modal">취소</button>
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
			          <form role="form">
				          <table class="table" style="width:400px;" align="center">
							<tbody>
								<tr>
									<th style="text-align:center">서&ensp;버&ensp;명</th>
										<td>
											<input type="text" name="" value="Test" style="width:250px; text-align:center" disabled>
										</td>
								</tr>
								<tr>
									<th style="text-align:center">장애코드</th>
										<td>
											<select id="" onChange="" name="" class="form-control inline-block" style="display:inline; width:250px; height:35px">
							                    <option value="">A1</option>
							                    <option value="">A2</option>
							                    <option value="">A3</option>
							                    <option value="">B1</option>
							                    <option value="">B2</option>
							                    <option value="">B3</option>
							                    <option value="">C1</option>
							                    <option value="">C2</option>
							                    <option value="">C3</option>
							                </select>
										</td>
								</tr>
								<tr>
									<th style="text-align:center">알림방법</th>
							         	<td>
							         		<select id="" onChange="" name="" class="form-control inline-block" style="display:inline; width:250px; height:35px">
							                    <option value="">Email</option>
							                    <option value="">SMS + Email</option>
							                </select>
							        	</td>
								</tr>      
								<tr>
									<th style="text-align:center">담&ensp;당&ensp;자</th>
							         	<td>
							         		<select id="" onChange="" name="" class="form-control inline-block" style="display:inline; width:250px; height:35px">
							                    <option value="">호날두</option>
							                    <option value="">메에시</option>
							                    <option value="">토오티</option>
							                    <option value="">히딩크</option>
							                </select>
							         	</td>
						      	</tr>   
							</tbody>
						</table>
			          </form>
			          <div class="modal-footer center-block" style="width:500px; padding:10px;">
						<button id="" type="submit" style="float:left" class="btn btn-success col-md-offset-5">수정</button>
				        <button type="submit" style="float:left" class="btn btn-default col-md-offset-1" data-dismiss="modal">취소</button>
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
			          <form role="form">
				          <table class="table" style="width:400px;" align="center">
							<tbody>
								<tr>
									<th style="text-align:center">장애코드</th>
										<td>
											<input type="text" name="" value="" style="width:250px; text-align:center">
										</td>
								</tr>
								<tr>
									<th style="text-align:center">상세설명</th>
										<td>
											<input type="text" name="" value="" style="width:250px; text-align:center">
										</td>
								</tr>
								<tr>
									<th style="text-align:center">서&ensp;버&ensp;명</th>
							         	<td>
							         		<input type="text" name="" value="Test" style="width:250px; text-align:center" disabled>
							        	</td>
								</tr>  
							</tbody>
						</table>
			          </form>
			          <div class="modal-footer center-block" style="width:500px; padding:10px;">
						<button id="" type="submit" style="float:left" class="btn btn-success col-md-offset-5">등록</button>
				        <button type="submit" style="float:left" class="btn btn-default col-md-offset-1" data-dismiss="modal">취소</button>
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
			          <form role="form">
				          <table class="table" style="width:400px;" align="center">
							<tbody>
								<tr>
									<th style="text-align:center">서&ensp;버&ensp;명</th>
										<td>
											<input type="text" name="" value="Test" style="width:250px; text-align:center" disabled>
										</td>
								</tr>
								<tr>
									<th style="text-align:center">장애코드</th>
										<td>
											<select id="" onChange="" name="" class="form-control inline-block" style="display:inline; width:250px; height:35px">
							                    <option value=""></option>
							                    <option value="">A1</option>
							                    <option value="">A2</option>
							                    <option value="">A3</option>
							                    <option value="">B1</option>
							                    <option value="">B2</option>
							                    <option value="">B3</option>
							                    <option value="">C1</option>
							                    <option value="">C2</option>
							                    <option value="">C3</option>
							                </select>
										</td>
								</tr>
								<tr>
									<th style="text-align:center">알림방법</th>
							         	<td>
							         		<select id="" onChange="" name="" class="form-control inline-block" style="display:inline; width:250px; height:35px">
							                    <option value=""></option>
							                    <option value="">Email</option>
							                    <option value="">SMS + Email</option>
							                </select>
							        	</td>
								</tr>      
								<tr>
									<th style="text-align:center">담&ensp;당&ensp;자</th>
							         	<td>
							         		<select id="" onChange="" name="" class="form-control inline-block" style="display:inline; width:250px; height:35px">
							                    <option value=""></option>
							                    <option value="">호날두</option>
							                    <option value="">메에시</option>
							                    <option value="">토오티</option>
							                    <option value="">히딩크</option>
							                </select>
							         	</td>
						      	</tr>    
							</tbody>
						</table>
			          </form>
			          <div class="modal-footer center-block" style="width:500px; padding:10px;">
						<button id="" type="submit" style="float:left" class="btn btn-success col-md-offset-5">등록</button>
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

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="/resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script>
	// 장애 및 담당자 목록  Data Table
	var serverInfo = $("#serverInfo").DataTable({
		"language"    : {
       		 'paginate'          : {
        	  	  "first" : "<<",
         		  "previous" : "<",
         		  "last"  : ">>",
          		  "next"  : ">"
         }
       },
       "scrollY"              : 400,
       "scrollCollapse"       : true,
		"pageLength"           : 10,
	    "pagingType"           : "full_numbers",
	    "dom"                  : '<"top"<"col-md-12"B>>' +
	                             'rt' +
	                             '<"bottom"<"col-md-8"p><"col-md-4"B>>',
	    "select"              : "multi",
		"autoWidth" : false,
	    "ordering": false
	});
	
	// 장애코드 수정 팝업창 띄우기
	$(document).ready(function(){
	    $("#btnUpdate").click(function(){
	        $("#errorUpdatePopup").modal();
	    });
	});
	
	// 장애담당자 수정 팝업창 띄우기
	$(document).ready(function(){
	    $("#btnAdminUpdate").click(function(){
	        $("#errorAdminUpdatePopup").modal();
	    });
	});
	
	// 장애코드 등록 팝업창 띄우기
	$(document).ready(function(){
	    $("#btnRegister").click(function(){
	        $("#errorRegisterPopup").modal();
	    });
	});
	
	// 장애담당자 등록 팝업창 띄우기
	$(document).ready(function(){
	    $("#btnAdminRegister").click(function(){
	        $("#errorAdminRegisterPopup").modal();
	    });
	});
</script>
