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
	<form action="update" method="get">
	<input type="hidden" name="num" value="${dto.num }">
		<table class="table tabel-bordered" style="width: 500px;">
		<caption><b>자동차 정보수정</b></caption>
			<tr>
				<th width="100">자동차명</th>
					<td>
						<input type="text" name="carname" class="form-control" required="required" value="${dto.carname }">
					</td>
			</tr>
			
			<tr>
				<th width="100">단가</th>
					<td>
						<input type="text" name="carprice" class="form-control" required="required" value="${dto.carprice }">
					</td>
			</tr>
			
			<tr>
				<th width="100">색상</th>
					<td>
						<input type="color" name="carcolor" class="form-control" value="${dto.carcolor }" required="required" >
					</td>
			</tr>
			
			<tr>
				<th width="100">구입일</th>
					<td>
						<input type="date" name="carguip" class="form-control" value="${dto.carguip}" required="required">
					</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-success">서버에 전송</button>
					<button type="button" class="btn btn-success" onclick="location.href='list'">목록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>