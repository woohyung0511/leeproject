<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.CartDto"%>
<%@page import="data.dto.ShopDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("uft-8");

CartDto dto=new CartDto();

String shopnum=request.getParameter("shopnum");
String num=request.getParameter("num");
int cnt=Integer.parseInt(request.getParameter("cnt"));

ShopDao dao=new ShopDao();

dto.setShopnum(shopnum);
dto.setNum(num);
dto.setCnt(cnt);

dao.insertCart(dto);


%>