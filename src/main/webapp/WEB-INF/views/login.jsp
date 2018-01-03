<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="/resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>
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



<div class="" style="min-height: 951.444px;">
	<div class="box" style="min-height:951.444px;">
		<div class="container" style="margin-top:150px;">
			<div class="row">
 				<div class="formWrapper center-block" style="width:400px; height:300px; background-color:#D8D8D8; border-radius:10px;">
       				<br>
        			<h2 class="text-center" style="color:#000000">장애 알림 시스템</h2>
            		<form name="frmLogin" class="form-horizontal" action="" method="post" onsubmit="return check();" >
            		<div class="box-body">
						<div class="input-group" style="margin-bottom: 25px">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    						<span class="input-group-addon">
    						<i class="glyphicon glyphicon-user"></i>
    						</span>
  				   			<input id="login-id" type="text" class="form-control" name="id" value="" placeholder="Input ID">                                        
			    		</div>
               			<div class="input-group" style="margin-bottom: 25px">
                			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    						<span class="input-group-addon">
    						<i class="glyphicon glyphicon-lock"></i>
    						</span>
  				    		<input id="login-password" type="password" class="form-control" name="password" value="" placeholder="Input Password">                                        
			    		</div>
                  		<br>
                  		<button type="submit" id="btn-login" class="btn btn-default btn-lg btn-block">Login</button>
                  		<p style= "color: red;">${loginFail}</p>
                  		<%-- <h1 style= "color: red;">${logout}</h1> --%>
                  		
            		</div>
            		</form>
 				</div>
			</div>
		</div>
	</div>
</div>


<script>
function check(){
	if( $("#login-id").val()=="" || $("#login-password").val()=="" ){
		alert("아이디와 패스워드를 입력해 주십시오");
		return false;
	}else{
		return true;	
	}
}
</script>



<%@include file="include/footer.jsp"%>

   