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
<div style="margin: 50px 50px;">
	<button type="button" class="btn btn-info"
	onclick="location.href='writeform'">글 쓰기</button>
	<br>
	<h2 class="alert alert-info">총 ${tcount }개의 게시글이 있습니다</h2>
	
	<table class="table table-bordered" style="width: 800px;">
		<caption><b>자동차 목록</b></caption>
			<tr bgcolor="#ddd">
				<th width="60">번호</th>
				<th width="160">작성자</th>
				<th width="120">제목</th>
				<th width="150">내용</th>
				<th width="160">등록일</th>
			</tr>
			
			 <c:forEach var="dto" items="${list }" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td><a href="detail?num=${dto.num }">${dto.writer}<img src="/save/${dto.photo }" style="width: 50px; height: 50px;"></a></td>
					<td>${dto.subject}</td>
					<td>${dto.content}</td>
					<td><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/></td>
					<td>
						<button type="button" class="btn btn-success btn-xs" onclick="location.href='updateform?num=${dto.num}'">수정</button>
						<button type="button" class="btn btn-success btn-xs" onclick="location.href='delete?num=${dto.num}'">삭제</button>
					</td>
				</tr>
			</c:forEach> 
	</table>
</div>
</body>
</html>