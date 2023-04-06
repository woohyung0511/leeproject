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
<form action="process3" method="post">
	<table class="table table-bordered" style="width: 400px;">
		<caption><b>시험점수입력</b></caption>
		<tr>
			<th style="width: 100px;">학생명</th>
			<td>
				<input type="text" name="sang" class="form-control">
			</td>
		</tr>
		
		<tr>
			<th style="width: 100px;">자바점수</th>
			<td>
				<input type="text" name="java" class="form-control">
			</td>
		</tr>
		
		<tr>
			<th style="width: 100px;">오라클점수</th>
			<td>
				<input type="text" name="oracle" class="form-control">
			</td>
		</tr>
		
		<tr>
			<th style="width: 100px;">스프링점수</th>
			<td>
				<input type="text" name="spring" class="form-control">
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
			<td>
				<button type="submit">전송</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>