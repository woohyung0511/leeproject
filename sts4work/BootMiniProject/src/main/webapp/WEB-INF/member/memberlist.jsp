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
	<h2 class="alert alert-info">총 ${count }명의 회원이 있습니다</h2>
	<br>
	<table class="table table-bordered" style="width: 800px;">
		<caption><b>전체 회원명단</b></caption>
			<tr style="background-color: #ddd">
				<th style="width: 50px;">번호</th>
				<th style="width: 150px;">이름</th>
				<th style="width: 100px;">아이디</th>
				<th style="width: 120px;">핸드폰</th>
				<th style="width: 350px;">주소</th>
				<th style="width: 200px;">이메일</th>
				<th style="width: 50px;">삭제
					<input type="checkbox" id="allcheck">
				</th>
			</tr>
			
			<c:forEach var="dto" items="${list }" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td>${dto.name }<img src="../photo/${dto.photo }" style="width: 30px; height: 30px;">&nbsp;&nbsp;&nbsp;</td>
					<td>${dto.id }</td>
					<td>${dto.hp }</td>
					<td>${dto.addr }</td>
					<td>${dto.email }</td>
					<td><input type="checkbox" class="del" num=${dto.num } name="check"></td>
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="7">
				<button type="button" class="btn btn-danger"
				style="margin-left: 650px;" id="btnmemberdel">DELETE</button>
				</td>
			</tr>
	</table>
	
	<script type="text/javascript">
	$("#allcheck").click(function(){
		
		/* if($("#allcheck").is(':checked')) {
			$("input[name=check]").prop("checked", true);
		} else {
			$("input[name=check]").prop("checked", false);
		} */
		
		var chk=$(this).is(":checked");
		
		$(".del").prop("checked",chk);
		
	})
	
	$("#btnmemberdel").click(function(){
		
		//체크 한 상품 갯수 구하기
		var cnt=$(".del:checked").length;
		
		if(cnt==0){
			alert("먼저 삭제 할 번호를 선택 해 주세요");
			return; //종료
		}
		
		$(".del:checked").each(function(){

			var num=$(this).attr("num");

			$.ajax({
				
				type:"get",
				dataType:"text",
				url:"delete",
				data:{"num":num},
				success:function(){
					
					alert("삭제되었습니다");
					 
					location.reload();
				}
			});
		})
	})
		
		
	</script>
</body>
</html>