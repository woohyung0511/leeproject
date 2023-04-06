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
	class="btn btn-info" onclick="location.href='writeform'">고객 정보 입력</button>

	<c:if test="${totalCount==0 }">
		<h3 class="alert alert-info">저장된 구매자 리스트가 없습니다</h3>
		
		
	</c:if>
	
	<c:if test="${totalCount>0 }">
		<h3 class="alert alert-info">총 ${totalCount }개의 리스트가 있습니다</h3>
		
		<hr>
		<table class="table table-bordered" style="width: 700px;">
			<tr bgcolor="#f0ffff">
				<th width="60">번호</th>
				<th width="120">이름</th>
				<th width="80">핸드폰</th>
				<th width="140">주소</th>
				<th width="160">가입일</th>
				<th width="100">수정|삭제</th>
			</tr>
			
			<c:forEach var="dto" items="${list }" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td>${dto.name }</td>
					<td>${dto.hp }</td>
					<td>${dto.addr }</td>
					<td>${dto.gaipday }</td>
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