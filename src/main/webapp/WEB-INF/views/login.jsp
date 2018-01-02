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

<div class="content-wrapper" style="min-height: 951.444px;">
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
	}else if(false){
		return false;
	}else{
		console.log("성공");
		return true;	
	}
}
</script>



<%@include file="include/footer.jsp"%>

   