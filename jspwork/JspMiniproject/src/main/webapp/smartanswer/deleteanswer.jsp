<%@page import="data.dao.SmartAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//idx
	String idx=request.getParameter("idx");
	
	//dao
	SmartAnswerDao dao=new SmartAnswerDao();
	
	//delete
	dao.deleteSmartAnswer(idx);
%>