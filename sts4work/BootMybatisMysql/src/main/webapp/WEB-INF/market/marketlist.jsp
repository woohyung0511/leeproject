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
	<c:if test="${totalCount==0 }">
		<div class="alert alert-info">
			<b>저장된 상품정보가 없습니다</b>
		</div>
	</c:if>
	
	<c:if test="${totalCount>0 }">
		<div class="alert alert-info">
			<b>총 ${totalCount }개의 상품정보가 있습니다</b>
		</div>
	</c:if>
	<button type="button" onclick="location.href='form'" class="btn btn-info">상품 추가</button>
	<br>
	<c:forEach var="a" items="${list }">
		<table class="table table-bordered" style="width: 500px;">
			<tr>
				<td>
					<c:if test="${a.photoname!=null }">
						<img alt="" src="../upload/${a.photoname }" style="max-width: 150px; margin-right: 100px;" align="left">
					</c:if>
					<c:if test="${a.photoname==null }">
						<img alt="" src="../upload/mang.png" style="max-width: 150px; margin-right: 100px;" align="left">
					</c:if>
					
					<h4>상품명: ${a.sang }</h4>
					<h4>단가: <fmt:formatNumber value="${a.dan }" type="currency"/></h4>
					<h4>입고날짜: <fmt:formatDate value="${a.ipgo}" pattern="yyyy-MM-dd HH:mm"/></h4>
					<h4>
						<button type="button" class="btn btn-success btn-xs" onclick="location.href='updateform?num=${a.num}'">상품수정</button>
						<button type="button" class="btn btn-danger btn-xs" onclick="location.href='delete?num=${a.num}'">상품삭제</button>
					</h4>
				</td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>