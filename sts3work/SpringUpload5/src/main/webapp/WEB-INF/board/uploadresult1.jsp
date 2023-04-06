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
	<h2>제목: ${title }</h2>
	<c:if test="${fileName=='no' }">
		<b>업로드 한 파일 없음</b>
	</c:if>
	
	<c:if test="${fileName!='no' }">
		<img alt="" src="../photo/${fileName }" style="max-width: 300px;">
	</c:if>
	
	<h2>업로드 한 이미지명: ${fileName }</h2>
	<h2>업로드 할 실제경로: ${path }</h2>
	
</body>
</html>