<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/bootstrap/css/style.css" rel="stylesheet">

<style>
	@import url(http://fonts.googleapis.com/earlyaccess/jejumyeongjo.css);
	@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
	
	#title{
	    font-family: ‘Nanum Pen Script’ ;
	    color:#ffffff;
	    font-size: 25px;
	}
	
	.background {
		background: url("http://cdn1.greatfon.com/uploads/picture/934/36934/ubuntu-linux-gnu-fon-siniy.jpg?width=1920&height=1080&crop=true") center;
		background-size:cover;
		width:100%;
		height:100%;
		position: relative;
		z-index:1;
		float:left;
		overflow:hidden;
		}
</style>

<html>
<body>
<div class="" style="min-height: 951.444px;">
	<div class="box background" style="min-height:951.444px;">
		<div class="container" style="margin-top:25px;">
			<div class="row">
				<img class="center-block" alt="" src="/resources/dist/img/logo_login.PNG">
				<br>
			</div> 
 				<div class="formWrapper center-block" style="width:500px; height:450px; background-color:#ffffff">
        			<div class="box-header" style="width:500px; height:110px; background-color:#222d32; display:flex; align-items:center; justify-content:center;">
        				<span id="title">장애 알림 관리 시스템</span>
        			</div>
            		<form name="frmLogin" class="form-horizontal" action="" method="post" onsubmit="return check();" >
            		<div class="box-body" style="padding:35px 50px;">
			    		<div class="form-group">
			            	<label for="id"><span class="glyphicon glyphicon-user"></span>&ensp;ID</label>
			            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			            	<input id="login-id" type="text" class="form-control" name="id" placeholder="아이디">
			            </div>
               			<div class="form-group">
			            	<label for="password"><span class="glyphicon glyphicon-lock"></span>&ensp;Password</label>
			            	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			            	<input id="login-password" type="password" class="form-control" name="password" placeholder="비밀번호">
			            </div>
                  		<br>
                  		<div class="row">
                  			<button type="submit" id="btn-login" class="btn btn-block" style="width:425px; height:50px; background-color:#222d32; color:white; font-size:18px"><span class="glyphicon glyphicon-off" style="color:white"></span> 로그인</button>
                  		</div>
                  		<br>
                  		<p style="text-align:center; font-size:12pt"><strong>Copyrights &copy; 2018 <a href="http://www.plantynet.com">Plantynet</a></strong> co. &ensp; All Rights Reserved.</p>

                  		<p style="text-align:center; color: red;">${loginFail}</p>
            		</div>
            		</form>
 				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>


<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="/resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>

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
