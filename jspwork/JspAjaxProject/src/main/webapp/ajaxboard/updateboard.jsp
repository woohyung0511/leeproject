<%@page import="ajaxboard.model.AjaxBoardDao"%>
<%@page import="ajaxboard.model.AjaxBoardDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	AjaxBoardDao dao=new AjaxBoardDao();

	request.setCharacterEncoding("utf-8");

	String num=request.getParameter("unum");
	String writer=request.getParameter("uwriter");
	String subject=request.getParameter("usubject");
	String content=request.getParameter("ucontent");
	String avata=request.getParameter("uavata");
	
	AjaxBoardDto dto=new AjaxBoardDto();
	
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setAvata(avata);
	
	dao.updateboard(dto);
%>