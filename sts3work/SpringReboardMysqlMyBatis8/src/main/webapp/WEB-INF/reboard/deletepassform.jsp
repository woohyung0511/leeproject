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
	<div style="margin: 100px 100px;">
		<form action="delete" method="post" class="form-inline">
			<!-- hidden -->
			<input type="hidden" name="num" value="${num }">
			<input type="hidden" name="currentPage" value="${currentPage }">
			
			<div class="alert alert-info" style="font-size: 1.3em; width: 350px;">
				<b>비밀번호를 입력 해라!</b><br>
			</div>
			
			<div>
				<input type="password" name="pass" class="form-control" style="width: 130px;"
				required="required">
				<button type="submit" class="btn btn-info">삭제하기</button>
				<button type="button" class="btn btn-success"
				onclick="history.back()">이전으로</button>
			</div>
		</form>
	</div>
</body>
</html>