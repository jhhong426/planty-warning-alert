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

<div class="content-wrapper" style="min-height:550px;">

<div class="box">
<h3><strong>&emsp;담당자 관리</strong></h3>
 <br>
 <h5>&emsp; &bull; &ensp;운영진 리스트</h5>
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
       		<td>zazzan</td>
       		<td>김규식</td>
       		<td>010-3838-1929</td>
       		<td>zajan@starhuzup</td>
       		<td><button type="button" class="btn btn-default" onclick="">삭제</button></td>
       	</tr>
     </tbody>
    </table>
</div>

</div>


<%@include file="include/footer.jsp"%>


<script>
var admin = $("#admin").DataTable({
    "autoWidth" : false,
    "ordering": false
  });
  
  
  
</script>

</html>
