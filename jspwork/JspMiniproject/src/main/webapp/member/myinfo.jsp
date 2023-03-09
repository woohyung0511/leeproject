<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<%
//전체멤버 정보 가져오기
MemberDao dao=new MemberDao();
List<MemberDto> list=dao.getAllMembers();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

//세션
String loginok=(String)session.getAttribute("loginok");
String myid=(String)session.getAttribute("myid");
%>
<body>
<table class="table table-bordered" style="width: 900px;">
<%
		for(MemberDto dto:list)
		{%>
		
		<%
		//로그인 중 이면서 로그인한 아이디와 같은사람만 보기
		if(loginok!=null && dto.getId().equals(myid)){%>
		
		<tr>
				<td><%=dto.getName() %><br>
				<%=dto.getId() %><br>
				<%=dto.getHp() %><br>
				<%=dto.getAddr() %><br>
				<%=dto.getEmail() %><br>
				<%=sdf.format(dto.getGaipday()) %><br>
				
				<button type="button" class="btn btn-danger btn-xs"
					onclick="delfunc(<%=dto.getNum()%>)">수정</button>				
				
					<button type="button" class="btn btn-danger btn-xs"
					onclick="delfunc(<%=dto.getNum()%>)">삭제</button>				
				</td>
		</tr>
			
		<%}
		%>
			
		<%}
		%>
</table>
</body>
</html>