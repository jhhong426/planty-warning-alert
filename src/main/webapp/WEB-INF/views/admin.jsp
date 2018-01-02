<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  


<%@include file="include/header.jsp"%>
<div class="content-wrapper" style="min-height:951.444px;">
	<div class="box" style="min-height:951.444px;">
		<h3><strong>&emsp;담당자 관리</strong></h3>
		<div class="box">
           <div class="box-body">
           <h5><strong>&emsp; &bull; &ensp;담당자 목록</strong></h5>
				<table id="admin" class="table table-bordered table-hover display">
					<thead>
						<tr>
							<th style="text-align:center">ID</th>
							<th style="text-align:center">이름</th>
							<th style="text-align:center">휴대폰</th>
							<th style="text-align:center">이메일</th>
							<th style="text-align:center">삭제</th>
						</tr>
					</thead>
					<tbody style="text-align:center">
						<tr>
				       		<td>jyt0206</td>
				       		<td>정연태</td>
				       		<td>010-6808-2992</td>
				       		<td>wjddusxo222@naver.com</td>
				       		<td><button type="button" class="btn btn-default" onclick="">삭제</button></td>
			       		</tr>
			       		<tr>
				       		<td>zazang</td>
				       		<td>김규식</td>
				       		<td>010-3838-1929</td>
				       		<td>zajan@starhuzup</td>
				       		<td><button id="btnRemove" type="button" class="btn btn-default">삭제</button></td>
				       	</tr>
				       	<tr>
				       		<td>baekjoon</td>
				       		<td>김주승</td>
				       		<td>010-2812-0291</td>
				       		<td>ethereum@gazua</td>
				       		<td><button id="btnRemove" type="button" class="btn btn-default">삭제</button></td>
				       	</tr>
				       	<tr>
				       		<td>gameMaker</td>
				       		<td>홍재혁</td>
				       		<td>010-1982-3918</td>
				       		<td>ncsoft@gazua</td>
				       		<td><button id="btnRemove" type="button" class="btn btn-default">삭제</button></td>
				       	</tr>
					</tbody>
			    </table>
				<br>
				
				
				<h5 class="col-md-offset-3"><strong>&emsp; &bull; &ensp;담당자 등록</strong></h5>
				<form name="" method="post" action="" onsubmit="">
				<table class="table" style="width:500px;" align="center">
					<tbody>
						<tr>
							<th style="text-align:center">&ensp;이 &emsp; &ensp; 름 </th>
								<td>
									<input type="text" name="manager_nm" value="" style="width:375px; text-align:center">
								</td>
						</tr>
						<tr>
							<th style="text-align:center">&ensp;소&ensp;속&ensp;팀</th>
								<td>
									<input type="text" name="teamNm" value="채널연구개발팀" style="width:375px; text-align:center" disabled >
								</td>
						</tr>
						<tr>
							<th style="text-align:center">&ensp;휴&ensp;대&ensp;폰</th>
					         	<td>
					         		<input type="text" name="phoneNum1" value="010" style="width:90px; text-align:center"> -
					             	<input type="text" name="phoneNum2" style="width:130px; text-align:center"> -
					             	<input type="text" name="phoneNum3" style="width:130px; text-align:center">
					        	</td>
						</tr>      
						<tr>
							<th style="text-align:center">&ensp;이&ensp;메&ensp;일</th>
					         	<td>
					         		<input type='text' name="email1" style="width:175px; text-align:center"> @
					            	<input type='text' name="email2" style="width:180px; text-align:center">
					         	</td>
				      	</tr>   
					</tbody>
				</table>
				  	<button id="btnRegister" type="button" class="btn btn-default col-md-offset-6">등록</button>
				  	<br>
				</form>
				<br>
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
    // 운영진 리스트 Data Table
	var admin = $("#admin").DataTable({
		"pageLength"           : 10,
        "pagingType"           : "full_numbers",
        "dom"                  : '<"top"<"col-md-12"B>>' +
                                 'rt' +
                                 '<"bottom"<"col-md-12"B>>',
        "select"              : "multi",
	    "autoWidth" : false,
	    "ordering": false
	});
	 
	
</script>
