<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
	<div style="margin-left: 100px; margin-top: 100px;">
		<img alt="" src="${root }/image/17.jpg" width="200" align="left" hspace="20">
		<br><br>
		<!-- id를 통한 이름 받아서 표시 -->
		
		<button type="button" class="btn btn-danger"
		onclick="location.href='logoutprocess'">로그아웃</button>
	</div>
</body>
</html>