<%@page import="ajaxboard.model.AjaxBoardDto"%>
<%@page import="ajaxboard.model.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
AjaxBoardDao dao=new AjaxBoardDao();

//엔코딩
request.setCharacterEncoding("utf-8");

//데이터 읽기
String writer=request.getParameter("writer");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
String avata=request.getParameter("avata");

//dto로 묶기
AjaxBoardDto dto=new AjaxBoardDto();

dto.setWriter(writer);
dto.setSubject(subject);
dto.setContent(content);
dto.setAvata(avata);

//insert호출
dao.insertBoard(dto);
%>