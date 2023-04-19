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
<div class="alert alert-info" style="width: 800px;">
<b>${totalCount }개의 상품이 있습니다</b>	
</div>

<table class="table table-bordered" style="width: 800px;">
	<caption>
		<span style="float:right;">
			<button type="button" class="btn btn-default" onclick="location.href='form'">상품추가</button>
		</span>
	</caption>
	
	<c:forEach items="${list }" var="dto">
		<tr>
			<td width="400" rowspan="4">
				<c:if test="${dto.photoname!='no' }">
					<%-- <c:forTokens var="pp" items="${dto.photoname }" delims=",">
						<a href="#">
							<img src="../photo/${pp }" style="max-width: 150px;">
						</a>
					</c:forTokens> --%>
					
					<img alt="" src="../photo/${dto.dimage }" style="max-width: 150px;">
				</c:if>
				
				<c:if test="${dto.photoname=='no' }">
					<img src="../image/no.png" style="max-width: 150px;">
				</c:if>
			</td>
			
			<td>
				<b>상품명:${dto.sangpum }</b>
			</td>
		</tr>
		
		<tr>
			<td>
				<b>단가:<fmt:formatNumber value="${dto.price }" type="currency"></fmt:formatNumber></b>
			</td>
		</tr>
		
		<tr>
			<td>
				<b>입고일:<fmt:formatDate value="${dto.ipgoday }" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></b>
			</td>
		</tr>
		
		<tr>
			<td>
				<button type="button" class="btn btn-info" onclick="location.href=''">수정</button>
				<button type="button" class="btn btn-info" onclick="location.href='delete?num=${dto.num}'">삭제</button>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>