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
	<span class="alert alert-info">
		<b>총 ${totalCount }명의 사원이 있습니다</b>
	</span>
	
	<br><br>
	<button type="button" class="btn btn-info" onclick="location.href='form'">사원 정보 입력</button>
	<hr>
	
	<div style="width: 800px; text-align:center;">
		<form action="list">
			<select name="title" class="form-control" style="width: 150px;">
				<option value="name" ${title='name'?"selected":"" }>이름</option>
				<option value="buseo" ${title='buseo'?"selected":"" }>부서명</option>
				<option value="driver" ${title='driver'?"selected":"" }>운전면허</option>
			</select>
			<input type="text" name="search" class="form-control" placeholder="검색단어"
			style="width: 150px;" value="${search }">
			
			<button type="submit" class="btn btn-success">검색</button>
		</form>
	</div>
	<br><br>
	
		<table class="table table-bordered" style="width: 700px;">
			<tr bgcolor="#ffc">
				<th width="60">No.</th>
				<th width="100">사원명</th>
				<th width="150">부서명</th>
				<th width="100">사진</th>
				<th width="100">운전면허</th>
				<th width="180">입사일</th>
				<th width="200">수정|삭제</th>
			</tr>
			
			<c:forEach var="dto" items="${list }" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td>${dto.name }</td>
					<td>${dto.buseo }</td>
					<td>
						<c:if test="${dto.photo!='no' }">
							<img alt="" src="../photo/${dto.photo }" width="50" height="50" class="img-circle">
						</c:if>	
						<c:if test="${dto.photo=='no' }">
							<img alt="" src="../res/no.PNG" width="50" height="50" class="img-circle">
						</c:if>	
					</td>
					<td>${dto.driver }</td>
					<td>
						<%-- <fmt:formatDate value=" --%> ${dto.ipsaday }<%--"  pattern="yyyy년 MM월 dd일" --%>/>
					</td> 
					<td>
						<button type="button" class="btn btn-info btn-xs"
						onclick="location.href='updateform?num=${dto.num}'">수정</button>
						<button type="button" class="btn btn-info btn-xs"
						onclick="location.href='delete?num=${dto.num}'">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</table>
</body>
</html>