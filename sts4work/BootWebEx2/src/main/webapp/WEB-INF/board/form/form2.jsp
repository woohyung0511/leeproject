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
	<h1>폼 데이터 DTO 각각 읽기</h1>
	<form action="read2" method="post">
		<table class="table tabel-bordered" style="width: 300px;">
			<tr>
				<th width="100">이름</th>
					<td>
						<input type="text" name="name" class="form-control">
					</td>
			</tr>
			
			<tr>
				<th width="100">나이</th>
					<td>
						<input type="text" name="age" class="form-control">
					</td>
			</tr>
			
			<tr>
				<th width="100">주소</th>
					<td>
						<input type="text" name="addr" class="form-control">
					</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success">서버에 전송</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>