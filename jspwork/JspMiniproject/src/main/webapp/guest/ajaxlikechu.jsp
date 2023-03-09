<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.guestDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//num
	String num=request.getParameter("num");
	
	//dao
	guestDao dao=new guestDao();
	
	//num에 해당하는 chu 1증가
	dao.updateChu(num);
	
	//num에 해당하는 chu값 json형식으로 반환
	int chu=dao.getData(num).getChu();
	
	JSONObject ob=new JSONObject();
	ob.put("chu", chu);
%>

<%=ob.toString()%>