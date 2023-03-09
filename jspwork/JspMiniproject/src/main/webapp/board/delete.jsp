<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//num,currentPage읽기
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	//dao
	SmartDao dao=new SmartDao();
	
	dao.deleteSmart(num);
	
	//목록
	response.sendRedirect("../index.jsp?main=board/boardlist.jsp?currentPage="+currentPage);
%>