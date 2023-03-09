<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
   //db에 저장할 id 가져오기
   //String myid=(String)session.getAttribute("myid");
	//이미지가 업로드되는 실제경로
	String realPath=getServletContext().getRealPath("/shopsave");
	System.out.println(realPath);
	
	int uploadSize=1024*1024*2; //2mb
	MultipartRequest multi=null;
	
	try{
	multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",
			new DefaultFileRenamePolicy());
	
	//multi변수로 모든 폼데이타 읽어오기
	String sangpum=multi.getParameter("sangpum");
	String category=multi.getParameter("category");
	String ipgoday=multi.getParameter("ipgoday");
	String photo=multi.getFilesystemName("photo");
	int price=Integer.parseInt(multi.getParameter("price"));
	
	//dto에 저장
	ShopDto dto=new ShopDto();
	dto.setSangpum(sangpum);
	dto.setCategory(category);
	dto.setPhoto(photo);
	dto.setIpgoday(ipgoday);
	dto.setPrice(price);
	
	//dao
	ShopDao dao=new ShopDao();
	dao.insertShop(dto);
	
	//다시 상품폼으로 이동
	response.sendRedirect("../index.jsp?main=shop/addform.jsp");
	
	}catch(Exception e){
		
		System.out.println("업로드 오류:"+e.getMessage());
	}
%>