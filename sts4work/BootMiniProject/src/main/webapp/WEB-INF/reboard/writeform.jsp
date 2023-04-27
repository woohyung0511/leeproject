<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<c:if test="${sessionScope.loginok==null }">
<script type="text/javascript">
	alert("먼저 로그인 후 글을 써 주세요");
	history.back();
</script>
</c:if>
	<form action="insert" method="post" enctype="multipart/form-data">
	
	<!-- hidden -->
	<input type="hidden" name="num" value="${num}">
    <input type="hidden" name="currentPage" value="${currentPage}">
    <input type="hidden" name="regroup" value="${regroup}">
    <input type="hidden" name="restep" value="${restep}">
    <input type="hidden" name="relevel" value="${relevel}">
    
    <!-- 로그인 시 저장된 세션 값 -->
    <input type="hidden" name="id" value="${sessionScope.myid }">
    <input type="hidden" name="name" value="${sessionScope.loginname }"> 
    
		<table class="table table-bordered" style="margin: 100px 100px; width: 500px;">
			<caption>
				<b>
					<c:if test="${num==0 }">새 글 쓰기</c:if>
					<c:if test="${num!=0 }">답 글 쓰기</c:if>
				</b>
			</caption> 
			
			<tr>
				<th width="120" bgcolor="#ddd">제목</th>
				<td><input type="text" name="subject" class="form-control"
					required="required" style="width: 250px;"></td>
			</tr>
			
			<tr>
				<th width="120" bgcolor="#ddd">사진</th>
				<td><input type="file" name="upload" class="form-control"
				multiple="multiple" style="width: 250px;">
				</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<textarea style="width: 480px; height: 150px;" name="content"
					class="form-control" required="required"></textarea>
				</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-default">등록</button>
					<button type="button" class="btn btn-default"
						onclick="location.href='list'">목록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>