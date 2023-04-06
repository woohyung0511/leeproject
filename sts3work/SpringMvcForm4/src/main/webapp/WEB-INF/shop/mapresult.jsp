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
	<h2>성적 결과</h2>
	이름:${name }<br>
	자바점수:${java }<br>
	오라클점수:${oracle }<br>
	스프링점수:${spring }<br>
	<c:set var="tot" value="${java+oracle+spring }"/>
	<c:set var="avg" value="${tot/3 }"/>
	총점:${tot }<br>
	합계:${avg }
</body>
</html>