<%@page import="data.dao.SmartDao"%>
<%@page import="data.dto.SmartDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
<%
  	//엔코딩
  	request.setCharacterEncoding("utf-8");

	//데이타 읽어서 dto읽기
	SmartDto dto=new SmartDto();
	String writer=request.getParameter("writer");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setContent(content);
	
	//dao선언후 insert호출
	SmartDao dao=new SmartDao();
	dao.insertSmart(dto);
	
	//방금추가된 num값얻기
	int num=dao.getMaxNum();
	
	//gaipsuccess페이지로 이동
	response.sendRedirect("../index.jsp?main=board/detailview.jsp?num="+num+"&currentPage=1");
%>
</body>
</html>