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
	<div style="margin: 30px 30px;">
		<form action="update" method="post" enctype="multipart/form-data">
			<!-- hidden  -->
			<input type="hidden" name="num" value="${dto.num }">
			<input type="hidden" name="currentPage" value="${currentPage }">
			
			<table class="table table-bordered" style="width: 500px;">
				<caption><b>수정</b></caption>
				
				<tr>
					<th width="100" bgcolor="#ddd">작성자</th>
						<td>
							<input type="text" name="writer" class="form-control"
							required="required" style="width: 150px;" value="${dto.writer }">
						</td>
				</tr>
				
				<tr>
				
				<tr>
					<th width="100" bgcolor="#ddd">제목</th>
						<td>
							<input type="text" name="subject" class="form-control"
							required="required" style="width: 250px;" value="${dto.subject }">
						</td>
				</tr>
				
				<tr>
					<th width="100" bgcolor="#ddd">사진</th>
						<td>
							<input type="file" name="upload" class="form-control"
							multiple="multiple" style="width: 250px;">
						</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<textarea style="width: 480px; height: 150px;"
						name="content" class="form-control" required="required">${dto.content }</textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-info">수정</button>
						<button type="button" class="btn btn-info" 
						onclick="location.href='list'">목록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>