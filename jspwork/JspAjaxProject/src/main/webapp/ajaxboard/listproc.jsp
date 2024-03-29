<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ajaxboard.model.AjaxBoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ajaxboard.model.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	AjaxBoardDao dao=new AjaxBoardDao();
	ArrayList<AjaxBoardDto> list=dao.getAllAboardDatas();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	//json라이브러리 이용해서 json 데이터 생성
	JSONArray arr=new JSONArray();
	
	for(AjaxBoardDto dto:list)
	{
		JSONObject ob=new JSONObject();
		ob.put("num",dto.getNum());
		ob.put("writer",dto.getWriter());
		ob.put("subject",dto.getSubject());
		ob.put("content",dto.getContent());
		ob.put("avata",dto.getAvata());
		ob.put("writeday",sdf.format(dto.getWriteday()));

		arr.add(ob);
	}
%>

<%=arr.toString()%>