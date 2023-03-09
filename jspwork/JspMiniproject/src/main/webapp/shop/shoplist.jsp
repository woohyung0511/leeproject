<%@page import="java.text.NumberFormat"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
  img.photo{
    width: 200px;
    height: 230px;
    border: 1px solid gray;
    margin-bottom: 10px;
  }
</style>
<script type="text/javascript">
  $(function(){
	  
	  $("a.godetail").click(function(){
	    	 
	    	 var shopnum=$(this).attr("shopnum");
	    	 //alert(shopnum);
	    	 
	    	 location.href="index.jsp?main=shop/detailpage.jsp?shopnum="+shopnum;
	     });
  })
     
</script>
</head>
<%
  ShopDao dao=new ShopDao();
  List<ShopDto> list=dao.getAllSangpums();
%>
<body>
<div class="container">
  

  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#tabs-1">전체</a></li>
    <li><a data-toggle="tab" href="#tabs-2">피규어</a></li>
    <li><a data-toggle="tab" href="#tabs-3">선물세트</a></li>
    <li><a data-toggle="tab" href="#tabs-4">게임기기</a></li>
    <li><a data-toggle="tab" href="#tabs-5">의상</a></li>
    <li><a data-toggle="tab" href="#tabs-6">악세서리</a></li>
  </ul>

  <div class="tab-content">
    <div id="tabs-1" class="tab-pane fade in active">
     <p>
       <table class="table table-bordered" style="width: 1000px;">
           <caption><b>전체상품목록</b></caption>
             <tr>
                <%
                NumberFormat nf=NumberFormat.getCurrencyInstance();
                int i=0;
                
                for(ShopDto dto:list)
                {
                	//이미지
                	String photo=dto.getPhoto();
                	
                	//20~30까지 난수발생
                	int sale=(int)(Math.random()*11)+20;
                	
                	
                	%>
                	<td>
                      <a shopnum="<%=dto.getShopnum()%>" style="cursor: pointer;" 
                      class="godetail"><img src="shopsave/<%=photo%>" class="photo">
                      <br>
                      <%=dto.getSangpum() %>
                      <b style="color: red; font-size: 0.8em;"><%=sale %>%</b>
                      
                      <span style="float: right;">
                        <div style="color: gray; font-size: 15px;">
                           <%
                           int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
                           %>
                           <strike><%=nf.format(price) %></strike>
                        </div>
                        
                        <div style="color: black; font-size: 16px;">
                          <%=nf.format(dto.getPrice()) %>
                        </div>
                      </span>
                      
                      </a>
                   </td>
                   
                   <%
                   if((i+1)%4==0)
                   {%>
                	   </tr>
                	   <tr>
                   <%}
                   i++;
                                 	
                }
                                
                %>
                   
             </tr>
       </table>
     </p>
   </div>


	<div id="tabs-2" class="tab-pane fade">
     <p>
       <table class="table table-bordered" style="width: 1000px;">
           <caption><b>전체상품목록</b></caption>
             <tr>
                <%
                 nf=NumberFormat.getCurrencyInstance();
                 i=0;
                
                for(ShopDto dto:list)
                {
                	
                	if(dto.getCategory().equals("피규어"))
                	{
                	
                	//이미지
                	String photo=dto.getPhoto();
                	
                	//20~30까지 난수발생
                	int sale=(int)(Math.random()*11)+20;
                	
                	
                	%>
                	<td>
                      <a shopnum="<%=dto.getShopnum()%>" style="cursor: pointer;" 
                      class="godetail"><img src="shopsave/<%=photo%>" class="photo">
                      <br>
                      <%=dto.getSangpum() %>
                      <b style="color: red; font-size: 0.8em;"><%=sale %>%</b>
                      
                      <span style="float: right;">
                        <div style="color: gray; font-size: 15px;">
                           <%
                           int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
                           %>
                           <strike><%=nf.format(price) %></strike>
                        </div>
                        
                        <div style="color: black; font-size: 16px;">
                          <%=nf.format(dto.getPrice()) %>
                        </div>
                      </span>
                      
                      </a>
                   </td>
                   
                   <%
                   if((i+1)%4==0)
                   {%>
                	   </tr>
                	   <tr>
                   <%}
                   i++;
                                 	
                }
                }              
                %>
                   
             </tr>
       </table>
     </p>
   </div>


	<div id="tabs-3" class="tab-pane fade">
     <p>
       <table class="table table-bordered" style="width: 1000px;">
           <caption><b>선물세트</b></caption>
             <tr>
                <%
                 nf=NumberFormat.getCurrencyInstance();
                 i=0;
                
                for(ShopDto dto:list)
                {
                	
                	if(dto.getCategory().equals("선물세트"))
                	{
                	
                	//이미지
                	String photo=dto.getPhoto();
                	
                	//20~30까지 난수발생
                	int sale=(int)(Math.random()*11)+20;
                	
                	
                	%>
                	<td>
                      <a shopnum="<%=dto.getShopnum()%>" style="cursor: pointer;" 
                      class="godetail"><img src="shopsave/<%=photo%>" class="photo">
                      <br>
                      <%=dto.getSangpum() %>
                      <b style="color: red; font-size: 0.8em;"><%=sale %>%</b>
                      
                      <span style="float: right;">
                        <div style="color: gray; font-size: 15px;">
                           <%
                           int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
                           %>
                           <strike><%=nf.format(price) %></strike>
                        </div>
                        
                        <div style="color: black; font-size: 16px;">
                          <%=nf.format(dto.getPrice()) %>
                        </div>
                      </span>
                      
                      </a>
                   </td>
                   
                   <%
                   if((i+1)%4==0)
                   {%>
                	   </tr>
                	   <tr>
                   <%}
                   i++;
                                 	
                }
                }              
                %>
                   
             </tr>
       </table>
     </p>
   </div>
   
   
   <div id="tabs-4" class="tab-pane fade">
     <p>
       <table class="table table-bordered" style="width: 1000px;">
           <caption><b>게임기기</b></caption>
             <tr>
                <%
                 nf=NumberFormat.getCurrencyInstance();
                 i=0;
                
                for(ShopDto dto:list)
                {
                	
                	if(dto.getCategory().equals("게임기기"))
                	{
                	
                	//이미지
                	String photo=dto.getPhoto();
                	
                	//20~30까지 난수발생
                	int sale=(int)(Math.random()*11)+20;
                	
                	
                	%>
                	<td>
                      <a shopnum="<%=dto.getShopnum()%>" style="cursor: pointer;" 
                      class="godetail"><img src="shopsave/<%=photo%>" class="photo">
                      <br>
                      <%=dto.getSangpum() %>
                      <b style="color: red; font-size: 0.8em;"><%=sale %>%</b>
                      
                      <span style="float: right;">
                        <div style="color: gray; font-size: 15px;">
                           <%
                           int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
                           %>
                           <strike><%=nf.format(price) %></strike>
                        </div>
                        
                        <div style="color: black; font-size: 16px;">
                          <%=nf.format(dto.getPrice()) %>
                        </div>
                      </span>
                      
                      </a>
                   </td>
                   
                   <%
                   if((i+1)%4==0)
                   {%>
                	   </tr>
                	   <tr>
                   <%}
                   i++;
                                 	
                }
                }              
                %>
                   
             </tr>
       </table>
     </p>
   </div>
   
   
   <div id="tabs-5" class="tab-pane fade">
     <p>
       <table class="table table-bordered" style="width: 1000px;">
           <caption><b>의상</b></caption>
             <tr>
                <%
                 nf=NumberFormat.getCurrencyInstance();
                 i=0;
                
                for(ShopDto dto:list)
                {
                	
                	if(dto.getCategory().equals("의상"))
                	{
                	
                	//이미지
                	String photo=dto.getPhoto();
                	
                	//20~30까지 난수발생
                	int sale=(int)(Math.random()*11)+20;
                	
                	
                	%>
                	<td>
                      <a shopnum="<%=dto.getShopnum()%>" style="cursor: pointer;" 
                      class="godetail"><img src="shopsave/<%=photo%>" class="photo">
                      <br>
                      <%=dto.getSangpum() %>
                      <b style="color: red; font-size: 0.8em;"><%=sale %>%</b>
                      
                      <span style="float: right;">
                        <div style="color: gray; font-size: 15px;">
                           <%
                           int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
                           %>
                           <strike><%=nf.format(price) %></strike>
                        </div>
                        
                        <div style="color: black; font-size: 16px;">
                          <%=nf.format(dto.getPrice()) %>
                        </div>
                      </span>
                      
                      </a>
                   </td>
                   
                   <%
                   if((i+1)%4==0)
                   {%>
                	   </tr>
                	   <tr>
                   <%}
                   i++;
                                 	
                }
                }              
                %>
                   
             </tr>
       </table>
     </p>
   </div>
   
   
   <div id="tabs-6" class="tab-pane fade">
     <p>
       <table class="table table-bordered" style="width: 1000px;">
           <caption><b>악세서리</b></caption>
             <tr>
                <%
                 nf=NumberFormat.getCurrencyInstance();
                 i=0;
                
                for(ShopDto dto:list)
                {
                	
                	if(dto.getCategory().equals("악세서리"))
                	{
                	
                	//이미지
                	String photo=dto.getPhoto();
                	
                	//20~30까지 난수발생
                	int sale=(int)(Math.random()*11)+20;
                	
                	
                	%>
                	<td>
                      <a shopnum="<%=dto.getShopnum()%>" style="cursor: pointer;" 
                      class="godetail"><img src="shopsave/<%=photo%>" class="photo">
                      <br>
                      <%=dto.getSangpum() %>
                      <b style="color: red; font-size: 0.8em;"><%=sale %>%</b>
                      
                      <span style="float: right;">
                        <div style="color: gray; font-size: 15px;">
                           <%
                           int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
                           %>
                           <strike><%=nf.format(price) %></strike>
                        </div>
                        
                        <div style="color: black; font-size: 16px;">
                          <%=nf.format(dto.getPrice()) %>
                        </div>
                      </span>
                      
                      </a>
                   </td>
                   
                   <%
                   if((i+1)%4==0)
                   {%>
                	   </tr>
                	   <tr>
                   <%}
                   i++;
                                 	
                }
                }              
                %>
                   
             </tr>
       </table>
     </p>
   </div>
   
   
  </div>
</div>
   
   
</body>
</html>