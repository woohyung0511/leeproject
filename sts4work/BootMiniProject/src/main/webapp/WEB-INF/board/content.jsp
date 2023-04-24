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
		<table class="table table-bordered" style="width: 600px; margin: 100px 100px;">
			<tr>
				<td>
					<h3><b>${dto.subject }</b>
						<span style="color: gray; float: right; font-size: 14px;"><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/></span>
					</h3>
					
					<span>작성자: ${dto.name }(${dto.myid })</span>
					
					<c:if test="${dto.uploadfile!='no' }">
						<span style="float: right;">
							<a href="download?clip=${dto.uploadfile }">
								<span class="glyphicon glyphicon-download-alt"></span>
								
								<b>${dto.uploadfile }</b>
							</a>
						</span>
					</c:if>
				</td>
			</tr>
			
			<tr>
				<td>
					<c:if test="${bupload==true }">
						<h3>업로드 파일이 이미지 입니다</h3>
							<img alt="" src="../photo/${dto.uploadfile }" style="max-width: 300px;">
					</c:if>
					
					<br><br>
					<pre style="background-color: #fff; border: 0px;">
						${dto.content }
					</pre>
					<br>
					<b>조회: ${dto.readcount }</b>
				</td>
			</tr>
			
			<!-- 버튼들 -->
			<tr>
				<td align="right">
				
					<!-- 글 쓰기는 로그인 중 일때만 -->
					<c:if test="${sessionScope.loginok!=null }">
					<button type="button" class="btn btn-default" onclick="location.href='form'" style="width: 80px;">글 쓰기</button>
					</c:if>
					<button type="button" class="btn btn-default" onclick="location.href='list?currentPage=${currentPage}'" style="width: 80px;">목록</button>
					
					<!-- 로그인 중 이면서 자기글만 수정,삭제 버튼 보이게 -->
					<c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid }">
					<button type="button" class="btn btn-default" onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage }'" style="width: 80px;">수정</button>
					<button type="button" class="btn btn-default" onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage }'" style="width: 80px;">삭제</button>
					</c:if>
				</td>
			</tr>
		</table>
</body>
</html>