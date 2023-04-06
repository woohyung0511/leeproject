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
	<button type="button" style="width: 100px;"
	class="btn btn-info" onclick="location.href='writeform'">차 정보 입력</button>

	<c:if test="${totalCount==0 }">
		<h3 class="alert alert-info">저장된 차의 정보가 없습니다</h3>
		
		
	</c:if>
	
	<c:if test="${totalCount>0 }">
		<h3 class="alert alert-info">총 ${totalCount }개의 글이 있습니다</h3>
		
		<hr>
		<table class="table table-bordered" style="width: 700px;">
			<tr bgcolor="#f0ffff">
				<th width="60">번호</th>
				<th width="120">자동차명</th>
				<th width="80">색상</th>
				<th width="140">가격</th>
				<th width="160">구입일</th>
				<th width="100">수정|삭제</th>
			</tr>
			
			<c:forEach var="dto" items="${list }" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td>${dto.carname }</td>
					<td>
						<div style="width: 20px; height: 20px; background-color: ${dto.carcolor}; border: 1px solid gray;"></div>
					</td>
					<td>
						<fmt:formatNumber value="${dto.carprice }" type="currency"/>
					</td>
					<td>${dto.carguip }</td>
					<td>
						<button type="button" class="btn btn-info btn-xs"
						onclick="location.href='updateform?num=${dto.num}'">수정</button>
						<button type="button" class="btn btn-info btn-xs"
						onclick="location.href='delete?num=${dto.num}'">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
		
</body>
</html>