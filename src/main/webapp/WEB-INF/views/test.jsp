<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	이거 테스트 페이지 입니다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
</h1>

<P>  The time on the server is ${serverTime}. </P>
<h1>manger_nm : ${vo.managerNm}</h1>
<h1>team id : ${vo.teamId}</h1>
<h1>phone_no : ${vo.phoneNo}</h1>
<h1>rgsde : ${vo.rgsde}</h1>
</body>
</html>
