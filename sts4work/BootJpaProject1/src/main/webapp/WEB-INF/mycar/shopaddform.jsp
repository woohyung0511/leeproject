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
	<form action="insert" method="post">
		<table class="table tabel-bordered" style="width: 500px;">
		<caption><b>구매 정보 입력</b></caption>
			<tr>
				<th width="100">상품명</th>
					<td>
						<input type="text" name="sangpum" class="form-control" required="required">
					</td>
			</tr>
			
			<tr>
				<th width="100">상품선택</th>
					<td>
						<select name="photo">
							<option value="a01" selected="selected">아이폰</option>
							<option value="a02">갤럭시</option>
						</select>
					</td>
			</tr>
			
			<tr>
				<th width="100">가격</th>
					<td>
						<input type="text" name="price" class="form-control" required="required">
					</td>
			</tr>
			
			<tr>
				<th width="100">입고일</th>
					<td>
						<input type="date" name="ipgoday" class="form-control" value="2023-04-10" required="required">
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