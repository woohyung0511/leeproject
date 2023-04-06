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
<h3>${msg }</h3>
<h3><fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm"/></h3>
<h2>매핑주소 연습</h2>
	<ul>
		<li><a href="apple/list">apple/list</a></li>
		<li><a href="apple/list.do">apple/list.do</a></li>
		<li><a href="apple/list.nhn">apple/list.nhn</a></li>
		<li><a href="banana/insert">apple/insert</a></li>
		<li><a href="orange/delete">orange/delete</a></li>
	</ul>
	
	<h2>이미지 출력 연습</h2>
		<ul>
			<li><a href="shop/detail">resource의 이미지출력</a></li>
			<li><a href="board/add/data">퀴즈: 이미지출력</a></li>
		</ul>
</body>
</html>