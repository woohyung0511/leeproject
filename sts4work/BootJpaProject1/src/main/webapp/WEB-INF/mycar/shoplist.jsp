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
	onclick="location.href='shopform'">상품 추가</button>
	<h3 class="alert alert-info">
	총 ${tcount }개의 쇼핑 리스트가 있습니다
	</h3>
	
	<table class="table table-bordered" style="width: 600px;">
		<caption><b>쇼핑 목록</b></caption>
			<tr bgcolor="#ddd">
				<th width="60">번호</th>
				<th width="160">상품명</th>
				<th width="120">가격</th>
				<th width="160">입고일</th>
			</tr>
			
			<c:forEach var="dto" items="${list }" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td><a href="shopdetail?num=${dto.num }">${dto.sangpum }<img src="/photo/${dto.photo }.png"></a></td>
					<td><fmt:formatNumber value="${dto.price }" type="currency"/></td>
					<td>${dto.ipgoday }</td>
					<td><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/></td>
					<td>
						<button type="button" class="btn btn-success btn-xs" onclick="location.href='updateform?num=${dto.num}'">수정</button>
						<button type="button" class="btn btn-success btn-xs" onclick="location.href='delete?num=${dto.num}'">삭제</button>
					</td>
				</tr>
			</c:forEach>
	</table>
</body>
</html>