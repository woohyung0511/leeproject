<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="searcharea" style="width: 800px; margin: 10px 100px;">
		<!-- 검색 창 -->
		<form action="list" class="form-inline" style="width: 600px; margin-left: 100px;">
			<div>
				<select class="form-control" style="width: 150px;"
					name="searchcolumn">
					<option value="subject">제목</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
				</select> &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="searchword"
					class="form-control" style="width: 200px;" placeholder="검색어를 입력하세요">
				<button type="submit" class="btn btn-success">검색</button>
			</div>
		</form>
	</div>

	<div style="margin: 30px 30px;">
		<table class="table table-bordered"
			style="width: 800px; margin: 10px 100px;">
			<caption>
				<b>Spring 게시판</b> <span style="float: right;"><button
						type="button" class="btn btn-default"
						onclick="location.href='form'">글 쓰기</button></span>
			</caption>

			<tr bgcolor="#ffc0cb">
				<th width="60">번호</th>
				<th width="460">제목</th>
				<th width="160">작성자</th>
				<th width="160">등록일</th>
				<th width="80">조회</th>
			</tr>

			<c:if test="${totalCount==0 }">
				<tr>
					<td colspan="5" align="center">
						<h3>등록된 게시글 없음</h3>
					</td>
				</tr>
			</c:if>

			<c:if test="${totalCount>0 }">
				<c:forEach var="dto" items="${list }">
					<tr>
						<td align="center">${no }</td>
						<c:set var="no" value="${no-1 }" />
						<!-- 출력 후 감소(증감식이 안되므로) -->

						<!-- 제목 -->
						<td>
							<!-- relevel만큼 공백추가 --> <c:forEach begin="1"
								end="${dto.relevel }">
                                &nbsp;&nbsp;<!-- 원글이면 0이기 때문에 반복안함-->
							</c:forEach> <!-- 답글이면 re이미지 출력 --> <c:if test="${dto.relevel>0 }">
								<img alt="" src="../photo/re.png">
							</c:if> <!-- 제목..여기 통해서 내용보기로 --> <a
							href="content?num=${dto.num }&currentPage=${currentPage}">${dto.subject }</a>

							<!-- 이미지가 있을 경우 아이콘 표시 --> <c:if test="${dto.photo!='no' }">
								<span class="glyphicon glyphicon-picture"></span>
							</c:if>
						</td>
						<td align="center">${dto.name }</td>
						<td align="center"><fmt:formatDate value="${dto.writeday }"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<td align="center">${dto.readcount }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<!-- 페이징 -->
	<c:if test="${totalCount>0 }">
		<div style="width: 800px; text-align: center;">
			<ul class="pagination">
				<!-- 이전 -->
				<c:if test="${startPage>1 }">
					<li><a href="list?currentPage=${startPage-1 }">이전</a></li>
				</c:if>

				<c:forEach var="pp" begin="${startPage }" end="${endPage }">
					<c:if test="${currentPage==pp }">
						<li class="active"><a href="list?currentPage=${pp }">${pp }</a>
						</li>
					</c:if>

					<c:if test="${currentPage!=pp }">
						<li><a href="list?currentPage=${pp }">${pp }</a></li>
					</c:if>
				</c:forEach>
				<!-- 다음 -->
				<c:if test="${endPage<totalPage }">
					<li><a href="list?currentPage=${endPage+1 }">다음</a></li>
				</c:if>
			</ul>
		</div>
	</c:if>

</body>
</html>