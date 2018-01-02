<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <title>장애 알림 시스템</title>
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
  </head>

<body class="skin-blue sidebar-mini" style="height: auto; min-height: 100%;">
  <div class="wrapper" style="height: auto; min-height: 100%;">
	<aside class="main-sidebar">
		<section class="sidebar" style="height: 951.444px;">
			<li>
				<a>${sessionScope.sessionVO.managerNm}님 환영합니다!</a>
			</li>
			<br>
			<form action="/login" method="get">
            <li>
          		<a>
            			<button type="submit" class="btn btn-default btn-xs">로그아웃</button>
            	</a>
            </li>
            </form>
			<br><br>
			<ul class="sidebar-menu tree" data-widget="tree">
				<li class="treeview">
					<a href="/login"> 
						<span>로그인</span>
					</a>
				</li>
				<li class="treeview">
					<a href="/login/admin">
						<span>담당자 관리</span>
					</a>
				</li>
				<li class="treeview">
					<a href="/login/userInfo"> 
						<span>사용자 정보</span>
					</a>
				</li>
				<li class="treeview">
					<a href="/login/serverList"> 
						<span>서버 목록</span>
					</a>
				</li>
				<li class="treeview">
					<a href="/login/monitoring"> 
						<span>모니터링</span>
					</a>
				</li>
			</ul>
		</section>
	</aside>
	
	
	