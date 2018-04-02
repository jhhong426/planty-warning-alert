<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <title>장애 알림 관리 시스템</title>
    <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/bootstrap/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href=" https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" href="/resources/img/alert_favicon.ico">
    <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
    <style>
		@import url(http://fonts.googleapis.com/earlyaccess/jejumyeongjo.css);
		@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
		
		#title {
		    font-family: ‘Nanum Pen Script’ ;
		    color:gray;
		    font-size: 35px;
		    margin-left:230px;
		}
    </style>
  </head>
<div class="container skin-blue sidebar-mini" style="width:auto; height:auto; padding:0px;">
  <div class="wrapper" style="width:auto%; height:auto;">
	<header class="main-header">
	    <div id="title">
	       <a href="/monitoring"> 
	       		<img src="/resources/dist/img/title.PNG" height="80px">
	       </a>
	    </div>
    </header>
	<aside class="main-sidebar">
		<section class="sidebar">
                 <img src="/resources/dist/img/logo.PNG" alt="" width="230px" height="70px" style="margin-top:-40px;">
             <br><br>
			<li>
				<a>${sessionScope.sessionVO.managerNm}님 환영합니다!</a>
			</li>
			<br>
			<form action="/logout" method="get">
            <li>
          		<a>
            		<button type="submit" class="btn btn-default btn-xs">로그아웃</button>
            	</a>
            </li>
            </form>
			<br><br>
			<ul class="sidebar-menu tree" data-widget="tree">
				
				<li class="treeview">
					<a href="/userInfo"> 
						<span>사용자 정보</span>
					</a>
				</li>
				<li class="treeview">
					<a href="/serverList"> 
						<span>서버 목록</span>
					</a>
				</li>
				<li class="treeview">
					<a href="/monitoring"> 
						<span>모니터링</span>
					</a>
				</li>
				<li class="treeview">
                    <a href="/admin">
                        <span>담당자 관리</span>
                    </a>
                </li>
			</ul>
		</section>
	</aside>
	
	
	