<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />    

<%@include file="include/header.jsp"%>

<!-- Bootstrap 3.3.4 -->
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    <!-- Custom Style -->
    <link href="/resources/bootstrap/css/style.css" rel="stylesheet">
    <!-- Datatable CSS -->
    <link rel="stylesheet" href=" https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
	<!-- 데이터테이블 스킨 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- jQuery 2.1.4 -->
    <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>

<div class="content-wrapper" style="min-height:951.444px;">
<div class="box" style="min-height:951.444px;">
	<div class="box">
	
		<div class="row">
			<div class="col-md-2 text-center">
				장애코드
			</div>
			<div class="col-md-5 text-center">
				상세설명
			</div>
			<div class="col-md-3 text-center">
				등록일
			</div>
			<div class="col-md-1 text-center">
				수정	
			</div>
			<div class="col-md-1">
				삭제
			</div>
		</div>
		
		<div class="box box-default">
			<div class="box-header with-border">
			
				<div class="box-tools pull right">
                     <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-plus"></i></button>
                 </div>
				
				<div class="row">
					<div class="col-md-2 text-center">
						A1
					</div>
					<div class="col-md-5 text-center">
						테스트테스트테스트테스트
					</div>
					<div class="col-md-3 text-center">
						2014-24-123
					</div>
					<div class="col-md-1 text-center">
						수정	
					</div>
					<div class="col-md-1">
						삭제
					</div>
				</div>
				
			</div> <!-- /box-header -->
			
			<div class="box-body">
				<table id="tabTest" style="width:100%;">
				  <tr>
				    <th class="tg-baqh text-center">담당자</th>
				    <th class="tg-yw4l text-center">알림방법</th>
				    <th class="tg-yw4l text-center">등록일</th>
				    <th class="tg-yw4l text-center">수정</th>
				    <th class="tg-yw4l text-center">삭제</th>
				  </tr>
				  <tr>
				    <td class="tg-yw4l text-center">김규식</td>
				    <td class="tg-yw4l text-center">Email</td>
				    <td class="tg-yw4l text-center">2014-21-13</td>
				    <td class="tg-yw4l text-center">수정</td>
				    <td class="tg-yw4l text-center">삭제</td>
				  </tr>
				</table>
			</div>
		</div>
	</div>
</div>
</div>

<%@include file="include/footer.jsp"%>

<!-- 스크립트 링크 시작 -->
       <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
       <!-- Bootstrap 3.3.7 -->
       <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
       <!-- SlimScroll 1.3.0 -->
       <script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
       <!-- FastClick -->
       <script src="/resources/plugins/fastclick/fastclick.js"></script>
      
       <!-- AdminLTE for demo purposes -->
       <script src="/resources/dist/js/demo.js"></script>
       <!-- jQuery Knob -->
       <script src="/resources/plugins/knob/jquery.knob.js"></script>
       <!-- Sparkline -->
       <script src="/resources/plugins/sparkline/jquery.sparkline.min.js"></script>
       <!-- Slimscroll -->
       <script src="resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
       <!-- AdminLTE App -->
       <!-- AdminLTE for demo purposes -->
       <script src="resources/dist/js/demo.js"></script>
       <script src="resources/dist/js/app.js"></script>
        <script src="/resources/plugins/jQuery/jquery.bpopup.min.js"></script>
        <script type="text/javascript">
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="/resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script>
var serverInfo = $("#tabTest").DataTable({
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


</script>
