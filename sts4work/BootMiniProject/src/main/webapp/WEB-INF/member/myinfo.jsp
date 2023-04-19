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
	<div style="margin: 200px;">
		<table class="table table-bordered">
			<c:forEach var="dto" items="${list }">
				<tr>
					<td style="width: 250px;" align="center" rowspan="5">
						<img alt="" src="../photo/${dto.photo }" width="220"
						height="250" border="1">
						<br>
						<input type="file" id="newphoto" style="display: none;" num=${dto.num }> <!-- 수정 시 호출 -->
						<button type="button" class="btn btn-info" id="btnnewphoto">사진수정</button>
					</td>
					
					<td style="width: 300px;">회원명: ${dto.name }</td>
					
					<!-- 수정 삭제 버튼 -->
					<td rowspan="5" align="center" style="width: 200px; vertical-align: middle;">
						<button type="button" class="btn btn-default"
						onclick="location.href=''">수정</button>	
					
						<button type="button" class="btn btn-default"
						onclick="location.href=''">삭제</button>	
					</td>
				</tr>
				
				<tr>
					<td style="width: 300px;">아이디: ${dto.id }</td>
				</tr>
				
				<tr>
					<td style="width: 300px;">이메일: ${dto.email }</td>
				</tr>
				
				<tr>
					<td style="width: 300px;">핸드폰: ${dto.hp }</td>
				</tr>
				
				<tr>
					<td style="width: 300px;">주소: ${dto.addr }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>