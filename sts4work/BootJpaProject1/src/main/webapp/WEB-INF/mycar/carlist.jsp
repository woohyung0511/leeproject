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
    <style type="text/css">
    .box{
    	width: 40px;
    	height: 40px;
    	border: 1px solid gray;
    	border-radius: 100px;
    }
    </style>
</head>
<body>
	<button type="button" class="btn btn-info"
	onclick="location.href='carform'">차 정보 추가</button>
	<h3 class="alert alert-info">
	총 ${tcount }개의 자동차 정보가 있습니다
	</h3>
	
	<table class="table table-bordered" style="width: 800px;">
		<caption><b>자동차 목록</b></caption>
			<tr bgcolor="#ddd">
				<th width="60">번호</th>
				<th width="160">자동차명</th>
				<th width="120">색상</th>
				<th width="150">단가</th>
				<th width="160">구입일</th>
				<th width="160">등록일</th>
			</tr>
			
			<c:forEach var="dto" items="${list }" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td>${dto.carname }</td>
					<td align="center"><div class="box" style="background-color: ${dto.carcolor}"></div>
					<td><fmt:formatNumber value="${dto.carprice }" type="currency"/></td>
					<td>${dto.carguip }</td>
					<td><fmt:formatDate value="${dto.guipday }" pattern="yyyy-MM-dd"/></td>
					<td>
						<button type="button" class="btn btn-success btn-xs" onclick="location.href='updateform?num=${dto.num}'">수정</button>
						<button type="button" class="btn btn-success btn-xs" onclick="location.href='deleteform?num=${dto.num}'">삭제</button>
					</td>
				</tr>
			</c:forEach>
	</table>
</body>
</html>