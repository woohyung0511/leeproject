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
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	
	<c:if test="${sessionScope.loginok==null }">
		<img alt="" src="${root }/image/19.jpg" style="width: 130px; height:130px;"
		class="img-circle">
	</c:if>
	
	<c:if test="${sessionScope.loginok!=null }">
		<img alt="" src="${root }/photo/${sessionScope.loginphoto}" style="width: 130px; height:130px;"
		class="img-circle">
	</c:if>
	
	
	<span class="glyphicon glyphicon-envelope">email</span>&nbsp;sist@gmail.com<br>
	<span class="glyphicon glyphicon-cog"></span>&nbsp;쌍용교육센터<br>
	<a href="">
		<img alt="" src="../image/insta.jpg" style="width: 20px;">&nbsp;쌍용교육센터
	</a>	
	<img alt="" src="../image/#.png" style="width: 200px;">
</body>
</html>