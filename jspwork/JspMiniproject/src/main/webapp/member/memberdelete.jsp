<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
MemberDao dao=new MemberDao();

String num=request.getParameter("num");

dao.deleteMember(num);

response.sendRedirect("../index.jsp?main=member/memberlist.jsp");
%>