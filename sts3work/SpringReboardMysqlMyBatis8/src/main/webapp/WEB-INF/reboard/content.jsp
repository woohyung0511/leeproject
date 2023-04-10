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
	#answer{
		border-bottom: 1px solid #ddd;
		margin-bottom: 20px;
		padding-top: 10px;
		padding-bottom: 10px;
		paddig-left: 20px;
	}
</style>
</head>
<body>
	<div style="margin: 50px 50px;">
		<table class="table table-bordered" style="width: 600px;">
			<caption><b>내용보기</b></caption>
				<tr>
					<td>
						<h2><b>${dto.subject }</b></h2>
						<span style="float: right; margin-left: 20px;">
							조회 ${dto.readcount }&nbsp;&nbsp;&nbsp;&nbsp;
							<fmt:formatDate value="${dto.writeday }"
							pattern="yyyy-MM-dd HH:mm"/>
						</span>
						<h5><b>작성자: ${dto.writer }</b></h5>
					</td>
				</tr>
				
				<tr>
					<td>
						<pre style="background-color: white; border: 0px;">${dto.content }</pre>
						<br><br>
						
						<c:if test="${dto.photo!='no' }">
							<c:forTokens var="ps" items="${dto.photo }" delims=",">
							<a href="../photo/${ps }">
								<img alt="" src="../photo/${ps }" style="width: 150px;
								border: 3px solid green;">
							</a>
							</c:forTokens>
						</c:if>
					</td>
				</tr>
				
				<tr>
					<td>
						<div id="answer">댓글목록출력예정</div>
						
						<form action="ainsert" method="post" class="form-inline">
							<!-- hidden -->
							<input type="hidden" name="num" value="${dto.num }">
							<input type="hidden" name="currentPage" value="${currentPage }">
							<b>닉네임: </b>
								<input type="text" name="nickname" class="form-control input-sm" style="width: 100px;"
								required="required">
								<b style="margin-left: 30px;">비밀번호: </b>
								<input type="password" name="pass" class="form-control input-sm" style="width: 100px;"
								required="required">
								<br><br>
								<input type="text" name="content" class="form-control input-sm"
								style="width: 500px;" required="required" placeholder="댓글을 입력 해">
								<button type="submit" class="btn btn-info btn-sm">확인</button>
						</form>
					</td>
				</tr>
				
				<tr>
					<td align="right">
						<button class="btn btn-default btn-sm"
						onclick="location.href='writeform'">글 쓰기</button>
					
						<button class="btn btn-default btn-sm"
						onclick="location.href='writeform?num=${dto.num}&regroup=${dto.regroup }&restep=${dto.restep }&relevel=${dto.relevel }&currentPage=${currentPage }'">답글 쓰기</button>
					
						<button class="btn btn-default btn-sm"
						onclick="location.href='updatepassform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
					
						<button class="btn btn-default btn-sm"
						onclick="location.href='deletepassform?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
					
						<button class="btn btn-default btn-sm"
						onclick="location.href='list?currentPage=${currentPage}'">목록</button>
					</td>
				</tr>
		</table>
	</div>
</body>
</html>