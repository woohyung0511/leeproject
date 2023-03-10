<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
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
    <style type="text/css">
   		div.sangpum img.photo{
   		width: 60px;
   		height: 90px;
   		border: 2px solid gray;
   		} 
   		
   		div.sangpum{cursor: pointer;}
    </style>
</head>
<%
	//로그인 한 아이디 얻기
	String id=(String)session.getAttribute("myid");

	//ShopDao
	ShopDao dao=new ShopDao();
	
	//MemberDao
	MemberDao mdao=new MemberDao();
	String name=mdao.getName(id);
	
	//장바구니 목록
	List<HashMap<String,String>> list=dao.getCartList(id);
%>
<body>

	<h4 class="alert alert-info" style="width: 1000px;"><%=id %>(<%=name %>)님의 장바구니</h4>
	
	<table class="table table-striped" style="width: 1000px;">
		<tr>
			<th style="width: 30px;">
				<input type="checkbox" id="allcheck">
			</th>
			<th style="width: 200px;">상품정보</th>
			<th style="width: 200px; padding-left: 200px;">상품금액</th>
		</tr>
		
		<%
		NumberFormat nf=NumberFormat.getInstance();
		
			for(int i=0;i<list.size();i++)
			{
				HashMap<String,String> map=list.get(i);
					//사진얻기
					String photo=map.get("photo");
					
					int cnt=Integer.parseInt(map.get("cnt"));
					%>
					
					<tr>
						<td>
							<input type="checkbox" name="idx" class="idx" idx=<%=map.get("idx") %>>
						</td>
						
						<td>
							<div shopnum="<%=map.get("shopnum")%>" class="sangpum">
								<img alt="" src="shopsave/<%=photo%>" class="photo" align="left" hspace="20">
								
								<h5><b>상품명: <%=map.get("sangpum") %></b></h5>
								<h5><b>갯수: <%=cnt %>개</b></h5>
								<h5><b>날짜: <%=map.get("cartday") %></b></h5>		
							</div>
						</td>
						
						<td align="left" style="padding-right:400px;">
						<%
							int price=Integer.parseInt(map.get("price"));
							price*cnt;
						%>
							
							<h4><%=nf.format(price) %>원</h4>
						</td>
					</tr>
			<%}
		
		%>
		
		<tr>
			<td colspan="3">
				<button type="button" class="btn btn-danger btn-Lg"
				style="margin-left: 100px;" id="btncartdel">선택상품삭제</button>
			</td>
		</tr>
	</table>
</body>
</html>